package nslm2.modules.dungeons.scripts
{
   import com.mz.core.utils2.task.TaskBase;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import com.mz.core.logging.Log;
   import nslm2.modules.dungeons.scripts.cmds.ScriptCmd_WaitPlayerClick;
   import nslm2.modules.dungeons.scripts.comps.DramaSayListS3;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.gmModules.PlayerLogUtil;
   
   public class ScriptRunner extends TaskBase
   {
       
      
      private var module:nslm2.modules.dungeons.scripts.IScriptBox;
      
      private var jsonArr:Array;
      
      private var queueArr:Vector.<nslm2.modules.dungeons.scripts.ScriptRunnerQueue>;
      
      private var waitPlayerClick:Boolean;
      
      private var runHandlerVo:TimerHandlerVo;
      
      public function ScriptRunner(param1:nslm2.modules.dungeons.scripts.IScriptBox, param2:Array, param3:Boolean = false)
      {
         super();
         module = param1;
         jsonArr = param2;
         waitPlayerClick = param3;
      }
      
      override public function exec() : void
      {
         super.exec();
         queueArr = new Vector.<nslm2.modules.dungeons.scripts.ScriptRunnerQueue>();
         addBranch(0);
         App.timer.doFrameLoop(1,onLoop,true,0);
      }
      
      public function addBranch(param1:int) : void
      {
         queueArr.push(new nslm2.modules.dungeons.scripts.ScriptRunnerQueue(param1,ScriptUtil.jsonToCmd(jsonArr[param1],this.module),this.addBranch));
      }
      
      private function onLoop(param1:TimerHandlerVo) : void
      {
         runHandlerVo = param1;
         queueArr.forEach(queueArr_onStep);
         this.checkQueueEnd();
         this.checkAllEnd();
      }
      
      private function queueArr_onStep(param1:nslm2.modules.dungeons.scripts.ScriptRunnerQueue, ... rest) : void
      {
         param1.onStep(this.runHandlerVo);
      }
      
      private function checkQueueEnd() : void
      {
         this.queueArr = this.queueArr.filter(checkQueueEnd_filter);
      }
      
      private function checkQueueEnd_filter(param1:nslm2.modules.dungeons.scripts.ScriptRunnerQueue, ... rest) : Boolean
      {
         if(param1.isEnd)
         {
            return false;
         }
         return true;
      }
      
      private function checkAllEnd() : void
      {
         var _loc1_:* = null;
         if(this.queueArr.length == 0)
         {
            if(waitPlayerClick)
            {
               App.timer.clearTimer(this.onLoop);
               Log.debug(this,"Script全部运行完成 等待玩家点击");
               _loc1_ = new ScriptCmd_WaitPlayerClick();
               _loc1_.addHandler(endAll);
               _loc1_.module = this.module;
               _loc1_.onStart(null);
            }
            else
            {
               endAll();
            }
         }
      }
      
      private function endAll() : void
      {
         Log.debug(this,"Script全部运行完成");
         if(DramaSayListS3.ins)
         {
            DramaSayListS3.ins.dispose();
            DramaSayListS3.ins = null;
         }
         if(ClientConfig.firstBattle == 1)
         {
            PlayerLogUtil.ins.saveNext();
         }
         this.onComplete();
         dispose();
      }
      
      override public function dispose() : void
      {
         this.jsonArr = null;
         this.queueArr = null;
         App.timer.clearTimer(this.onLoop);
      }
   }
}
