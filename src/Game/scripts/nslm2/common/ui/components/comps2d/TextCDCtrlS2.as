package nslm2.common.ui.components.comps2d
{
   import com.mz.core.interFace.IDispose;
   import morn.core.components.Label;
   import nslm2.utils.ServerTimer;
   import morn.core.handlers.Handler;
   
   public class TextCDCtrlS2 implements IDispose
   {
       
      
      public var txt:Label;
      
      public var strFormatFunc:Function;
      
      public var deadLine:uint;
      
      public var cplHandler;
      
      public function TextCDCtrlS2(param1:Label, param2:Function, param3:*)
      {
         super();
         this.txt = param1;
         this.strFormatFunc = param2;
         this.cplHandler = param3;
      }
      
      public function start(param1:uint) : void
      {
         deadLine = param1;
         App.timer.doLoop(1000,onLoop);
         onLoop();
      }
      
      private function onLoop() : void
      {
         var _loc1_:int = this.deadLine - ServerTimer.ins.second;
         if(_loc1_ <= 0)
         {
            if(this.cplHandler)
            {
               Handler.execute(this.cplHandler);
            }
            this.stop();
         }
         else
         {
            txt.text = this.strFormatFunc(_loc1_);
         }
      }
      
      public function stop() : void
      {
         App.timer.clearTimer(this.onLoop);
      }
      
      public function dispose() : void
      {
         stop();
      }
   }
}
