package nslm2.modules.footstones.assistantModules.subAssistants.mysteryshop
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcMysticShopVo;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.common.model.HeroModel;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class AssisMysteryShopModel
   {
      
      private static var _ins:nslm2.modules.footstones.assistantModules.subAssistants.mysteryshop.AssisMysteryShopModel;
       
      
      public var shenShengShopList:Array;
      
      public var fengbaoShopList:Array;
      
      public var zhenbaoShopList:Array;
      
      public var itemShopList:Array;
      
      public var tempNeedBuyShopList:Array;
      
      public var showHeroSoul:Boolean = true;
      
      public var showDiamond:Boolean = true;
      
      public var dataInited:Boolean;
      
      public function AssisMysteryShopModel()
      {
         shenShengShopList = [];
         fengbaoShopList = [];
         zhenbaoShopList = [];
         itemShopList = [];
         tempNeedBuyShopList = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.footstones.assistantModules.subAssistants.mysteryshop.AssisMysteryShopModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.assistantModules.subAssistants.mysteryshop.AssisMysteryShopModel();
         }
         return _ins;
      }
      
      public function initData() : void
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         if(dataInited == false)
         {
            _loc4_ = StcMgr.ins.getVoArrByColumnValue("static_mystic_shop","shop_type",60310 + 100000);
            _loc3_ = _loc4_.length;
            while(_loc6_ < _loc3_)
            {
               _loc1_ = _loc4_[_loc6_];
               if(!(_loc1_.weight == 0 && _loc1_.super_weight == 0))
               {
                  _loc5_ = StcMgr.ins.getShopVo(_loc1_.item_id);
                  _loc2_ = WealthUtil.parseCostStr(_loc5_.sell_res);
                  switch(int(_loc2_.kind) - 20)
                  {
                     case 0:
                        addItem(_loc2_,_loc5_);
                        break;
                     default:
                        addItem(_loc2_,_loc5_);
                        break;
                     default:
                        addItem(_loc2_,_loc5_);
                        break;
                     default:
                        addItem(_loc2_,_loc5_);
                        break;
                     default:
                        addItem(_loc2_,_loc5_);
                        break;
                     default:
                        addItem(_loc2_,_loc5_);
                        break;
                     default:
                        addItem(_loc2_,_loc5_);
                        break;
                     default:
                        addItem(_loc2_,_loc5_);
                        break;
                     default:
                        addItem(_loc2_,_loc5_);
                        break;
                     default:
                        addItem(_loc2_,_loc5_);
                        break;
                     case 10:
                        addNpc(_loc2_,_loc5_);
                  }
               }
               _loc6_++;
            }
            dataInited = true;
         }
      }
      
      private function addNpc(param1:WealthVo, param2:StcShopVo) : void
      {
         addNpcByGroup(param1.stcNpcVo,param2);
      }
      
      private function addNpcByGroup(param1:StcNpcVo, param2:StcShopVo) : void
      {
         if(param1)
         {
            switch(int(param1.group) - 1)
            {
               case 0:
                  if(fengbaoShopList.indexOf(param2.id) == -1)
                  {
                     fengbaoShopList.push(param2.id);
                  }
                  break;
               case 1:
                  if(shenShengShopList.indexOf(param2.id) == -1)
                  {
                     shenShengShopList.push(param2.id);
                  }
                  break;
               case 2:
                  if(zhenbaoShopList.indexOf(param2.id) == -1)
                  {
                     zhenbaoShopList.push(param2.id);
                     break;
                  }
            }
         }
      }
      
      private function addItem(param1:WealthVo, param2:StcShopVo) : void
      {
         var _loc3_:* = null;
         if(param1.stcItemVo)
         {
            if(!(int(param1.stcItemVo.kind) - 21))
            {
               _loc3_ = StcMgr.ins.getNpcVo(param1.stcItemVo.heroPiece_stcNpcId);
               if(_loc3_)
               {
                  addNpcByGroup(_loc3_,param2);
               }
            }
            else if(itemShopList.indexOf(param2.id) == -1)
            {
               itemShopList.push(param2.id);
            }
         }
      }
      
      public function notSelectedShopListByIndex(param1:int) : Array
      {
         var _loc3_:* = [];
         if(showDiamond == false && showHeroSoul == false)
         {
            return _loc3_;
         }
         var _loc4_:Array = [];
         switch(int(param1))
         {
            case 0:
               _loc4_ = itemShopList.concat(getTuiJianItem());
               break;
            case 1:
               _loc4_ = sortArr(fengbaoShopList);
               break;
            case 2:
               _loc4_ = sortArr(shenShengShopList);
               break;
            case 3:
               _loc4_ = sortArr(zhenbaoShopList);
         }
         var _loc2_:Array = ArrayUtil.differenceBetweenArrs(_loc4_,tempNeedBuyShopList);
         if(showDiamond == false || showHeroSoul == false)
         {
            _loc3_ = _loc2_.filter(filterFunc);
         }
         else
         {
            _loc3_ = _loc2_;
         }
         return _loc3_;
      }
      
      private function getTuiJianItem() : Array
      {
         var _loc1_:* = null;
         var _loc5_:* = null;
         var _loc4_:Array = fengbaoShopList.concat(shenShengShopList).concat(zhenbaoShopList);
         _loc4_ = ArrayUtil.differenceBetweenArrs(_loc4_,tempNeedBuyShopList);
         if(showDiamond == false || showHeroSoul == false)
         {
            _loc4_ = _loc4_.filter(filterFunc);
         }
         var _loc3_:Array = [];
         var _loc7_:int = 0;
         var _loc6_:* = _loc4_;
         for each(var _loc2_ in _loc4_)
         {
            _loc1_ = StcMgr.ins.getShopVo(_loc2_);
            _loc5_ = WealthVo.parseCostStr(_loc1_.sell_res);
            if(_loc5_.stcItemVo && _loc5_.stcItemVo.kind == 21)
            {
               if(HeroModel.ins.checkHeroInTeam(_loc5_.stcItemVo.heroPiece_stcNpcId))
               {
                  _loc3_.push(_loc2_);
               }
            }
            else if(_loc5_.stcNpcVo)
            {
               if(HeroModel.ins.checkHeroInTeam(_loc5_.stcNpcVo.id))
               {
                  _loc3_.push(_loc2_);
               }
            }
         }
         return sortArr(_loc3_);
      }
      
      private function highSort(param1:*, param2:*) : int
      {
         if(param1.in_use > param2.in_use)
         {
            return -1;
         }
         if(param1.in_use < param2.in_use)
         {
            return 1;
         }
         if(param1.res > param2.res)
         {
            return -1;
         }
         if(param2.res > param1.res)
         {
            return 1;
         }
         if(param1.color > param2.color)
         {
            return -1;
         }
         if(param2.color > param1.color)
         {
            return 1;
         }
         if(param1.npc_id > param2.npc_id)
         {
            return 1;
         }
         if(param2.npc_id > param1.npc_id)
         {
            return -1;
         }
         if(param1.price > param2.price)
         {
            return 1;
         }
         if(param2.price > param1.price)
         {
            return -1;
         }
         return 0;
      }
      
      private function sortArr(param1:Array) : Array
      {
         var _loc2_:* = null;
         var _loc8_:* = null;
         var _loc6_:* = null;
         var _loc4_:Array = [];
         var _loc10_:int = 0;
         var _loc9_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc2_ = StcMgr.ins.getShopVo(_loc3_);
            _loc8_ = WealthVo.parseCostStr(_loc2_.sell_res);
            _loc6_ = WealthUtil.parseCostStr(_loc2_.curr_res);
            if(_loc8_.stcItemVo && _loc8_.stcItemVo.kind == 21)
            {
               if(HeroModel.ins.checkHeroInTeam(_loc8_.stcItemVo.heroPiece_stcNpcId))
               {
                  _loc4_.push({
                     "in_use":1,
                     "id":_loc3_,
                     "is_piece":1,
                     "res":_loc6_.kind,
                     "price":_loc6_.count,
                     "color":StcMgr.ins.getNpcVo(_loc8_.stcItemVo.heroPiece_stcNpcId).quality,
                     "npc_id":_loc8_.stcItemVo.heroPiece_stcNpcId
                  });
               }
               else
               {
                  _loc4_.push({
                     "in_use":0,
                     "id":_loc3_,
                     "is_piece":1,
                     "res":_loc6_.kind,
                     "price":_loc6_.count,
                     "color":StcMgr.ins.getNpcVo(_loc8_.stcItemVo.heroPiece_stcNpcId).quality,
                     "npc_id":_loc8_.stcItemVo.heroPiece_stcNpcId
                  });
               }
            }
            else if(_loc8_.stcNpcVo)
            {
               if(HeroModel.ins.checkHeroInTeam(_loc8_.stcNpcVo.id))
               {
                  _loc4_.push({
                     "in_use":1,
                     "id":_loc3_,
                     "is_piece":0,
                     "res":_loc6_.kind,
                     "price":_loc6_.count,
                     "color":_loc8_.stcNpcVo.quality,
                     "npc_id":_loc8_.stcNpcVo.id
                  });
               }
               else
               {
                  _loc4_.push({
                     "in_use":0,
                     "id":_loc3_,
                     "is_piece":0,
                     "res":_loc6_.kind,
                     "price":_loc6_.count,
                     "color":_loc8_.stcNpcVo.quality,
                     "npc_id":_loc8_.stcNpcVo.id
                  });
               }
            }
         }
         _loc4_.sort(highSort);
         var _loc5_:Array = [];
         var _loc12_:int = 0;
         var _loc11_:* = _loc4_;
         for each(var _loc7_ in _loc4_)
         {
            _loc5_.push(_loc7_.id);
         }
         return _loc5_;
      }
      
      public function isSelected(param1:int) : Boolean
      {
         return tempNeedBuyShopList.indexOf(param1) != -1;
      }
      
      public function addNeedBuyShopId(param1:int) : void
      {
         tempNeedBuyShopList.push(param1);
         ObserverMgr.ins.sendNotice("mysteryShopChanged");
      }
      
      public function removeNeedBuyShopId(param1:int) : void
      {
         ArrayUtil.removeItem(tempNeedBuyShopList,param1);
         ObserverMgr.ins.sendNotice("mysteryShopChanged");
      }
      
      private function filterFunc(param1:int, ... rest) : Boolean
      {
         var _loc4_:StcShopVo = StcMgr.ins.getShopVo(param1);
         var _loc3_:WealthVo = WealthUtil.parseCostStr(_loc4_.curr_res);
         if(showDiamond && _loc3_.kind == 3)
         {
            return true;
         }
         if(showHeroSoul && _loc3_.kind == 15)
         {
            return true;
         }
         return false;
      }
   }
}
