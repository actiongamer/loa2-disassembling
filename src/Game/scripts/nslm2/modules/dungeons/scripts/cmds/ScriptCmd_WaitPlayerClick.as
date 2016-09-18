package nslm2.modules.dungeons.scripts.cmds
{
   import nslm2.common.ui.components.comps2d.others.ClickToNext;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import morn.core.handlers.Handler;
   
   public class ScriptCmd_WaitPlayerClick extends ScriptCmdBase
   {
       
      
      private var handler;
      
      private var box:ClickToNext;
      
      public function ScriptCmd_WaitPlayerClick()
      {
         super();
      }
      
      public function addHandler(param1:*) : ScriptCmd_WaitPlayerClick
      {
         handler = param1;
         return this;
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         box = new ClickToNext();
         box.addHandler(stage_click);
         box.centerX = 400;
         box.centerY = 300;
         this.module.topLayer2D.addChild(box);
      }
      
      private function stage_click() : void
      {
         if(handler)
         {
            Handler.execute(handler);
            handler = null;
         }
         this.onEnd();
      }
      
      override public function onEnd() : void
      {
         box.dispose();
         box = null;
         super.onEnd();
      }
   }
}
