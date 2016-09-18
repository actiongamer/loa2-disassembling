package away3d.cameras.lenses
{
   import away3d.core.math.Matrix3DUtils;
   
   public class PerspectiveLens extends LensBase
   {
       
      
      private var _fieldOfView:Number;
      
      private var _focalLengthInv:Number;
      
      private var _yMax:Number;
      
      private var _xMax:Number;
      
      public function PerspectiveLens(param1:Number = 60)
      {
         super();
         this.fieldOfView = param1;
      }
      
      public function get fieldOfView() : Number
      {
         return _fieldOfView;
      }
      
      public function set fieldOfView(param1:Number) : void
      {
         if(param1 == _fieldOfView)
         {
            return;
         }
         _fieldOfView = param1;
         _focalLengthInv = Math.tan(_fieldOfView * 3.14159265358979 / 360);
         invalidateMatrix();
      }
      
      override public function clone() : LensBase
      {
         var _loc1_:PerspectiveLens = new PerspectiveLens(_fieldOfView);
         _loc1_._near = _near;
         _loc1_._far = _far;
         _loc1_._aspectRatio = _aspectRatio;
         return _loc1_;
      }
      
      override protected function updateMatrix() : void
      {
         var _loc1_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         _yMax = _near * _focalLengthInv;
         _xMax = _yMax * _aspectRatio;
         _loc1_[0] = _near / _xMax;
         _loc1_[5] = _near / _yMax;
         _loc1_[10] = _far / (_far - _near);
         _loc1_[11] = 1;
         var _loc4_:* = 0;
         _loc1_[15] = _loc4_;
         _loc4_ = _loc4_;
         _loc1_[13] = _loc4_;
         _loc4_ = _loc4_;
         _loc1_[12] = _loc4_;
         _loc4_ = _loc4_;
         _loc1_[9] = _loc4_;
         _loc4_ = _loc4_;
         _loc1_[8] = _loc4_;
         _loc4_ = _loc4_;
         _loc1_[7] = _loc4_;
         _loc4_ = _loc4_;
         _loc1_[6] = _loc4_;
         _loc4_ = _loc4_;
         _loc1_[4] = _loc4_;
         _loc4_ = _loc4_;
         _loc1_[3] = _loc4_;
         _loc4_ = _loc4_;
         _loc1_[2] = _loc4_;
         _loc1_[1] = _loc4_;
         _loc1_[14] = -_near * _loc1_[10];
         _matrix.copyRawDataFrom(_loc1_);
         var _loc2_:Number = _far * _focalLengthInv;
         var _loc3_:Number = _loc2_ * _aspectRatio;
         _loc4_ = -_xMax;
         _frustumCorners[9] = _loc4_;
         _frustumCorners[0] = _loc4_;
         _loc4_ = _xMax;
         _frustumCorners[6] = _loc4_;
         _frustumCorners[3] = _loc4_;
         _loc4_ = -_yMax;
         _frustumCorners[4] = _loc4_;
         _frustumCorners[1] = _loc4_;
         _loc4_ = _yMax;
         _frustumCorners[10] = _loc4_;
         _frustumCorners[7] = _loc4_;
         _loc4_ = -_loc3_;
         _frustumCorners[21] = _loc4_;
         _frustumCorners[12] = _loc4_;
         _loc4_ = _loc3_;
         _frustumCorners[18] = _loc4_;
         _frustumCorners[15] = _loc4_;
         _loc4_ = -_loc2_;
         _frustumCorners[16] = _loc4_;
         _frustumCorners[13] = _loc4_;
         _loc4_ = _loc2_;
         _frustumCorners[22] = _loc4_;
         _frustumCorners[19] = _loc4_;
         _loc4_ = _near;
         _frustumCorners[11] = _loc4_;
         _loc4_ = _loc4_;
         _frustumCorners[8] = _loc4_;
         _loc4_ = _loc4_;
         _frustumCorners[5] = _loc4_;
         _frustumCorners[2] = _loc4_;
         _loc4_ = _far;
         _frustumCorners[23] = _loc4_;
         _loc4_ = _loc4_;
         _frustumCorners[20] = _loc4_;
         _loc4_ = _loc4_;
         _frustumCorners[17] = _loc4_;
         _frustumCorners[14] = _loc4_;
         _matrixInvalid = false;
      }
   }
}
