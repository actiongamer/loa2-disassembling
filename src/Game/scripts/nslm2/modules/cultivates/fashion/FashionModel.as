package nslm2.modules.cultivates.fashion
{
   import flash.events.EventDispatcher;
   import com.mz.core.utils.DictHash;
   import com.netease.protobuf.UInt64;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcClotheSuitVo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.common.model.PlayerModel;
   import proto.FashionList;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.event.MzEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.ClothesSkillBagRes;
   import proto.ClothesBagRes;
   import game.ui.roleInfos.NpcPropVo;
   import proto.Item;
   import nslm2.utils.Uint64Util;
   import proto.ItemReduce;
   import nslm2.modules.footstones.quickUseModules.QuickUseModel;
   import proto.ClothesActiveRes;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.modules.cultivates.skillChangePanels.SkillChangeModel;
   
   public class FashionModel extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.cultivates.fashion.FashionModel;
       
      
      public var clothDict:DictHash;
      
      public var wingDict:DictHash;
      
      public var inactivatedNorSkillArr:Array;
      
      public var inactivatedSpeSkillArr:Array;
      
      public var activatedNorSkillArr:Array;
      
      public var activatedSpeSkillArr:Array;
      
      public var activatedClothArr:Array;
      
      public var activatedWingArr:Array;
      
      public var canActivatedWingArr:Array;
      
      public var canActivatedClothArr:Array;
      
      public var usingClothId:int;
      
      public var usingWingId:int;
      
      public var usingLeftAccId:int;
      
      public var usingRightAccId:int;
      
      public var usingNormalSkillId:int;
      
      public var usingSpecialSkillId:int;
      
      public var fashionAddProp:Array;
      
      public var fashionAccArr:Array;
      
      public var fashionAccSkillDict:DictHash;
      
      public var fashionAddFight:UInt64;
      
      public var newFashionArr:Vector.<uint>;
      
      private var _fashionSuitList:Array;
      
      public function FashionModel()
      {
         clothDict = new DictHash();
         wingDict = new DictHash();
         inactivatedNorSkillArr = [];
         inactivatedSpeSkillArr = [];
         activatedNorSkillArr = [];
         activatedSpeSkillArr = [];
         activatedClothArr = [];
         activatedWingArr = [];
         canActivatedWingArr = [];
         canActivatedClothArr = [];
         fashionAddProp = NpcPropVo.getEmptyPopArr(1,5,0);
         fashionAccArr = [];
         fashionAccSkillDict = new DictHash();
         fashionAddFight = new UInt64();
         newFashionArr = new Vector.<uint>();
         _fashionSuitList = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.cultivates.fashion.FashionModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.fashion.FashionModel();
         }
         return _ins;
      }
      
      public function isNewFashion(param1:uint) : Boolean
      {
         return this.newFashionArr.indexOf(param1) != -1;
      }
      
      public function removeNewFashion(param1:uint) : void
      {
         ArrayUtil.removeItem(this.newFashionArr,param1);
      }
      
      public function get fashionSuitList() : Array
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         if(_fashionSuitList.length <= 0)
         {
            this.inactivatedNorSkillArr = [];
            this.inactivatedSpeSkillArr = [];
            _loc2_ = StcMgr.ins.getClotheSuitTable();
            var _loc6_:int = 0;
            var _loc5_:* = _loc2_.array;
            for each(var _loc4_ in _loc2_.array)
            {
               _loc3_ = getFashionCloth(_loc4_.id);
               _loc1_ = StcMgr.ins.getItemVo(_loc3_);
               if(int(_loc1_.extend_4) == PlayerModel.ins.sex)
               {
                  _fashionSuitList.push(_loc4_.id);
                  setSkill(_loc4_.skill_1);
                  setSkill(_loc4_.skill_2);
               }
            }
         }
         return _fashionSuitList.reverse().sort(fashionSortFunc);
      }
      
      public function norSkillList() : Array
      {
         var _loc1_:Array = this.activatedNorSkillArr.concat(this.inactivatedNorSkillArr);
         return _loc1_.sort(skillSortFunc);
      }
      
      public function speSkillList() : Array
      {
         var _loc1_:Array = this.activatedSpeSkillArr.concat(this.inactivatedSpeSkillArr);
         return _loc1_.sort(skillSortFunc);
      }
      
      public function initFashionAcc(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         fashionAccArr = param1;
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_.curUseId)
            {
               _loc2_ = StcMgr.ins.getFashionSynVo(_loc3_.id);
               _loc4_ = StcMgr.ins.getItemVo(_loc2_.item);
               if(_loc4_.kind == 15)
               {
                  usingLeftAccId = _loc2_.item;
               }
               else
               {
                  usingRightAccId = _loc2_.item;
               }
            }
            fashionAccSkillDict.put(_loc3_.id,_loc3_.skillNum);
         }
      }
      
      public function hasNewUnequipedFashionAcc() : Boolean
      {
         var _loc1_:* = null;
         var _loc5_:* = null;
         if(FuncOpenAutoCtrl.checkOpen(31200) == false)
         {
            return false;
         }
         if(usingLeftAccId > 0 && usingRightAccId > 0)
         {
            return false;
         }
         var _loc2_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc7_:int = 0;
         var _loc6_:* = fashionAccArr;
         for each(var _loc3_ in fashionAccArr)
         {
            _loc1_ = StcMgr.ins.getFashionSynVo(_loc3_.id);
            _loc5_ = StcMgr.ins.getItemVo(_loc1_.item);
            if(_loc5_.kind == 15)
            {
               _loc2_ = true;
            }
            else
            {
               _loc4_ = true;
            }
            if(!(_loc2_ && _loc4_))
            {
               continue;
            }
            break;
         }
         if(_loc2_ && usingLeftAccId == 0)
         {
            return true;
         }
         if(_loc4_ && usingRightAccId == 0)
         {
            return true;
         }
         return false;
      }
      
      public function hasNewAccCanSyn() : Boolean
      {
         if(FuncOpenAutoCtrl.checkOpen(31200) == false)
         {
            return false;
         }
         var _loc1_:Array = StcMgr.ins.getFashionSynTable().array;
         var _loc4_:int = 0;
         var _loc3_:* = _loc1_;
         for each(var _loc2_ in _loc1_)
         {
            if(isSynItemEnough(_loc2_))
            {
               return true;
            }
         }
         return false;
      }
      
      public function isSynItemEnough(param1:StcFashionSynVo) : Boolean
      {
         var _loc4_:* = null;
         var _loc3_:Boolean = false;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         if(BagModel.ins.getStcCount(param1.item) == 0)
         {
            _loc4_ = WealthUtil.costStrToArr(param1.costItem + "|" + param1.extraCost);
            _loc3_ = true;
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc2_ = _loc4_[_loc5_];
               if(_loc2_.kind == 1)
               {
                  if(_loc2_.count > PlayerModel.ins.gold)
                  {
                     _loc3_ = false;
                     break;
                  }
               }
               else if(_loc2_.count > BagModel.ins.getStcCount(_loc2_.itemId))
               {
                  _loc3_ = false;
                  break;
               }
               _loc5_++;
            }
            if(_loc3_)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getFashionCloth(param1:int) : int
      {
         if(clothDict.containsKey(param1) == false)
         {
            clothDict.put(param1,(StcMgr.ins.getVoByMultiColumnValue("static_item",["kind","extend_1"],[10,param1]) as StcItemVo).id);
         }
         return clothDict.getValue(param1);
      }
      
      public function getFashionWing(param1:int) : int
      {
         if(wingDict.containsKey(param1) == false)
         {
            wingDict.put(param1,(StcMgr.ins.getVoByMultiColumnValue("static_item",["kind","extend_1"],[12,param1]) as StcItemVo).id);
         }
         return wingDict.getValue(param1);
      }
      
      public function getSuitId(param1:int) : int
      {
         if(param1 == 0)
         {
            return 0;
         }
         var _loc2_:StcItemVo = StcMgr.ins.getItemVo(param1);
         return int(_loc2_.extend_1);
      }
      
      public function changeFashion(param1:int, param2:int) : void
      {
         if(param2 == 0)
         {
            return;
         }
         switch(int(param1))
         {
            case 0:
               switch(int(StcMgr.ins.getItemVo(param2).kind) - 10)
               {
                  case 0:
                     usingClothId = 0;
                     break;
                  default:
                     usingClothId = 0;
                     break;
                  case 2:
                     usingWingId = 0;
               }
               break;
            case 1:
               switch(int(StcMgr.ins.getItemVo(param2).kind) - 10)
               {
                  case 0:
                     usingClothId = param2;
                     break;
                  default:
                     usingClothId = param2;
                     break;
                  case 2:
                     usingWingId = param2;
               }
         }
         this.dispatchEvent(new MzEvent("evtFashionUsingChange",["OK"]));
         PlayerModel.ins.playerInfo.suit = this.usingClothId;
         PlayerModel.ins.playerInfo.wing = this.usingWingId;
         ObserverMgr.ins.sendNotice("evtFashionUsingChange");
      }
      
      public function changeSkill(param1:int, param2:int) : void
      {
         if(param2 == 0)
         {
            return;
         }
         switch(int(param1))
         {
            case 0:
               if(!(int(StcMgr.ins.getSkillVo(param2).kind) - 1))
               {
                  usingSpecialSkillId = 0;
               }
               else
               {
                  usingNormalSkillId = 0;
               }
               break;
            case 1:
               if(!(int(StcMgr.ins.getSkillVo(param2).kind) - 1))
               {
                  usingSpecialSkillId = param2;
                  break;
               }
               usingNormalSkillId = param2;
               break;
         }
         this.dispatchEvent(new MzEvent("evtSkillUsingChange",param2));
      }
      
      public function resetSkill(param1:ClothesSkillBagRes) : void
      {
         if(param1 != null)
         {
            resetNowHasSkill(param1.id);
            var _loc4_:int = 0;
            var _loc3_:* = param1.__use;
            for each(var _loc2_ in param1.__use)
            {
               if(_loc2_ != 0)
               {
                  if(!(int(StcMgr.ins.getSkillVo(_loc2_).kind) - 1))
                  {
                     usingSpecialSkillId = _loc2_;
                  }
                  else
                  {
                     usingNormalSkillId = _loc2_;
                  }
               }
            }
         }
      }
      
      private function resetNowHasSkill(param1:Array) : void
      {
         activatedNorSkillArr = [];
         activatedSpeSkillArr = [];
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            if(!(int(StcMgr.ins.getSkillVo(_loc2_).kind) - 1))
            {
               activatedSpeSkillArr.push(_loc2_);
               ArrayUtil.removeItem(inactivatedSpeSkillArr,_loc2_);
            }
            else
            {
               activatedNorSkillArr.push(_loc2_);
               ArrayUtil.removeItem(inactivatedNorSkillArr,_loc2_);
            }
         }
      }
      
      public function resetFashion(param1:ClothesBagRes) : void
      {
         activatedClothArr = [];
         activatedWingArr = [];
         this.fashionAddProp = NpcPropVo.getEmptyPopArr(1,5,0);
         if(param1 != null)
         {
            BagModel.ins.add(param1.items);
            BagModel.ins.order();
            canActivatedClothArr = [];
            canActivatedWingArr = [];
            newFashionArr = new Vector.<uint>();
            var _loc4_:int = 0;
            var _loc3_:* = param1.items;
            for each(var _loc2_ in param1.items)
            {
               switch(int(StcMgr.ins.getItemVo(_loc2_.itemId).kind) - 10)
               {
                  case 0:
                     if(_loc2_.isEquiped == true)
                     {
                        usingClothId = _loc2_.itemId;
                     }
                     if(_loc2_.place == 0)
                     {
                        canActivatedClothArr.push(_loc2_.itemId);
                     }
                     else
                     {
                        activatedClothArr.push(_loc2_.itemId);
                     }
                     continue;
                  default:
                     continue;
                  case 2:
                     if(_loc2_.isEquiped == true)
                     {
                        usingWingId = _loc2_.itemId;
                     }
                     if(_loc2_.place == 0)
                     {
                        canActivatedWingArr.push(_loc2_.itemId);
                     }
                     else
                     {
                        activatedWingArr.push(_loc2_.itemId);
                     }
                     continue;
               }
            }
            if(Uint64Util.toNumber(param1.ability) != 0)
            {
               this.fashionAddProp = NpcPropVo.addProp(this.fashionAddProp,NpcPropVo.parseFightPropToBaseProp5List(param1.prop));
            }
            if(param1.hasAbility)
            {
               this.fashionAddFight = Uint64Util.clone(param1.ability);
            }
         }
      }
      
      public function hasActivatedClothBySuitId(param1:int) : Boolean
      {
         return this.activatedClothArr.indexOf(this.getFashionCloth(param1)) != -1;
      }
      
      public function hasActivatedWingBySuitId(param1:int) : Boolean
      {
         return this.activatedWingArr.indexOf(this.getFashionWing(param1)) != -1;
      }
      
      public function hasActivatedFashion(param1:int) : Boolean
      {
         return this.activatedWingArr.indexOf(param1) != -1 || this.activatedClothArr.indexOf(param1) != -1;
      }
      
      public function hasActivatedFashionByKind(param1:uint) : Boolean
      {
         var _loc2_:* = false;
         switch(int(param1) - 10)
         {
            case 0:
               _loc2_ = this.activatedClothArr.length != 0;
               break;
            default:
               _loc2_ = this.activatedClothArr.length != 0;
               break;
            case 2:
               _loc2_ = this.activatedWingArr.length != 0;
         }
         return _loc2_;
      }
      
      public function canActivate(param1:int) : Boolean
      {
         if(this.canActivatedClothArr.indexOf(param1) != -1 || this.canActivatedWingArr.indexOf(param1) != -1)
         {
            return true;
         }
         return false;
      }
      
      public function activateFashion(param1:int) : void
      {
         var _loc3_:StcItemVo = StcMgr.ins.getItemVo(param1);
         switch(int(_loc3_.kind) - 10)
         {
            case 0:
               ArrayUtil.removeItem(this.canActivatedClothArr,param1);
               if(this.activatedClothArr.indexOf(param1) == -1)
               {
                  this.activatedClothArr.push(param1);
               }
               break;
            default:
               ArrayUtil.removeItem(this.canActivatedClothArr,param1);
               if(this.activatedClothArr.indexOf(param1) == -1)
               {
                  this.activatedClothArr.push(param1);
               }
               break;
            case 2:
               ArrayUtil.removeItem(this.canActivatedWingArr,param1);
               if(this.activatedWingArr.indexOf(param1) == -1)
               {
                  this.activatedWingArr.push(param1);
                  break;
               }
         }
         var _loc4_:UInt64 = BagModel.ins.getIdBySid(param1);
         var _loc2_:ItemReduce = new ItemReduce();
         _loc2_.id = _loc4_;
         QuickUseModel.ins.removeQuickUse([_loc2_]);
      }
      
      public function hasFashionCanActivateByKind(param1:uint) : Boolean
      {
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:Array = BagModel.ins.itemArr;
         var _loc5_:int = _loc4_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc2_ = _loc4_[_loc6_];
            _loc3_ = StcMgr.ins.getItemVo(_loc2_.itemId);
            if(this.canActivate(_loc2_.itemId) && _loc3_.kind == param1)
            {
               return true;
            }
            _loc6_++;
         }
         return false;
      }
      
      public function hasSkill(param1:int) : Boolean
      {
         return this.activatedNorSkillArr.indexOf(param1) != -1 || this.activatedSpeSkillArr.indexOf(param1) != -1;
      }
      
      public function fashionIsUsing(param1:int) : Boolean
      {
         if(param1 == 0)
         {
            return false;
         }
         return param1 == this.usingClothId || param1 == this.usingWingId;
      }
      
      public function suitIsUsing(param1:int) : Boolean
      {
         if(param1 == 0)
         {
            return false;
         }
         return param1 == this.getSuitId(usingClothId) || param1 == this.getSuitId(usingWingId);
      }
      
      public function skillIsUsing(param1:int) : Boolean
      {
         if(param1 == 0)
         {
            return false;
         }
         return param1 == this.usingNormalSkillId || param1 == this.usingSpecialSkillId;
      }
      
      public function addCanActivateFashion(param1:int) : void
      {
         var _loc2_:StcItemVo = StcMgr.ins.getItemVo(param1);
         switch(int(_loc2_.kind) - 10)
         {
            case 0:
               if(this.canActivatedClothArr.indexOf(param1) == -1 && this.activatedClothArr.indexOf(param1) == -1)
               {
                  this.canActivatedClothArr.push(param1);
               }
               break;
            default:
               if(this.canActivatedClothArr.indexOf(param1) == -1 && this.activatedClothArr.indexOf(param1) == -1)
               {
                  this.canActivatedClothArr.push(param1);
               }
               break;
            case 2:
               if(this.canActivatedWingArr.indexOf(param1) == -1 && this.activatedWingArr.indexOf(param1) == -1)
               {
                  this.canActivatedWingArr.push(param1);
                  break;
               }
         }
      }
      
      public function onDataChangeOne(param1:ClothesActiveRes, param2:int) : void
      {
         if(param1.hasAbility)
         {
            this.fashionAddFight = Uint64Util.clone(param1.ability);
         }
         if(param1.hasProp)
         {
            this.fashionAddProp = NpcPropVo.addProp(NpcPropVo.getEmptyPopArr(1,5,0),NpcPropVo.parseFightPropToBaseProp5List(param1.prop));
         }
         getNewSkill(param1.skill);
         resetNowHasSkill(param1.skill);
         this.activateFashion(param2);
         this.dispatchEvent(new MzEvent("evtActivateCpl",param2));
      }
      
      private function getNewSkill(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc3_:Array = ArrayUtil.concat(this.activatedNorSkillArr,this.activatedSpeSkillArr);
         var _loc2_:Array = ArrayUtil.differenceBetweenArrs(param1,_loc3_);
         var _loc7_:int = 0;
         var _loc6_:* = _loc2_;
         for each(var _loc5_ in _loc2_)
         {
            _loc4_ = StcMgr.ins.getSkillVo(_loc5_);
            if(_loc4_.kind == 1)
            {
               SkillChangeModel.ins.newSpeSkillVec.push(_loc5_);
            }
            else
            {
               SkillChangeModel.ins.newNorSkillVec.push(_loc5_);
            }
         }
      }
      
      private function setSkill(param1:int) : void
      {
         if(this.activatedNorSkillArr.indexOf(param1) == -1 && this.activatedSpeSkillArr.indexOf(param1) == -1)
         {
            if(!(int(StcMgr.ins.getSkillVo(param1).kind) - 1))
            {
               inactivatedSpeSkillArr.push(param1);
            }
            else
            {
               inactivatedNorSkillArr.push(param1);
            }
         }
      }
      
      private function fashionSortFunc(param1:int, param2:int) : int
      {
         if(this.suitNewFashionCount(param1) > this.suitNewFashionCount(param2))
         {
            return -1;
         }
         if(this.suitNewFashionCount(param1) < this.suitNewFashionCount(param2))
         {
            return 1;
         }
         if(this.suitIsUsing(param1) == true)
         {
            if(this.suitIsUsing(param2) == true)
            {
               return 0;
            }
            return -1;
         }
         if(hasActivatedClothBySuitId(param1) || hasActivatedWingBySuitId(param1))
         {
            if(this.suitIsUsing(param2) == true)
            {
               return 1;
            }
            if(hasActivatedClothBySuitId(param2) || hasActivatedWingBySuitId(param2))
            {
               return 0;
            }
            return -1;
         }
         if(this.suitIsUsing(param2) == true || hasActivatedClothBySuitId(param2) || hasActivatedWingBySuitId(param2))
         {
            return 1;
         }
         if(param1 > param2)
         {
            return -1;
         }
         return 1;
      }
      
      private function suitNewFashionCount(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = this.getFashionCloth(param1);
         var _loc3_:int = this.getFashionWing(param1);
         if(this.isNewFashion(_loc4_))
         {
            _loc2_++;
         }
         if(this.isNewFashion(_loc3_))
         {
            _loc2_++;
         }
         return _loc2_;
      }
      
      private function skillSortFunc(param1:int, param2:int) : int
      {
         if(this.skillIsUsing(param1) == true)
         {
            if(this.skillIsUsing(param2) == true)
            {
               return 0;
            }
            return -1;
         }
         if(this.hasSkill(param1) == true)
         {
            if(this.skillIsUsing(param2) == true)
            {
               return 1;
            }
            if(this.hasSkill(param2) == true)
            {
               return 0;
            }
            return -1;
         }
         if(this.skillIsUsing(param2) == true || this.hasSkill(param2) == true)
         {
            return 1;
         }
         return 0;
      }
   }
}
