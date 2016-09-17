package nslm2.common.ui.components.comps2d.others
{
   import game.ui.commons.comps.others.TaskAlertRenderUI;
   import flash.events.Event;
   import nslm2.common.compsEffects.SummaryZoomInAndRotationEffCtrl3;
   
   public class TaskAlertRender extends TaskAlertRenderUI
   {
       
      
      public function TaskAlertRender()
      {
         super();
         this.parts.push(new SummaryZoomInAndRotationEffCtrl3(this,2,4));
         this.addEventListener("change",changeHandler);
      }
      
      protected function changeHandler(param1:Event) : void
      {
         if(txt_content.textHeight > 41)
         {
            img_bg.height = txt_content.textHeight + 62;
         }
         else
         {
            img_bg.height = 169;
         }
      }
      
      override public function dispose() : void
      {
         this.removeEventListener("change",changeHandler);
         super.dispose();
      }
   }
}
