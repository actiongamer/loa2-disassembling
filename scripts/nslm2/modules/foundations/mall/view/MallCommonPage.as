package nslm2.modules.foundations.mall.view
{
   import game.ui.mallModule.CommonPageUI;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import flash.display.DisplayObject;
   import nslm2.modules.foundations.mall.model.MallModel;
   import com.mz.core.utils.ArrayUtil;
   import morn.customs.FilterLib;
   import com.greensock.TweenLite;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class MallCommonPage extends CommonPageUI implements IObserver, IViewStackPage
   {
       
      
      private var filterBreath:GlowFilterBreathCtrl;
      
      private var highLightItem:DisplayObject;
      
      public function MallCommonPage()
      {
         super();
         (pageBar as IPageBar).bindList(list_items);
      }
      
      public function getFocusNotices() : Array
      {
         return ["mall_notice_update_info","mall_hilight_item"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = param1;
         if("mall_notice_update_info" !== _loc5_)
         {
            if("mall_hilight_item" === _loc5_)
            {
               if(param2)
               {
                  _loc3_ = ArrayUtil.indexByAttr(list_items.dataSource,"id",param2);
                  _loc4_ = list_items.getCell(_loc3_);
                  if(_loc4_)
                  {
                     highLightItem = _loc4_;
                     filterBreath = new GlowFilterBreathCtrl(FilterLib.TEXT_GROW_SELECTED_FILTER,2,0.5,0.5).addHandler(filterBreath_cb);
                     TweenLite.delayedCall(3,hideHighLiht);
                  }
               }
            }
         }
         else
         {
            list_items.dataSource = MallModel.ins.getCrtPageItemList();
            if(param2)
            {
               this.fadeIn(0,11010);
            }
         }
      }
      
      private function hideHighLiht() : void
      {
         if(filterBreath)
         {
            filterBreath.dispose();
            filterBreath = null;
         }
         if(highLightItem)
         {
            highLightItem.filters = [];
            highLightItem = null;
         }
      }
      
      private function filterBreath_cb(param1:Array) : void
      {
         highLightItem.filters = param1;
      }
      
      public function viewStackIn() : void
      {
         ObserverMgr.ins.regObserver(this);
         visible = true;
      }
      
      public function viewStackOut() : void
      {
         ObserverMgr.ins.unregObserver(this);
         visible = false;
         TweenLite.killDelayedCallsTo(hideHighLiht);
         if(filterBreath)
         {
            filterBreath.dispose();
            filterBreath = null;
         }
      }
   }
}
