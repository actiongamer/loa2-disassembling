package nslm2.common.model
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import com.netease.protobuf.UInt64;
   import com.mz.core.utils.DictHash;
   import nslm2.utils.Uint64Util;
   import proto.HeroInfo;
   import morn.core.handlers.Handler;
   import morn.core.handlers.HandlerList;
   import com.mz.core.utils2.task.TaskBase;
   import flash.utils.Dictionary;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import proto.PanelBaseInfo;
   import nslm2.modules.cultivates.roleTeam.vo.RoleTeamVo;
   import nslm2.modules.cultivates.roleTeam.vo.YuanJunVo;
   import nslm2.modules.roleInfos.equipPanels.MengYuePropVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import com.mz.core.utils.ArrayUtil;
   import proto.PlayerDataNotify;
   import nslm2.utils.ProtoUtils;
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   import proto.Item;
   import nslm2.modules.cultivates.roleTeam.ctrl.CheckRoleTeamRedPointCtrl;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleNewMsg;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import proto.BaoWu;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   import nslm2.modules.cultivates.roleTeam.vo.RoleTeamHeroVo;
   import proto.BuZhen;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.vos.StcMengyueVo;
   import nslm2.modules.roleInfos.tupos.RoleTupoUtil;
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import nslm2.modules.roleInfos.vo.RoleTupoNeedVo;
   import nslm2.modules.roleInfos.phaseUps.talents.PhaseUpTalentUtil;
   import nslm2.modules.roleInfos.awake.RoleAwakeUtil;
   import proto.HeroShengjieRecordReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.HeroShengjieRecordRes;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.ShengjieRecord;
   
   public class HeroModel
   {
      
      private static var _ins:nslm2.common.model.HeroModel;
      
      private static const MAX_ON_POS:int = 5;
       
      
      public var newHeroArr:Vector.<UInt64>;
      
      public var suitDataDic:DictHash;
      
      public var heroYuanfenDic:DictHash;
      
      public var getHeroInfoTaskDict:Dictionary;
      
      public var getHeroInfoHandlerDict:Dictionary;
      
      private var _teamHeroArr:Array;
      
      private var _yuanJunArr:Array;
      
      private var _canJoinTeamArr:Array;
      
      private var _canJoinYuanjunArr:Array;
      
      private var _onPosHeroNodeIDArr:Array;
      
      private var _panelBaseInfoList:Array;
      
      private var _heroInfoDic:DictHash;
      
      public var needSortPanelBaseInfoList:Boolean = true;
      
      private var stcNpcVoDic:Dictionary;
      
      private var _phaseDict:DictHash;
      
      private var _requestHeroBaseId:uint;
      
      private var _requestHeroSjLevel:uint;
      
      public function HeroModel()
      {
         newHeroArr = new Vector.<UInt64>();
         suitDataDic = new DictHash();
         heroYuanfenDic = new DictHash();
         getHeroInfoTaskDict = new Dictionary();
         getHeroInfoHandlerDict = new Dictionary();
         _panelBaseInfoList = [];
         _heroInfoDic = new DictHash();
         stcNpcVoDic = new Dictionary();
         _phaseDict = new DictHash();
         super();
      }
      
      public static function get ins() : nslm2.common.model.HeroModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.common.model.HeroModel();
         }
         return _ins;
      }
      
      public static function getHeroNodeId(param1:int) : int
      {
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(param1);
         if(_loc2_)
         {
            return _loc2_.node;
         }
         return 0;
      }
      
      public function isNewHero(param1:UInt64) : Boolean
      {
         return Uint64Util.indexOfArray(this.newHeroArr,param1) > -1;
      }
      
      public function removeNewHero(param1:UInt64) : void
      {
         Uint64Util.removeItemFromArray(this.newHeroArr,param1);
      }
      
      public function getHeroInfoQuick(param1:UInt64) : HeroInfo
      {
         var _loc2_:String = Uint64Util.toString(param1);
         return this.heroInfoDic.getValue(_loc2_);
      }
      
      public function getHeroInfo(param1:UInt64, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param2 == null)
         {
            throw new Error("HeroModel.getHeroInfo()参数$handler必须设值");
         }
         if(playerHero && Uint64Util.equal(playerHero.baseInfo.id,param1))
         {
            Handler.execute(param2,[playerHero]);
         }
         else
         {
            _loc3_ = Uint64Util.toString(param1);
            if(this.heroInfoDic.containsKey(_loc3_))
            {
               Handler.execute(param2,[this.heroInfoDic.getValue(_loc3_)]);
            }
            else if(getHeroInfoTaskDict[_loc3_])
            {
               (getHeroInfoHandlerDict[_loc3_] as HandlerList).addHandler(param2);
            }
            else
            {
               getHeroInfoHandlerDict[_loc3_] = new HandlerList();
               (getHeroInfoHandlerDict[_loc3_] as HandlerList).addHandler(param2);
               _loc4_ = new GetHeroInfoTask(param1).addHandlers(getHeroInfoCpl);
               getHeroInfoTaskDict[_loc3_] = _loc4_;
               _loc4_.exec();
            }
         }
      }
      
      private function getHeroInfoCpl(param1:GetHeroInfoTask) : void
      {
         var _loc2_:String = Uint64Util.toString(param1.heroId);
         Handler.execute(getHeroInfoHandlerDict[_loc2_] as HandlerList,[this.heroInfoDic.getValue(_loc2_)]);
         delete getHeroInfoTaskDict[_loc2_];
      }
      
      public function getQuality(param1:UInt64, param2:int) : int
      {
         var _loc3_:int = 0;
         if(nslm2.common.model.HeroModel.ins.isCurPlayerHero(param1))
         {
            _loc3_ = MilitaryModel.ins.getPlayerQuality(PlayerModel.ins.playerInfo.militaryrank);
         }
         else
         {
            _loc3_ = StcMgr.ins.getNpcVo(param2).quality;
         }
         return _loc3_;
      }
      
      public function isCurPlayerHero(param1:UInt64) : Boolean
      {
         if(playerHero)
         {
            return Uint64Util.equal(this.playerHero.baseInfo.id,param1);
         }
         return true;
      }
      
      public function isCurPlayerHeroByStcNpcId(param1:int) : Boolean
      {
         var _loc2_:* = null;
         if(playerHero)
         {
            _loc2_ = getNpcStcVo(param1);
            return _loc2_.node == 100 || _loc2_.node == 200;
         }
         return false;
      }
      
      public function get heroInfoDic() : DictHash
      {
         return _heroInfoDic;
      }
      
      public function get teamHeroArr() : Array
      {
         updateTeamHeroArr();
         return _teamHeroArr;
      }
      
      public function updateTeamHeroArr() : void
      {
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         _teamHeroArr = [];
         var _loc1_:Array = [];
         var _loc7_:int = 0;
         var _loc6_:* = panelBaseInfoList;
         for each(var _loc4_ in panelBaseInfoList)
         {
            if(_loc4_.position > 0)
            {
               _loc1_.push(_loc4_);
            }
         }
         _loc3_ = 1;
         while(_loc3_ <= 5)
         {
            _loc2_ = null;
            _loc5_ = new RoleTeamVo();
            _loc5_.index = _loc3_;
            var _loc9_:int = 0;
            var _loc8_:* = _loc1_;
            for each(_loc4_ in _loc1_)
            {
               if(_loc4_.position == _loc3_)
               {
                  _loc2_ = _loc4_;
               }
            }
            _loc5_.heroData = _loc2_;
            _teamHeroArr.push(_loc5_);
            _loc3_++;
         }
      }
      
      public function get teamHeroArrWithoutPlayer() : Array
      {
         updateTeamHeroArr();
         _teamHeroArr.shift();
         return _teamHeroArr;
      }
      
      public function get teamHeroInfoArr() : Array
      {
         var _loc1_:Array = [];
         _loc1_.push(playerHero);
         var _loc4_:int = 0;
         var _loc3_:* = heroInfoDic.array;
         for each(var _loc2_ in heroInfoDic.array)
         {
            if(_loc2_.baseInfo.position > 0)
            {
               _loc1_.push(_loc2_);
            }
         }
         _loc1_.sort(sortTeamHero);
         return _loc1_;
      }
      
      public function getIndexInTeamHeroInfo(param1:HeroInfo) : int
      {
         var _loc3_:int = 0;
         var _loc2_:Array = this.teamHeroInfoArr;
         while(_loc3_ < _loc2_.length)
         {
            if(Uint64Util.equal((_loc2_[_loc3_] as HeroInfo).baseInfo.id,param1.baseInfo.id))
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function getIndexInYuanJunHeroInfo(param1:HeroInfo) : int
      {
         var _loc3_:int = 0;
         var _loc2_:Array = this.YuanJunArr;
         while(_loc3_ < _loc2_.length)
         {
            if((_loc2_[_loc3_] as YuanJunVo).heroData && Uint64Util.equal((_loc2_[_loc3_] as YuanJunVo).heroData.id,param1.baseInfo.id))
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      private function sortTeamHero(param1:HeroInfo, param2:HeroInfo) : int
      {
         if(param1.baseInfo.position < param2.baseInfo.position)
         {
            return -1;
         }
         return 1;
      }
      
      public function get totalYuanFengCnt() : int
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = panelBaseInfoList;
         for each(var _loc3_ in panelBaseInfoList)
         {
            if(_loc3_.position > 1)
            {
               _loc1_ = _loc1_ + MengYuePropVo.getActivateMengYueCnt(HeroInfoUtil.getNodeId(_loc3_.baseId),_loc3_.mengyue,1);
            }
         }
         return _loc1_;
      }
      
      public function get onPosHeroNodeIDArr() : Array
      {
         return _onPosHeroNodeIDArr;
      }
      
      public function initOnPosHeroNodeIDArr() : void
      {
         var _loc2_:* = null;
         _onPosHeroNodeIDArr = [];
         var _loc4_:int = 0;
         var _loc3_:* = panelBaseInfoList;
         for each(var _loc1_ in panelBaseInfoList)
         {
            if(_loc1_.position || uint(_loc1_.place))
            {
               _onPosHeroNodeIDArr.push(getHeroNodeId(_loc1_.baseId));
            }
         }
      }
      
      public function updateOnPosHeroNodeIdArr(param1:PanelBaseInfo) : void
      {
         var _loc2_:int = getHeroNodeId(param1.baseId);
         if(param1.position || uint(param1.place))
         {
            if(_onPosHeroNodeIDArr.indexOf(_loc2_) < 0)
            {
               _onPosHeroNodeIDArr.push(_loc2_);
            }
         }
         else
         {
            ArrayUtil.removeItem(_onPosHeroNodeIDArr,_loc2_);
         }
      }
      
      public function get YuanJunArr() : Array
      {
         updateYuanJunArr();
         return _yuanJunArr;
      }
      
      public function updateYuanJunArr() : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:int = 0;
         _yuanJunArr = [];
         var _loc1_:Array = [];
         var _loc7_:int = 0;
         var _loc6_:* = panelBaseInfoList;
         for each(var _loc5_ in panelBaseInfoList)
         {
            if(_loc5_.place > 20)
            {
               _loc1_.push(_loc5_);
            }
         }
         _loc3_ = 1;
         while(_loc3_ <= 6)
         {
            _loc2_ = null;
            _loc4_ = new YuanJunVo();
            _loc4_.index = _loc3_;
            var _loc9_:int = 0;
            var _loc8_:* = _loc1_;
            for each(_loc5_ in _loc1_)
            {
               if(_loc5_.place == _loc3_ + 20)
               {
                  _loc2_ = _loc5_;
               }
            }
            _loc4_.heroData = _loc2_;
            _yuanJunArr.push(_loc4_);
            _loc3_++;
         }
      }
      
      public function get YuanJunCnt() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = panelBaseInfoList;
         for each(var _loc2_ in panelBaseInfoList)
         {
            if(_loc2_.place > 20)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function getFeedHeros() : Array
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = heroInfoDic.array;
         for each(var _loc2_ in heroInfoDic.array)
         {
            if(getNpcStcVo(_loc2_.baseInfo.baseId).quality > 2)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function onDataChange(param1:PlayerDataNotify) : void
      {
         if(param1.addHeroes)
         {
            this.addArr(param1.addHeroes);
         }
         if(param1.reduceHeroes)
         {
            this.reduceArr(param1.reduceHeroes);
         }
      }
      
      public function onChangeOne(param1:HeroInfo) : void
      {
         var _loc8_:* = null;
         var _loc5_:Boolean = false;
         var _loc7_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = null;
         if(playerHero && Uint64Util.equal(playerHero.baseInfo.id,param1.baseInfo.id))
         {
            _loc8_ = playerHero;
         }
         else
         {
            _loc8_ = heroInfoDic.getValue(Uint64Util.toString(param1.baseInfo.id));
         }
         if(_loc8_)
         {
            if(_loc8_.baseInfo.place != param1.baseInfo.place)
            {
               _loc5_ = true;
            }
            ProtoUtils.copyParams(param1,_loc8_);
         }
         else
         {
            _loc5_ = true;
            heroInfoDic.put(Uint64Util.toString(param1.baseInfo.id),param1);
         }
         var _loc10_:int = 0;
         var _loc9_:* = panelBaseInfoList;
         for each(var _loc4_ in panelBaseInfoList)
         {
            if(Uint64Util.equal(_loc4_.id,param1.baseInfo.id))
            {
               _loc7_ = _loc4_;
               ProtoUtils.copyParams(HeroInfoUtil.heroInfoToPanelBaseinfo(param1),_loc4_);
               updateOnPosHeroNodeIdArr(_loc4_);
               RecycleModel.ins.addCanRebornHero(_loc7_);
            }
         }
         if(_loc5_)
         {
            if(!param1.baseInfo.place)
            {
               RecycleModel.ins.removeIdleHero(_loc7_.id);
               RecycleModel.ins.addIdleHero([_loc7_]);
            }
            if(param1.baseInfo.place > 0)
            {
               RecycleModel.ins.removeIdleHero(param1.baseInfo.id);
            }
         }
         var _loc12_:int = 0;
         var _loc11_:* = param1.items;
         for each(var _loc3_ in param1.items)
         {
            if(_loc3_)
            {
               _loc2_ = StcMgr.ins.getItemVo(_loc3_.itemId).extend_1;
               _loc6_ = Uint64Util.toString(param1.baseInfo.id) + "|" + _loc2_;
               suitDataDic.put(_loc6_,_loc3_.suit.length);
            }
         }
      }
      
      public function addArr(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc5_:int = param1.length;
         var _loc2_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = param1[_loc6_];
            newHeroArr.push(_loc3_.baseInfo.id);
            heroInfoDic.put(Uint64Util.toString(_loc3_.baseInfo.id),_loc3_);
            _loc4_ = HeroInfoUtil.heroBaseInfoToPanelBaseInfo(_loc3_.baseInfo);
            panelBaseInfoList.push(_loc4_);
            _loc2_.push(_loc4_);
            _loc6_++;
         }
         if(_loc5_ > 0)
         {
            RecycleModel.ins.addIdleHero(_loc2_);
            CheckRoleTeamRedPointCtrl.ins.checkTeamAndSupporter();
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_NEW",new SwitchModuleNewMsg(30701,true));
         }
      }
      
      public function reduceArr(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_];
            heroInfoDic.remove(Uint64Util.toString(_loc3_));
            Uint64Util.removeItemByAttr(panelBaseInfoList,PanelBaseInfo.ID.name,_loc3_);
            Uint64Util.removeItemFromArray(newHeroArr,_loc3_);
            RecycleModel.ins.removeIdleHero(_loc3_);
            _loc4_++;
         }
         if(_loc2_ > 0)
         {
            CheckRoleTeamRedPointCtrl.ins.checkTeamAndSupporter();
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_NEW",new SwitchModuleNewMsg(30701,newHeroArr.length > 0));
         }
      }
      
      public function getInfoById(param1:UInt64) : HeroInfo
      {
         return heroInfoDic.getValue(Uint64Util.toString(param1));
      }
      
      public function getEquipedItemByKind(param1:int) : Item
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(RoleInfoModel.ins.heroInfo == null)
         {
            _loc3_ = nslm2.common.model.HeroModel.ins.playerHero.items.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = nslm2.common.model.HeroModel.ins.playerHero.items[_loc4_];
               if(StcMgr.ins.getItemVo(_loc2_.itemId).kind == param1)
               {
                  return _loc2_;
               }
               _loc4_++;
            }
         }
         _loc3_ = RoleInfoModel.ins.heroInfo.items.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = RoleInfoModel.ins.heroInfo.items[_loc4_];
            if(StcMgr.ins.getItemVo(_loc2_.itemId).kind == param1)
            {
               return _loc2_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function getEquipedTreasureByKind(param1:BaoWu) : BaoWu
      {
         var _loc2_:int = StcMgr.ins.getItemVo(param1.baseId).kind;
         return getEquipedTreasureByKind2(_loc2_);
      }
      
      public function getEquipedTreasureByKind2(param1:int) : BaoWu
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         if(RoleInfoModel.ins.heroInfo == null)
         {
            _loc3_ = nslm2.common.model.HeroModel.ins.playerHero.baowu;
         }
         _loc3_ = RoleInfoModel.ins.heroInfo.baowu;
         var _loc4_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _loc3_[_loc5_];
            if(StcMgr.ins.getItemVo(_loc2_.baseId).kind == param1)
            {
               return _loc2_;
            }
            _loc5_++;
         }
         return null;
      }
      
      public function hasCanJoinTeamHero(param1:Boolean = false) : Boolean
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = panelBaseInfoList;
         for each(var _loc3_ in panelBaseInfoList)
         {
            if(!_loc3_.position && !_loc3_.place)
            {
               _loc2_ = getHeroNodeId(_loc3_.baseId);
               if(_onPosHeroNodeIDArr.indexOf(_loc2_) == -1 || !param1 && RoleTeamModel.ins.crtHeroNodeId == _loc2_)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function sortHeroList() : void
      {
         if(needSortPanelBaseInfoList)
         {
            _panelBaseInfoList.sort(sortHeroFun);
            needSortPanelBaseInfoList = false;
         }
      }
      
      public function get notOnPosHeroList() : Array
      {
         var _loc4_:* = null;
         var _loc1_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc7_:int = 0;
         var _loc6_:* = panelBaseInfoList;
         for each(var _loc5_ in panelBaseInfoList)
         {
            if(!_loc5_.position && !_loc5_.place)
            {
               _loc1_ = getHeroNodeId(_loc5_.baseId);
               if(_onPosHeroNodeIDArr.indexOf(_loc1_) == -1 || RoleTeamModel.ins.crtHeroNodeId == _loc1_)
               {
                  _loc3_ = getHasYuanFenHeroIDArr(_loc5_);
                  _loc4_ = new RoleTeamHeroVo();
                  _loc4_.heroInfo = _loc5_;
                  _loc4_.yuanFenDataArr = _loc3_;
                  _loc4_.yuanFenCnt = _loc3_.length;
                  _loc2_.push(_loc4_);
               }
            }
         }
         _loc2_.sort(sortIdleHero);
         return _loc2_;
      }
      
      public function getNotInYuanJunHeroList(param1:Boolean = true) : Array
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:Array = [];
         var _loc7_:int = 0;
         var _loc6_:* = panelBaseInfoList;
         for each(var _loc5_ in panelBaseInfoList)
         {
            if(!_loc5_.position && !_loc5_.place)
            {
               if(_onPosHeroNodeIDArr.indexOf(getHeroNodeId(_loc5_.baseId)) == -1)
               {
                  _loc3_ = getHasYuanFenHeroIDArr(_loc5_,true);
                  _loc4_ = new RoleTeamHeroVo();
                  _loc4_.heroInfo = _loc5_;
                  _loc4_.yuanFenCnt = _loc3_.length;
                  _loc4_.yuanFenDataArr = _loc3_;
                  _loc2_.push(_loc4_);
               }
            }
         }
         _loc2_.sort(sortIdleHero);
         return _loc2_;
      }
      
      public function getNpcStcVo(param1:int) : StcNpcVo
      {
         var _loc2_:* = null;
         if(stcNpcVoDic.hasOwnProperty(param1))
         {
            _loc2_ = stcNpcVoDic[param1];
         }
         else
         {
            _loc2_ = StcMgr.ins.getNpcVo(param1);
            stcNpcVoDic[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      private function sortIdleHero(param1:RoleTeamHeroVo, param2:RoleTeamHeroVo) : int
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:int = param1.yuanFenCnt;
         var _loc4_:int = param2.yuanFenCnt;
         if(_loc3_ > _loc4_)
         {
            return -1;
         }
         if(_loc3_ < _loc4_)
         {
            return 1;
         }
         _loc5_ = getNpcStcVo(param1.heroInfo.baseId);
         _loc6_ = getNpcStcVo(param2.heroInfo.baseId);
         if(_loc5_.quality > _loc6_.quality)
         {
            return -1;
         }
         if(_loc5_.quality < _loc6_.quality)
         {
            return 1;
         }
         if(param1.heroInfo.level > param2.heroInfo.level)
         {
            return -1;
         }
         if(param1.heroInfo.level < param2.heroInfo.level)
         {
            return 1;
         }
         if(param1.heroInfo.baseId < param2.heroInfo.baseId)
         {
            return -1;
         }
         if(param1.heroInfo.baseId > param2.heroInfo.baseId)
         {
            return 1;
         }
         return 0;
      }
      
      public function hasIdleHero() : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:* = panelBaseInfoList;
         for each(var _loc1_ in panelBaseInfoList)
         {
            if(!_loc1_.position && _onPosHeroNodeIDArr.indexOf(getHeroNodeId(_loc1_.baseId)) == -1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasIdleYuanJun() : Boolean
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = panelBaseInfoList;
         for each(var _loc2_ in panelBaseInfoList)
         {
            if(!_loc2_.position && !_loc2_.place)
            {
               if(_onPosHeroNodeIDArr.indexOf(getHeroNodeId(_loc2_.baseId)) == -1)
               {
                  _loc1_ = getHasYuanFenHeroIDArr(_loc2_);
                  if(_loc1_.length)
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public function checkHeroInTeamOrYuanJun(param1:int) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = panelBaseInfoList;
         for each(var _loc2_ in panelBaseInfoList)
         {
            if(getNpcStcVo(_loc2_.baseId).node == getNpcStcVo(param1).node && _loc2_.place > 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function checkHeroInTeam(param1:int) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = panelBaseInfoList;
         for each(var _loc2_ in panelBaseInfoList)
         {
            if(getNpcStcVo(_loc2_.baseId).node == getNpcStcVo(param1).node && _loc2_.place > 0 && _loc2_.place < 20)
            {
               return true;
            }
         }
         return false;
      }
      
      public function checkHasYuanFenItem(param1:UInt64, param2:int) : Boolean
      {
         var _loc5_:* = null;
         if(playerHero && Uint64Util.equal(playerHero.baseInfo.id,param1))
         {
            _loc5_ = playerHero;
         }
         else
         {
            _loc5_ = heroInfoDic.getValue(Uint64Util.toString(param1));
         }
         if(!_loc5_)
         {
            return false;
         }
         var _loc7_:int = 0;
         var _loc6_:* = _loc5_.items;
         for each(var _loc3_ in _loc5_.items)
         {
            if(_loc3_.itemId == param2)
            {
               return true;
            }
         }
         var _loc9_:int = 0;
         var _loc8_:* = _loc5_.baowu;
         for each(var _loc4_ in _loc5_.baowu)
         {
            if(_loc4_.baseId == param2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getPositionHeros() : Vector.<HeroInfo>
      {
         var _loc1_:Vector.<HeroInfo> = new Vector.<HeroInfo>();
         var _loc3_:Array = nslm2.common.model.HeroModel.ins.getPositionList();
         var _loc5_:int = 0;
         var _loc4_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            if(this.isCurPlayerHero(_loc2_.id))
            {
               _loc1_.push(playerHero);
            }
            else
            {
               _loc1_.push(this.getHeroInfoQuick(_loc2_.id));
            }
         }
         return _loc1_;
      }
      
      public function getPositionList() : Array
      {
         var _loc3_:* = null;
         var _loc1_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = panelBaseInfoList;
         for each(var _loc2_ in panelBaseInfoList)
         {
            if(_loc2_.place > 0 && _loc2_.place < 20)
            {
               _loc3_ = new BuZhen();
               _loc3_.id = _loc2_.id;
               _loc3_.place = _loc2_.place;
               _loc1_.push(_loc3_);
            }
         }
         return _loc1_;
      }
      
      public function changePositionPlace(param1:UInt64, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = panelBaseInfoList;
         for each(var _loc4_ in panelBaseInfoList)
         {
            if(Uint64Util.equal(param1,_loc4_.id))
            {
               _loc4_.place = param2;
            }
         }
         if(this.isCurPlayerHero(param1))
         {
            this.playerHero.baseInfo.place = param2;
         }
         else
         {
            _loc3_ = heroInfoDic.getValue(Uint64Util.toString(param1));
            if(_loc3_)
            {
               _loc3_.baseInfo.place = param2;
            }
         }
      }
      
      public function getHasYuanFenHeroIDArr(param1:PanelBaseInfo, param2:Boolean = false) : Array
      {
         var _loc3_:int = 0;
         var _loc7_:* = null;
         var _loc6_:int = StcMgr.ins.getNpcVo(param1.baseId).node;
         var _loc5_:Array = [];
         var _loc9_:int = 0;
         var _loc8_:* = _teamHeroArr;
         for each(var _loc4_ in _teamHeroArr)
         {
            if(_loc4_.heroData)
            {
               _loc3_ = StcMgr.ins.getNpcVo(_loc4_.heroData.baseId).node;
               if(param2 || !Uint64Util.equal(_loc4_.heroData.id,RoleTeamModel.ins.crtHeroId))
               {
                  _loc7_ = WealthUtil.isMengYueHero(_loc6_,_loc3_);
                  if(_loc7_)
                  {
                     _loc5_.push(_loc7_);
                  }
               }
            }
         }
         return _loc5_;
      }
      
      public function getPanelBaseInfoByPos(param1:int) : PanelBaseInfo
      {
         return ArrayUtil.findByAttr(panelBaseInfoList,PanelBaseInfo.POSITION.name,param1);
      }
      
      public function isReinforcements2(param1:PanelBaseInfo, param2:int, param3:Array) : Boolean
      {
         if(param1.place && !isReinforcements(param1.place) || isCurPlayerHero(param1.id))
         {
            return true;
         }
         return false;
      }
      
      public function isReinforcements(param1:int) : Boolean
      {
         if(param1 >= 20)
         {
            return true;
         }
         return false;
      }
      
      public function get playerHero() : HeroInfo
      {
         if(PlayerModel.ins.playerInfo == null)
         {
            return null;
         }
         return PlayerModel.ins.playerInfo.playerHero;
      }
      
      public function set playerHero(param1:HeroInfo) : void
      {
         PlayerModel.ins.playerInfo.playerHero = param1;
      }
      
      public function getPanelBaseInfoByStcNpcId(param1:int) : PanelBaseInfo
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc2_:int = this.panelBaseInfoList.length;
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc3_ = (this.panelBaseInfoList[_loc5_] as PanelBaseInfo).baseId;
            _loc4_ = StcMgr.ins.getNpcVo(_loc3_);
            if(_loc4_ && _loc4_.node == param1)
            {
               return this.panelBaseInfoList[_loc5_];
            }
            _loc5_++;
         }
         return null;
      }
      
      public function getSortOnHeroList() : Array
      {
         return nslm2.common.model.HeroModel.ins.panelBaseInfoList.sort(sortHeroFun);
      }
      
      public function haveTupoHeros() : Boolean
      {
         var _loc6_:* = null;
         var _loc1_:* = null;
         var _loc5_:* = null;
         var _loc2_:Boolean = false;
         var _loc11_:int = 0;
         var _loc10_:* = getSortOnHeroList().filter(nslm2.common.model.HeroModel.ins.isReinforcements2);
         for each(var _loc7_ in getSortOnHeroList().filter(nslm2.common.model.HeroModel.ins.isReinforcements2))
         {
            _loc6_ = StcMgr.ins.getNpcVo(_loc7_.baseId);
            _loc1_ = RoleTupoUtil.getStcTupoVo(_loc6_.node,_loc6_.tupo + 1);
            _loc5_ = RoleTupoUtil.getTupoNeedItem(_loc1_);
            var _loc9_:int = 0;
            var _loc8_:* = RoleTupoNeedVo.voArrFromWealthVoArr(_loc5_,_loc7_);
            for each(var _loc4_ in RoleTupoNeedVo.voArrFromWealthVoArr(_loc5_,_loc7_))
            {
               if(RoleTupoUtil.getGodhoodEquipState(_loc4_.panelBaseInfo,_loc4_.wealthVo.sid) == 3 && _loc7_.place && !nslm2.common.model.HeroModel.ins.isReinforcements(_loc7_.place))
               {
                  _loc2_ = true;
               }
            }
         }
         var _loc13_:int = 0;
         var _loc12_:* = nslm2.common.model.HeroModel.ins.teamHeroInfoArr;
         for each(var _loc3_ in nslm2.common.model.HeroModel.ins.teamHeroInfoArr)
         {
            if(RoleTupoUtil.canTupo(_loc3_,false))
            {
               _loc2_ = true;
            }
         }
         return _loc2_;
      }
      
      public function haveCanPhaseUpTalent() : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:* = nslm2.common.model.HeroModel.ins.teamHeroInfoArr;
         for each(var _loc1_ in nslm2.common.model.HeroModel.ins.teamHeroInfoArr)
         {
            if(PhaseUpTalentUtil.canUp(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      public function haveCanAwakeHeros() : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:* = nslm2.common.model.HeroModel.ins.teamHeroInfoArr;
         for each(var _loc1_ in nslm2.common.model.HeroModel.ins.teamHeroInfoArr)
         {
            if(RoleAwakeUtil.checkCurHeroStatus(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      public function haveCanLvlUpHeros() : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc1_:Boolean = false;
         var _loc5_:int = 0;
         var _loc4_:* = nslm2.common.model.HeroModel.ins.teamHeroInfoArr;
         for each(var _loc2_ in nslm2.common.model.HeroModel.ins.teamHeroInfoArr)
         {
            if(_loc2_.baseInfo.level <= PlayerModel.ins.level - 5)
            {
            }
         }
         return _loc1_;
      }
      
      public function getHeroInfoImmediate(param1:UInt64) : HeroInfo
      {
         var _loc2_:* = null;
         if(playerHero && Uint64Util.equal(playerHero.baseInfo.id,param1))
         {
            _loc2_ = playerHero;
         }
         else
         {
            _loc2_ = heroInfoDic.getValue(Uint64Util.toString(param1));
         }
         return _loc2_;
      }
      
      public function getHeroCount(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = panelBaseInfoList;
         for each(var _loc2_ in panelBaseInfoList)
         {
            if(_loc2_.baseId == param1)
            {
               _loc3_++;
            }
         }
         return _loc3_;
      }
      
      public function getHeroNodeCount(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = panelBaseInfoList;
         for each(var _loc2_ in panelBaseInfoList)
         {
            if(StcMgr.ins.getNpcVo(_loc2_.baseId).node == param1)
            {
               _loc3_++;
            }
         }
         return _loc3_;
      }
      
      public function getHeroArr(param1:int) : Array
      {
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = panelBaseInfoList;
         for each(var _loc3_ in panelBaseInfoList)
         {
            if(_loc3_.baseId == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function getTupoFeedHeroArr(param1:int) : Array
      {
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = panelBaseInfoList;
         for each(var _loc3_ in panelBaseInfoList)
         {
            if(_loc3_.baseId == param1 && Uint64Util.equal(RoleInfoModel.ins.heroInfo.baseInfo.id,_loc3_.id) == false && _loc3_.place <= 0)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function isDefaultHero(param1:PanelBaseInfo) : Boolean
      {
         var _loc3_:StcNpcVo = StcMgr.ins.getNpcVo(param1.baseId);
         var _loc2_:int = _loc3_.tupo;
         if(param1.shengridinfo)
         {
            return param1.shengjie <= 1 && _loc2_ == 0 && param1.shengridinfo.pagenum == 1 && param1.shengridinfo.nodesinfo.length == 0;
         }
         return param1.shengjie <= 1 && _loc2_ == 0;
      }
      
      public function getPhaseRecord(param1:uint, param2:uint) : void
      {
         var _loc4_:* = null;
         _requestHeroBaseId = param1;
         _requestHeroSjLevel = param2;
         var _loc3_:DictHash = _phaseDict.getValue(param1);
         if(_loc3_)
         {
            _loc4_ = _loc3_.getValue(param2);
            if(_loc4_)
            {
               ObserverMgr.ins.sendNotice("msg_init_phase_up_horse_lamp",revertResToArr(_loc4_));
            }
            else
            {
               requestPhaseRecord(param1,param2);
            }
         }
         else
         {
            requestPhaseRecord(param1,param2);
         }
      }
      
      private function pushPhaseRecord(param1:uint, param2:uint, param3:Array) : void
      {
         var _loc5_:* = null;
         var _loc4_:DictHash = _phaseDict.getValue(param1);
         if(_loc4_)
         {
            _loc4_.put(param2,param3);
         }
         else
         {
            _loc5_ = new DictHash();
            _loc5_.put(param2,param3);
            _phaseDict.put(param1,_loc5_);
         }
      }
      
      private function requestPhaseRecord(param1:uint, param2:uint) : void
      {
         var _loc3_:HeroShengjieRecordReq = new HeroShengjieRecordReq();
         _loc3_.hero = param1;
         _loc3_.level = param2;
         ServerEngine.ins.send(5014,_loc3_,server_shengjieRecord);
      }
      
      private function server_shengjieRecord(param1:HeroShengjieRecordRes) : void
      {
         if(param1 == null)
         {
            pushPhaseRecord(_requestHeroBaseId,_requestHeroSjLevel,[]);
            ObserverMgr.ins.sendNotice("msg_init_phase_up_horse_lamp",revertResToArr([]));
         }
         else
         {
            pushPhaseRecord(_requestHeroBaseId,_requestHeroSjLevel,param1.info);
            ObserverMgr.ins.sendNotice("msg_init_phase_up_horse_lamp",revertResToArr(param1.info));
         }
      }
      
      private function revertResToArr(param1:Array) : Array
      {
         var _loc2_:* = null;
         var _loc3_:Array = [];
         var _loc5_:StcNpcVo = StcMgr.ins.getNpcVo(_requestHeroBaseId);
         if(param1.length <= 0)
         {
            if(this.isCurPlayerHeroByStcNpcId(_requestHeroBaseId))
            {
               _loc3_.push(LocaleMgr.ins.getStr(30100809,[LocaleMgr.ins.getStr(7000 + _requestHeroSjLevel + 1)]));
            }
            else
            {
               _loc3_.push(LocaleMgr.ins.getStr(30100807,[LocaleMgr.ins.getStr(_loc5_.name),LocaleMgr.ins.getStr(7000 + _requestHeroSjLevel + 1)]));
            }
            return _loc3_;
         }
         var _loc7_:int = 0;
         var _loc6_:* = param1;
         for each(var _loc4_ in param1)
         {
            if(this.isCurPlayerHeroByStcNpcId(_requestHeroBaseId))
            {
               _loc2_ = LocaleMgr.ins.getStr(30100808,[_loc4_.server,_loc4_.name,_loc4_.value,LocaleMgr.ins.getStr(7000 + _requestHeroSjLevel + 1)]);
               _loc3_.push(_loc2_);
            }
            else
            {
               if(StcMgr.ins.getNpcVo(_requestHeroBaseId).kind == 21)
               {
                  _loc2_ = LocaleMgr.ins.getStr(999902834,[_loc4_.server,_loc4_.name,_loc4_.value,LocaleMgr.ins.getStr(_loc5_.name),LocaleMgr.ins.getStr(7000 + _requestHeroSjLevel + 1)]);
               }
               else
               {
                  _loc2_ = LocaleMgr.ins.getStr(30100806,[_loc4_.server,_loc4_.name,_loc4_.value,LocaleMgr.ins.getStr(_loc5_.name),LocaleMgr.ins.getStr(7000 + _requestHeroSjLevel + 1)]);
               }
               _loc3_.push(_loc2_);
            }
         }
         return _loc3_;
      }
      
      private function sortHeroFun(param1:PanelBaseInfo, param2:PanelBaseInfo) : int
      {
         if(nslm2.common.model.HeroModel.ins.isCurPlayerHero(param1.id))
         {
            return -1;
         }
         if(nslm2.common.model.HeroModel.ins.isCurPlayerHero(param2.id))
         {
            return 1;
         }
         if(param1.place && uint(param2.place))
         {
            if(isReinforcements(param1.place) && isReinforcements(param2.place))
            {
               return sortSubFunc(param1,param2);
            }
            if(isReinforcements(param1.place))
            {
               return 1;
            }
            if(isReinforcements(param2.place))
            {
               return -1;
            }
            return param1.position < param2.position?-1:1;
         }
         if(param1.place)
         {
            return -1;
         }
         if(param2.place)
         {
            return 1;
         }
         if(nslm2.common.model.HeroModel.ins.isNewHero(param1.id) && nslm2.common.model.HeroModel.ins.isNewHero(param2.id))
         {
            return sortSubFunc(param1,param2);
         }
         if(nslm2.common.model.HeroModel.ins.isNewHero(param1.id))
         {
            return -1;
         }
         if(nslm2.common.model.HeroModel.ins.isNewHero(param2.id))
         {
            return 1;
         }
         return sortSubFunc(param1,param2);
      }
      
      private function sortSubFunc(param1:PanelBaseInfo, param2:PanelBaseInfo) : int
      {
         var _loc5_:StcNpcVo = StcMgr.ins.getNpcVo(param1.baseId);
         var _loc3_:StcNpcVo = StcMgr.ins.getNpcVo(param2.baseId);
         if(_loc5_.quality > _loc3_.quality)
         {
            return -1;
         }
         if(_loc5_.quality < _loc3_.quality)
         {
            return 1;
         }
         if(param1.level > param2.level)
         {
            return -1;
         }
         if(param1.level < param2.level)
         {
            return 1;
         }
         var _loc4_:int = Uint64Util.compare(param1.ability,param2.ability);
         if(_loc4_ == 0)
         {
            if(_loc5_.id > _loc3_.id)
            {
               return -1;
            }
            return 1;
         }
         return -_loc4_;
      }
      
      public function getHeroYuanFenArr(param1:int, param2:int) : Array
      {
         var _loc3_:* = null;
         var _loc4_:String = param1 + "|" + param2;
         if(heroYuanfenDic.containsKey(_loc4_))
         {
            return heroYuanfenDic.getValue(_loc4_);
         }
         _loc3_ = StcMgr.ins.getVoArrByMultiColumnValue("static_mengyue",["node","kind"],[param1,param2]);
         heroYuanfenDic.put(_loc4_,_loc3_);
         return _loc3_;
      }
      
      public function get panelBaseInfoList() : Array
      {
         return _panelBaseInfoList;
      }
      
      public function set panelBaseInfoList(param1:Array) : void
      {
         _panelBaseInfoList = param1;
         initOnPosHeroNodeIDArr();
      }
      
      public function canSelectYuanjun() : Boolean
      {
         return nslm2.common.model.HeroModel.ins.teamHeroInfoArr.length >= 5;
      }
   }
}
