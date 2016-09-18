package nslm2.modules.scenes.commons
{
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import flash.geom.Point;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import morn.core.handlers.Handler;
   
   public class TweenMoveCameraCtrl
   {
       
      
      public var cameraBase:Scene45Base;
      
      public var fromPos:Point;
      
      public var toPosition:Point;
      
      public var fromScale:Number;
      
      public var toScale:Number;
      
      private var handler;
      
      private var _progress:Number = 0;
      
      private var isDispose:Boolean = false;
      
      public function TweenMoveCameraCtrl(param1:Scene45Base)
      {
         super();
         this.cameraBase = param1;
      }
      
      public function exec(param1:Point, param2:Number, param3:Number = 0.8, param4:* = null) : void
      {
         handler = param4;
         this.fromPos = this.cameraBase.lookAtPos2d;
         this.fromScale = this.cameraBase.cameraScale;
         this.toPosition = param1;
         this.toScale = param2;
         this.cameraBase.canTweenCamera = true;
         this.progress = 0;
         TweenLite.to(this,param3,{
            "progress":1,
            "ease":Cubic.easeOut,
            "onComplete":tween_cpl
         });
      }
      
      private function tween_cpl() : void
      {
         var _loc1_:* = undefined;
         this.cameraBase.canTweenCamera = true;
         if(handler)
         {
            _loc1_ = handler;
            handler = null;
            Handler.execute(_loc1_);
         }
      }
      
      public function get progress() : Number
      {
         return _progress;
      }
      
      public function set progress(param1:Number) : void
      {
         var _loc3_:Number = fromScale + (toScale - fromScale) * progress;
         _progress = param1;
         var _loc2_:Point = new Point(((toPosition.x - fromPos.x / fromScale) * progress + fromPos.x / fromScale) * _loc3_,((toPosition.y - fromPos.y / fromScale) * progress + fromPos.y / fromScale) * _loc3_);
         this.cameraBase.cameraScale = _loc3_;
         this.cameraBase.setLookAtPos2d(_loc2_,false);
      }
      
      public function dispose() : void
      {
         this.isDispose = true;
         TweenLite.killTweensOf(this);
      }
   }
}
