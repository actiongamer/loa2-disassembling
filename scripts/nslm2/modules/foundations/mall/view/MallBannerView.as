package nslm2.modules.foundations.mall.view
{
   import game.ui.mallModule.BannerViewUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.ctrls.ListPageBarCtrl;
   import flash.events.MouseEvent;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class MallBannerView extends BannerViewUI implements IObserver
   {
       
      
      private var pageBarContrl:ListPageBarCtrl;
      
      public function MallBannerView()
      {
         super();
         list_navBtn.selectHandler = navHander;
         addEvent();
      }
      
      private function addEvent() : void
      {
         addEventListener("rollOver",overHandler);
         addEventListener("rollOut",outHandler);
      }
      
      private function removeEvent() : void
      {
         removeEventListener("rollOver",overHandler);
         removeEventListener("rollOut",outHandler);
      }
      
      protected function outHandler(param1:MouseEvent) : void
      {
         startAutoPlay();
      }
      
      protected function overHandler(param1:MouseEvent) : void
      {
         stopAutoPlay();
      }
      
      private function stopAutoPlay() : void
      {
         TimerManager.ins.clearTimer(changeBanner);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         list_navBtn.repeatX = param1.length;
         list_navBtn.dataSource = param1;
         list_navBtn.commitMeasure();
         list_navBtn.x = (width - list_navBtn.width >> 1) - 10;
         list_banner.dataSource = param1;
         list_navBtn.selectedIndex = 0;
         startAutoPlay();
         ObserverMgr.ins.regObserver(this);
      }
      
      private function navHander(param1:int) : void
      {
         pageBarContrl = new ListPageBarCtrl(list_banner,null,null,null);
         pageBarContrl.hChangePageCtrl.setTime(0.6);
         pageBarContrl.pageTo(param1,true);
      }
      
      private function startAutoPlay() : void
      {
         if(list_banner.dataSource && list_banner.dataSource.length > 1)
         {
            TimerManager.ins.doLoop(3000,changeBanner);
         }
      }
      
      private function changeBanner() : void
      {
         var _loc1_:int = list_navBtn.selectedIndex;
         var _loc2_:int = list_navBtn.dataSource.length;
         _loc1_++;
         _loc1_ = _loc1_ >= _loc2_?0:_loc1_;
         list_navBtn.selectedIndex = _loc1_;
      }
      
      public function getFocusNotices() : Array
      {
         return ["mall_start_auto_scroll_banner"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         if(param1 == "mall_start_auto_scroll_banner")
         {
            if(param2)
            {
               startAutoPlay();
               addEvent();
            }
            else
            {
               stopAutoPlay();
               removeEvent();
            }
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         removeEvent();
         TimerManager.ins.clearTimer(changeBanner);
         super.dispose();
      }
   }
}
