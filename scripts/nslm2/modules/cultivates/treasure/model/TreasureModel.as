package nslm2.modules.cultivates.treasure.model
{
   import com.mz.core.utils.DictHash;
   import proto.HeroInfo;
   import proto.BaoWu;
   import morn.core.components.List;
   import morn.customs.components.PanelBg;
   import proto.PlayerDataNotify;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.cultivates.roleTeam.ctrl.CheckRoleTeamRedPointCtrl;
   import com.netease.protobuf.UInt64;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.ProtoUtils;
   import proto.BaoWuFumo;
   import nslm2.modules.cultivates.treasure.util.TreasureUtil;
   import nslm2.modules.roleInfos.equipPanels.RoleEquipPanel;
   import nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import nslm2.modules.cultivates.treasure.vo.TreasureVo;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.utils.getTimer;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.Item;
   import nslm2.modules.cultivates.treasure.vo.RuneCategoryVo;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.cultivates.treasure.vo.RuneTypeVo;
   import flash.geom.Point;
   import morn.core.components.Box;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.vos.StcBaowuKeyinVo;
   import nslm2.mgrs.stcMgrs.vos.StcBaowuFuwenKeyinVo;
   
   public class TreasureModel
   {
      
      private static var _ins:nslm2.modules.cultivates.treasure.model.TreasureModel;
       
      
      public var openHoleCostItemID:int;
      
      public var openHoleCostItem:Array;
      
      public var openHoleCostDiamond:Array;
      
      private var _heroTreasureArr:Array;
      
      private var _idleTreasureArr:Array;
      
      private var treasureDic:DictHash;
      
      public var defaultSelectHero:HeroInfo;
      
      public var defaultSelectTreasure:BaoWu;
      
      public var heroInfoArr:Array;
      
      public var allTreasureArr:Array;
      
      public var selectedHeroInfo:HeroInfo;
      
      private var _selectedTreasure:BaoWu;
      
      public var crtTakOffTreasure:BaoWu;
      
      public var hasHighQualityItem:Boolean;
      
      public var needShowLiansuoEffect:Boolean;
      
      public var openHoleCostType:int;
      
      public var targetPlace:int;
      
      public var floatOffSet:int;
      
      private var _runeCategoryArr:Array;
      
      public var autoBatchMaxLvl:int;
      
      public var autoBatchRuneTypeArr:Array;
      
      public var selectedRuneKind:int;
      
      public var list_rune:List;
      
      public var list_category:List;
      
      public var module_panelBg:PanelBg;
      
      public var runeComposeNotice:Array;
      
      public var blockHeroNotifyTips:Boolean;
      
      public var selectedExpTreausreIconArr:Array;
      
      private var _allTreausreWealthVoArr:Array;
      
      private var _preBwData:BaoWu;
      
      public var firstTreasureID:UInt64;
      
      private var needSort:Boolean = true;
      
      private var expTreausreArr:Array;
      
      public function TreasureModel()
      {
         openHoleCostItem = [];
         openHoleCostDiamond = [];
         _heroTreasureArr = [];
         _idleTreasureArr = [];
         _allTreausreWealthVoArr = [];
         expTreausreArr = [];
         super();
         treasureDic = new DictHash();
         openHoleCostItemID = DefindConsts.FUMO_CONSUME_ITEM.split("|")[0];
         WealthUtil.parseCost(DefindConsts.FUMO_PUTONG,openHoleCostItem);
         WealthUtil.parseDiamdondCost(DefindConsts.FUMO_COST,openHoleCostDiamond);
      }
      
      public static function get ins() : nslm2.modules.cultivates.treasure.model.TreasureModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.treasure.model.TreasureModel();
         }
         return _ins;
      }
      
      public static function getStarLightArray(param1:int, param2:Boolean = false) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:int = 10;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            if(_loc5_ < param1)
            {
               _loc3_.push("StarLightOn");
            }
            else if(!param2)
            {
               _loc3_.push("StarLightOff");
            }
            else
            {
               break;
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function onDataChange(param1:PlayerDataNotify) : void
      {
         if(param1.addBaowu && param1.addBaowu.length > 0)
         {
            this.addArr(param1.addBaowu);
         }
         if(param1.reduceBaowu && param1.reduceBaowu.length > 0)
         {
            this.reduceArr(param1.reduceBaowu);
         }
      }
      
      public function addArr(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_];
            treasureDic.put(Uint64Util.toString(_loc3_.id),_loc3_);
            _loc4_++;
         }
         CheckRoleTeamRedPointCtrl.ins.checkEquip();
         if(_loc2_ > 0)
         {
            addIdleTreasure(param1);
         }
      }
      
      public function reduceArr(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            treasureDic.remove(Uint64Util.toString(_loc2_));
            removeIdleTreasure(_loc2_);
            _loc4_++;
         }
         if(_loc3_ > 0)
         {
            CheckRoleTeamRedPointCtrl.ins.checkEquip();
         }
      }
      
      public function get selectedTreasureItemVo() : StcItemVo
      {
         if(selectedTreasure)
         {
            return StcMgr.ins.getItemVo(selectedTreasure.baseId);
         }
         return null;
      }
      
      public function hasTreasureInBg(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = this.treasureDic.array.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.treasureDic.array[_loc5_];
            _loc3_ = StcMgr.ins.getItemVo(_loc2_.baseId);
            if(_loc2_.statue < 2 && _loc3_.kind == param1)
            {
               return true;
            }
            _loc5_++;
         }
         return false;
      }
      
      public function updateHeroInfo(param1:HeroInfo) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = heroInfoArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = heroInfoArr[_loc4_];
            if(_loc2_.baseInfo)
            {
               if(Uint64Util.equal(param1.baseInfo.id,_loc2_.baseInfo.id))
               {
                  heroInfoArr[_loc4_] = param1;
               }
            }
            _loc4_++;
         }
      }
      
      public function initTreasureData(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         if(treasureDic)
         {
            treasureDic.clear();
         }
         else
         {
            treasureDic = new DictHash();
         }
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            treasureDic.put(Uint64Util.toString(_loc2_.id),_loc2_);
            _loc4_++;
         }
         if(_loc3_ > 0)
         {
            initIdleTreasureList();
         }
      }
      
      public function getTreausreByPos(param1:int) : Array
      {
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc5_:* = null;
         if(!treasureDic)
         {
            treasureDic = new DictHash();
         }
         var _loc4_:Array = [];
         var _loc2_:Array = treasureDic.array;
         var _loc6_:int = _loc2_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc5_ = _loc2_[_loc7_];
            if(_loc5_ && _loc5_.statue < 2)
            {
               if(getBaoWuPos(_loc5_.baseId) == param1)
               {
                  _loc3_ = WealthUtil.treasureToVo(_loc5_);
                  _loc4_.push(_loc3_);
               }
            }
            _loc7_++;
         }
         _loc4_.sort(WealthUtil.sortEquipOrTreasure);
         if(_loc4_.length)
         {
            firstTreasureID = (_loc4_[0] as WealthVo).treasure.id;
         }
         while(_loc4_.length == 0 || _loc4_.length % 8)
         {
            _loc4_.push(new WealthVo());
         }
         return _loc4_;
      }
      
      private function sortEquip(param1:WealthVo, param2:WealthVo) : int
      {
         if(param1.quality > param2.quality)
         {
            return -1;
         }
         if(param1.quality == param2.quality)
         {
            if(Uint64Util.toInt(param1.treasure.ability) >= Uint64Util.toInt(param2.treasure.ability))
            {
               return -1;
            }
         }
         return 1;
      }
      
      public function updateTreasureData(param1:BaoWu, param2:int) : void
      {
         var _loc4_:String = Uint64Util.toString(param1.id);
         var _loc3_:BaoWu = this.treasureDic.getValue(_loc4_);
         if(_loc3_)
         {
            if(_loc3_.statue != param2)
            {
               ProtoUtils.copyParams(param1,_loc3_);
               _loc3_.statue = param2;
               CheckRoleTeamRedPointCtrl.ins.checkEquip();
               if(_loc3_.statue < 2)
               {
                  addIdleTreasure([_loc3_]);
               }
               else
               {
                  removeIdleTreasure(_loc3_.id);
               }
            }
            else
            {
               ProtoUtils.copyParams(param1,_loc3_);
            }
         }
         else
         {
            param1.statue = param2;
            treasureDic.put(_loc4_,param1);
            CheckRoleTeamRedPointCtrl.ins.checkEquip();
            addIdleTreasure([param1]);
         }
      }
      
      public function updateTreasureInfo(param1:BaoWu) : void
      {
         var _loc3_:String = Uint64Util.toString(param1.id);
         var _loc2_:BaoWu = this.treasureDic.getValue(_loc3_);
         if(_loc2_)
         {
            ProtoUtils.copyParams(param1,_loc2_);
         }
      }
      
      public function updateTreasureStatus(param1:UInt64, param2:int) : void
      {
         var _loc4_:String = Uint64Util.toString(param1);
         var _loc3_:BaoWu = this.treasureDic.getValue(_loc4_);
         if(_loc3_)
         {
            if(_loc3_.statue != param2)
            {
               _loc3_.statue = param2;
               CheckRoleTeamRedPointCtrl.ins.checkEquip();
               if(_loc3_.statue < 2)
               {
                  addIdleTreasure([_loc3_]);
               }
               else
               {
                  removeIdleTreasure(_loc3_.id);
               }
            }
         }
      }
      
      public function get crtTreasureRuneTypes() : Array
      {
         var _loc1_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = selectedTreasure.fumo;
         for each(var _loc2_ in selectedTreasure.fumo)
         {
            if(_loc2_.id)
            {
               _loc1_.push(TreasureUtil.getAddtionType(_loc2_.id));
            }
         }
         return _loc1_;
      }
      
      private function getBaoWuPos(param1:int) : int
      {
         var _loc2_:StcItemVo = StcMgr.ins.getItemVo(param1);
         return _loc2_.kind;
      }
      
      public function initAllTreasureList() : void
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc3_:int = heroInfoArr.length;
         allTreasureArr = [];
         var _loc2_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = heroInfoArr[_loc4_];
            _loc2_ = toTreasureVoArr(_loc1_.baowu,_loc1_.baseInfo.baseId);
            allTreasureArr.push(_loc2_);
            _loc4_++;
         }
      }
      
      private function toTreasureVoArr(param1:Array, param2:int) : Array
      {
         var _loc7_:int = 0;
         var _loc4_:* = null;
         var _loc6_:* = null;
         if(param1 == null)
         {
            param1 = [];
         }
         var _loc3_:Array = [];
         var _loc5_:int = RoleEquipPanel.baowuPlaceArr.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc4_ = new HeroEquipVo();
            _loc4_.place = RoleEquipPanel.baowuPlaceArr[_loc7_];
            _loc6_ = getEquipingBaowu(param1,_loc4_.place);
            if(_loc6_)
            {
               _loc4_.wealthVo = WealthUtil.treasureToVo(_loc6_);
               _loc4_.wealthVo.extraData = param2;
            }
            else
            {
               _loc4_.wealthVo = new WealthVo();
               _loc4_.wealthVo.kind = 1;
               _loc4_.wealthVo.extraData = param2;
            }
            _loc3_.push(_loc4_);
            _loc7_++;
         }
         return _loc3_;
      }
      
      private function getEquipingBaowu(param1:Array, param2:int) : BaoWu
      {
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc4_ = StcMgr.ins.getItemVo(_loc3_.baseId);
            if(_loc4_.kind == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getDefaultSelectedHeroIndex(param1:UInt64 = null) : int
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc2_:Array = [];
         var _loc4_:int = heroInfoArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = heroInfoArr[_loc5_];
            if(_loc3_.baseInfo)
            {
               if(param1)
               {
                  if(Uint64Util.equal(_loc3_.baseInfo.id,param1))
                  {
                     defaultSelectHero = _loc3_;
                     RoleInfoModel.ins.heroInfo = _loc3_;
                     return _loc5_;
                  }
               }
               else if(_loc3_.baowu.length > 0)
               {
                  defaultSelectHero = _loc3_;
                  RoleInfoModel.ins.heroInfo = _loc3_;
                  return _loc5_;
               }
            }
            _loc5_++;
         }
         defaultSelectHero = heroInfoArr[0];
         return -1;
      }
      
      public function getDefaultSelectedEquipIndex(param1:int = -1, param2:int = 0) : int
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         if(param1 == -1)
         {
            return -1;
         }
         var _loc3_:Array = allTreasureArr[param1];
         var _loc5_:int = _loc3_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = _loc3_[_loc6_];
            if(param2)
            {
               if(_loc4_.place == param2)
               {
                  defaultSelectTreasure = _loc4_.wealthVo.treasure;
                  return _loc6_;
               }
            }
            else if(_loc4_.wealthVo.treasure)
            {
               defaultSelectTreasure = _loc4_.wealthVo.treasure;
               return _loc6_;
            }
            _loc6_++;
         }
         return -1;
      }
      
      public function get idleTreasureList() : Array
      {
         return _idleTreasureArr;
      }
      
      public function initIdleTreasureList() : void
      {
         var _loc3_:* = null;
         _idleTreasureArr = [];
         _allTreausreWealthVoArr = [];
         var _loc1_:Array = treasureDic.array;
         var _loc5_:int = 0;
         var _loc4_:* = _loc1_;
         for each(var _loc2_ in _loc1_)
         {
            if(_loc2_.statue < 2)
            {
               _loc3_ = new TreasureVo();
               _loc3_.wealthVo = WealthUtil.treasureToVo(_loc2_);
               _allTreausreWealthVoArr.push(_loc3_.wealthVo);
               _loc3_.baoWu = _loc2_;
               _idleTreasureArr.push(_loc3_);
            }
         }
         ObserverMgr.ins.sendNotice("treasure_notice_idle_updated");
      }
      
      public function sortIdleTreasure() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc5_:* = 0;
         var _loc3_:int = 0;
         if(needSort)
         {
            needSort = false;
            _idleTreasureArr.sort(sortTreasure);
            _loc2_ = expTreausreArr.length;
            _loc1_ = getTimer();
            _loc7_ = 0;
            while(_loc7_ < _loc2_)
            {
               _loc6_ = expTreausreArr[_loc7_];
               if(_loc6_)
               {
                  _loc3_ = 0;
                  while(_loc3_ < _idleTreasureArr.length)
                  {
                     if(_idleTreasureArr[_loc3_]["quality"] >= _loc6_[0]["quality"])
                     {
                        _loc5_ = _loc3_;
                        break;
                     }
                     _loc5_ = _loc3_;
                     _loc3_++;
                  }
                  var _loc9_:int = 0;
                  var _loc8_:* = _loc6_;
                  for each(var _loc4_ in _loc6_)
                  {
                     ArrayUtil.insert(_idleTreasureArr,_loc5_,_loc4_);
                  }
               }
               _loc7_++;
            }
         }
      }
      
      public function addIdleTreasure(param1:Array) : void
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            if(_loc2_.statue < 2)
            {
               _loc5_ = new TreasureVo();
               _loc5_.wealthVo = WealthUtil.treasureToVo(_loc2_);
               _loc5_.baoWu = _loc2_;
               addItemInOrder(_idleTreasureArr,_loc5_);
               _allTreausreWealthVoArr.push(_loc5_.wealthVo);
            }
            _loc4_++;
         }
         if(_allTreausreWealthVoArr.length >= 400)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30600331));
         }
         else if(_allTreausreWealthVoArr.length > 360)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30600330));
         }
         ObserverMgr.ins.sendNotice("treasure_notice_idle_updated");
      }
      
      public function removeIdleTreasure(param1:UInt64) : void
      {
         Uint64Util.removeItemByAttr(_idleTreasureArr,"id",param1);
         Uint64Util.removeItemByAttr(_allTreausreWealthVoArr,"id",param1);
         ObserverMgr.ins.sendNotice("treasure_notice_idle_updated");
      }
      
      public function addExpTreasure(param1:Item, param2:int) : void
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc3_:int = getTimer();
         _loc4_ = 0;
         while(_loc4_ < param2)
         {
            _loc5_ = new TreasureVo();
            _loc5_.baoWu = new BaoWu();
            _loc5_.wealthVo = WealthUtil.itemToVo(param1);
            _loc5_.baoWu.baseId = _loc5_.wealthVo.sid;
            _loc5_.baoWu.id = param1.id;
            _loc5_.baoWu.exp = Uint64Util.fromNumber(0);
            addItemInOrder(_idleTreasureArr,_loc5_);
            _loc4_++;
         }
         ObserverMgr.ins.sendNotice("treasure_notice_idle_updated");
      }
      
      public function initExpTreuasres(param1:Array) : void
      {
         var _loc7_:* = null;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:int = param1.length;
         var _loc2_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc3_ = param1[_loc6_];
            _loc2_ = [];
            _loc5_ = 0;
            while(_loc5_ < _loc3_.count)
            {
               _loc7_ = new TreasureVo();
               _loc7_.baoWu = new BaoWu();
               _loc7_.wealthVo = WealthUtil.itemToVo(_loc3_);
               _loc7_.baoWu.baseId = _loc7_.wealthVo.sid;
               _loc7_.baoWu.id = _loc3_.id;
               _loc7_.baoWu.exp = Uint64Util.fromNumber(0);
               _loc2_.push(_loc7_);
               _loc5_++;
            }
            expTreausreArr[WealthUtil.getItemQuality(_loc3_.itemId)] = _loc2_;
            _loc6_++;
         }
      }
      
      public function removeExpTreasure(param1:UInt64, param2:int) : void
      {
         var _loc6_:* = null;
         var _loc3_:int = 0;
         var _loc5_:* = 0;
         var _loc4_:int = _idleTreasureArr.length;
         _loc5_ = _loc4_;
         while(_loc5_ >= 0)
         {
            if(_loc3_ != param2)
            {
               _loc6_ = _idleTreasureArr[_loc5_];
               if(_loc6_ && Uint64Util.equal(_loc6_.baoWu.id,param1))
               {
                  _idleTreasureArr.splice(_loc5_,1);
                  _loc3_++;
               }
               _loc5_--;
               continue;
            }
            break;
         }
         ObserverMgr.ins.sendNotice("treasure_notice_idle_updated");
      }
      
      private function addItemInOrder(param1:Array, param2:TreasureVo) : void
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
               if(sortTreasure(_loc6_,param2) >= 0)
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
      
      private function sortTreasure(param1:TreasureVo, param2:TreasureVo) : int
      {
         var _loc4_:StcItemVo = StcMgr.ins.getItemVo(param1.baoWu.baseId);
         var _loc3_:StcItemVo = StcMgr.ins.getItemVo(param2.baoWu.baseId);
         if(_loc4_.quality < _loc3_.quality)
         {
            return -1;
         }
         if(_loc4_.quality > _loc3_.quality)
         {
            return 1;
         }
         if(param1.baoWu.level > param2.baoWu.level)
         {
            return 1;
         }
         if(param1.baoWu.level < param2.baoWu.level)
         {
            return -1;
         }
         if(_loc4_.id > _loc3_.id)
         {
            return 1;
         }
         return -1;
      }
      
      public function get selectedTreasureList() : Array
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         hasHighQualityItem = false;
         var _loc1_:Array = [];
         var _loc3_:int = _idleTreasureArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _idleTreasureArr[_loc4_];
            if(_loc2_.selected == true)
            {
               if(_loc2_.quality >= 4 && _loc2_.wealthVo.stcItemVo.kind)
               {
                  hasHighQualityItem = true;
               }
               _loc1_.push(_loc2_);
            }
            _loc4_++;
         }
         while(_loc1_.length < 6)
         {
            _loc1_.push("");
         }
         return _loc1_;
      }
      
      public function unSelectAll() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _idleTreasureArr;
         for each(var _loc1_ in _idleTreasureArr)
         {
            _loc1_.selected = false;
         }
      }
      
      public function get selectedTreasureIDArr() : Array
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:Array = [];
         var _loc3_:int = _idleTreasureArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _idleTreasureArr[_loc4_];
            if(_loc2_.selected == true)
            {
               _loc1_.push(_loc2_.id);
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function get selectedNum() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = _idleTreasureArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _idleTreasureArr[_loc4_];
            if(_loc2_.selected)
            {
               _loc1_++;
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function get selecteTrueasureAllExp() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = _idleTreasureArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _idleTreasureArr[_loc4_];
            if(_loc2_.selected)
            {
               _loc1_ = _loc1_ + _loc2_.exp;
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function autoSelect(param1:int) : void
      {
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc2_:int = selectedNum;
         var _loc3_:int = 0;
         var _loc4_:int = _idleTreasureArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _idleTreasureArr[_loc5_];
            if(_loc6_ && !_loc6_.selected && _loc6_.quality <= param1)
            {
               _loc6_.selected = true;
               _loc3_++;
               if(_loc3_ >= 6 - _loc2_)
               {
                  break;
               }
            }
            _loc5_++;
         }
      }
      
      public function checkHasMoreTreasure(param1:int) : Boolean
      {
         return selectedTreasureIDArr.length < getCanAutoAddCnt(param1);
      }
      
      public function checkHasMoreExpTreasure(param1:int, param2:Boolean = false) : Boolean
      {
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = _idleTreasureArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _idleTreasureArr[_loc5_];
            if(_loc6_ && _loc6_.quality <= param1)
            {
               if(param2)
               {
                  if(_loc6_.wealthVo.stcItemVo.kind == 8 || _loc6_.wealthVo.stcItemVo.kind == 9)
                  {
                     return true;
                  }
               }
               else if(_loc6_.wealthVo.stcItemVo.kind == 31)
               {
                  return true;
               }
            }
            _loc5_++;
         }
         return false;
      }
      
      public function getCanAutoAddCnt(param1:int) : int
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = _idleTreasureArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _idleTreasureArr[_loc4_];
            if(_loc5_ && _loc5_.quality <= param1)
            {
               _loc2_++;
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function hasBetterTreasure(param1:WealthVo) : Boolean
      {
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = getKind(param1.treasure);
         var _loc4_:int = this.treasureDic.array.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc2_ = this.treasureDic.array[_loc6_];
            _loc3_ = StcMgr.ins.getItemVo(_loc2_.baseId);
            if(_loc2_.statue < 2 && _loc3_.kind == _loc5_)
            {
               if(WealthUtil.compareEquipOrTreausre(param1.sid,_loc2_.baseId,int(param1.extraData),true))
               {
                  return true;
               }
            }
            _loc6_++;
         }
         return false;
      }
      
      private function getKind(param1:BaoWu) : int
      {
         var _loc2_:StcItemVo = StcMgr.ins.getItemVo(param1.baseId);
         var _loc3_:int = _loc2_.kind;
         return _loc3_;
      }
      
      public function updateRuneCategoryArrData() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         _runeCategoryArr = [];
         _loc1_ = 0;
         while(_loc1_ <= int(DefindConsts.FUMO_MAXTYPE))
         {
            _loc2_ = new RuneCategoryVo();
            _loc2_.type = _loc1_;
            _loc2_.runeArr = BagModel.ins.getRuneArrByType(_loc2_.type);
            _runeCategoryArr.push(_loc2_);
            _loc1_++;
         }
      }
      
      public function get runeCategoryArr() : Array
      {
         updateRuneCategoryArrData();
         return _runeCategoryArr;
      }
      
      public function dispose() : void
      {
         defaultSelectHero = null;
         defaultSelectTreasure = null;
         selectedHeroInfo = null;
         selectedTreasure = null;
         crtTakOffTreasure = null;
         allTreasureArr = [];
         heroInfoArr = [];
         list_rune = null;
         list_category = null;
      }
      
      public function initAutoBatchRuneTypeArr() : Array
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         if(!autoBatchRuneTypeArr)
         {
            autoBatchRuneTypeArr = [];
            _loc1_ = 1;
            while(_loc1_ <= DefindConsts.FUMO_MAXTYPE)
            {
               _loc2_ = new RuneTypeVo();
               _loc2_.type = _loc1_;
               autoBatchRuneTypeArr.push(_loc2_);
               _loc1_++;
            }
         }
         var _loc4_:int = 0;
         var _loc3_:* = autoBatchRuneTypeArr;
         for each(_loc2_ in autoBatchRuneTypeArr)
         {
            if(selectedRuneKind == 0)
            {
               _loc2_.selected = true;
            }
            else if(_loc2_.type == selectedRuneKind)
            {
               _loc2_.selected = true;
            }
            else
            {
               _loc2_.selected = false;
            }
         }
         return autoBatchRuneTypeArr;
      }
      
      public function getRunePositon(param1:int) : Array
      {
         var _loc2_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc13_:* = null;
         var _loc5_:Array = list_rune.dataSource as Array;
         var _loc7_:int = _loc5_.length;
         var _loc9_:* = -1;
         var _loc12_:Point = new Point();
         var _loc4_:* = 1;
         _loc11_ = 0;
         while(_loc11_ < _loc7_)
         {
            _loc10_ = _loc5_[_loc11_];
            if(_loc10_ && _loc10_.sid == param1)
            {
               _loc9_ = _loc11_;
               break;
            }
            _loc11_++;
         }
         if(_loc9_ >= 0)
         {
            _loc6_ = list_rune.getCell(_loc9_);
            if(_loc6_)
            {
               _loc2_ = _loc6_.localToGlobal(_loc12_);
            }
         }
         var _loc8_:int = TreasureUtil.getRuneType(param1);
         _loc9_ = 0;
         if(!_loc2_)
         {
            _loc3_ = list_category.dataSource as Array;
            _loc7_ = _loc3_.length;
            _loc11_ = 0;
            while(_loc11_ < _loc7_)
            {
               _loc13_ = _loc3_[_loc11_];
               if(_loc13_.type == _loc8_)
               {
                  _loc9_ = _loc11_;
                  break;
               }
               _loc11_++;
            }
            _loc6_ = list_category.getCell(_loc9_);
            _loc12_.x = 26;
            _loc12_.y = 8;
            _loc2_ = _loc6_.localToGlobal(_loc12_);
            _loc4_ = 0.4;
         }
         return [_loc2_,_loc4_];
      }
      
      public function getRuneCategoryPositon(param1:int) : Array
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc9_:* = null;
         var _loc11_:int = 0;
         var _loc5_:Array = list_rune.dataSource as Array;
         var _loc8_:int = _loc5_.length;
         var _loc12_:* = -1;
         var _loc7_:Point = new Point();
         var _loc4_:* = 1;
         var _loc6_:Box = list_rune.getCell(_loc12_);
         var _loc10_:int = TreasureUtil.getRuneType(param1);
         _loc12_ = 0;
         if(!_loc3_)
         {
            _loc2_ = list_category.dataSource as Array;
            _loc8_ = _loc2_.length;
            _loc11_ = 0;
            while(_loc11_ < _loc8_)
            {
               _loc9_ = _loc2_[_loc11_];
               if(_loc9_.type == _loc10_)
               {
                  _loc12_ = _loc11_;
                  break;
               }
               _loc11_++;
            }
            _loc6_ = list_category.getCell(_loc12_);
            _loc7_.x = 26;
            _loc7_.y = 8;
            _loc3_ = _loc6_.localToGlobal(_loc7_);
            _loc4_ = 0.4;
         }
         return [_loc3_,_loc4_];
      }
      
      public function checkCanCompose() : Boolean
      {
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc2_:RuneCategoryVo = _runeCategoryArr[0];
         _loc3_ = _loc2_.runeArr;
         if(_loc3_.length)
         {
            var _loc6_:int = 0;
            var _loc5_:* = _loc3_;
            for each(_loc1_ in _loc3_)
            {
               if(_loc1_)
               {
                  if(int(_loc1_.stcItemVo.extend_2) < int(DefindConsts.FUMO_MAXLV))
                  {
                     _loc4_ = PlayerModel.ins.getCountByWealthVo(_loc1_);
                     if(_loc4_ >= 3)
                     {
                        return true;
                     }
                  }
               }
            }
         }
         return false;
      }
      
      public function checkSelectedTreasursHasRune() : Boolean
      {
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc3_:int = _idleTreasureArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = _idleTreasureArr[_loc4_];
            if(_loc1_.selected == true)
            {
               var _loc6_:int = 0;
               var _loc5_:* = _loc1_.baoWu.fumo;
               for each(var _loc2_ in _loc1_.baoWu.fumo)
               {
                  if(_loc2_.id > 0)
                  {
                     return true;
                  }
               }
            }
            _loc4_++;
         }
         return false;
      }
      
      public function getOnekeyStrenTreausreList(param1:int, param2:Boolean = false) : Array
      {
         var _loc8_:* = null;
         var _loc6_:int = 0;
         selectedExpTreausreIconArr = [];
         var _loc3_:Array = [];
         var _loc5_:int = _idleTreasureArr.length;
         var _loc4_:int = Uint64Util.toInt(selectedTreasure.exp);
         var _loc7_:int = TreasureUtil.getStrenVo(selectedTreasure.level,selectedTreasure.baseId).exp;
         hasHighQualityItem = false;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc8_ = _idleTreasureArr[_loc6_] as TreasureVo;
            if(param2)
            {
               if(_loc8_ && (_loc8_.wealthVo.stcItemVo.kind == 31 || _loc8_.wealthVo.stcItemVo.kind == 8 || _loc8_.wealthVo.stcItemVo.kind == 9) && _loc8_.quality <= param1)
               {
                  if(_loc8_.quality >= 4)
                  {
                     hasHighQualityItem = true;
                  }
                  _loc4_ = _loc4_ + _loc8_.exp;
                  _loc3_.push(_loc8_.baoWu.id);
                  selectedExpTreausreIconArr.push(_loc8_.wealthVo.iconUrl());
                  if(_loc4_ >= _loc7_)
                  {
                     break;
                  }
               }
            }
            else if(_loc8_ && _loc8_.wealthVo.stcItemVo.kind == 31 && _loc8_.quality <= param1)
            {
               if(_loc8_.quality >= 4)
               {
                  hasHighQualityItem = true;
               }
               _loc4_ = _loc4_ + _loc8_.exp;
               _loc3_.push(_loc8_.baoWu.id);
               selectedExpTreausreIconArr.push(_loc8_.wealthVo.iconUrl());
               if(_loc4_ >= _loc7_)
               {
                  break;
               }
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      public function getALLTreausreData() : Array
      {
         return _allTreausreWealthVoArr;
      }
      
      public function checkHasRune(param1:BaoWu) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1.fumo;
         for each(var _loc2_ in param1.fumo)
         {
            if(_loc2_.id > 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get selectedTreasure() : BaoWu
      {
         return _selectedTreasure;
      }
      
      public function set selectedTreasure(param1:BaoWu) : void
      {
         if(_selectedTreasure != param1)
         {
            _selectedTreasure = param1;
         }
      }
      
      public function get preBwData() : BaoWu
      {
         return _preBwData;
      }
      
      public function set preBwData(param1:BaoWu) : void
      {
         _preBwData = param1;
      }
      
      public function get currentKeyinVo() : StcBaowuKeyinVo
      {
         if(selectedTreasure)
         {
            return StcMgr.ins.getVoByMultiColumnValue("static_baowu_keyin",["level","itemid"],[selectedTreasure.keyin,selectedTreasure.baseId]);
         }
         return null;
      }
      
      public function get currentFuwenKeyinVo() : StcBaowuFuwenKeyinVo
      {
         if(selectedTreasure)
         {
            return StcMgr.ins.getVoByMultiColumnValue("static_baowu_fuwen_keyin",["level","quality"],[selectedTreasure.fuwenkeyin,StcMgr.ins.getItemVo(selectedTreasure.baseId).quality]);
         }
         return null;
      }
      
      public function get nextKeyinVo() : StcBaowuKeyinVo
      {
         if(selectedTreasure)
         {
            return StcMgr.ins.getVoByMultiColumnValue("static_baowu_keyin",["level","quality"],[selectedTreasure.keyin + 1,StcMgr.ins.getItemVo(selectedTreasure.baseId).quality]);
         }
         return null;
      }
      
      public function checkSceneTreasure3D() : void
      {
      }
   }
}
