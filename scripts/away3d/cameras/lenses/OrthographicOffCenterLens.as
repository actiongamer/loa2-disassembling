package away3d.cameras.lenses
{
   import away3d.core.math.Matrix3DUtils;
   
   public class OrthographicOffCenterLens extends LensBase
   {
       
      
      private var _minX:Number;
      
      private var _maxX:Number;
      
      private var _minY:Number;
      
      private var _maxY:Number;
      
      public function OrthographicOffCenterLens(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         _minX = param1;
         _maxX = param2;
         _minY = param3;
         _maxY = param4;
      }
      
      public function get minX() : Number
      {
         return _minX;
      }
      
      public function set minX(param1:Number) : void
      {
         _minX = param1;
         invalidateMatrix();
      }
      
      public function get maxX() : Number
      {
         return _maxX;
      }
      
      public function set maxX(param1:Number) : void
      {
         _maxX = param1;
         invalidateMatrix();
      }
      
      public function get minY() : Number
      {
         return _minY;
      }
      
      public function set minY(param1:Number) : void
      {
         _minY = param1;
         invalidateMatrix();
      }
      
      public function get maxY() : Number
      {
         return _maxY;
      }
      
      public function set maxY(param1:Number) : void
      {
         _maxY = param1;
         invalidateMatrix();
      }
      
      override public function clone() : LensBase
      {
         var _loc1_:OrthographicOffCenterLens = new OrthographicOffCenterLens(_minX,_maxX,_minY,_maxY);
         _loc1_._near = _near;
         _loc1_._far = _far;
         _loc1_._aspectRatio = _aspectRatio;
         return _loc1_;
      }
      
      override protected function updateMatrix() : void
      {
         var _loc2_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         var _loc1_:Number = 1 / (_maxX - _minX);
         var _loc4_:Number = 1 / (_maxY - _minY);
         var _loc3_:Number = 1 / (_far - _near);
         _loc2_[0] = 2 * _loc1_;
         _loc2_[5] = 2 * _loc4_;
         _loc2_[10] = 1 * _loc3_;
         _loc2_[12] = -(_maxX + _minX) * _loc1_;
         _loc2_[13] = -(_maxY + _minY) * _loc4_;
         _loc2_[14] = -_near * _loc3_;
         _loc2_[15] = 1;
         var _loc5_:* = 0;
         _loc2_[11] = _loc5_;
         _loc5_ = _loc5_;
         _loc2_[9] = _loc5_;
         _loc5_ = _loc5_;
         _loc2_[8] = _loc5_;
         _loc5_ = _loc5_;
         _loc2_[7] = _loc5_;
         _loc5_ = _loc5_;
         _loc2_[6] = _loc5_;
         _loc5_ = _loc5_;
         _loc2_[4] = _loc5_;
         _loc5_ = _loc5_;
         _loc2_[3] = _loc5_;
         _loc5_ = _loc5_;
         _loc2_[2] = _loc5_;
         _loc2_[1] = _loc5_;
         _matrix.copyRawDataFrom(_loc2_);
         _loc5_ = _minX;
         _frustumCorners[21] = _loc5_;
         _loc5_ = _loc5_;
         _frustumCorners[12] = _loc5_;
         _loc5_ = _loc5_;
         _frustumCorners[9] = _loc5_;
         _frustumCorners[0] = _loc5_;
         _loc5_ = _maxX;
         _frustumCorners[18] = _loc5_;
         _loc5_ = _loc5_;
         _frustumCorners[15] = _loc5_;
         _loc5_ = _loc5_;
         _frustumCorners[6] = _loc5_;
         _frustumCorners[3] = _loc5_;
         _loc5_ = _minY;
         _frustumCorners[16] = _loc5_;
         _loc5_ = _loc5_;
         _frustumCorners[13] = _loc5_;
         _loc5_ = _loc5_;
         _frustumCorners[4] = _loc5_;
         _frustumCorners[1] = _loc5_;
         _loc5_ = _maxY;
         _frustumCorners[22] = _loc5_;
         _loc5_ = _loc5_;
         _frustumCorners[19] = _loc5_;
         _loc5_ = _loc5_;
         _frustumCorners[10] = _loc5_;
         _frustumCorners[7] = _loc5_;
         _loc5_ = _near;
         _frustumCorners[11] = _loc5_;
         _loc5_ = _loc5_;
         _frustumCorners[8] = _loc5_;
         _loc5_ = _loc5_;
         _frustumCorners[5] = _loc5_;
         _frustumCorners[2] = _loc5_;
         _loc5_ = _far;
         _frustumCorners[23] = _loc5_;
         _loc5_ = _loc5_;
         _frustumCorners[20] = _loc5_;
         _loc5_ = _loc5_;
         _frustumCorners[17] = _loc5_;
         _frustumCorners[14] = _loc5_;
         _matrixInvalid = false;
      }
   }
}
