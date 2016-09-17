package nslm2.common.ui.components.comps2d
{
   import morn.core.components.Label;
   import morn.core.handlers.Handler;
   
   public class TextCDCtrl
   {
       
      
      public var txt:Label;
      
      public var startCD:int;
      
      public var leaveCD:int;
      
      public var strFormatFunc:Function;
      
      public var startTimer:int;
      
      public var cplHandler;
      
      public function TextCDCtrl(param1:Label, param2:Function, param3:*)
      {
         super();
         this.txt = param1;
         this.strFormatFunc = param2;
         this.cplHandler = param3;
      }
      
      public function start(param1:int) : void
      {
         startCD = param1;
         leaveCD = param1;
         startTimer = App.timer.currTimer;
         App.timer.doLoop(300,onLoop);
         onLoop();
      }
      
      private function onLoop() : void
      {
         leaveCD = Math.max(0,Math.ceil(startCD - (App.timer.currTimer - startTimer) / 1000));
         if(leaveCD <= 0)
         {
            this.stop();
            Handler.execute(this.cplHandler);
         }
         else
         {
            txt.text = this.strFormatFunc(leaveCD);
         }
      }
      
      public function stop() : void
      {
         App.timer.clearTimer(this.onLoop);
      }
      
      public function dispose() : void
      {
         txt = null;
         strFormatFunc = null;
         cplHandler = null;
      }
   }
}
