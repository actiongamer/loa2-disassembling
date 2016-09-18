package nslm2.common.compsEffects
{
   import com.mz.core.interFace.IDispose;
   import flash.geom.Point;
   import morn.core.components.Image;
   import com.greensock.easing.Linear;
   import com.greensock.TweenLite;
   import morn.core.handlers.Handler;
   
   public class ImgMoveEffect implements IDispose
   {
       
      
      private var _cplHandler;
      
      private var _startPoint:Point;
      
      private var _endPoint:Point;
      
      private var _isPlaying:Boolean;
      
      private var _moveImage:Image;
      
      private var _isBezier:Boolean;
      
      private var autoDispose:Boolean;
      
      public var duration:Number = 0.5;
      
      public var toScale:Number = NaN;
      
      public function ImgMoveEffect()
      {
         _moveImage = new Image();
         super();
      }
      
      public function config(param1:Number = 0.5, param2:Number = NaN) : ImgMoveEffect
      {
         duration = param1;
         toScale = param2;
         return this;
      }
      
      public function init(param1:Image, param2:Point = null, param3:Point = null, param4:* = null, param5:Boolean = false, param6:Boolean = false) : void
      {
         this.autoDispose = param6;
         if(_isPlaying == true)
         {
            return;
         }
         this._moveImage.remove();
         if(param2 != null)
         {
            this._startPoint = param2;
         }
         else
         {
            this._startPoint = param1.localToGlobal(new Point());
         }
         if(param3 != null)
         {
            this._endPoint = param3;
         }
         else
         {
            this._endPoint = param1.localToGlobal(new Point());
         }
         this._endPoint = param3;
         this._cplHandler = param4;
         this._isBezier = param5;
         this._moveImage.bitmapData = param1.bitmapData;
         this._moveImage.x = _startPoint.x;
         this._moveImage.y = _startPoint.y;
         this._moveImage.width = param1.width;
         this._moveImage.height = param1.height;
         this._moveImage.visible = false;
         param1.stage.addChild(_moveImage);
      }
      
      public function startAnim(param1:Boolean = true) : void
      {
         var _loc2_:* = null;
         if(this._isPlaying == true)
         {
            return;
         }
         this._moveImage.visible = param1;
         if(_isBezier == true)
         {
            _loc2_ = {
               "bezierThrough":[{
                  "x":_startPoint.x + offset(),
                  "y":_startPoint.y + offset()
               },{
                  "x":_endPoint.x,
                  "y":_endPoint.y
               }],
               "orientToBezier":false,
               "ease":Linear.easeOut,
               "onComplete":tweenCpl
            };
         }
         else
         {
            _loc2_ = {
               "x":_endPoint.x,
               "y":_endPoint.y,
               "onComplete":tweenCpl
            };
         }
         if(isNaN(this.toScale) == false)
         {
            _loc2_.scaleX = this.toScale;
            _loc2_.scaleY = this.toScale;
         }
         TweenLite.to(this._moveImage,duration,_loc2_);
         this._isPlaying = true;
      }
      
      private function offset() : Number
      {
         return Math.random() > 0.5?Math.random() * 100:Number(-Math.random() * 100);
      }
      
      private function tweenCpl() : void
      {
         if(this._cplHandler)
         {
            Handler.execute(this._cplHandler);
         }
         this._moveImage.x = _startPoint.x;
         this._moveImage.y = _startPoint.y;
         this._moveImage.visible = false;
         this._isPlaying = false;
         if(autoDispose)
         {
            this.dispose();
         }
      }
      
      public function dispose() : void
      {
         this._moveImage.dispose();
      }
   }
}
