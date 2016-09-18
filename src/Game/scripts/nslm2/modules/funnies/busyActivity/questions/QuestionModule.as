package nslm2.modules.funnies.busyActivity.questions
{
   import game.ui.busyActivity.questions.QuestionViewUI;
   import flash.events.MouseEvent;
   import nslm2.modules.funnies.busyActivity.questions.model.QuestionModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.RTools;
   import nslm2.utils.TimeUtils;
   import proto.QuestionPanelRes;
   import nslm2.modules.funnies.busyActivity.questions.model.QuestionVo;
   import nslm2.modules.funnies.busyActivity.questions.panel.QuestionTextPanel;
   import morn.core.components.View;
   import nslm2.modules.funnies.busyActivity.questions.panel.QuestionNormalPanel;
   import nslm2.modules.foundations.AlertUtil;
   import proto.QuestionSubmitReq;
   import proto.QuestionSubmitRes;
   
   public class QuestionModule extends QuestionViewUI
   {
       
      
      private var questionPages:Array;
      
      private var curPageQuestions:Array;
      
      private var curPageIndex:int;
      
      private var questionPanels:Array;
      
      public function QuestionModule()
      {
         questionPanels = [];
         super();
         btn_update.visible = false;
         btn_close.addEventListener("click",onClose);
      }
      
      protected function onClose(param1:MouseEvent) : void
      {
         QuestionModel.ins.clearAllAnswer();
         ModuleMgr.ins.closeModule(900600);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         ServerEngine.ins.send(10041,null,onGetQuestionCpl);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         txt_title.text = LocaleMgr.ins.getStr(9900600);
         txt_desc.text = RTools.getStrByJSON(QuestionModel.ins.desc);
         txt_time.text = LocaleMgr.ins.getStr(60800013,[TimeUtils.getShortTimeStr(QuestionModel.ins.startTime),TimeUtils.getShortTimeStr(QuestionModel.ins.endTime)]);
         super.preShow(param1);
      }
      
      private function onGetQuestionCpl(param1:QuestionPanelRes) : void
      {
         QuestionModel.ins.isFinish = param1.finish;
         QuestionModel.ins.updateAnswer(param1.an);
         super.moduleServerCpl();
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         questionPages = QuestionModel.ins.getQuestionByPages();
         setPage(0);
         btn_update.addEventListener("click",onUpdate);
         pageBarUI.btn_prev.addEventListener("click",onPrev);
         pageBarUI.btn_next.addEventListener("click",onNext);
      }
      
      protected function onPrev(param1:MouseEvent) : void
      {
         setPage(curPageIndex - 1);
      }
      
      protected function onNext(param1:MouseEvent) : void
      {
         if(showNoSelAlert() == false)
         {
            setPage(curPageIndex + 1);
         }
      }
      
      private function setPage(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(param1 < questionPages.length && param1 >= 0)
         {
            curPageIndex = param1;
            this.box.removeChildren();
            curPageQuestions = questionPages[param1];
            _loc4_ = 0;
            while(_loc4_ < curPageQuestions.length)
            {
               _loc3_ = curPageQuestions[_loc4_] as QuestionVo;
               if(_loc3_.isText())
               {
                  _loc2_ = new QuestionTextPanel();
               }
               else
               {
                  _loc2_ = new QuestionNormalPanel();
               }
               this.box.addChild(_loc2_);
               _loc2_.dataSource = _loc3_;
               _loc2_.y = _loc4_ * 190;
               _loc4_++;
            }
            pageBarUI.btn_prev.disabled = curPageIndex == 0;
            pageBarUI.btn_next.disabled = curPageIndex == questionPages.length - 1;
            pageBarUI.txt_pageNum.text = param1 + 1 + "/" + questionPages.length;
            if(QuestionModel.ins.isFinish == false)
            {
               btn_update.visible = curPageIndex == questionPages.length - 1;
            }
            else
            {
               btn_update.visible = true;
               btn_update.disabled = true;
               btn_update.label = LocaleMgr.ins.getStr(999903009);
            }
         }
      }
      
      protected function onUpdate(param1:MouseEvent) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         _loc5_ = 0;
         while(_loc5_ < questionPages.length)
         {
            _loc3_ = questionPages[_loc5_] as Array;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc2_ = _loc3_[_loc4_] as QuestionVo;
               if(_loc2_.hasSelected() == false)
               {
                  AlertUtil.alert(LocaleMgr.ins.getStr(999903002));
                  return;
               }
               _loc4_++;
            }
            _loc5_++;
         }
         AlertUtil.comfirm(LocaleMgr.ins.getStr(999903005),onUpdateAnswers);
      }
      
      private function onUpdateAnswers() : void
      {
         var _loc1_:QuestionSubmitReq = new QuestionSubmitReq();
         _loc1_.version = QuestionModel.ins.version;
         _loc1_.an = QuestionModel.ins.getAnswer();
         ServerEngine.ins.send(10042,_loc1_,onSubmitClp);
      }
      
      private function onSubmitClp(param1:QuestionSubmitRes) : void
      {
         if(param1.ok)
         {
            QuestionModel.ins.isFinish = true;
            AlertUtil.alert(LocaleMgr.ins.getStr(999903003),onConfirm);
         }
         else
         {
            AlertUtil.alert(LocaleMgr.ins.getStr(999903004));
         }
      }
      
      private function onConfirm() : void
      {
         ModuleMgr.ins.closeModule(900600);
      }
      
      private function showNoSelAlert() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         if(QuestionModel.ins.isFinish)
         {
            return false;
         }
         _loc2_ = 0;
         while(_loc2_ < curPageQuestions.length)
         {
            _loc1_ = curPageQuestions[_loc2_];
            if(_loc1_.hasSelected() == false)
            {
               AlertUtil.alert(LocaleMgr.ins.getStr(999903002));
               return true;
            }
            _loc2_++;
         }
         return false;
      }
   }
}
