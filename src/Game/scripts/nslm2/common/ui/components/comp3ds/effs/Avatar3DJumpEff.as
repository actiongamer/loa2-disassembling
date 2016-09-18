package nslm2.common.ui.components.comp3ds.effs
{
   import nslm2.modules.scenes.commons.Unit3DBase;
   import flash.geom.Point;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import morn.core.handlers.Handler;
   
   public class Avatar3DJumpEff
   {
      
      protected static const JUMP_DOWN_TIME:Number = 0.15;
      
      protected static const JUMP_STAND_TIME:Number = 0.3;
      
      protected static const MAX_JUMP_HEIGHT:Number = 300;
       
      
      public var endHandler;
      
      private var unit3D:Unit3DBase;
      
      private var _jumpPath:Array;
      
      protected var jumpTarget:Point = null;
      
      protected var jumpStart:Point = null;
      
      protected var jumpDuration:Number = 0;
      
      protected var jumpSpeedH:Number = 1.0;
      
      protected var jumpSpeedV:Number = 1.0;
      
      protected var jumpGravity:Number = 1000;
      
      protected var jumpUp:Boolean = true;
      
      protected var jumpTime:Number = 0;
      
      protected var jumpBounce:Boolean = false;
      
      public function Avatar3DJumpEff(param1:Unit3DBase)
      {
         super();
         this.unit3D = param1;
      }
      
      public function setJumpPath(param1:Array) : void
      {
         _jumpPath = param1;
         var _loc2_:Array = _jumpPath.shift();
         jump(new Point(unit3D.x2d,unit3D.y2d),new Point(parseFloat(_loc2_[0]),parseFloat(_loc2_[1])),parseFloat(_loc2_[2]));
      }
      
      public function jump(param1:Point, param2:Point, param3:Number) : void
      {
         jumpTarget = param2;
         jumpStart = param1;
         if(param3 <= 300)
         {
            jumpBounce = true;
            jumpDuration = param3 * 0.001;
            jumpSpeedH = jumpTarget.subtract(jumpStart).length / jumpDuration;
            jumpGravity = 0;
            jumpSpeedV = 0;
            jumpUp = false;
         }
         else
         {
            jumpBounce = false;
            jumpDuration = param3 * 0.001 - 0.3;
            jumpSpeedH = jumpTarget.subtract(jumpStart).length / jumpDuration;
            jumpGravity = 300 * 2 / jumpDuration / jumpDuration;
            jumpSpeedV = jumpGravity * jumpDuration * 0.5;
            jumpUp = true;
         }
         jumpTime = 0;
         TimerManager.ins.doFrameLoop(1,onJumpFrame);
      }
      
      private function onJumpFrame(param1:TimerHandlerVo) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = null;
         jumpTime = jumpTime + param1.overTimeMs * 0.001;
         if(jumpTime >= jumpDuration - 0.15 && jumpUp)
         {
            jumpUp = false;
         }
         var _loc4_:Point = null;
         if(jumpTime >= jumpDuration)
         {
            TimerManager.ins.clearTimer(onJumpFrame);
            if(endHandler)
            {
               _loc2_ = endHandler;
               endHandler = null;
               Handler.execute(_loc2_);
            }
         }
         else
         {
            _loc3_ = jumpTarget.subtract(jumpStart);
            _loc3_.normalize(1);
            _loc3_.x = _loc3_.x * (jumpSpeedH * jumpTime);
            _loc3_.y = _loc3_.y * (jumpSpeedH * jumpTime);
            _loc3_.y = _loc3_.y + (jumpSpeedV * jumpTime - jumpGravity * jumpTime * jumpTime * 0.5);
            _loc4_ = jumpStart.add(_loc3_);
            unit3D.pos2d = new Point(_loc4_.x,_loc4_.y);
         }
         if(!jumpBounce && unit3D)
         {
            unit3D.blurEffect(unit3D.position);
         }
      }
   }
}
