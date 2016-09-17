package morn.customs.components
{
   import com.mz.core.utils.DisplayUtils;
   import flash.events.MouseEvent;
   
   public class PanelViewBase extends FadeView
   {
       
      
      private var _panelBg:morn.customs.components.PanelBg;
      
      public function PanelViewBase()
      {
         super();
      }
      
      override protected function initialize() : void
      {
         this._panelBg = DisplayUtils.findChildrenMatchingClass(this,morn.customs.components.PanelBg);
         super.initialize();
      }
      
      public function get panelBg() : morn.customs.components.PanelBg
      {
         return _panelBg;
      }
      
      public function btnCloseHandler(param1:MouseEvent = null) : void
      {
      }
   }
}
