package nslm2.modules.foundations.dailyTask.view
{
   import game.ui.dailyTaskModules.view.AchiveTaskViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.miniTasks.model.TaskModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.compsEffects.ListRemoveItemTweenEffect;
   import nslm2.modules.foundations.dailyTask.render.DailyTaskListRender;
   import nslm2.modules.foundations.miniTasks.vo.TaskVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.greensock.TweenLite;
   
   public class AchiveTaskView extends AchiveTaskViewUI implements IViewStackPage, IObserver
   {
       
      
      private var model:TaskModel;
      
      private var crtID:int;
      
      private var crtGroupid:int;
      
      public function AchiveTaskView()
      {
         model = TaskModel.ins;
         super();
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
         if(param1)
         {
            new ListRemoveItemTweenEffect(list_task,param2,model.achiveTaskArr).set_duration(0.3).set_Removeduration(0.2).exec();
         }
         else
         {
            list_task.dataSource = model.achiveTaskArr;
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["task_notice_update_task","task_notice_get_reward_success","task_notice_get_reward_effect"];
      }
      
      private function getRewardSueccessHandler(param1:DailyTaskListRender) : void
      {
         crtID = (param1.dataSource as TaskVo).id;
         crtGroupid = (param1.dataSource as TaskVo).groupId;
         FloatUtil.showGetItemsDisplayPanel(param1.list_reward.dataSource as Array);
         TweenLite.delayedCall(0.2,updateTaskList,[true,list_task.selectedIndex]);
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("task_notice_update_task" !== _loc3_)
         {
            if("task_notice_get_reward_success" !== _loc3_)
            {
               if("task_notice_get_reward_effect" !== _loc3_)
               {
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
