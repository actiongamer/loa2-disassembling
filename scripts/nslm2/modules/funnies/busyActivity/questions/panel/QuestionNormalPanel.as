package nslm2.modules.funnies.busyActivity.questions.panel
{
   import game.ui.busyActivity.questions.panel.QuestionNormalPanelUI;
   import nslm2.modules.funnies.busyActivity.questions.model.QuestionVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.RTools;
   import flash.events.MouseEvent;
   import nslm2.modules.funnies.busyActivity.questions.model.QuestionModel;
   
   public class QuestionNormalPanel extends QuestionNormalPanelUI
   {
       
      
      private var questionVo:QuestionVo;
      
      private var selItems:Vector.<nslm2.modules.funnies.busyActivity.questions.panel.QuestionRender>;
      
      private var lastSelItem:nslm2.modules.funnies.busyActivity.questions.panel.QuestionRender;
      
      public function QuestionNormalPanel()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         .super.dataSource = param1;
         questionVo = param1 as QuestionVo;
         if(questionVo)
         {
            this.txtQuestion.text = LocaleMgr.ins.getStr(999903006,[questionVo.showId]) + RTools.getStrByJSON(questionVo.question);
            this.txtQuestion.textWidth;
            if(txtQuestion.textField.numLines == 2)
            {
               txtQuestion.y = -2;
            }
            else if(txtQuestion.textField.numLines == 3)
            {
               txtQuestion.y = -18;
               txtQuestion.leading = -2;
            }
            selItems = new Vector.<nslm2.modules.funnies.busyActivity.questions.panel.QuestionRender>();
            _loc3_ = 0;
            while(_loc3_ < questionVo.answerLabels.length)
            {
               _loc2_ = new nslm2.modules.funnies.busyActivity.questions.panel.QuestionRender();
               _loc2_.setAnswer(questionVo.isSingleSel(),questionVo.answerLabels[_loc3_]);
               selItems.push(_loc2_);
               _loc2_.y = _loc3_ * 32;
               answerBox.addChild(_loc2_);
               _loc2_.addEventListener("click",onItemSelected);
               _loc2_.setSelected(questionVo.getIsSelected(_loc3_));
               if(questionVo.isSingleSel() && questionVo.getIsSelected(_loc3_))
               {
                  lastSelItem = _loc2_;
               }
               _loc3_++;
            }
         }
      }
      
      protected function onItemSelected(param1:MouseEvent) : void
      {
         var _loc4_:int = 0;
         if(QuestionModel.ins.isFinish)
         {
            return;
         }
         var _loc2_:nslm2.modules.funnies.busyActivity.questions.panel.QuestionRender = param1.currentTarget as nslm2.modules.funnies.busyActivity.questions.panel.QuestionRender;
         if(questionVo.isSingleSel())
         {
            if(lastSelItem && lastSelItem != _loc2_)
            {
               lastSelItem.setSelected(false);
               _loc2_.setSelected(true);
            }
            else
            {
               _loc2_.setSelected(true);
            }
            lastSelItem = _loc2_;
         }
         else
         {
            _loc2_.setSelected(!_loc2_.getSelected());
         }
         var _loc3_:String = "";
         _loc4_ = 0;
         while(_loc4_ < selItems.length)
         {
            if(selItems[_loc4_].getSelected())
            {
               _loc3_ = _loc3_ + "1";
            }
            else
            {
               _loc3_ = _loc3_ + "0";
            }
            _loc4_++;
         }
         questionVo.answer = _loc3_;
      }
   }
}
