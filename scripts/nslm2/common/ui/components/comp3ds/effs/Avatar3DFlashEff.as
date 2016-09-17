package nslm2.common.ui.components.comp3ds.effs
{
   import nslm2.modules.scenes.commons.Unit3DBase;
   import flash.geom.Point;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import morn.core.handlers.Handler;
   
   public class Avatar3DFlashEff
   {
       
      
      public var endHandler;
      
      private var unit3D:Unit3DBase;
      
      public var duration:Number;
      
      public var overTimeMs:Number;
      
      public var speedX:Number;
      
      public var speedY:Number;
      
      public var from:Point;
      
      public var to:Point;
      
      public function Avatar3DFlashEff(param1:Unit3DBase)
      {
         super();
         this.unit3D = param1;
      }
      
      public function setPath(param1:Array) : void
      {
      }
      
      public function flash(param1:Point, param2:Point, param3:Number) : void
      {
         this.duration = param3;
         this.overTimeMs = 0;
         this.from = param1;
         this.to = param2;
         this.speedX = (to.x - param1.x) / param3;
         this.speedY = (to.y - param1.y) / param3;
         TimerManager.ins.doFrameLoop(1,onFrame);
      }
      
      private function onFrame(param1:TimerHandlerVo) : void
      {
         var _loc2_:* = undefined;
         overTimeMs = overTimeMs + param1.overTimeMs;
         if(overTimeMs >= this.duration)
         {
            TimerManager.ins.clearTimer(onFrame);
            unit3D.pos2d = to.clone();
            if(endHandler)
            {
               _loc2_ = endHandler;
               endHandler = null;
               Handler.execute(_loc2_);
            }
         }
         else
         {
            unit3D.pos2d = new Point(from.x + this.speedX * overTimeMs,from.y + this.speedY * overTimeMs);
            unit3D.blurEffect(unit3D.position);
         }
      }
   }
}
