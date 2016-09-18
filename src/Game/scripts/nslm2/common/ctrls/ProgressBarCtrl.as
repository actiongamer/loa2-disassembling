package nslm2.common.ctrls
{
   import com.mz.core.interFace.IDispose;
   import morn.core.components.Image;
   import morn.core.components.ProgressBar;
   import morn.core.handlers.Handler;
   
   public class ProgressBarCtrl implements IDispose
   {
      
      public static const LIGHT:String = "$light";
      
      public static const SPLIT:String = "$split";
       
      
      private var _barImg:Image;
      
      private var _barMask:Image;
      
      private var _lightMask:Image;
      
      private var _light:Image;
      
      private var _progressBar:ProgressBar;
      
      private var _initValue:Number;
      
      public function ProgressBarCtrl(param1:ProgressBar, param2:Number = 1, param3:Boolean = true, param4:Boolean = false)
      {
         super();
         _progressBar = param1;
         _initValue = _progressBar.value;
         _progressBar.value = 1;
         _progressBar.bar.alpha = 0;
         _progressBar.commitMeasure();
         var _loc5_:uint = getX(param1.value);
         _barMask = new Image(param1.bar.skin);
         _barMask.x = param1.bar.x;
         _barMask.y = param1.bar.y;
         _barMask.anchorX = 1;
         _barMask.width = param1.bar.width;
         _barMask.height = param1.bar.height;
         param1.addChild(_barMask);
         _barImg = new Image(param1.bar.skin);
         _barImg.sizeGrid = _progressBar.sizeGrid;
         _barImg.x = param1.bar.x;
         _barImg.y = param1.bar.y;
         _barImg.visible = _loc5_ > getProgressLeft();
         _barImg.width = param1.bar.width;
         _barImg.height = param1.bar.height;
         param1.addChild(_barImg);
         _barImg.mask = _barMask;
         _light = new Image(param1.skin + "$light");
         _light.cacheAsBitmap = true;
         _light.anchorX = param2;
         _light.anchorY = 0.5;
         _light.x = _loc5_ - _light.width / 2;
         _light.visible = _loc5_ > getProgressLeft();
         _light.y = param1.bar.y + param1.bar.height / 2;
         param1.addChild(_light);
         _lightMask = new Image(param1.bar.skin);
         _lightMask.sizeGrid = param1.sizeGrid;
         _lightMask.x = param1.bar.x;
         _lightMask.y = param1.bar.y;
         _lightMask.width = param1.bar.width;
         _lightMask.height = param1.bar.height;
         _lightMask.cacheAsBitmap = true;
         if(param3)
         {
            _light.mask = _lightMask;
            param1.addChild(_lightMask);
         }
         param1.setChangeHandler(new Handler(changeHandler));
         _progressBar.value = _initValue;
         this._progressBar.commitMeasure();
      }
      
      private function changeHandler(param1:Number) : void
      {
         var _loc2_:uint = getX(param1);
         this._progressBar.commitMeasure();
         if(this._light.bitmapData)
         {
            this._light.x = _loc2_;
            this._barMask.x = _loc2_;
            this._barImg.visible = _loc2_ > getProgressLeft();
            this._light.visible = _loc2_ > getProgressLeft();
         }
      }
      
      public function splitCnt(param1:int) : ProgressBarCtrl
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Array = _progressBar.sizeGrid.split(",");
         var _loc2_:Number = _loc4_[0];
         _loc5_ = 1;
         while(_loc5_ < param1)
         {
            _loc3_ = new Image(_progressBar.skin + "$split");
            _loc3_.anchorY = 0.5;
            _loc3_.anchorX = 0.5;
            _loc3_.x = getX(1 / param1 * _loc5_);
            _loc3_.y = this._progressBar.bar.height / 2;
            _progressBar.addChild(_loc3_);
            _loc5_++;
         }
         return this;
      }
      
      public function get light() : Image
      {
         return _light;
      }
      
      private function getX(param1:Number) : Number
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc6_:Number = NaN;
         if(_progressBar.sizeGrid)
         {
            _loc3_ = _progressBar.sizeGrid.split(",");
            _loc4_ = _loc3_[0];
            _loc5_ = _loc3_[2];
            _loc2_ = _progressBar.width - _loc4_ - _loc5_;
            _loc6_ = _loc2_ * param1;
            return _loc4_ + _loc6_;
         }
         return _progressBar.width * param1;
      }
      
      private function getProgressLeft() : Number
      {
         var _loc1_:* = null;
         if(_progressBar.sizeGrid)
         {
            _loc1_ = _progressBar.sizeGrid.split(",");
            return _loc1_[0];
         }
         return 0;
      }
      
      private function getProgressRight() : Number
      {
         var _loc1_:* = null;
         if(_progressBar.sizeGrid)
         {
            _loc1_ = _progressBar.sizeGrid.split(",");
            return _loc1_[2];
         }
         return 0;
      }
      
      public function dispose() : void
      {
      }
   }
}
