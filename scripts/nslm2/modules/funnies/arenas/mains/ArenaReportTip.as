package nslm2.modules.funnies.arenas.mains
{
   import game.ui.arenas.mains.ArenaReportTipUI;
   import nslm2.modules.funnies.arenas.ArenaService;
   import com.greensock.TweenLite;
   import flash.events.Event;
   import proto.ArenaReport;
   import com.greensock.easing.Back;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import morn.customs.FilterLib;
   import com.mz.core.interFace.IDispose;
   
   public class ArenaReportTip extends ArenaReportTipUI
   {
       
      
      private var showBtnHideAllFilter:Boolean = false;
      
      private var isTweenIn:Boolean = true;
      
      public function ArenaReportTip()
      {
         super();
         this.txt_more.toolTip = LocaleMgr.ins.getStr(41210617);
         this.txt_more.text = TextFieldUtil.linkHtmlText2(LocaleMgr.ins.getStr(999000563),LinkUtils.evtString(0));
         this.txt_more.addEventListener("click",txt_more_onClick);
         this.img_arrow_show.mouseEvent = false;
         this.btn_show.clickHandler = btn_click;
         switchEventListeners(true);
         var _loc1_:IDispose = new GlowFilterBreathCtrl(FilterLib.TEXT_GROW_SELECTED_FILTER).set_duration(1.2).addHandler(filterBreath_cb);
         this.parts.push(_loc1_);
         this.visible = false;
      }
      
      public function get service() : ArenaService
      {
         return ArenaService.ins;
      }
      
      private function filterBreath_cb(param1:Array) : void
      {
         if(this.showBtnHideAllFilter)
         {
            this.btn_show.filters = param1;
         }
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.service.addEventListener("EVT_NEW_REPORTS",onNewReports);
         }
         else
         {
            this.service.removeEventListener("EVT_NEW_REPORTS",onNewReports);
         }
      }
      
      public function init() : void
      {
         this.visible = true;
         this.refresh();
         TweenLite.delayedCall(5,tweenOut);
      }
      
      private function onNewReports(param1:Event) : void
      {
         this.refresh();
         if(this.isTweenIn == false)
         {
            showBtnHideAllFilter = true;
         }
      }
      
      private function refresh() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:Array = [];
         if(this.service.infoRes)
         {
            _loc3_ = 3;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = this.service.infoRes.reports[_loc4_];
               if(_loc2_)
               {
                  _loc1_.push(_loc2_);
               }
               _loc4_++;
            }
         }
         this.list.array = _loc1_;
      }
      
      public function tweenIn() : void
      {
         isTweenIn = true;
         TweenLite.to(this.box_content,0.3,{
            "x":0,
            "ease":Back.easeOut
         });
         TweenLite.to(this.img_arrow_show,0.3,{"rotation":0});
      }
      
      public function tweenOut() : void
      {
         isTweenIn = false;
         TweenLite.to(this.box_content,0.3,{
            "x":this.box_show.x + this.btn_show.width,
            "ease":Back.easeOut
         });
         TweenLite.to(this.img_arrow_show,0.3,{"rotation":-90});
      }
      
      private function btn_click() : void
      {
         TweenLite.killDelayedCallsTo(tweenOut);
         showBtnHideAllFilter = false;
         this.btn_show.filters = [];
      }
      
      private function txt_more_onClick(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showOrCloseModule(50900,50280);
      }
      
      override public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(tweenOut);
         switchEventListeners(false);
         super.dispose();
      }
   }
}
