package nslm2.modules.foundations.recycle.view.panel.heroMirror
{
   import game.ui.recycleModules.heroMirror.HeroHeadItemViewUI;
   import nslm2.common.compsEffects.FlickerEffCtrl;
   import nslm2.modules.foundations.recycle.vo.RecycleVo;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.WealthUtil;
   
   public class HeroHeadItemView extends HeroHeadItemViewUI
   {
       
      
      private var flickerTxtExpPre:FlickerEffCtrl;
      
      private var _data:RecycleVo;
      
      public function HeroHeadItemView()
      {
         super();
         init();
         this.addEventListener("addedToStage",addToStage);
      }
      
      private function init() : void
      {
      }
      
      protected function addToStage(param1:Event) : void
      {
         this.removeEventListener("addedToStage",addToStage);
         addListeners();
         show();
         this.addEventListener("removedFromStage",removeFromSTage);
      }
      
      protected function removeFromSTage(param1:Event) : void
      {
         this.removeEventListener("removedFromStage",removeFromSTage);
         removeListeners();
         hide();
         this.addEventListener("addedToStage",addToStage);
      }
      
      private function addListeners() : void
      {
         cleanBtn.addEventListener("click",cleanBtnClick);
      }
      
      private function removeListeners() : void
      {
         cleanBtn.removeEventListener("click",cleanBtnClick);
      }
      
      public function cleanBtnClick(param1:MouseEvent) : void
      {
         !!param1?param1.stopPropagation():0;
         addImage.visible = true;
         itemBox.visible = false;
         _data = null;
         ObserverMgr.ins.sendNotice("CLEAN_HERO_MIRROR_SELCET",int(this.name.substr(-1)));
      }
      
      public function show() : void
      {
         addImage.visible = true;
         itemBox.visible = false;
         if(!flickerTxtExpPre)
         {
            flickerTxtExpPre = new FlickerEffCtrl(addImage,1);
         }
         flickerTxtExpPre.resume();
      }
      
      public function hide() : void
      {
         _data = null;
         flickerTxtExpPre.pause();
      }
      
      override public function get wealthVo() : WealthVo
      {
         if(_data)
         {
            return _data.wealthVo;
         }
         return null;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as RecycleVo;
         addImage.visible = false;
         flickerTxtExpPre.pause();
         .super.dataSource = param1;
         itemBox.visible = true;
      }
      
      override protected function validateTooltip() : void
      {
         if(wealthVo && wealthVo.kind != 0)
         {
            this.img_icon.toolTip = WealthUtil.tooltip(wealthVo);
         }
         else
         {
            this.img_icon.toolTip = null;
         }
      }
      
      public function agianResume() : void
      {
         if(_data == null && addImage.visible == true)
         {
            flickerTxtExpPre.pause();
            flickerTxtExpPre.resume();
         }
      }
      
      override public function dispose() : void
      {
         if(this.hasEventListener("addedToStage"))
         {
            this.removeEventListener("addedToStage",addToStage);
         }
         super.dispose();
      }
   }
}
