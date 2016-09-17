package nslm2.modules.foundations.miniTasks.ctrl
{
   import nslm2.modules.foundations.miniTasks.model.TaskModel;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class AutoTrackCtrl
   {
       
      
      public function AutoTrackCtrl()
      {
         super();
      }
      
      public static function startAutoTrak() : void
      {
         var _loc1_:int = 0;
         if(TaskModel.ins.crtTaskVo)
         {
            if(TaskModel.ins.crtTaskVo.targetType == 101)
            {
               _loc1_ = 100;
               ObserverMgr.ins.sendNotice("task_notice_auto_track",_loc1_);
            }
         }
      }
   }
}
