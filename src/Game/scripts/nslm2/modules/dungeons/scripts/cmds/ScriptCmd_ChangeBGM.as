package nslm2.modules.dungeons.scripts.cmds
{
   import nslm2.modules.fightPlayer.UnitView;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   
   public class ScriptCmd_ChangeBGM extends ScriptCmdBase
   {
       
      
      private var unit:UnitView;
      
      public function ScriptCmd_ChangeBGM()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         this.onEnd();
      }
   }
}
