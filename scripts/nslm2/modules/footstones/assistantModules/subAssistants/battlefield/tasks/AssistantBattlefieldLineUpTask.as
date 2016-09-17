package nslm2.modules.footstones.assistantModules.subAssistants.battlefield.tasks
{
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.modules.battles.battlefields.service.BattlefieldService;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBginfoVo;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import nslm2.modules.foundations.miniTasks.vo.TaskVo;
   import nslm2.modules.foundations.miniTasks.service.TaskService;
   import nslm2.mgrs.stcMgrs.vos.StcTaskVo;
   import nslm2.utils.WealthUtil;
   
   public class AssistantBattlefieldLineUpTask extends TaskBase
   {
       
      
      private var _taskId:int;
      
      public function AssistantBattlefieldLineUpTask(param1:Object = null)
      {
         super(param1);
      }
      
      override public function exec() : void
      {
         super.exec();
         switchEventListeners(true);
         BattlefieldService.ins.getBattlefieldInfo();
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldTimeOut",onTimeOut);
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldEnterScene",onTaskCpl);
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldInfoCpl",onGetBgInfoCpl);
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldGetTaskInfoCpl",onTaskInfoCpl);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldTimeOut",onTimeOut);
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldEnterScene",onTaskCpl);
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldInfoCpl",onGetBgInfoCpl);
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldGetTaskInfoCpl",onTaskInfoCpl);
         }
      }
      
      private function onGetBgInfoCpl(param1:MzEvent) : void
      {
         BattlefieldMsgs.ins.removeEventListener("msgBattlefieldInfoCpl",onGetBgInfoCpl);
         BattlefieldService.ins.getBattlefieldTodayRewardInfo();
      }
      
      private function doLineUp() : void
      {
         var _loc1_:* = null;
         if(BattlefieldUtil.canEnter())
         {
            if(BattlefieldModel.ins.curTeamId != null)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(60200031));
               this.onComplete();
            }
            else
            {
               start();
               _loc1_ = StcMgr.ins.getBginfoVo(BattlefieldModel.ins.curBattlefieldId);
               if(_loc1_)
               {
                  AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200038,[LocaleMgr.ins.getStr(_loc1_.bg_name)]),50500);
               }
               AssistantModel.ins.showDoingAlert(LocaleMgr.ins.getStr(60200029));
            }
         }
         else
         {
            AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200039),50500);
            this.onComplete();
         }
      }
      
      private function start() : void
      {
         if(BattlefieldModel.ins.startStamp != 0)
         {
            BattlefieldUtil.showEnterConfirm();
         }
         else
         {
            autoApply();
         }
      }
      
      private function autoApply() : void
      {
         if(BattlefieldModel.ins.regStamp == 0)
         {
            BattlefieldService.ins.applySingle();
         }
      }
      
      private function onTimeOut(param1:MzEvent) : void
      {
         AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200040),50500);
         autoApply();
      }
      
      private function onTaskCpl(param1:MzEvent) : void
      {
         this.onComplete();
      }
      
      override public function stop() : void
      {
         AssistantModel.ins.hideDoingAlert();
         super.stop();
      }
      
      private function onTaskInfoCpl(param1:MzEvent) : void
      {
         BattlefieldMsgs.ins.removeEventListener("msgBattlefieldGetTaskInfoCpl",onTaskInfoCpl);
         if(BattlefieldUtil.canEnter())
         {
            getReward();
         }
         else
         {
            doLineUp();
         }
      }
      
      private function getReward() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = BattlefieldModel.ins.taskDic.array;
         for each(var _loc1_ in BattlefieldModel.ins.taskDic.array)
         {
            if(_loc1_.status == 2)
            {
               _taskId = _loc1_.id;
               TaskService.ins.taskFinish(_loc1_.id,onServerCpl_task);
               return;
            }
         }
         this.doLineUp();
      }
      
      private function onServerCpl_task() : void
      {
         var _loc2_:StcTaskVo = StcMgr.ins.getTaskVo(_taskId);
         var _loc1_:TaskVo = new TaskVo();
         _loc1_.id = _taskId;
         BattlefieldModel.ins.updateTaskStatus(_taskId,3);
         BattlefieldUtil.checkHasTodayReward();
         AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200046,[LocaleMgr.ins.getStr(_loc2_.name),WealthUtil.wealthVoArrToString(_loc1_.rewardArr)]),50500);
         getReward();
      }
   }
}
