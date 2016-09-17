package nslm2.modules.dungeons.scripts.cmds
{
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   
   public class ScriptCmd_Branch extends ScriptCmdBase
   {
       
      
      public function ScriptCmd_Branch()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         this.onEnd();
      }
   }
}
