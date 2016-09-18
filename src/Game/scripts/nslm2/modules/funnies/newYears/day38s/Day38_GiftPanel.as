package nslm2.modules.funnies.newYears.day38s
{
   import game.ui.newYears.day38s.Day38_GiftPanelUI;
   import nslm2.modules.funnies.newYears.day38s.services.Day38Service;
   import flash.events.Event;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class Day38_GiftPanel extends Day38_GiftPanelUI
   {
       
      
      public function Day38_GiftPanel()
      {
         super();
         this.list_reward.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
      }
      
      public function get service() : Day38Service
      {
         return Day38Service.ins;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         service.addEventListener("EVT_SCORE_CPL",service_initCpl);
         service.server_getScorePanel();
      }
      
      private function service_initCpl(param1:Event) : void
      {
         service.removeEventListener("EVT_SCORE_CPL",service_initCpl);
         super.moduleServerStart(null);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(13333008);
         refreshUI();
         super.preShow(param1);
      }
      
      private function refreshUI(... rest) : void
      {
         var _loc2_:Array = StcMgr.ins.getGoddessScoreRewardTable().array;
         _loc2_.sortOn("id",16);
         var _loc3_:Array = service.scorePanelRes.rankAward;
         _loc3_.sortOn("id",16);
         this.list_reward.array = _loc3_;
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this.service.addEventListener("EVT_GIFT_GET_CPL",refreshUI);
         }
         else
         {
            this.service.removeEventListener("EVT_GIFT_GET_CPL",refreshUI);
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
      }
   }
}
