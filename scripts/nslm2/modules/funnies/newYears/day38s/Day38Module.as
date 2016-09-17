package nslm2.modules.funnies.newYears.day38s
{
   import game.ui.newYears.day38s.Day38ModuleUI;
   import nslm2.modules.funnies.newYears.day38s.services.Day38Service;
   import flash.events.Event;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.greensock.TweenLite;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class Day38Module extends Day38ModuleUI
   {
      
      public static var needShowDetail:Boolean = true;
       
      
      private var img_detailOriData:Object;
      
      public function Day38Module()
      {
         img_detailOriData = {};
         super();
         img_detailOriData.x = this.img_detail.x;
         img_detailOriData.y = this.img_detail.y;
         this.img_detail.visible = false;
         this.img_detail.addEventListener("click",img_detail_click);
         this.box_detail_tip.mouseEvent = false;
         this.txt_detail_tip.text = LocaleMgr.ins.getStr(13333003);
         if(needShowDetail == false)
         {
            this.box_detail_tip.visible = false;
         }
      }
      
      public function get service() : Day38Service
      {
         return Day38Service.ins;
      }
      
      public function get votePanel() : Day38_VotePanel
      {
         return this.votePanelUI as Day38_VotePanel;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         service.addEventListener("EVT_INIT_CPL",service_initCpl);
         service.init();
      }
      
      private function service_initCpl(param1:Event) : void
      {
         service.removeEventListener("EVT_INIT_CPL",service_initCpl);
         super.moduleServerStart(null);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.votePanel.init();
         super.preShow(param1);
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
            this.btn_close.addEventListener("click",this.btnCloseHandler);
         }
         else
         {
            this.btn_close.removeEventListener("click",this.btnCloseHandler);
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["MSG_NPC_FUNC_VO_CHANGE","MSG_DAY38_VOTE_DETAIL"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("MSG_NPC_FUNC_VO_CHANGE" !== _loc4_)
         {
            if("MSG_DAY38_VOTE_DETAIL" === _loc4_)
            {
               needShowDetail = false;
               this.box_detail_tip.visible = false;
               _loc3_ = StcMgr.ins.getNpcVo(param2 as int);
               this.img_detail.skin = UrlLib.roleBg(_loc3_.node);
               this.img_detail.visible = true;
               this.img_detail.scale = 0.01;
               this.img_detail.alpha = 1;
               this.img_detail.x = this.mouseX;
               this.img_detail.y = this.mouseY;
               TweenLite.killTweensOf(this.img_detail);
               TweenLite.to(this.img_detail,0.4,{
                  "x":img_detailOriData.x,
                  "y":img_detailOriData.y,
                  "scale":1
               });
            }
         }
         else if(param2 == 13335)
         {
            this.votePanel.refreshRedPoi();
         }
      }
      
      private function img_detail_click(param1:MouseEvent) : void
      {
         TweenLite.killTweensOf(this.img_detail);
         TweenLite.to(this.img_detail,0.2,{
            "alpha":0,
            "visible":false
         });
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
      }
   }
}
