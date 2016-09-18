package nslm2.modules.foundations.auctionShop.ctr
{
   import com.mz.core.interFace.IDispose;
   import morn.core.components.Button;
   import nslm2.common.ui.components.comps2d.TextCDCtrl;
   
   public class BtnCountDownCtr implements IDispose
   {
       
      
      public var btn:Button;
      
      public var countDownCtr:TextCDCtrl;
      
      private var rawLabel:String;
      
      private var cd:int;
      
      public var startCD:int;
      
      public var leaveCD:int;
      
      public var strFormatFunc:Function;
      
      public var startTimer:int;
      
      public var cplHandler;
      
      public function BtnCountDownCtr()
      {
         super();
      }
      
      public function init(param1:Button, param2:int) : void
      {
         btn = param1;
         rawLabel = param1.label;
         cd = param2;
      }
      
      public function start() : void
      {
         btn.disabled = true;
         startCD = cd;
         leaveCD = cd;
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
            btn.label = rawLabel;
         }
         else
         {
            btn.label = rawLabel + " " + leaveCD + "s";
         }
      }
      
      public function stop() : void
      {
         App.timer.clearTimer(this.onLoop);
         btn.disabled = false;
      }
      
      public function dispose() : void
      {
         if(countDownCtr)
         {
            countDownCtr.stop();
            countDownCtr = null;
         }
         stop();
         btn = null;
      }
   }
}
