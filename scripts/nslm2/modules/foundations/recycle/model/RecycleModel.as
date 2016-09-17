package nslm2.modules.foundations.recycle.model
{
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.foundations.recycle.vo.RecycleVo;
   import proto.PanelBaseInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import flash.display.DisplayObject;
   import nslm2.utils.Uint64Util;
   import nslm2.common.vo.WealthVo;
   import com.netease.protobuf.UInt64;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.cultivates.treasure.vo.TreasureVo;
   import nslm2.modules.bag.itemModuels.BagModel;
   import proto.Item;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.bag.itemModuels.BagConsts;
   import nslm2.utils.WealthUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   
   public class RecycleModel implements IDispose
   {
      
      private static var _ins:nslm2.modules.foundations.recycle.model.RecycleModel;
       
      
      private var _idleHeroList:Array;
      
      private var _rebornHeroList:Array;
      
      private var _rebornTreasureList:Array;
      
      private var _idleEquipList:Array;
      
      private var _canRecTreasureList:Array;
      
      public var selectedRebornItem:RecycleVo;
      
      public var crtFunctionType:int;
      
      public var resIcon:DisplayObject;
      
      public var hasHighQualityItem:Boolean;
      
      public var hasOrangeEquip:Boolean;
      
      public var rewardHeroId:int;
      
      public var rewardHeroIdArr:Array;
      
      public var selectedRecTreasure:RecycleVo;
      
      private var needSortIdleHero:Boolean = true;
      
      private var _needSortEquip:Boolean = true;
      
      public function RecycleModel()
      {
         _idleHeroList = [];
         _rebornHeroList = [];
         _rebornTreasureList = [];
         _idleEquipList = [];
         _canRecTreasureList = [];
         rewardHeroIdArr = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.recycle.model.RecycleModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.recycle.model.RecycleModel();
         }
         return _ins;
      }
      
      private static function sortSubFunc(param1:RecycleVo, param2:RecycleVo) : int
      {
         if(param1.wealthVo.item.star > param2.wealthVo.item.star)
         {
            return -1;
         }
         if(param1.wealthVo.item.star == param2.wealthVo.item.star)
         {
            if(param1.wealthVo.quality > param2.wealthVo.quality)
            {
               return 1;
            }
            return 0;
         }
         return 1;
      }
      
      public static function canReborn(param1:PanelBaseInfo) : Boolean
      {
         if(param1.place > 0)
         {
            return false;
         }
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(param1.baseId);
         if(param1.level > 1 || param1.shengjie > 1)
         {
            return true;
         }
         if(StcMgr.ins.getNpcVo(param1.baseId).tupo > 0)
         {
            return true;
         }
         return false;
      }
      
      public function addIdleHero(param1:Array) : void
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            if(canRecycle(_loc2_))
            {
               if(Uint64Util.indexByAttr(_idleHeroList,"id",_loc2_.id) < 0)
               {
                  _loc5_ = new RecycleVo();
                  _loc5_.heroBaseInfo = _loc2_;
                  _loc5_.wealthVo = new WealthVo();
                  _loc5_.wealthVo.kind = 30;
                  _loc5_.wealthVo.sid = _loc2_.baseId;
                  addItemInOrder(_idleHeroList,_loc5_);
               }
            }
            if(canReborn(_loc2_))
            {
               if(Uint64Util.indexByAttr(_rebornHeroList,"id",_loc2_.id) < 0)
               {
                  _loc5_ = new RecycleVo();
                  _loc5_.heroBaseInfo = _loc2_;
                  _loc5_.wealthVo = new WealthVo();
                  _loc5_.wealthVo.kind = 30;
                  _loc5_.wealthVo.sid = _loc2_.baseId;
                  addItemInOrder(_rebornHeroList,_loc5_);
               }
            }
            _loc4_++;
         }
         updateRedPointStatus();
      }
      
      public function addCanRebornHero(param1:PanelBaseInfo) : void
      {
         if(!canReborn(param1))
         {
            return;
         }
         if(Uint64Util.indexByAttr(_rebornHeroList,"id",param1.id) >= 0)
         {
            return;
         }
         var _loc2_:RecycleVo = new RecycleVo();
         _loc2_.heroBaseInfo = param1;
         _loc2_.wealthVo = new WealthVo();
         _loc2_.wealthVo.kind = 30;
         _loc2_.wealthVo.sid = param1.baseId;
         addItemInOrder(_rebornHeroList,_loc2_);
      }
      
      public function sortIdleHero() : void
      {
         if(needSortIdleHero)
         {
            _idleHeroList.sort(sortHero);
            needSortIdleHero = false;
         }
      }
      
      private function addItemInOrder(param1:Array, param2:RecycleVo) : void
      {
         var _loc6_:* = null;
         var _loc3_:Boolean = false;
         var _loc5_:int = 0;
         var _loc4_:int = param1.length;
         if(!_loc4_)
         {
            param1.push(param2);
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc6_ = param1[_loc5_];
               if(sortHero(_loc6_,param2) >= 0)
               {
                  param1.splice(_loc5_,0,param2);
                  _loc3_ = true;
                  break;
               }
               _loc5_++;
            }
            if(!_loc3_)
            {
               param1.push(param2);
            }
         }
      }
      
      public function removeIdleHero(param1:UInt64) : void
      {
         Uint64Util.removeItemByAttr(_idleHeroList,PanelBaseInfo.ID.name,param1);
         Uint64Util.removeItemByAttr(_rebornHeroList,PanelBaseInfo.ID.name,param1);
         updateRedPointStatus();
      }
      
      public function initIdleHeroList() : void
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:Array = HeroModel.ins.panelBaseInfoList;
         _idleHeroList = [];
         _rebornHeroList = [];
         var _loc3_:int = _loc1_.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _loc1_[_loc4_];
            if(canRecycle(_loc2_))
            {
               _loc5_ = new RecycleVo();
               _loc5_.heroBaseInfo = _loc2_;
               _loc5_.wealthVo = new WealthVo();
               _loc5_.wealthVo.kind = 30;
               _loc5_.wealthVo.sid = _loc2_.baseId;
               _idleHeroList.push(_loc5_);
            }
            if(canReborn(_loc2_))
            {
               _loc5_ = new RecycleVo();
               _loc5_.heroBaseInfo = _loc2_;
               _loc5_.wealthVo = new WealthVo();
               _loc5_.wealthVo.kind = 30;
               _loc5_.wealthVo.sid = _loc2_.baseId;
               _rebornHeroList.push(_loc5_);
            }
            _loc4_++;
         }
         updateRedPointStatus();
      }
      
      public function updateIdleTreasureList() : void
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc2_:Array = TreasureModel.ins.idleTreasureList;
         _rebornTreasureList = [];
         _canRecTreasureList = [];
         var _loc3_:int = _loc2_.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = _loc2_[_loc4_];
            if(canRebornTreausre(_loc1_))
            {
               _loc5_ = new RecycleVo();
               _loc5_.wealthVo = _loc1_.wealthVo;
               _rebornTreasureList.push(_loc5_);
            }
            if(canRecycleTreausre(_loc1_))
            {
               _loc5_ = new RecycleVo();
               _loc5_.wealthVo = _loc1_.wealthVo;
               _canRecTreasureList.push(_loc5_);
            }
            _loc4_++;
         }
         _canRecTreasureList.sort(sortHero);
         _rebornTreasureList.sort(sortHero);
      }
      
      public function initIdleEquipList() : void
      {
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         _idleEquipList = [];
         var _loc1_:Array = BagModel.ins.itemArr.concat();
         var _loc4_:int = _loc1_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = _loc1_[_loc5_];
            _loc2_ = StcMgr.ins.getItemVo(_loc3_.itemId);
            if(!_loc3_.isEquiped && BagConsts.EQUIP_PLACE.indexOf(_loc2_.kind) >= 0)
            {
               _loc6_ = new RecycleVo();
               _loc6_.wealthVo = WealthUtil.itemToVo(_loc3_);
               _idleEquipList.push(_loc6_);
            }
            _loc5_++;
         }
         updateRedPointStatus();
      }
      
      private function updateRedPointStatus() : void
      {
         var _loc1_:* = getCanAutoAddCnt(_idleHeroList,3) >= 5;
         var _loc2_:* = getCanAutoAddCnt(_idleEquipList,3) >= 5;
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(11300,_loc1_ || _loc2_));
      }
      
      public function addIdleEquip(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc2_ in param1)
         {
            _loc3_ = new RecycleVo();
            _loc3_.wealthVo = WealthUtil.itemToVo(_loc2_);
            addItemInOrder(_idleEquipList,_loc3_);
         }
         updateRedPointStatus();
      }
      
      public function removeIdleEquip(param1:UInt64) : void
      {
         Uint64Util.removeItemByAttr(_idleEquipList,PanelBaseInfo.ID.name,param1);
         updateRedPointStatus();
      }
      
      public function sortIdleEquipList() : void
      {
         if(_needSortEquip)
         {
            _idleEquipList.sort(sortHero);
            _needSortEquip = false;
         }
      }
      
      public function autoAddHero() : void
      {
         autoAdd(_idleHeroList,3);
      }
      
      public function autoAddEquip() : void
      {
         autoAdd(_idleEquipList,3);
      }
      
      public function autoAddTreasure() : void
      {
         autoAdd(_canRecTreasureList,5);
      }
      
      private function autoAdd(param1:Array, param2:int) : void
      {
         var _loc7_:* = null;
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = param1.length;
         var _loc3_:int = getSelectedNum(param1);
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = param1[_loc6_];
            if(_loc7_ && !_loc7_.isSelected && _loc7_.quality <= param2)
            {
               _loc7_.isSelected = true;
               _loc4_++;
               if(_loc4_ >= 5 - _loc3_)
               {
                  break;
               }
            }
            _loc6_++;
         }
      }
      
      public function get canAutoAddHeroCnt() : int
      {
         return getCanAutoAddCnt(_idleHeroList,3);
      }
      
      public function get canAutoAddEquipCnt() : int
      {
         return getCanAutoAddCnt(_idleEquipList,3);
      }
      
      public function get canAutoAddTreasureCnt() : int
      {
         return getCanAutoAddCnt(_canRecTreasureList,5);
      }
      
      private function getCanAutoAddCnt(param1:Array, param2:int) : int
      {
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param1[_loc5_];
            if(_loc6_ && _loc6_.quality <= param2)
            {
               _loc3_++;
               if(_loc3_ > 5)
               {
                  return _loc3_;
               }
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function get selectedHeroNum() : int
      {
         return getSelectedNum(_idleHeroList);
      }
      
      public function get mirrorSelectedHeroNum() : int
      {
         return getSelectedNum(rewardHeroIdArr);
      }
      
      public function get selectedEquipNum() : int
      {
         return getSelectedNum(_idleEquipList);
      }
      
      private function getSelectedNum(param1:Array) : int
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            if(_loc3_ && _loc3_.isSelected == true)
            {
               _loc2_++;
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function get selectedHeroList() : Array
      {
         return getSelectedItemList(_idleHeroList);
      }
      
      public function get selectedEquipList() : Array
      {
         return getSelectedItemList(_idleEquipList);
      }
      
      public function get selectedHeroIdList() : Array
      {
         return getSelectedIdArr(_idleHeroList);
      }
      
      public function get selectedTreasureList() : Array
      {
         return getSelectedItemList(_canRecTreasureList);
      }
      
      public function get selectedTreasureIdList() : Array
      {
         return getSelectedIdArr(_canRecTreasureList);
      }
      
      public function get selectedEquipIdList() : Array
      {
         return getSelectedIdArr(_idleEquipList);
      }
      
      public function resetSelectedHero() : void
      {
         resetSelect(_idleHeroList);
      }
      
      public function resetSelectedEquip() : void
      {
         resetSelect(_idleEquipList);
      }
      
      public function resetSelectedTreasure() : void
      {
         resetSelect(_canRecTreasureList);
      }
      
      public function checkHasMoreHero() : Boolean
      {
         return selectedHeroIdList.length < canAutoAddHeroCnt;
      }
      
      public function checkHasMoreEquip() : Boolean
      {
         return selectedEquipIdList.length < canAutoAddEquipCnt;
      }
      
      public function checkHasMoreTreasure() : Boolean
      {
         return selectedTreasureIdList.length < canAutoAddTreasureCnt;
      }
      
      private function resetSelect(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            _loc2_.isSelected = false;
            _loc4_++;
         }
      }
      
      private function getSelectedIdArr(param1:Array) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:Array = [];
         var _loc4_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            if(_loc3_.isSelected == true)
            {
               _loc2_.push(_loc3_.id);
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      private function getSelectedItemList(param1:Array) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         hasHighQualityItem = false;
         hasOrangeEquip = false;
         var _loc2_:Array = [];
         var _loc4_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            if(_loc3_.isSelected == true)
            {
               if(_loc3_.quality >= 4)
               {
                  hasHighQualityItem = true;
               }
               if(_loc3_.quality >= 5)
               {
                  hasOrangeEquip = true;
               }
               _loc2_.push(_loc3_);
            }
            _loc5_++;
         }
         while(_loc2_.length < 5)
         {
            _loc2_.push("");
         }
         return _loc2_;
      }
      
      public function get idleHeroList() : Array
      {
         return _idleHeroList;
      }
      
      public function get idleEquiList() : Array
      {
         return _idleEquipList;
      }
      
      public function get idleCanRebornEquipList() : Array
      {
         return _idleEquipList.filter(filterCanRebornEquip).sort(sortSubFunc);
      }
      
      private function filterCanRebornEquip(param1:RecycleVo, param2:int, param3:Array) : Boolean
      {
         return param1.quality > 4;
      }
      
      private function sortHero(param1:RecycleVo, param2:RecycleVo) : int
      {
         if(param1.quality > param2.quality)
         {
            return 1;
         }
         if(param1.quality < param2.quality)
         {
            return -1;
         }
         if(param1.fightValue > param2.fightValue)
         {
            return 1;
         }
         if(param1.fightValue < param2.fightValue)
         {
            return -1;
         }
         return 0;
      }
      
      private function canRecycle(param1:PanelBaseInfo) : Boolean
      {
         if(param1.place > 0)
         {
            return false;
         }
         return true;
      }
      
      private function canRebornTreausre(param1:TreasureVo) : Boolean
      {
         if(param1.baoWu.level > 1 || param1.baoWu.keyin > 0 || param1.baoWu.fuwenkeyin > 0)
         {
            return true;
         }
         return false;
      }
      
      private function canRecycleTreausre(param1:TreasureVo) : Boolean
      {
         if(param1.quality >= 5)
         {
            return true;
         }
         return false;
      }
      
      public function get rebornHeroList() : Array
      {
         return _rebornHeroList;
      }
      
      public function get rebornTreasureList() : Array
      {
         return _rebornTreasureList;
      }
      
      public function get selectedTreasureNum() : int
      {
         return getSelectedNum(_canRecTreasureList);
      }
      
      public function dispose() : void
      {
         this.resetSelectedEquip();
         this.resetSelectedHero();
         selectedRebornItem = null;
         crtFunctionType = 1;
         selectedRecTreasure = null;
      }
      
      public function get canRecTreasureList() : Array
      {
         return _canRecTreasureList;
      }
      
      public function isEmptyRewardHeroIdArr() : Boolean
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < rewardHeroIdArr.length)
         {
            if(rewardHeroIdArr[_loc1_])
            {
               return false;
            }
            _loc1_++;
         }
         return true;
      }
      
      public function getCountRewardHeroIdArr() : uint
      {
         var _loc2_:int = 0;
         var _loc1_:uint = 0;
         _loc2_ = 0;
         while(_loc2_ < rewardHeroIdArr.length)
         {
            if(rewardHeroIdArr[_loc2_])
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function getChangeRecycleVoArr() : Array
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc1_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < rewardHeroIdArr.length)
         {
            _loc2_ = rewardHeroIdArr[_loc3_] as RecycleVo;
            if(_loc2_)
            {
               _loc1_.push(_loc2_);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function getChangeArr() : Array
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc1_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < rewardHeroIdArr.length)
         {
            _loc2_ = rewardHeroIdArr[_loc3_] as RecycleVo;
            if(_loc2_)
            {
               _loc1_.push(_loc2_.id);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function getChangeIdArr() : Array
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc1_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < rewardHeroIdArr.length)
         {
            _loc2_ = rewardHeroIdArr[_loc3_] as RecycleVo;
            if(_loc2_)
            {
               _loc1_.push(_loc2_.heroBaseInfo.baseId);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function cheakGroup(param1:RecycleVo) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < rewardHeroIdArr.length)
         {
            _loc2_ = rewardHeroIdArr[_loc3_] as RecycleVo;
            if(_loc2_ && _loc2_.wealthVo.stcNpcVo.group != param1.wealthVo.stcNpcVo.group)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
   }
}
