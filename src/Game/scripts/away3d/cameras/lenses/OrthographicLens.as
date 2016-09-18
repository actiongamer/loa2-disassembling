package away3d.cameras.lenses
{
   import away3d.events.LensEvent;
   import away3d.core.math.Matrix3DUtils;
   
   public class OrthographicLens extends LensBase
   {
       
      
      private var _projectionHeight:Number;
      
      private var _xMax:Number;
      
      private var _yMax:Number;
      
      public function OrthographicLens(param1:Number = 500)
      {
         super();
         _projectionHeight = param1;
      }
      
      public function get projectionHeight() : Number
      {
         return _projectionHeight;
      }
      
      public function set projectionHeight(param1:Number) : void
      {
         if(param1 == _projectionHeight)
         {
            return;
         }
         _projectionHeight = param1;
         invalidateMatrix();
         this.dispatchEvent(new LensEvent("projectionHeightChanged",this));
      }
      
      override public function clone() : LensBase
      {
         var _loc1_:OrthographicLens = new OrthographicLens();
         _loc1_._near = _near;
         _loc1_._far = _far;
         _loc1_._aspectRatio = _aspectRatio;
         _loc1_.projectionHeight = _projectionHeight;
         return _loc1_;
      }
      
      override protected function updateMatrix() : void
      {
         var _loc1_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         _yMax = _projectionHeight * 0.5;
         _xMax = _yMax * _aspectRatio;
         _loc1_[0] = 2 / (_projectionHeight * _aspectRatio);
         _loc1_[5] = 2 / _projectionHeight;
         _loc1_[10] = 1 / (_far - _near);
         _loc1_[14] = _near / (_near - _far);
         var _loc2_:* = 0;
         _loc1_[13] = _loc2_;
         _loc2_ = _loc2_;
         _loc1_[12] = _loc2_;
         _loc2_ = _loc2_;
         _loc1_[11] = _loc2_;
         _loc2_ = _loc2_;
         _loc1_[9] = _loc2_;
         _loc2_ = _loc2_;
         _loc1_[8] = _loc2_;
         _loc2_ = _loc2_;
         _loc1_[7] = _loc2_;
         _loc2_ = _loc2_;
         _loc1_[6] = _loc2_;
         _loc2_ = _loc2_;
         _loc1_[4] = _loc2_;
         _loc2_ = _loc2_;
         _loc1_[3] = _loc2_;
         _loc2_ = _loc2_;
         _loc1_[2] = _loc2_;
         _loc1_[1] = _loc2_;
         _loc1_[15] = 1;
         _loc2_ = -_xMax;
         _frustumCorners[21] = _loc2_;
         _loc2_ = _loc2_;
         _frustumCorners[12] = _loc2_;
         _loc2_ = _loc2_;
         _frustumCorners[9] = _loc2_;
         _frustumCorners[0] = _loc2_;
         _loc2_ = _xMax;
         _frustumCorners[18] = _loc2_;
         _loc2_ = _loc2_;
         _frustumCorners[15] = _loc2_;
         _loc2_ = _loc2_;
         _frustumCorners[6] = _loc2_;
         _frustumCorners[3] = _loc2_;
         _loc2_ = -_yMax;
         _frustumCorners[16] = _loc2_;
         _loc2_ = _loc2_;
         _frustumCorners[13] = _loc2_;
         _loc2_ = _loc2_;
         _frustumCorners[4] = _loc2_;
         _frustumCorners[1] = _loc2_;
         _loc2_ = _yMax;
         _frustumCorners[22] = _loc2_;
         _loc2_ = _loc2_;
         _frustumCorners[19] = _loc2_;
         _loc2_ = _loc2_;
         _frustumCorners[10] = _loc2_;
         _frustumCorners[7] = _loc2_;
         _loc2_ = _near;
         _frustumCorners[11] = _loc2_;
         _loc2_ = _loc2_;
         _frustumCorners[8] = _loc2_;
         _loc2_ = _loc2_;
         _frustumCorners[5] = _loc2_;
         _frustumCorners[2] = _loc2_;
         _loc2_ = _far;
         _frustumCorners[23] = _loc2_;
         _loc2_ = _loc2_;
         _frustumCorners[20] = _loc2_;
         _loc2_ = _loc2_;
         _frustumCorners[17] = _loc2_;
         _frustumCorners[14] = _loc2_;
         _matrix.copyRawDataFrom(_loc1_);
         _matrixInvalid = false;
      }
   }
}
