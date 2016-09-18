package nslm2.modules.dungeons.scripts.cmds
{
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   
   public class ScriptCmd_Unknown extends ScriptCmdBase
   {
       
      
      public function ScriptCmd_Unknown()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         this.onEnd();
      }
   }
}
