package nslm2.modules.foundations.fourteenDays.view
{
   import game.ui.sevenDayModule.view.SevDaysEnhTskViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.fourteenDays.model.FourteenDaysModel;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.LabelUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.common.compsEffects.ListRemoveItemTweenEffect;
   import nslm2.modules.foundations.sevenDays.view.SevenDaysTaskRender;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.greensock.TweenLite;
   
   public class FourteenDaysEnhTaskView extends SevDaysEnhTskViewUI implements IViewStackPage, IObserver
   {
       
      
      private var model:FourteenDaysModel;
      
      private var textCdCtrl:TextCDCtrlS2;
      
      private var textCdCtrl2:TextCDCtrlS2;
      
      private var crtID:int;
      
      private var crtGroupid:int;
      
      public function FourteenDaysEnhTaskView()
      {
         model = FourteenDaysModel.ins;
         super();
         textCdCtrl = new TextCDCtrlS2(this.end_time,textCDFormat,txtCDCtrl_cpl);
         textCdCtrl2 = new TextCDCtrlS2(this.reward_end_time,textCDFormat2,txtCDCtrl_cpl2);
         textCdCtrl.start(model.endTime);
         textCdCtrl2.start(model.rewardEndTime);
         this.event_period.text = LocaleMgr.ins.getStr(13100501,[TimeUtils.getShortTimeStr(model.startTime),TimeUtils.getShortTimeStr(model.endTime)]);
      }
      
      private function txtCDCtrl_cpl() : void
      {
         this.end_time.text = LocaleMgr.ins.getStr(999000360);
      }
      
      private function txtCDCtrl_cpl2() : void
      {
         this.reward_end_time.text = LocaleMgr.ins.getStr(999000360);
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(13100502) + TextFieldUtil.htmlText2(TimeUtils.hisCNWithDay(param1),LabelUtils.cdColor(true));
      }
      
      private function textCDFormat2(param1:int) : String
      {
         return LocaleMgr.ins.getStr(13100503) + TextFieldUtil.htmlText2(TimeUtils.hisCNWithDay(param1),LabelUtils.cdColor(true));
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.fadeIn();
         ObserverMgr.ins.regObserver(this);
         updateTaskList();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         ObserverMgr.ins.unregObserver(this);
      }
      
      private function updateTaskList(param1:Boolean = false, param2:int = 0) : void
      {
         if(model.currentDay > 6 && model.currentDay < 14)
         {
            this.img_titleBG.skin = UrlLib.fourteenDayTask(1,2,model.currentDay + 1);
            titleTxt.text = LocaleMgr.ins.getStr(999902200 + model.currentDay + 1);
         }
         if(param1)
         {
            model.enhanceTaskArray[param2].status = 3;
            new ListRemoveItemTweenEffect(this.list_task,param2,model.enhanceTaskArray.sortOn(["status","id"])).set_duration(0.3).set_Removeduration(0.2).exec();
            if(model.enhanceTaskArray.sortOn(["status","id"])[param2].status != 1)
            {
               model.hasTask2Reward = false;
            }
            ObserverMgr.ins.sendNotice("sevenday_notice_update_red_point");
         }
         else
         {
            list_task.dataSource = model.enhanceTaskArray.sortOn(["status","id"]);
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["sevenday_notice_update_task","sevenday_notice_get_reward_success","sevenday_notice_get_reward_effect"];
      }
      
      private function getRewardSueccessHandler(param1:SevenDaysTaskRender) : void
      {
         FloatUtil.showGetItemsDisplayPanel(param1.list_reward.array);
         TweenLite.delayedCall(0.2,updateTaskList,[true,list_task.selectedIndex]);
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("sevenday_notice_update_task" !== _loc3_)
         {
            if("sevenday_notice_get_reward_success" !== _loc3_)
            {
               if("sevenday_notice_get_reward_effect" === _loc3_)
               {
                  this.list_task.mouseEvent = false;
                  TweenLite.delayedCall(1.5,resetEnable);
               }
            }
            else
            {
               getRewardSueccessHandler(param2);
            }
         }
         else
         {
            updateTaskList();
         }
      }
      
      private function resetEnable() : void
      {
         this.list_task.mouseEvent = true;
      }
   }
}
