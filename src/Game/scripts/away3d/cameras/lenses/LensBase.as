package away3d.cameras.lenses
{
   import flash.events.EventDispatcher;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import away3d.errors.AbstractMethodError;
   import away3d.events.LensEvent;
   
   public class LensBase extends EventDispatcher
   {
       
      
      protected var _matrix:Matrix3D;
      
      protected var _near:Number = 20;
      
      protected var _far:Number = 12000;
      
      protected var _aspectRatio:Number = 1;
      
      protected var _matrixInvalid:Boolean = true;
      
      protected var _frustumCorners:Vector.<Number>;
      
      private var _unprojection:Matrix3D;
      
      private var _unprojectionInvalid:Boolean = true;
      
      public function LensBase()
      {
         _frustumCorners = new Vector.<Number>(24,true);
         super();
         _matrix = new Matrix3D();
      }
      
      public function get frustumCorners() : Vector.<Number>
      {
         return _frustumCorners;
      }
      
      public function set frustumCorners(param1:Vector.<Number>) : void
      {
         _frustumCorners = param1;
      }
      
      public final function get matrix() : Matrix3D
      {
         if(_matrixInvalid)
         {
            updateMatrix();
            _matrixInvalid = false;
         }
         return _matrix;
      }
      
      public final function set matrix(param1:Matrix3D) : void
      {
         _matrix = param1;
         invalidateMatrix();
      }
      
      public function get near() : Number
      {
         return _near;
      }
      
      public function set near(param1:Number) : void
      {
         if(param1 == _near)
         {
            return;
         }
         _near = param1;
         invalidateMatrix();
      }
      
      public function get far() : Number
      {
         return _far;
      }
      
      public function set far(param1:Number) : void
      {
         if(param1 == _far)
         {
            return;
         }
         _far = param1;
         invalidateMatrix();
      }
      
      public function project(param1:Vector3D) : Vector3D
      {
         var _loc2_:Vector3D = matrix.transformVector(param1);
         _loc2_.x = _loc2_.x / _loc2_.w;
         _loc2_.y = -_loc2_.y / _loc2_.w;
         return _loc2_;
      }
      
      public function get unprojectionMatrix() : Matrix3D
      {
         if(_unprojectionInvalid)
         {
            if(!_unprojection)
            {
               _unprojection = new Matrix3D();
            }
            _unprojection.copyFrom(matrix);
            _unprojection.invert();
            _unprojectionInvalid = false;
         }
         return _unprojection;
      }
      
      public function unproject(param1:Number, param2:Number, param3:Number) : Vector3D
      {
         var _loc4_:Vector3D = new Vector3D(param1,-param2,param3,1);
         _loc4_ = unprojectionMatrix.transformVector(_loc4_);
         var _loc5_:Number = 1 / _loc4_.w;
         _loc4_.x = _loc4_.x * _loc5_;
         _loc4_.y = _loc4_.y * _loc5_;
         _loc4_.z = _loc4_.z * _loc5_;
         _loc4_.w = 1;
         return _loc4_;
      }
      
      public function clone() : LensBase
      {
         throw new AbstractMethodError();
      }
      
      function get aspectRatio() : Number
      {
         return _aspectRatio;
      }
      
      function set aspectRatio(param1:Number) : void
      {
         if(_aspectRatio == param1)
         {
            return;
         }
         _aspectRatio = param1;
         invalidateMatrix();
      }
      
      protected function invalidateMatrix() : void
      {
         _matrixInvalid = true;
         _unprojectionInvalid = true;
         dispatchEvent(new LensEvent("matrixChanged",this));
      }
      
      protected function updateMatrix() : void
      {
         throw new AbstractMethodError();
      }
   }
}
