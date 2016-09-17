package nslm2.modules.dungeons.scripts.cmds
{
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   
   public class ScriptCmd_Delay extends ScriptCmdBase
   {
       
      
      public function ScriptCmd_Delay()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         super.onStart(param1);
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
         super.onStep(param1);
         this.checkEnd();
      }
   }
}
