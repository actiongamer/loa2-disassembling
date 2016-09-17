package nslm2.modules.footstones.quickUseModules
{
   import com.netease.protobuf.UInt64;
   import proto.Item;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchQuickUseMsg;
   import nslm2.utils.Uint64Util;
   import proto.ItemReduce;
   import proto.HeroInfo;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.cultivates.roleTeam.util.RoleTeamUtil;
   import nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
   import nslm2.modules.bag.itemModuels.BagModel;
   
   public class QuickUseModel
   {
      
      private static var _ins:nslm2.modules.footstones.quickUseModules.QuickUseModel;
       
      
      public var lastClickedStamp:int;
      
      public var itemIdArr:Array;
      
      public var showingItemId:UInt64;
      
      public var canShowQuickUse:Boolean;
      
      public function QuickUseModel()
      {
         itemIdArr = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.footstones.quickUseModules.QuickUseModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.quickUseModules.QuickUseModel();
         }
         return _ins;
      }
      
      public function getIndexByBagType(param1:int) : int
      {
         var _loc2_:int = 0;
         switch(int(param1) - 96)
         {
            case 0:
            case 1:
               _loc2_ = QuickUseConsts.subViewStackIdArr.indexOf(99);
               break;
            default:
            case 3:
               _loc2_ = QuickUseConsts.subViewStackIdArr.indexOf(1);
         }
         return _loc2_;
      }
      
      public function addQuickUse(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:int = param1.length;
         _loc5_ = 0;
         for(; _loc5_ < _loc3_; _loc5_++)
         {
            _loc2_ = param1[_loc5_] as Item;
            if(!(_loc2_ && _loc2_.count == 0))
            {
               _loc4_ = StcMgr.ins.getItemVo((param1[_loc5_] as Item).itemId);
               var _loc6_:* = _loc4_.kind;
               if(1 !== _loc6_)
               {
                  if(3 !== _loc6_)
                  {
                     if(2 !== _loc6_)
                     {
                        if(4 !== _loc6_)
                        {
                           if(10 !== _loc6_)
                           {
                              if(12 !== _loc6_)
                              {
                                 if(11 !== _loc6_)
                                 {
                                    if(99 !== _loc6_)
                                    {
                                       if(96 !== _loc6_)
                                       {
                                          if(97 !== _loc6_)
                                          {
                                          }
                                          continue;
                                       }
                                       addr79:
                                       checkTreasureChest(param1[_loc5_] as Item);
                                       continue;
                                    }
                                    §§goto(addr79);
                                 }
                              }
                              addr62:
                              ObserverMgr.ins.sendNotice("msgSwitchQuickUse",new SwitchQuickUseMsg((param1[_loc5_] as Item).id,true));
                              continue;
                           }
                           §§goto(addr62);
                        }
                     }
                     addr51:
                     getBetterEquipVo(param1[_loc5_] as Item);
                     continue;
                  }
                  addr50:
                  §§goto(addr51);
               }
               §§goto(addr50);
            }
         }
      }
      
      public function removeQuickUse(param1:Array) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            Uint64Util.removeItemFromArray(this.itemIdArr,(param1[_loc3_] as ItemReduce).id);
            if(Uint64Util.equal(showingItemId,(param1[_loc3_] as ItemReduce).id))
            {
               ObserverMgr.ins.sendNotice("msgShowNextItem");
               return;
            }
            _loc3_++;
         }
      }
      
      public function removeQuickUseById(param1:UInt64) : void
      {
         Uint64Util.removeItemFromArray(this.itemIdArr,param1);
      }
      
      public function removeQuickUseSameId(param1:UInt64) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = itemIdArr.length;
         var _loc2_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(Uint64Util.equal(itemIdArr[_loc4_],param1) == false)
            {
               _loc2_.push(itemIdArr[_loc4_]);
            }
            _loc4_++;
         }
         itemIdArr = _loc2_;
         ObserverMgr.ins.sendNotice("msgShowNextItem");
      }
      
      public function getBetterEquipVo(param1:Item, param2:Boolean = true) : HeroInfo
      {
         var _loc10_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc6_:Array = HeroModel.ins.teamHeroInfoArr;
         var _loc7_:StcItemVo = StcMgr.ins.getItemVo(param1.itemId);
         _loc9_ = 0;
         while(_loc9_ < _loc6_.length)
         {
            _loc8_ = _loc6_[_loc9_];
            _loc5_ = RoleTeamUtil.toEquipVoArr(_loc8_.items,0,_loc8_.baseInfo.baseId);
            _loc4_ = RoleTeamUtil.toEquipBaoWuVoArr(_loc8_.baowu,0,_loc8_.baseInfo.baseId);
            var _loc12_:int = 0;
            var _loc11_:* = _loc5_;
            for each(var _loc3_ in _loc5_)
            {
               if(!_loc3_.wealthVo)
               {
                  if(_loc3_.place == _loc7_.kind)
                  {
                     if(param2)
                     {
                        ObserverMgr.ins.sendNotice("msgSwitchQuickUse",new SwitchQuickUseMsg(param1.id,true));
                     }
                     return _loc8_;
                  }
               }
               else if(BagModel.ins.isBetterEquip(_loc3_.wealthVo,param1,_loc8_.baseInfo.baseId))
               {
                  if(param2)
                  {
                     ObserverMgr.ins.sendNotice("msgSwitchQuickUse",new SwitchQuickUseMsg(param1.id,true));
                  }
                  return _loc8_;
               }
            }
            _loc9_++;
         }
         return null;
      }
      
      public function checkTreasureChest(param1:Item) : void
      {
         ObserverMgr.ins.sendNotice("msgSwitchQuickUse",new SwitchQuickUseMsg(param1.id,true));
      }
   }
}
