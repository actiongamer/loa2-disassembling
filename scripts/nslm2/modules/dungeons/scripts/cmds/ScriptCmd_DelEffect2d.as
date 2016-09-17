package nslm2.modules.dungeons.scripts.cmds
{
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   
   public class ScriptCmd_DelEffect2d extends ScriptCmdBase
   {
       
      
      public function ScriptCmd_DelEffect2d()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         super.onStart(param1);
         module.deleteDisplay2D(this.vo.id);
         this.onEnd();
      }
   }
}
