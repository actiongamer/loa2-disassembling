package nslm2.modules.dungeons.scripts.cmds
{
   import nslm2.modules.fightPlayer.UnitView;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import com.greensock.TweenLite;
   import flash.geom.Point;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class ScriptCmd_JumpTo extends ScriptCmdBase
   {
      
      protected static const JUMP_DOWN_TIME:Number = 0.15;
      
      protected static const JUMP_STAND_TIME:Number = 0.3;
      
      protected static const MAX_JUMP_HEIGHT:Number = 300;
       
      
      public var unit:UnitView;
      
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
      
      public function ScriptCmd_JumpTo()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         super.onStart(param1);
         unit = findUnit(this.vo.id);
         unit.y = vo.y;
         TweenLite.delayedCall(vo.fade / 1000,this.delayJump);
      }
      
      private function delayJump() : void
      {
         jump(new Point(unit.x,unit.y3d),new Point(vo.x,0),800);
      }
      
      public function setJumpPath(param1:Array) : void
      {
         _jumpPath = param1;
         var _loc2_:Array = _jumpPath.shift();
         jump(new Point(unit.x,unit.y3d),new Point(parseFloat(_loc2_[0]),parseFloat(_loc2_[1])),parseFloat(_loc2_[2]));
      }
      
      private function jump(param1:Point, param2:Point, param3:Number) : void
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
         var _loc2_:* = null;
         jumpTime = jumpTime + param1.overTimeMs * 0.001;
         if(jumpTime >= jumpDuration - 0.15 && jumpUp)
         {
            jumpUp = false;
         }
         var _loc3_:Point = null;
         if(jumpTime >= jumpDuration)
         {
            TimerManager.ins.clearTimer(onJumpFrame);
            this.onEnd();
         }
         else
         {
            _loc2_ = jumpTarget.subtract(jumpStart);
            _loc2_.normalize(1);
            _loc2_.x = _loc2_.x * (jumpSpeedH * jumpTime);
            _loc2_.y = _loc2_.y * (jumpSpeedH * jumpTime);
            _loc2_.y = _loc2_.y + (jumpSpeedV * jumpTime - jumpGravity * jumpTime * jumpTime * 0.5);
            _loc3_ = jumpStart.add(_loc2_);
            unit.x = _loc3_.x;
            unit.y3d = _loc3_.y;
         }
         if(!jumpBounce && unit)
         {
            unit.blurEffect(unit.avatarBox.position);
         }
      }
      
      override public function onEnd() : void
      {
         TweenLite.killDelayedCallsTo(this.delayJump);
         unit = null;
         super.onEnd();
      }
   }
}
