package nslm2.modules.dungeons.scripts.cmds
{
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   
   public class ScriptCmd_DeleteUnit extends ScriptCmdBase
   {
       
      
      public function ScriptCmd_DeleteUnit()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         super.onStart(param1);
         module.deleteUnit(this.vo.id);
         this.onEnd();
      }
   }
}
