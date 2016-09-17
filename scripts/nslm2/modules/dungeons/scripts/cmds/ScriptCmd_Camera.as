package nslm2.modules.dungeons.scripts.cmds
{
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class ScriptCmd_Camera extends ScriptCmdBase
   {
       
      
      private var dis:int;
      
      private var ori:int;
      
      public function ScriptCmd_Camera()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         super.onStart(param1);
         ori = this.module.cameraX;
         if(this.vo.offX != 0)
         {
            this.vo.x = ori + this.vo.offX;
         }
         if(this.vo.time > 0)
         {
            dis = this.vo.x - this.module.cameraX;
            this.vo.speed = dis / this.vo.time * 1000;
         }
         else if(this.vo.speed > 0)
         {
            dis = this.vo.x - this.module.cameraX;
            this.vo.time = Math.abs(dis / vo.speed) * 1000;
         }
         else
         {
            this.module.cameraX = this.vo.x;
            this.onEnd();
         }
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
         super.onStep(param1);
         var _loc2_:int = ori + this.vo.speed * ((TimerManager.ins.currTimer - this.startTimer) / 1000);
         this.module.cameraX = _loc2_;
         this.checkEndTimer();
      }
      
      override public function onEnd() : void
      {
         this.module.cameraX = this.vo.x;
         super.onEnd();
      }
   }
}
