package nslm2.modules.funnies.teamGuajiScenes.counter
{
   import morn.core.components.Button;
   import nslm2.utils.ServerTimer;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TeamInviteCounter
   {
       
      
      public var deadLine:uint;
      
      public var cplHandler;
      
      public var strFormatFunc:Function;
      
      public var btn_invite:Button;
      
      public function TeamInviteCounter(param1:Button, param2:Function, param3:*)
      {
         super();
         this.cplHandler = param3;
         this.btn_invite = param1;
         this.strFormatFunc = param2;
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
            Handler.execute(this.cplHandler);
            this.stop();
         }
         else
         {
            this.btn_invite.label = this.strFormatFunc(_loc1_);
         }
      }
      
      public function stop() : void
      {
         this.btn_invite.label = LocaleMgr.ins.getStr(41210078);
         App.timer.clearTimer(this.onLoop);
      }
   }
}
