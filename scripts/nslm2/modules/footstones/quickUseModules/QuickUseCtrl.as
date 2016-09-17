package nslm2.modules.footstones.quickUseModules
{
   import com.mz.core.interFace.IObserver;
   import com.mz.core.interFace.IDispose;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchQuickUseMsg;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.utils.Uint64Util;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import proto.Item;
   import nslm2.modules.bag.itemModuels.BagModel;
   
   public class QuickUseCtrl implements IObserver, IDispose
   {
      
      private static var _ins:nslm2.modules.footstones.quickUseModules.QuickUseCtrl;
       
      
      public function QuickUseCtrl()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.footstones.quickUseModules.QuickUseCtrl
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.quickUseModules.QuickUseCtrl();
         }
         return _ins;
      }
      
      public function init() : void
      {
         ObserverMgr.ins.regObserver(this);
      }
      
      public function getFocusNotices() : Array
      {
         return ["msgSwitchQuickUse","msgChangeQuickUseShow","msgShowNextItem"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:Boolean = false;
         var _loc6_:* = param1;
         if("msgSwitchQuickUse" !== _loc6_)
         {
            if("msgChangeQuickUseShow" !== _loc6_)
            {
               if("msgShowNextItem" === _loc6_)
               {
                  ModuleMgr.ins.closeModule(96500);
                  checkShow();
               }
            }
            else
            {
               _loc3_ = param2 as Boolean;
               if(_loc3_)
               {
                  TimerManager.ins.doOnce(1000,checkShow);
               }
               else
               {
                  TimerManager.ins.clearTimer(checkShow);
               }
            }
         }
         else
         {
            _loc5_ = param2 as SwitchQuickUseMsg;
            _loc4_ = _loc5_.itemId;
            if(_loc5_.vis)
            {
               QuickUseModel.ins.itemIdArr.push(_loc4_);
               checkShow();
            }
            else
            {
               if(ModuleMgr.ins.isShow(96500) == true && Uint64Util.equal(QuickUseModel.ins.showingItemId,_loc4_))
               {
                  ModuleMgr.ins.closeModule(96500);
               }
               Uint64Util.removeItemFromArray(QuickUseModel.ins.itemIdArr,_loc4_);
            }
         }
      }
      
      public function checkShow() : void
      {
         var _loc1_:* = null;
         if(ModuleMgr.ins.isShow(96500) == false && (NGUtil.curStcVo == null || NGUtil.curStcVo && NGUtil.curStcVo.is_unlock != 0) && QuickUseModel.ins.canShowQuickUse == true)
         {
            if(QuickUseModel.ins.itemIdArr.length > 0)
            {
               _loc1_ = getNextNeedShowItem();
               if(_loc1_ && _loc1_.count > 0)
               {
                  QuickUseModel.ins.showingItemId = _loc1_.id;
                  ModuleMgr.ins.showModule(96500,QuickUseModel.ins.showingItemId);
               }
            }
         }
      }
      
      public function getNextNeedShowItem() : Item
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc3_:int = QuickUseModel.ins.itemIdArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = BagModel.ins.getItemById(QuickUseModel.ins.itemIdArr[_loc4_]);
            if(_loc1_ && _loc1_.count > 0)
            {
               _loc2_ = _loc1_;
               break;
            }
            _loc4_++;
         }
         QuickUseModel.ins.itemIdArr.splice(0,_loc4_);
         return _loc2_;
      }
      
      public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
      }
   }
}
