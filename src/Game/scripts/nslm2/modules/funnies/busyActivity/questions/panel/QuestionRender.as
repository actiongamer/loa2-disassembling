package nslm2.modules.funnies.busyActivity.questions.panel
{
   import game.ui.busyActivity.questions.panel.QuestionRenderUI;
   import nslm2.utils.RTools;
   import flash.events.MouseEvent;
   
   public class QuestionRender extends QuestionRenderUI
   {
       
      
      private var _selected:Boolean = false;
      
      public function QuestionRender()
      {
         super();
      }
      
      public function setAnswer(param1:Boolean, param2:String) : void
      {
         if(param1)
         {
            btn.style = "Radio圆形";
         }
         lContent.text = RTools.getStrByJSON(param2);
         lContent.wordWrap = false;
         this.mouseChildren = false;
         this.addEventListener("rollOver",onRollOver);
         this.addEventListener("rollOut",onRollOut);
         this.buttonMode = true;
      }
      
      protected function onRollOut(param1:MouseEvent) : void
      {
         btn.dispatchEvent(param1);
      }
      
      protected function onRollOver(param1:MouseEvent) : void
      {
         btn.dispatchEvent(param1);
      }
      
      public function setSelected(param1:Boolean) : void
      {
         _selected = param1;
         btn.selected = param1;
      }
      
      public function getSelected() : Boolean
      {
         return _selected;
      }
      
      public function getLineCount() : int
      {
         return 1;
      }
   }
}
