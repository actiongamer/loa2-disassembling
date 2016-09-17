package nslm2.common.model
{
   import flash.events.EventDispatcher;
   import com.mz.core.utils.DictHash;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.utils.LocalData;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.ServerTimer;
   import proto.BattlePlayer;
   import nslm2.modules.fightPlayer.UnitVo;
   import nslm2.modules.battles.battle.FPUtil;
   import proto.GetTimesBuyRes;
   import proto.GetTimesBuyRes.times;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.scenes.commons.SceneModel;
   import proto.PlayerDataNotify;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import proto.Source;
   import nslm2.utils.Uint64Util;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcLevelVo;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.nets.sockets.ServerConsts;
   import com.mz.core.configs.ClientConfig;
   import proto.HeroInfoNotify;
   import proto.HeroAllInfoNotify;
   import proto.HeroInfo;
   import proto.PlayerInfoNotify;
   import nslm2.common.vo.VipInfoVo;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.foundations.vip.consts.VipUtils;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.funnies.arenas.ArenaService;
   import com.mz.core.logging.Log;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.funnies.tencent.model.TencentVipModel;
   import proto.PlayerInfo;
   import com.netease.protobuf.UInt64;
   import proto.PlayerQQInfo;
   import nslm2.utils.RTools;
   import nslm2.modules.footstones.roleLvlUpModule.model.RoleLvlUpModel;
   import nslm2.modules.cultivates.roleTeam.ctrl.CheckRoleTeamRedPointCtrl;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.otherPt.duowans.DuoWanGameMsgCollector;
   import nslm2.modules.foundations.chatModules.ChatModel;
   import nslm2.modules.roleInfos.levelUps.RoleLevelUpUtil;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.foundations.FloatBubbleUtil;
   import nslm2.modules.foundations.miniTasks.model.TaskModel;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.common.event.WealthChangeEvent;
   import nslm2.modules.funnies.dials.model.DialModel;
   import nslm2.modules.foundations.angelFund.service.AngelFundService;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.scenes.commons.Unit3DBase;
   import nslm2.modules.fightPlayer.FactoryUtil;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import proto.PlayerBaseInfo;
   import morn.core.utils.StringUtils;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.skins.ColorLib;
   
   public class PlayerModel extends EventDispatcher
   {
      
      private static var _ins:nslm2.common.model.PlayerModel;
      
      private static const PUTONG:Number = 0;
      
      public static const GM:Number = 1;
      
      public static const ZHIDAOYUAN:Number = 2;
      
      private static const FULIHAO:Number = 3;
       
      
      private var wealthMap:Object;
      
      public var team:DictHash;
      
      public var rightTeam:DictHash;
      
      public var currentCity:int = 10000;
      
      private var _level:int;
      
      public var dist:uint;
      
      public var distName:String;
      
      public var opName:String;
      
      public var autoUpdateHeroInfo:Boolean = true;
      
      private var isFirstSetDataNotify:Boolean = true;
      
      public var oldDataNotify:Vector.<PlayerDataNotify>;
      
      private var _playerInfo:PlayerInfo;
      
      public var vipInfoVo:VipInfoVo;
      
      private var _vip:int;
      
      private const BATTLE_SCENE_ARR:Array = [40300,41400,40405,41215];
      
      public var vipUpNum:int;
      
      private var _exp:Number;
      
      public var totalFightValue:Number;
      
      public var buyTimesLib:Object;
      
      public function PlayerModel()
      {
         wealthMap = {};
         oldDataNotify = new Vector.<PlayerDataNotify>();
         vipInfoVo = new VipInfoVo();
         buyTimesLib = {};
         super();
         init();
         initDiamondTimer();
      }
      
      public static function get ins() : nslm2.common.model.PlayerModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.common.model.PlayerModel();
         }
         return _ins;
      }
      
      private function initDiamondTimer() : void
      {
         TimerManager.ins.doLoop(120000,checkDiamond);
      }
      
      private function checkDiamond() : void
      {
         if(LocalData.insCurPlayer.load("DiamondAlert") == null)
         {
            if(diamond_not_bind > 0 && diamond_not_bind < 200 && vip >= 1 && level > 30 && diamond_bind > 0)
            {
               AlertUtil.alert(LocaleMgr.ins.getStr(999902717));
               LocalData.insCurPlayer.save("DiamondAlert",ServerTimer.ins.date.date);
               TimerManager.ins.clearTimer(checkDiamond);
            }
         }
         else if(diamond_not_bind > 0 && diamond_not_bind < 200 && vip >= 1 && level > 30 && diamond_bind > 0 && int(LocalData.insCurPlayer.load("DiamondAlert")) != ServerTimer.ins.date.date)
         {
            AlertUtil.alert(LocaleMgr.ins.getStr(999902717));
            LocalData.insCurPlayer.save("DiamondAlert",ServerTimer.ins.date.date);
            TimerManager.ins.clearTimer(checkDiamond);
         }
      }
      
      public function createTeam(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         team = new DictHash();
         rightTeam = new DictHash();
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc2_ = param1[_loc5_];
            _loc4_ = createUnitIdBySp(_loc2_);
            _loc3_ = new UnitVo();
            FPUtil.protoVoToVo(_loc2_,_loc3_,BattlePlayer);
            _loc3_.id = _loc4_;
            _loc3_.hp = _loc2_.prop.hp;
            _loc3_.serVo = _loc2_;
            _loc3_.init();
            if(_loc2_.isAttack == 1)
            {
               if(_loc3_.stcNpcVo.kind == 5)
               {
                  _loc3_.isMajor = true;
               }
               team.put(_loc3_.id,_loc3_);
            }
            else
            {
               _loc3_.isAttack = 0;
               if(_loc3_.stcNpcVo.kind == 5)
               {
                  _loc3_.isMajor = true;
               }
               rightTeam.put(_loc3_.id,_loc3_);
            }
            _loc5_++;
         }
      }
      
      private function createUnitIdBySp(param1:BattlePlayer) : String
      {
         return FPUtil.genBattleId(param1.isAttack,param1.posId) + "";
      }
      
      public function resetTeam(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc3_:Array = team.array;
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            UnitVo(_loc3_[_loc5_]).hp = 0;
            _loc5_++;
         }
         rightTeam = new DictHash();
         _loc7_ = 0;
         while(_loc7_ < param1.length)
         {
            _loc2_ = param1[_loc7_];
            _loc6_ = createUnitIdBySp(_loc2_);
            if(_loc2_.isAttack == 1)
            {
               _loc4_ = this.team.getValue(_loc6_);
               _loc4_.serVo = _loc2_;
               _loc4_.rage = _loc2_.rage;
               _loc4_.hp = _loc2_.prop.hp;
            }
            else
            {
               _loc4_ = new UnitVo();
               FPUtil.protoVoToVo(_loc2_,_loc4_,BattlePlayer);
               _loc4_.id = _loc6_;
               _loc4_.hp = _loc2_.prop.hp;
               _loc4_.serVo = _loc2_;
               _loc4_.init();
               _loc4_.isAttack = 0;
               rightTeam.put(_loc4_.id,_loc4_);
            }
            _loc7_++;
         }
      }
      
      public function se_onGetTimes(param1:GetTimesBuyRes) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         nslm2.common.model.PlayerModel.ins.buyTimesLib = {};
         if(param1 && param1.info)
         {
            _loc3_ = param1.info.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = param1.info[_loc4_];
               nslm2.common.model.PlayerModel.ins.buyTimesLib[_loc2_.kind] = _loc2_.time;
               _loc4_++;
            }
         }
      }
      
      private function init() : void
      {
         wealthMap[1010] = 0;
         wealthMap[10] = 0;
         wealthMap[1] = 0;
         wealthMap[3] = 0;
         wealthMap[4] = 0;
         wealthMap[2] = 0;
         wealthMap[8] = 0;
         ServerEngine.ins.addAlwayHandler(8004,serverCpl_playerDataNotify);
         ServerEngine.ins.addAlwayHandler(5011,serverCpl_heroInfoNotify);
         ServerEngine.ins.addAlwayHandler(5018,serverCpl_heroAllInfoNotify);
         ServerEngine.ins.addAlwayHandler(5336,se_onGetTimes);
      }
      
      private function serverCpl_playerDataNotify(param1:PlayerDataNotify, param2:ServerEvent) : void
      {
         var _loc11_:int = 0;
         var _loc4_:* = null;
         var _loc10_:int = 0;
         var _loc3_:* = null;
         var _loc8_:Number = NaN;
         if(!nslm2.common.model.PlayerModel.ins.playerInfo)
         {
            return;
         }
         if(param1.cmd != 8004)
         {
            if(oldDataNotify.length >= 3)
            {
               oldDataNotify.pop();
            }
            oldDataNotify.unshift(param1);
         }
         if(param1.cmd == 2107)
         {
            FloatUtil.showGetItemsDisplayPanel(WealthUtil.costStrToArr(DefindConsts.BLUE_DAY_CONTINUE),LocaleMgr.ins.getStr(999000001),null,0,true,0,false);
         }
         var _loc7_:Array = param1.source;
         var _loc9_:int = _loc7_.length;
         _loc11_ = 0;
         while(_loc11_ < _loc9_)
         {
            _loc4_ = _loc7_[_loc11_];
            this.changeWealth(_loc4_.kind,_loc4_.count,param1.cmd);
            if(_loc4_.kind == 3 && diamond_not_bind > _loc4_.count)
            {
               if(diamond_not_bind > 0 && diamond_not_bind < 200 && vip >= 1 && level > 30 && diamond_bind > 0)
               {
                  checkDiamond();
               }
            }
            _loc11_++;
         }
         if(param1.hasInfo)
         {
            if(param1.info.hasAbility)
            {
               totalFightValue = Uint64Util.toNumber(param1.info.ability);
               App.observer.sendNotice("role_info_update_fight_value");
            }
            _loc10_ = param1.info.lv;
            _loc3_ = StcMgr.ins.getVoByMultiColumnValue("static_level",["level","kind"],[_loc10_,1]);
            _loc8_ = _loc3_.all_exp + Uint64Util.toNumber(param1.info.exp);
            this.setLevel(param1.info.lv);
            _exp = Uint64Util.toNumber(param1.info.exp);
            this.changeWealth(10,_loc8_);
            if(param1.info.hasVip)
            {
               this.setVip(param1.info.vip);
            }
            else
            {
               vipUpNum = 0;
            }
         }
         else
         {
            vipUpNum = 0;
         }
         BagModel.ins.onDataChange(param1);
         HeroModel.ins.onDataChange(param1);
         TreasureModel.ins.onDataChange(param1);
         var _loc6_:Boolean = ServerConsts.ins.autoFloatCMDDic.hasOwnProperty(param1.cmd);
         if(_loc6_)
         {
            if(param2)
            {
               FloatUtil.floatPlayerDataChange(param2.dataNotifyCacheVo);
            }
         }
         var _loc5_:Boolean = ServerConsts.ins.autoDisplayCMDDic.hasOwnProperty(param1.cmd);
         if(_loc5_)
         {
            if(param2)
            {
               FloatUtil.displayPlayerDataChange(param2.dataNotifyCacheVo);
            }
         }
         if(isFirstSetDataNotify)
         {
            if(ClientConfig.mainLoadingPage)
            {
               ClientConfig.mainLoadingPage.scrollTipCtrl.show(this.vip,this.level,ServerTimer.ins.second);
            }
            isFirstSetDataNotify = false;
         }
      }
      
      private function setShowTitle(param1:uint) : void
      {
         this.playerInfo.showTitleId = param1;
      }
      
      private function serverCpl_heroInfoNotify(param1:HeroInfoNotify) : void
      {
         if(autoUpdateHeroInfo)
         {
            HeroModel.ins.onChangeOne(param1.info);
         }
      }
      
      private function serverCpl_heroAllInfoNotify(param1:HeroAllInfoNotify) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1.info;
         for each(var _loc2_ in param1.info)
         {
            HeroModel.ins.onChangeOne(_loc2_);
         }
      }
      
      public function parsePlayerInfo(param1:PlayerInfoNotify) : void
      {
         this.vipInfoVo = new VipInfoVo();
         _playerInfo = param1.player;
         if(param1.player.qqInfo)
         {
            EnvConfig.ins.vipType = param1.player.qqInfo.vipType;
            this.vipInfoVo = VipUtils.curVipInfoVo();
            if(EnvConfig.ins.vipType == 2 && this.vipInfoVo.needShowValid)
            {
               NpcFuncService.ins.changeCount(60721,1);
            }
            else
            {
               NpcFuncService.ins.changeCount(60721,0);
            }
         }
         ArenaService.ins.init(playerInfo.arenaRank,playerInfo.arenaHistTopRank);
         if(playerInfo.playerHero == null)
         {
            Log.fatal(this,"heroInfo is null");
         }
         else
         {
            HeroModel.ins.onChangeOne(playerInfo.playerHero);
         }
         BagModel.ins;
         if(playerInfo.hasVip)
         {
            _vip = param1.player.vip;
         }
         ServerEngine.ins.addAlwayHandler(2003,serverCpl_playerInfoNotify);
      }
      
      private function serverCpl_playerInfoNotify(param1:PlayerInfoNotify) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         if(param1.player.qqInfo)
         {
            this.playerInfo.qqInfo = param1.player.qqInfo;
            _loc2_ = false;
            if(EnvConfig.ins.vipType != param1.player.qqInfo.vipType)
            {
               EnvConfig.ins.vipType = param1.player.qqInfo.vipType;
               _loc2_ = true;
            }
            _loc3_ = VipUtils.curVipInfoVo();
            if(this.vipInfoVo == null)
            {
               this.vipInfoVo = _loc3_;
               _loc2_ = true;
            }
            else if(_loc3_.equal(this.vipInfoVo) == false)
            {
               this.vipInfoVo = _loc3_;
               _loc2_ = true;
            }
            if(EnvConfig.ins.vipType == 2 && this.vipInfoVo.needShowValid)
            {
               NpcFuncService.ins.changeCount(60721,1);
            }
            else
            {
               NpcFuncService.ins.changeCount(60721,0);
            }
            ObserverMgr.ins.sendNotice("MSG_VIP_CHANGE");
            if(_loc2_)
            {
               TencentVipModel.ins.reCount();
            }
         }
      }
      
      public function isCurPlayer(param1:UInt64) : Boolean
      {
         if(playerInfo)
         {
            return Uint64Util.equal(this.playerInfo.id,param1);
         }
         return true;
      }
      
      public function get qqInfo() : PlayerQQInfo
      {
         return this.playerInfo.qqInfo;
      }
      
      public function get vip() : int
      {
         return _vip;
      }
      
      public function setVip(param1:int) : void
      {
         vipUpNum = param1 - _vip;
         _vip = param1;
         this.playerInfo.vip = _vip;
      }
      
      public function get level() : int
      {
         if(ClientConfig.firstBattle == 1)
         {
            return 1;
         }
         return _level;
      }
      
      public function set gm_level(param1:int) : void
      {
         setLevel(param1);
      }
      
      private function setLevel(param1:int) : void
      {
         $val = param1;
         if(!_level)
         {
            _level = $val;
            if((ClientConfig.gameId == "167" || (EnvConfig.ins.ptId == 590 || EnvConfig.ins.ptId == 592) && ClientConfig.gameId == "160" && RTools.isAppointServer() || EnvConfig.ins.showDevModule) && _playerInfo)
            {
               var obj:Object = {};
               obj.account = ClientConfig.playId;
               obj.gameId = ClientConfig.gameId;
               obj.serverId = ClientConfig.district;
               obj.role = nslm2.common.model.PlayerModel.ins.playerInfo.name;
               obj.level = nslm2.common.model.PlayerModel.ins.level;
               obj.lang = ClientConfig.language;
               obj.isMod = nslm2.common.model.PlayerModel.ins.playerInfo.gmType == 2?true:false;
               obj.opId = EnvConfig.ins.ptId;
               if(nslm2.common.model.PlayerModel.ins.playerInfo.gmType == 2)
               {
                  CallJsMrg.ins.onInstructorPost(obj,function():*
                  {
                     var /*UnknownSlot*/:* = function():int
                     {
                        return PlayerModel.ins.level;
                     };
                     return function():int
                     {
                        return PlayerModel.ins.level;
                     };
                  }());
               }
               CallJsMrg.ins.redInstructorGet(obj);
            }
            return;
         }
         if(_level != $val)
         {
            RoleLvlUpModel.ins.preVo.preLvl = _level;
            RoleLvlUpModel.ins.preVo.preStaminaMax = staminaMax;
            _level = $val;
            CheckRoleTeamRedPointCtrl.ins.checkTeamAndSupporter();
            if(_level > 10)
            {
               GlobalRef.mainCityReshowParam.needShowPanel = true;
            }
            _playerInfo.playerHero.baseInfo.level = $val;
            if(_level != 0)
            {
               NGUtil.levelUp($val);
            }
            if(!checkIsInBattleScene() && _level > 10)
            {
               if(EnvConfig.ins.hideForBS == false)
               {
                  ModuleMgr.ins.showModule(10150,null,ModuleMgr.ins.popLayer.curModuleId);
               }
            }
            if(EnvConfig.ins.ptId == 33)
            {
               DuoWanGameMsgCollector.ins.reportLevelUp();
            }
            ObserverMgr.ins.sendNotice("PLAYER_LEVEL_UP");
            ChatModel.ins.onPlayerLevelChange();
            this.changeWealth(1010,$val);
            if(_level > 3)
            {
               if(RoleLevelUpUtil.chekHasNeedPromptLevelUpHero())
               {
                  ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(30701,true));
               }
            }
            FloatBubbleUtil.checkShow();
            TaskModel.ins.refreshTaskAfterLvlUp();
            FuncOpenAutoCtrl.updateFuncBtnNew(true);
         }
      }
      
      private function checkIsInBattleScene() : Boolean
      {
         return ModuleMgr.ins.isShow(40300);
      }
      
      public function get exp() : Number
      {
         return _exp;
      }
      
      public function set exp(param1:Number) : void
      {
         _exp = param1;
      }
      
      public function changeWealth(param1:int, param2:*, param3:int = 0) : void
      {
         var _loc6_:* = getWealthValue(param1);
         if(param1 == 2)
         {
            RoleLvlUpModel.ins.preVo.preStamina = _loc6_;
         }
         wealthMap[param1] = param2;
         if(!_loc6_ && param1 == 2)
         {
            RoleLvlUpModel.ins.preVo.preStamina = param2;
         }
         var _loc5_:WealthChangeEvent = new WealthChangeEvent(param1,param2,_loc6_);
         var _loc4_:* = !ServerConsts.ins.blockAutoRefreshCMDDict.hasOwnProperty(param3);
         if(_loc4_)
         {
            App.observer.sendNotice("wealthChange",_loc5_);
         }
         ObserverMgr.ins.sendNotice("notice_refresh_module_need_resource_data");
         if(param1 == 31)
         {
            DialModel.ins.checkRedPoint();
         }
         if(DialModel.getIns(60800).isShopCostWealthVo(param1))
         {
            DialModel.getIns(60800).checkRedPoint();
         }
         if(DialModel.getIns(60810).isShopCostWealthVo(param1))
         {
            DialModel.getIns(60810).checkRedPoint();
         }
         if(param1 == 4 && FuncOpenAutoCtrl.checkOpen(900400))
         {
            AngelFundService.ins.initFundInfo();
         }
      }
      
      public function getWealthValue(param1:int) : *
      {
         return this.wealthMap[param1];
      }
      
      public function getCountByWealthVo(param1:WealthVo) : Number
      {
         var _loc2_:* = param1.kind;
         if(20 !== _loc2_)
         {
            if(30 !== _loc2_)
            {
               if(3 !== _loc2_)
               {
                  return this.getWealthValue(param1.kind);
               }
               return this.getWealthValue(param1.kind) + this.getWealthValue(4);
            }
            return HeroModel.ins.getHeroCount(param1.stcNpcVo.id);
         }
         return BagModel.ins.getStcCount(param1.sid);
      }
      
      public function get gold() : int
      {
         return this.getWealthValue(1);
      }
      
      public function get diamond() : int
      {
         return this.getWealthValue(3) + this.getWealthValue(4);
      }
      
      public function get diamond_not_bind() : int
      {
         return this.getWealthValue(3);
      }
      
      public function get diamond_bind() : int
      {
         return this.getWealthValue(4);
      }
      
      public function get stamina() : int
      {
         return this.getWealthValue(2);
      }
      
      public function get staminaMax() : int
      {
         var _loc1_:int = nslm2.common.model.PlayerModel.ins.level;
         var _loc2_:StcLevelVo = StcMgr.ins.getVoByMultiColumnValue("static_level",["level","kind"],[_loc1_,1]);
         return _loc2_.max_stamina;
      }
      
      public function get expNeed() : int
      {
         var _loc1_:int = nslm2.common.model.PlayerModel.ins.level;
         var _loc2_:StcLevelVo = StcMgr.ins.getVoByMultiColumnValue("static_level",["level","kind"],[_loc1_,1]);
         return _loc2_.exp;
      }
      
      public function get sex() : int
      {
         var _loc1_:StcNpcVo = StcMgr.ins.getNpcVo(this.playerInfo.playerHero.baseInfo.baseId);
         return _loc1_.sex;
      }
      
      public function get wingModelId() : int
      {
         if(this.playerInfo.wing == 0)
         {
            return 0;
         }
         var _loc1_:StcItemVo = StcMgr.ins.getItemVo(this.playerInfo.wing);
         if(_loc1_)
         {
            return int(_loc1_.extend_2);
         }
         return 0;
      }
      
      public function get suitModelId() : int
      {
         if(this.playerInfo.suit == 0)
         {
            return 0;
         }
         return this.getFashionModel3DId(this.playerInfo.suit,this.sex);
      }
      
      public function changePlayerView(param1:Unit3DBase, param2:int, param3:int, param4:int) : void
      {
         var _loc6_:StcNpcVo = StcMgr.ins.getNpcVo(param2);
         var _loc5_:int = _loc6_.sex;
         param1.initByModelId(this.getModelIdByStcId(param3,param2),_loc5_,!!param3?getWeaponIdByFashionItemId(param3,_loc5_):FactoryUtil.weapon_ModelVos(param2),StcMgr.ins.getModelVo(this.getModelIdByStcId(param4,param2,true)));
      }
      
      public function changePlayerViewByPlayerInfo(param1:Unit3DBase, param2:PlayerInfo) : void
      {
         var _loc5_:StcNpcVo = StcMgr.ins.getNpcVo(param2.playerHero.baseInfo.baseId);
         var _loc4_:int = _loc5_.sex;
         var _loc3_:int = PetModel.ins.getModelByNpcId(param2.playerHero.baseInfo.baseId);
         param1.initByModelId(_loc5_.kind == 21 && _loc3_ > 0?_loc3_:this.getModelIdByStcId(param2.suit,param2.playerHero.baseInfo.baseId),_loc4_,!!param2.suit?getWeaponIdByFashionItemId(param2.suit,_loc4_):FactoryUtil.weapon_ModelVos(param2.playerHero.baseInfo.baseId),StcMgr.ins.getModelVo(this.getModelIdByStcId(param2.wing,param2.playerHero.baseInfo.baseId,true)));
      }
      
      public function changePlayerViewByPlayerBaseInfo(param1:Unit3DBase, param2:PlayerBaseInfo, param3:int = 1) : void
      {
         var _loc6_:StcNpcVo = StcMgr.ins.getNpcVo(param2.npcId);
         var _loc5_:int = _loc6_.sex;
         var _loc4_:int = PetModel.ins.getModelByNpcId(param2.npcId);
         param1.initByModelId(_loc6_.kind == 21 && _loc4_ > 0?_loc4_:this.getModelIdByStcId(param2.clothes,param2.npcId),_loc5_,!!param2.clothes?getWeaponIdByFashionItemId(param2.clothes,_loc5_):FactoryUtil.weapon_ModelVos(param2.npcId),StcMgr.ins.getModelVo(this.getModelIdByStcId(param2.wing,param2.npcId,true)),param3);
      }
      
      public function getFashionModel3DId(param1:int, param2:int = 0) : int
      {
         var _loc4_:* = null;
         var _loc3_:* = 0;
         var _loc5_:StcItemVo = StcMgr.ins.getItemVo(param1);
         if(_loc5_)
         {
            _loc4_ = _loc5_.extend_2.split("|");
            if(_loc4_.length > 0)
            {
               _loc3_ = uint(_loc4_[param2 - 1]);
            }
            else
            {
               _loc3_ = uint(int(_loc4_[0]));
            }
            return _loc3_;
         }
         return 0;
      }
      
      public function getModelIdByStcId(param1:uint, param2:uint, param3:Boolean = false) : uint
      {
         var _loc4_:* = null;
         var _loc5_:StcNpcVo = StcMgr.ins.getNpcVo(param2);
         if(param1 > 0)
         {
            _loc4_ = StcMgr.ins.getItemVo(param1);
            if(_loc4_)
            {
               return int(_loc4_.extend_2);
            }
         }
         if(param3)
         {
            return 0;
         }
         return int(_loc5_.model_id);
      }
      
      public function getWeaponIdByFashionItemId(param1:uint, param2:int) : Vector.<StcModelVo>
      {
         var _loc4_:StcItemVo = StcMgr.ins.getItemVo(param1);
         if(_loc4_ == null)
         {
            return new Vector.<StcModelVo>();
         }
         var _loc3_:String = _loc4_.extend_3;
         if(StringUtils.isNull(_loc3_) == false)
         {
            return FactoryUtil.weapon_ModelVosByStr(_loc3_);
         }
         return new Vector.<StcModelVo>();
      }
      
      public function getPlayerNameWithAccType(param1:String, param2:Number, param3:uint) : String
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param3)
         {
            param1 = "S" + param3 % 10000 + "." + param1;
         }
         var _loc6_:* = param2;
         if(1 !== _loc6_)
         {
            if(2 !== _loc6_)
            {
               _loc4_ = "";
               _loc5_ = TextFieldUtil.htmlText2(_loc4_,16723968) + param1;
            }
            else
            {
               _loc4_ = "[" + LocaleMgr.ins.getStr(5111) + "] ";
               _loc5_ = TextFieldUtil.htmlText2(_loc4_,458496) + param1;
            }
         }
         else
         {
            _loc4_ = "[" + LocaleMgr.ins.getStr(5113) + "] ";
            _loc5_ = TextFieldUtil.htmlText2(_loc4_,16723968) + param1;
         }
         return _loc5_;
      }
      
      public function getFullNameWithDistName(param1:PlayerBaseInfo, param2:Boolean = true, param3:Boolean = true) : String
      {
         if(param2)
         {
            if(param3 || this.dist != param1.dist)
            {
               if(RTools.cl(false,true))
               {
                  return TextFieldUtil.htmlText2(["S" + param1.dist % 10000,param1.name].join("."),ColorLib.getMilitaryColor(param1.militaryRank));
               }
               return TextFieldUtil.htmlText2(["S" + param1.dist % 10000,param1.name].join("."),ColorLib.getMilitaryColor(param1.militaryRank));
            }
            return TextFieldUtil.htmlText2(param1.name,ColorLib.getMilitaryColor(param1.militaryRank));
         }
         if(param3 || this.dist != param1.dist)
         {
            if(RTools.cl(false,true))
            {
               return ["S" + param1.dist % 10000,param1.name].join(".");
            }
            return ["S" + param1.dist % 10000,param1.name].join(".");
         }
         return param1.name;
      }
      
      public function getDistName(param1:PlayerBaseInfo) : String
      {
         return ["S" + param1.dist % 10000].join(".");
      }
      
      public function getSelfFullNameWithDistName(param1:Boolean = true) : String
      {
         if(param1)
         {
            return TextFieldUtil.htmlText2(["S" + this.dist % 10000,this.playerInfo.name].join("."),ColorLib.getMilitaryColor(this.playerInfo.militaryrank));
         }
         return ["S" + this.dist % 10000,this.playerInfo.name].join(".");
      }
      
      public function get playerInfo() : PlayerInfo
      {
         return _playerInfo;
      }
      
      public function get playerBaseInfo() : PlayerBaseInfo
      {
         var _loc1_:PlayerBaseInfo = new PlayerBaseInfo();
         _loc1_.id = this.playerInfo.id;
         _loc1_.dist = this.dist;
         _loc1_.distName = this.distName;
         _loc1_.militaryRank = this.playerInfo.militaryrank;
         _loc1_.npcId = this.playerInfo.playerHero.baseInfo.baseId;
         _loc1_.name = this.playerInfo.name;
         return null;
      }
   }
}
