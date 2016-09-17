package nslm2.modules.dungeons.scripts.cmds
{
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   
   public class ScriptCmd_End extends ScriptCmdBase
   {
       
      
      public function ScriptCmd_End()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         super.onStart(param1);
         this.onEnd();
      }
   }
}
