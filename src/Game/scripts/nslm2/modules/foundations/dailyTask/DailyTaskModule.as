package nslm2.modules.foundations.dailyTask
{
   import game.ui.dailyTaskModules.DailyTaskModuleUI;
   import nslm2.modules.foundations.miniTasks.model.TaskModel;
   import morn.core.components.ViewStack;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.dailyTask.view.DailyTaskView;
   import nslm2.modules.foundations.dailyTask.view.AchiveTaskView;
   import nslm2.modules.foundations.dailyTask.view.ResourceBackView;
   import nslm2.utils.ServerTimer;
   
   public class DailyTaskModule extends DailyTaskModuleUI
   {
       
      
      private var model:TaskModel;
      
      private var subViewStack:ViewStack;
      
      public function DailyTaskModule()
      {
         model = TaskModel.ins;
         super();
         subViewStack = new ViewStack();
         subViewStack.x = 16;
         subViewStack.y = 81;
         addChild(subViewStack);
         subViewStack.subViewClasses = [DailyTaskView,AchiveTaskView];
         tabBar.selectHandler = tabChangeHandler;
      }
      
      private function tabChangeHandler(param1:int) : void
      {
         subViewStack.selectedIndex = param1;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc3_:* = null;
         this.panelBg.titleImgId = 13000;
         updateRedPointStatus();
         var _loc2_:Array = [];
         if(FuncOpenAutoCtrl.checkOpen(13001))
         {
            tabBar.labels = [LocaleMgr.ins.getStr(999000231),LocaleMgr.ins.getStr(999000232)].join(",");
            _loc2_.push(0,13001);
            subViewStack.subViewClasses = [DailyTaskView,AchiveTaskView];
         }
         else
         {
            tabBar.labels = LocaleMgr.ins.getStr(999000232);
            _loc2_.push(0);
            subViewStack.subViewClasses = [AchiveTaskView];
         }
         if(FuncOpenAutoCtrl.checkOpen(13002))
         {
            _loc3_ = tabBar.labels.split(",");
            _loc3_.push(LocaleMgr.ins.getStr(109000001));
            tabBar.labels = _loc3_.join(",");
            _loc2_.push(13002);
            subViewStack.subViewClasses = [DailyTaskView,AchiveTaskView,ResourceBackView];
         }
         FuncOpenAutoCtrl.checkFuncTabNew(_loc2_,tabBar);
         if(param1 is int)
         {
            tabBar.selectedIndex = int(param1);
         }
         else
         {
            subViewStack.selectedIndex = 0;
         }
         TaskModel.ins.checkTimeTask(ServerTimer.ins.second);
         super.preShow();
      }
      
      override public function getFocusNotices() : Array
      {
         return ["task_notice_get_reward_success","task_notice_update_task","TASK_NOTICE_UPDATE_RESOURCE_BACK"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         updateRedPointStatus();
      }
      
      private function updateRedPointStatus() : void
      {
         if(FuncOpenAutoCtrl.checkOpen(13001))
         {
            img_redPoint1.visible = model.hasDailyTaskReward;
            img_redPoint2.visible = model.hasAchiveTaskReward;
            img_redPoint3.visible = model.hasResBackReward && FuncOpenAutoCtrl.checkOpen(13002);
         }
         else
         {
            img_redPoint1.visible = model.hasAchiveTaskReward;
            img_redPoint2.visible = model.hasResBackReward && FuncOpenAutoCtrl.checkOpen(13002);
            img_redPoint3.visible = false;
         }
      }
   }
}
