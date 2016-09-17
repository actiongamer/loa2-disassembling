package nslm2.modules.dungeons.scripts
{
   import nslm2.modules.dungeons.scripts.cmds.ScriptCmdBase;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.dungeons.scripts.configs.ScriptConfigList;
   import nslm2.modules.dungeons.scripts.configs.ScriptConfigVo;
   import com.mz.core.logging.Log;
   
   public class ScriptRunnerQueue
   {
       
      
      public var branch_index:int;
      
      public var isEnd:Boolean;
      
      private var waitArr:Array;
      
      private var running:ScriptCmdBase;
      
      private var addBranchHandler:Function;
      
      private var runHandlerVo:TimerHandlerVo;
      
      public function ScriptRunnerQueue(param1:int, param2:Array, param3:Function)
      {
         super();
         this.addBranchHandler = param3;
         this.branch_index = param1;
         this.waitArr = param2;
      }
      
      public function onStep(param1:TimerHandlerVo) : void
      {
         runHandlerVo = param1;
         if(running)
         {
            running.onStep(param1);
         }
         else
         {
            this.runNext();
         }
      }
      
      private function runNext() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(waitArr.length > 0 && GlobalRef.skipAllScript == false)
         {
            _loc2_ = this.waitArr.shift() as ScriptCmdBase;
            if(_loc2_.vo.disabled == true)
            {
               runNext();
            }
            else
            {
               _loc2_.endHandler = cmdEndHandler;
               this.running = _loc2_;
               _loc1_ = ScriptConfigList.ins.cmdList.getValue(_loc2_.vo.cmd) as ScriptConfigVo;
               _loc2_.vo.script_name = _loc1_.script_name_cn;
               Log.debug(this,"Sciprt分支" + branch_index + "运行" + _loc2_.vo.show_name);
               if(_loc2_.vo.cmd == "branch")
               {
                  this.addBranchHandler(int(_loc2_.vo.url));
                  this.runNext();
               }
               else
               {
                  _loc2_.onStart(runHandlerVo);
               }
            }
         }
         else
         {
            this.isEnd = true;
         }
      }
      
      private function cmdEndHandler() : void
      {
         this.running = null;
         this.runNext();
      }
   }
}
