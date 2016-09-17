package nslm2.modules.funnies.busyActivity.questions.panel
{
   import game.ui.busyActivity.questions.panel.QuestionTextPanelUI;
   import nslm2.modules.funnies.busyActivity.questions.model.QuestionVo;
   import nslm2.utils.RTools;
   import nslm2.modules.funnies.busyActivity.questions.model.QuestionModel;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.Event;
   
   public class QuestionTextPanel extends QuestionTextPanelUI
   {
       
      
      private var questionVo:QuestionVo;
      
      public function QuestionTextPanel()
      {
         super();
         this.txtContent.maxChars = RTools.cl(600,300);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         questionVo = param1 as QuestionVo;
         if(questionVo)
         {
            this.txtQuestion.text = RTools.getStrByJSON(questionVo.question);
            if(QuestionModel.ins.isFinish == false)
            {
               this.txtContent.addEventListener("change",onContentChange);
               UIMgr.stage.focus = txtContent.textField;
            }
            else
            {
               this.txtContent.editable = false;
            }
            this.txtContent.text = questionVo.answer;
         }
         updateTextCount();
      }
      
      protected function onContentChange(param1:Event) : void
      {
         questionVo.answer = this.txtContent.text;
         updateTextCount();
      }
      
      private function updateTextCount() : void
      {
         this.txt_txtCount.text = this.txtContent.text.length + "/" + this.txtContent.maxChars;
         this.txt_txtCount.color = this.txtContent.text.length >= this.txtContent.maxChars?16723968:14210735;
      }
   }
}
