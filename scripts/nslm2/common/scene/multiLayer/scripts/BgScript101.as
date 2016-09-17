package nslm2.common.scene.multiLayer.scripts
{
   import flash.geom.Point;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import com.mz.core.utils.MathUtil;
   
   public class BgScript101 extends BgScriptBase
   {
       
      
      private var speed:int;
      
      private var aim:Point;
      
      private var fireMs:int;
      
      public function BgScript101()
      {
         super();
      }
      
      override public function start() : void
      {
         initPos();
         TimerManager.ins.doLoop(1,onLoop);
      }
      
      private function initPos() : void
      {
         this.bgTarget.x = vo.x.newValue;
         this.bgTarget.y = vo.y.newValue;
         speed = vo.speed.newValue;
         aim = new Point(!!vo.aimX?vo.aimX.newValue:Number(this.bgTarget.x),!!vo.aimY?vo.aimY.newValue:Number(this.bgTarget.y));
      }
      
      private function onLoop(param1:TimerHandlerVo) : void
      {
         var _loc3_:* = null;
         var _loc2_:Point = new Point(this.bgTarget.x,this.bgTarget.y);
         var _loc4_:Number = param1.overTimeMs * speed / 1000;
         var _loc5_:Number = MathUtil.disWith2Point(_loc2_,this.aim);
         if(_loc4_ >= _loc5_)
         {
            this.initPos();
         }
         else
         {
            _loc3_ = MathUtil.nextPoint2(_loc2_,aim,_loc4_);
            this.bgTarget.x = _loc3_.x;
            this.bgTarget.y = _loc3_.y;
         }
      }
      
      override public function dispose() : void
      {
         TimerManager.ins.clearTimer(onLoop);
      }
   }
}
