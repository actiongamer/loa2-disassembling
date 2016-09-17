package nslm2.modules.funnies.worldBoss
{
   import game.ui.worldBoss.WorldBossModuleUI;
   import flash.geom.Point;
   import com.mz.core.utils.MathUtil;
   import nslm2.modules.funnies.worldBoss.consts.WorldBossConsts;
   import nslm2.modules.scenes.commons.SceneModel;
   import nslm2.modules.funnies.worldBoss.service.WorldBossServiceHandler;
   import nslm2.modules.scenes.mainCitys.MultiPathMaskScene45;
   import nslm2.modules.funnies.worldBoss.model.WorldBossModel;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import com.mz.core.utils.DictHash;
   import org.specter3d.display.particle.SpecterEffect;
   import nslm2.modules.funnies.worldBoss.view.WorldBossRevivePanel;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
   import nslm2.modules.foundations.setting.model.SettingModel;
   import away3d.events.MouseEvent3D;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import proto.WorldBossInfo;
   import nslm2.utils.ServerTimer;
   import com.greensock.TweenLite;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.battles.battle.FPUtil;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import flash.geom.Vector3D;
   import nslm2.utils.ProtoUtils;
   import nslm2.modules.funnies.families.familyBosses.FamilybossUnit3D;
   import flash.events.Event;
   import proto.WorldBossMemberDeadNotify;
   import nslm2.common.model.PlayerModel;
   import com.netease.protobuf.UInt64;
   import com.mz.core.mgrs.UIMgr;
   import proto.WorldBossJoinFightStartRes;
   import nslm2.modules.battles.reportPlayer.BattleReportParamVo;
   import proto.WorldBossQuickFightStartRes;
   import proto.BgFightNotify;
   import nslm2.modules.battles.battlefields.vos.FastBattleData;
   import nslm2.modules.battles.battlefields.vos.FastBattlePlayerData;
   import nslm2.utils.Uint64Util;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyBossVo;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.utils.WealthUtil;
   import morn.core.components.Button;
   import nslm2.modules.foundations.setting.service.SettingService;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.tooltipsModules.vos.WideToolTipStringVo;
   
   public class WorldBossModule extends WorldBossModuleUI
   {
       
      
      private var serviceHandler:WorldBossServiceHandler;
      
      private var scene:MultiPathMaskScene45;
      
      private var bossModel:WorldBossModel;
      
      private var stautsCDCtr:TextCDCtrlS2;
      
      private var bossDataDic:DictHash;
      
      private var bossAvatarDic:DictHash;
      
      private var bossCnt:int;
      
      private var stimulateCDCtr:TextCDCtrlS2;
      
      private var _protectMaskEffect:SpecterEffect;
      
      private var revivePanel:WorldBossRevivePanel;
      
      private var fightLose:Boolean;
      
      private var _openSee:Boolean;
      
      public function WorldBossModule()
      {
         super();
         serviceHandler = WorldBossServiceHandler.ins;
         bossModel = WorldBossModel.ins;
         bossDataDic = new DictHash();
         bossAvatarDic = new DictHash();
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         img_hide.visible = false;
         helpBtn.toolTip = new WideToolTipStringVo(LocaleMgr.ins.getStr(41700013),300);
      }
      
      public static function radomRebornPos() : Point
      {
         var _loc1_:Point = new Point();
         var _loc3_:int = MathUtil.randomInt(WorldBossConsts.PLAYER_REBORN_RECT.left * 10000,WorldBossConsts.PLAYER_REBORN_RECT.right * 10000) / 10000;
         var _loc2_:int = MathUtil.randomInt(WorldBossConsts.PLAYER_REBORN_RECT.top * 10000,WorldBossConsts.PLAYER_REBORN_RECT.bottom * 10000) / 10000;
         _loc1_.x = _loc3_;
         _loc1_.y = _loc2_;
         return _loc1_;
      }
      
      private function get model() : SceneModel
      {
         return SceneModel.ins;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         serviceHandler.addAlwaysListerner();
         if(EnvConfig.ins.testAuthor != 993)
         {
            ModuleMgr.ins.staticLayer.closeAll([10430]);
            ModuleMgr.ins.showModule(10400);
            ModuleMgr.ins.showModule(10500);
         }
         list_BossHead.dataSource = [];
         rankPanel.list_rank.dataSource = [];
         rankPanel.txt_getReward.mouseChildren = false;
         rankPanel.txt_getReward.mouseEnabled = true;
         rankPanel.txt_getReward.buttonMode = true;
         rankPanel.txt_getReward.addEventListener("click",showRankModule);
         init3D();
      }
      
      protected function showRankModule(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(41701);
      }
      
      override public function show(param1:Object = null) : void
      {
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(MainToolBarChangeMsg.WolrdBoss_moduleIdArr,[],true));
         openSee = SettingModel.ins.otherPlayers;
         super.show(param1);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            box_showOthers.addEventListener("click",swtichShowOthers);
            this.scene.multiBgLayer.addEventListener("mouseDown3d",img3d_onMouseDown);
         }
         else
         {
            box_showOthers.removeEventListener("click",swtichShowOthers);
            this.scene.multiBgLayer.addEventListener("mouseDown3d",img3d_onMouseDown);
         }
         super.switchEventListeners(param1);
      }
      
      protected function img3d_onMouseDown(param1:MouseEvent3D) : void
      {
         if(bossModel.isAutoFight)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(40740160));
            check_auto.selected = false;
            serviceHandler.switchSetting(2,false);
            bossModel.isAutoFight = false;
            changeCheckBoxLabel();
         }
      }
      
      private function init3D() : void
      {
         this.scene = new MultiPathMaskScene45();
         this.scene.init(this.moduleId,DefindConsts.WORLD_BOSS_STAGE_ID,initHandler);
         this.addChild(this.scene);
      }
      
      private function initHandler() : void
      {
         serviceHandler.getInfo();
         this.preShowCpl();
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["world_boss_update_boss_info","world_boss_notice_next_wave","world_boss_update_status","world_boss_update_base_info","world_boss_goto_kill_bosss","world_boss_update_damage_rank","world_boss_player_revive","world_boss_player_die","world_boss_update_stimulate_info","family_boss_attack_boss","world_boss_update_my_damage"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("world_boss_update_status" !== _loc4_)
         {
            if("world_boss_notice_next_wave" !== _loc4_)
            {
               if("world_boss_update_boss_info" !== _loc4_)
               {
                  if("world_boss_update_base_info" !== _loc4_)
                  {
                     if("world_boss_goto_kill_bosss" !== _loc4_)
                     {
                        if("world_boss_update_damage_rank" !== _loc4_)
                        {
                           if("world_boss_player_die" !== _loc4_)
                           {
                              if("world_boss_player_revive" !== _loc4_)
                              {
                                 if("world_boss_update_stimulate_info" !== _loc4_)
                                 {
                                    if("world_boss_update_my_damage" !== _loc4_)
                                    {
                                       if("family_boss_attack_boss" === _loc4_)
                                       {
                                          _loc3_ = bossDataDic.getValue(param2);
                                          if(_loc3_ && _loc3_.hp > 0)
                                          {
                                             if(!bossModel.simpleReport)
                                             {
                                                WorldBossServiceHandler.ins.requestFight(param2,startFight);
                                             }
                                             else
                                             {
                                                WorldBossServiceHandler.ins.requestFastFight(param2,startFastFight);
                                             }
                                          }
                                          else if(bossModel.status == 5)
                                          {
                                             scene.autoTrack(bossModel.autoAttackBossId);
                                          }
                                       }
                                    }
                                    else
                                    {
                                       rankPanel.txt_myDamage.num = bossModel.myTotalDamage;
                                    }
                                 }
                              }
                              else
                              {
                                 playerReviveHandler(param2);
                              }
                           }
                           else
                           {
                              playerDieHandler(param2);
                           }
                        }
                        else
                        {
                           rankPanel.list_rank.dataSource = bossModel.simpleDamageRankList;
                           rankPanel.txt_empty.visible = !bossModel.simpleDamageRankList.length;
                        }
                     }
                     else
                     {
                        scene.autoTrack(param2);
                     }
                  }
                  else
                  {
                     updateBaseInfo();
                  }
               }
               else
               {
                  updateBossInfo(param2);
               }
            }
         }
         else
         {
            updateStatus();
         }
      }
      
      private function updateBaseInfo() : void
      {
         check_auto.selected = bossModel.isAutoFight;
         check_FastBattle.selected = bossModel.simpleReport;
         changeCheckBoxLabel();
         rankPanel.txt_myDamage.num = bossModel.myTotalDamage;
         updateStatus();
         if(bossModel.reviveCD && bossModel.reviveCD > ServerTimer.ins.second)
         {
            TweenLite.delayedCall(0.3,playerDideHandler);
         }
      }
      
      private function updateStatus(param1:Boolean = false) : void
      {
         txt_statusCD.text = getStatusName();
         if(bossModel.status >= 7)
         {
            bossModel.statusCD = 0;
         }
         if(bossModel.statusCD)
         {
            txt_statusCD.text = txt_statusCD.text + TimeUtils.hisColonAddZero2(bossModel.statusCD - ServerTimer.ins.second);
            if(!stautsCDCtr)
            {
               stautsCDCtr = new TextCDCtrlS2(txt_statusCD,statusCDFormat,statusCDCompleteHandler);
            }
            stautsCDCtr.start(bossModel.statusCD);
         }
         else if(stautsCDCtr)
         {
            stautsCDCtr.stop();
         }
         switch(int(bossModel.status) - 4)
         {
            case 0:
               box_status.y = 8;
               SceneModel.ins.findPathMed.initFindPathMed([1]);
               if(scene.playerHero.pos2d.x > WorldBossConsts.PLAYER_REBORN_RECT.right)
               {
                  resetPlayerPos();
               }
               if(!_protectMaskEffect)
               {
                  _protectMaskEffect = EffectManager.createEffect(Effect3DUtils.getUrlBySid(3604),true,null,null,0,true,1);
                  _protectMaskEffect.rotationY = -71;
                  _protectMaskEffect.scaleAll = 2.6;
                  _protectMaskEffect.position = new Vector3D(1485,0,-1567);
                  scene.multiBgLayer.effAllLayer.addChild(_protectMaskEffect);
               }
               break;
            case 1:
               box_status.y = 8;
               SceneModel.ins.findPathMed.initFindPathMed();
               autoAttckBoss();
               moveProtectMaskEffect();
               break;
            case 2:
               break;
            case 3:
               box_status.y = 220;
               clearBoss();
               hideRevivePanel();
               scene.multiBgLayer.removeMethod(FPUtil.getGrayMethod());
               SceneModel.ins.findPathMed.initFindPathMed();
         }
      }
      
      private function statusCDFormat(param1:int) : String
      {
         return getStatusName() + TimeUtils.hisColonAddZero2(param1);
      }
      
      private function statusCDCompleteHandler() : void
      {
      }
      
      private function getStatusName() : String
      {
         switch(int(bossModel.status) - 4)
         {
            case 0:
               return LocaleMgr.ins.getStr(40740260);
            case 1:
               return LocaleMgr.ins.getStr(40740261);
            case 2:
               return LocaleMgr.ins.getStr(40740262);
            case 3:
               return LocaleMgr.ins.getStr(41700012,[TimeUtils.getFullTimeStrCN(bossModel.nextActivityStartTime,true,false)]);
         }
      }
      
      private function updateBossInfo(param1:Array) : void
      {
         var _loc5_:Boolean = false;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = null;
         list_BossHead.dataSource = bossModel.bossInfoArr;
         var _loc8_:int = 0;
         var _loc7_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc4_ = bossDataDic.getValue(_loc3_.bossid);
            if(!_loc4_)
            {
               if(!bossAvatarDic.getValue(_loc3_.bossid))
               {
                  if(_loc3_.hp > 0)
                  {
                     addBossAvatar(_loc3_,false);
                     _loc5_ = true;
                  }
                  _loc2_ = new WorldBossInfo();
                  ProtoUtils.copyParams(_loc3_,_loc2_);
                  bossDataDic.put(_loc3_.bossid,_loc2_);
                  continue;
               }
               throw new Error("Boss重复添加：" + _loc3_.bossid);
            }
            if(_loc4_.hp == 0 && _loc3_.hp > 0)
            {
               addBossAvatar(_loc4_,true);
               _loc5_ = true;
            }
            else if(_loc4_.hp > 0 && _loc3_.hp <= 0)
            {
               _loc6_ = bossAvatarDic.getValue(_loc4_.bossid);
               _loc6_.stopRandomRun();
               _loc6_.action = "dead";
               TweenLite.delayedCall(1,removeBossAfterDie,[_loc6_]);
            }
            ProtoUtils.copyParams(_loc3_,_loc4_);
         }
         if(_loc5_)
         {
            autoAttckBoss();
         }
      }
      
      private function removeBossAfterDie(param1:FamilybossUnit3D) : void
      {
         removeBoss(param1);
      }
      
      private function addBossAvatar(param1:WorldBossInfo, param2:Boolean) : void
      {
         var _loc3_:* = 0;
         var _loc8_:int = 0;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc6_:int = bossModel.bossInfoArr.length;
         _loc8_ = 0;
         while(_loc8_ < _loc6_)
         {
            _loc5_ = bossModel.bossInfoArr[_loc8_];
            if(_loc5_.bossid == param1.bossid)
            {
               _loc3_ = _loc8_;
               break;
            }
            _loc3_ = _loc8_;
            _loc8_++;
         }
         if(bossModel.bossInfoArr.length < 2)
         {
            _loc7_ = WorldBossConsts.BOSS_POS_CENTER;
         }
         else
         {
            _loc7_ = WorldBossConsts.BOSS_BORN_POS[_loc3_];
         }
         var _loc4_:FamilybossUnit3D = scene.addFamilyBoss(param1.bossid,param1.npcgroupid,_loc7_);
         _loc4_.bossId = param1.bossid;
         _loc4_.playReviveAct = param2;
         _loc4_.addEventListener("avatar_anim_all_complete",bossAavatarInitComplete);
         _loc4_.addEventListener("animator_complete",bossAnimatorComplete);
         bossAvatarDic.put(param1.bossid,_loc4_);
         _loc4_.setSummaryView(true);
      }
      
      protected function bossAavatarInitComplete(param1:Event) : void
      {
         var _loc2_:FamilybossUnit3D = param1.target as FamilybossUnit3D;
         if(_loc2_.playReviveAct)
         {
            _loc2_.revive();
         }
         else
         {
            _loc2_.born();
         }
         _loc2_.playReviveAct = false;
      }
      
      protected function bossAnimatorComplete(param1:Event) : void
      {
         var _loc2_:FamilybossUnit3D = param1.target as FamilybossUnit3D;
         var _loc3_:* = _loc2_.action;
         if("dead" !== _loc3_)
         {
            if("skill_1" !== _loc3_)
            {
               if("relive" !== _loc3_)
               {
                  _loc2_.action = "std_2";
               }
               else
               {
                  _loc2_.action = "std_2";
               }
            }
            else
            {
               _loc2_.action = "std_2";
            }
         }
         else
         {
            removeBoss(_loc2_);
         }
      }
      
      private function removeBoss(param1:FamilybossUnit3D) : void
      {
         if(!param1)
         {
            return;
         }
         param1.removeEventListener("avatar_anim_all_complete",bossAavatarInitComplete);
         param1.removeEventListener("animator_complete",bossAnimatorComplete);
         scene.removeFamilyBoss(param1);
         bossAvatarDic.remove(param1.bossId);
         param1.setSummaryView(false);
         param1 = null;
      }
      
      private function playerDieHandler(param1:WorldBossMemberDeadNotify) : void
      {
         if(PlayerModel.ins.isCurPlayer(param1.playerid))
         {
            bossModel.reviveCD = param1.relivetimestamp;
         }
         else
         {
            scene.setOtherRolePos(param1.playerid,radomRebornPos());
         }
      }
      
      private function playerDideHandler() : void
      {
         if(isDisposed)
         {
            return;
         }
         if(bossModel.status >= 7)
         {
            return;
         }
         showRevivePanel();
         scene.multiBgLayer.addMethod(FPUtil.getGrayMethod());
         SceneModel.ins.findPathMed.initFindPathMed([1]);
         if(scene.playerHero.pos2d.x > WorldBossConsts.PLAYER_REBORN_RECT.right)
         {
            resetPlayerPos();
         }
      }
      
      private function resetPlayerPos() : void
      {
         var _loc1_:Point = SceneModel.ins.findPathMed.getCanMovePoiNearest(radomRebornPos());
         scene.playerHero.pos2d = _loc1_;
      }
      
      private function playerReviveHandler(param1:UInt64) : void
      {
         if(PlayerModel.ins.isCurPlayer(param1))
         {
            hideRevivePanel();
            scene.multiBgLayer.removeMethod(FPUtil.getGrayMethod());
            SceneModel.ins.findPathMed.initFindPathMed();
            autoAttckBoss();
         }
      }
      
      private function autoAttckBoss() : void
      {
         if(bossModel.isAutoFight && !bossModel.reviveCD && bossModel.autoAttackBossId && bossModel.status >= 5)
         {
            scene.autoTrack(bossModel.autoAttackBossId);
         }
      }
      
      private function showRevivePanel() : void
      {
         if(!revivePanel)
         {
            revivePanel = new WorldBossRevivePanel();
         }
         addChild(revivePanel);
         revivePanel.x = UIMgr.gameWidth - revivePanel.width >> 1;
         revivePanel.y = UIMgr.gameHeight - revivePanel.height >> 1;
         revivePanel.show(bossModel.reviveCD);
         revivePanel.fadeIn();
      }
      
      private function hideRevivePanel() : void
      {
         if(revivePanel && contains(revivePanel))
         {
            revivePanel.fadeOutThenDispose();
            revivePanel = null;
         }
      }
      
      private function gwCdFormat(param1:int) : String
      {
         return TimeUtils.isColonWithZero(param1);
      }
      
      private function startFight(param1:WorldBossJoinFightStartRes) : void
      {
         var _loc2_:BattleReportParamVo = BattleReportParamVo.createId(param1.reportid);
         _loc2_.type = 5;
         _loc2_.drops = param1.rewards;
         _loc2_.otherskillBoss = param1.invalidefight;
         _loc2_.familybossId = param1.bossid;
         _loc2_.familybossDmg = param1.totalhurt - bossModel.myTotalDamage;
         ModuleMgr.ins.showModule(40201,_loc2_);
      }
      
      private function startFastFight(param1:WorldBossQuickFightStartRes) : void
      {
         if(!param1)
         {
            return;
         }
         bossModel.myTotalDamage = param1.totalhurt;
         var _loc4_:BgFightNotify = new BgFightNotify();
         var _loc5_:FastBattleData = new FastBattleData();
         _loc4_.attacker = param1.attacker;
         _loc4_.target = param1.target;
         if(param1.result == 1)
         {
            _loc4_.winnerId = param1.attacker.playerId;
         }
         else
         {
            _loc4_.winnerId = param1.target.playerId;
         }
         var _loc2_:FastBattlePlayerData = new FastBattlePlayerData();
         var _loc6_:FastBattlePlayerData = new FastBattlePlayerData();
         _loc2_.name = PlayerModel.ins.playerInfo.name;
         _loc2_.level = PlayerModel.ins.level;
         _loc2_.fightValue = Uint64Util.fromNumber(PlayerModel.ins.totalFightValue);
         _loc2_.playerId = PlayerModel.ins.playerInfo.id;
         _loc2_.npcID = PlayerModel.ins.playerInfo.playerHero.baseInfo.baseId;
         _loc2_.miliRank = PlayerModel.ins.playerInfo.militaryrank;
         _loc2_.side = 1;
         var _loc7_:StcNpcGroupVo = StcMgr.ins.getNpcGroupVo(bossModel.crtAttackBossID);
         var _loc8_:StcNpcVo = StcMgr.ins.getNpcVo(_loc7_.display_npc);
         _loc6_.npcID = _loc8_.id;
         _loc6_.level = _loc8_.level;
         _loc6_.name = TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(_loc8_.name),ColorLib.qualityColor(_loc8_.quality));
         var _loc3_:StcFamilyBossVo = StcMgr.ins.getVoByColumnValue("static_family_boss","rank",bossModel.crtWave);
         _loc6_.fightValue = Uint64Util.fromNumber(_loc3_.ability);
         _loc6_.side = 2;
         _loc5_.fightData = _loc4_;
         _loc5_.leftPlayerData = _loc2_;
         _loc5_.rightPlayerData = _loc6_;
         _loc5_.loseCallBack = new Handler(fightLoseHandler,[param1]);
         _loc5_.winCallBack = new Handler(fightWinHandler,[param1]);
         _loc5_.closeCallBack = new Handler(fastFightEndHandler);
         _loc5_.isFamilyBoss = true;
         ModuleMgr.ins.showModule(50509,_loc5_,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function fightWinHandler(param1:WorldBossQuickFightStartRes) : void
      {
         if(param1.rewards && param1.rewards.length)
         {
            TweenLite.delayedCall(0.8,FloatUtil.showGetItemsDisplayPanel,[WealthUtil.rewardArrToWealthVoArr(param1.rewards)]);
         }
      }
      
      private function fastFightEndHandler() : void
      {
         if(fightLose)
         {
            playerDideHandler();
         }
         else
         {
            autoAttckBoss();
         }
         fightLose = false;
      }
      
      private function fightLoseHandler(param1:WorldBossQuickFightStartRes) : void
      {
         if(param1.rewards && param1.rewards.length)
         {
            TweenLite.delayedCall(0.5,FloatUtil.showGetItemsDisplayPanel,[WealthUtil.rewardArrToWealthVoArr(param1.rewards)]);
         }
         fightLose = true;
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(check_auto !== _loc2_)
         {
            if(check_FastBattle === _loc2_)
            {
               serviceHandler.switchSetting(1,check_FastBattle.selected);
               changeCheckBoxLabel();
               bossModel.simpleReport = check_FastBattle.selected;
            }
         }
         else
         {
            serviceHandler.switchSetting(2,check_auto.selected);
            changeCheckBoxLabel();
            bossModel.isAutoFight = check_auto.selected;
            if(bossModel.isAutoFight)
            {
               autoAttckBoss();
            }
         }
      }
      
      private function changeCheckBoxLabel() : void
      {
         check_FastBattle.label = !!check_FastBattle.selected?LocaleMgr.ins.getStr(40740006) + LocaleMgr.ins.getStr(40740008):LocaleMgr.ins.getStr(40740006) + LocaleMgr.ins.getStr(40740009);
         check_auto.label = !!check_auto.selected?LocaleMgr.ins.getStr(40740007) + LocaleMgr.ins.getStr(40740008):LocaleMgr.ins.getStr(40740007) + LocaleMgr.ins.getStr(40740009);
      }
      
      protected function swtichShowOthers(param1:MouseEvent) : void
      {
         openSee = !_openSee;
      }
      
      public function get openSee() : Boolean
      {
         if(SettingModel.ins.otherPlayers == 0)
         {
            _openSee = true;
         }
         else
         {
            _openSee = false;
         }
         return _openSee;
      }
      
      public function set openSee(param1:Boolean) : void
      {
         if(param1)
         {
            txt_showOthers.text = LocaleMgr.ins.getStr(40740001);
            box_showOthers.toolTip = LocaleMgr.ins.getStr(9796042);
         }
         else
         {
            txt_showOthers.text = LocaleMgr.ins.getStr(40740000);
            box_showOthers.toolTip = LocaleMgr.ins.getStr(9796040);
         }
         if(param1 == _openSee)
         {
            return;
         }
         _openSee = param1;
         if(param1)
         {
            SettingModel.ins.otherPlayers = 1;
         }
         else
         {
            SettingModel.ins.otherPlayers = 0;
         }
         if(_openSee)
         {
            img_hide.visible = true;
            img_show.visible = false;
         }
         else
         {
            img_hide.visible = false;
            img_show.visible = true;
         }
         SettingService.ins.save(12,SettingModel.ins.otherPlayers);
         ObserverMgr.ins.sendNotice("MSG_SEE_OTHER_PLAYERS_SWITCH",param1);
         ObserverMgr.ins.sendNotice("msg_other_players_VISIBLE");
      }
      
      private function clearBoss() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = bossAvatarDic.array;
         for each(var _loc1_ in bossAvatarDic.array)
         {
            if(_loc1_)
            {
               _loc1_.removeEventListener("avatar_anim_all_complete",bossAavatarInitComplete);
               _loc1_.removeEventListener("animator_complete",bossAnimatorComplete);
               _loc1_.dispose();
               _loc1_ = null;
            }
         }
         bossDataDic.clear();
         bossAvatarDic.clear();
      }
      
      private function moveProtectMaskEffect() : void
      {
         if(_protectMaskEffect)
         {
            scene.multiBgLayer.effAllLayer.removeChild(_protectMaskEffect);
            _protectMaskEffect.dispose();
            _protectMaskEffect = null;
         }
      }
      
      override public function dispose() : void
      {
         serviceHandler.dispose();
         var _loc3_:int = 0;
         var _loc2_:* = bossAvatarDic;
         for each(var _loc1_ in bossAvatarDic)
         {
            if(_loc1_)
            {
               _loc1_.removeEventListener("avatar_anim_all_complete",bossAavatarInitComplete);
               _loc1_.removeEventListener("animator_complete",bossAnimatorComplete);
               _loc1_.dispose();
               _loc1_ = null;
            }
         }
         bossModel.dispose();
         bossDataDic.clear();
         bossAvatarDic.clear();
         if(revivePanel)
         {
            revivePanel.dispose();
            revivePanel = null;
         }
         if(stautsCDCtr)
         {
            stautsCDCtr.dispose();
         }
         if(stimulateCDCtr)
         {
            stimulateCDCtr.dispose();
         }
         TweenLite.killDelayedCallsTo(playerDideHandler);
         TweenLite.killDelayedCallsTo(removeBossAfterDie);
         TweenLite.killDelayedCallsTo(FloatUtil.showGetItemsDisplayPanel);
         if(scene)
         {
            scene.dispose();
            scene = null;
         }
         super.dispose();
      }
   }
}
