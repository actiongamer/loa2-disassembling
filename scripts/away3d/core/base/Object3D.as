package away3d.core.base
{
   import away3d.library.assets.NamedAssetBase;
   import away3d.controllers.ControllerBase;
   import away3d.events.Object3DEvent;
   import flash.geom.Vector3D;
   import flash.geom.Matrix3D;
   import §away3d:arcane§.invalidateTransform;
   import away3d.core.math.Matrix3DUtils;
   
   public class Object3D extends NamedAssetBase
   {
       
      
      var _controller:ControllerBase;
      
      private var _smallestNumber:Number = 1.0E-22;
      
      private var _transformDirty:Boolean = true;
      
      private var _positionDirty:Boolean;
      
      private var _rotationDirty:Boolean;
      
      private var _scaleDirty:Boolean;
      
      private var _positionChanged:Object3DEvent;
      
      private var _rotationChanged:Object3DEvent;
      
      private var _scaleChanged:Object3DEvent;
      
      private var _rotationX:Number = 0;
      
      private var _rotationY:Number = 0;
      
      private var _rotationZ:Number = 0;
      
      private var _eulers:Vector3D;
      
      private var _flipY:Matrix3D;
      
      private var _listenToPositionChanged:Boolean;
      
      private var _listenToRotationChanged:Boolean;
      
      private var _listenToScaleChanged:Boolean;
      
      protected var _transform:Matrix3D;
      
      protected var _scaleX:Number = 1;
      
      protected var _scaleY:Number = 1;
      
      protected var _scaleZ:Number = 1;
      
      protected var _x:Number = 0;
      
      protected var _y:Number = 0;
      
      protected var _z:Number = 0;
      
      protected var _pivotPoint:Vector3D;
      
      protected var _pivotZero:Boolean = true;
      
      protected var _pos:Vector3D;
      
      protected var _rot:Vector3D;
      
      protected var _sca:Vector3D;
      
      protected var _transformComponents:Vector.<Vector3D>;
      
      public var extra:Object;
      
      public function Object3D()
      {
         _eulers = new Vector3D();
         _flipY = new Matrix3D();
         _transform = new Matrix3D();
         _pivotPoint = new Vector3D();
         _pos = new Vector3D();
         _rot = new Vector3D();
         _sca = new Vector3D();
         super();
         _transformComponents = new Vector.<Vector3D>(3,true);
         _transformComponents[0] = _pos;
         _transformComponents[1] = _rot;
         _transformComponents[2] = _sca;
         _transform.identity();
         _flipY.appendScale(1,-1,1);
      }
      
      private function invalidatePivot() : void
      {
         _pivotZero = _pivotPoint.x == 0 && _pivotPoint.y == 0 && _pivotPoint.z == 0;
         invalidateTransform();
      }
      
      private function invalidatePosition() : void
      {
         if(_positionDirty)
         {
            return;
         }
         _positionDirty = true;
         invalidateTransform();
         if(_listenToPositionChanged)
         {
            notifyPositionChanged();
         }
      }
      
      private function notifyPositionChanged() : void
      {
         if(!_positionChanged)
         {
            _positionChanged = new Object3DEvent("positionChanged",this);
         }
         dispatchEvent(_positionChanged);
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         var _loc6_:* = param1;
         if("positionChanged" !== _loc6_)
         {
            if("rotationChanged" !== _loc6_)
            {
               if("scaleChanged" === _loc6_)
               {
                  _listenToScaleChanged = true;
               }
            }
            else
            {
               _listenToRotationChanged = true;
            }
         }
         else
         {
            _listenToPositionChanged = true;
         }
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         if(hasEventListener(param1))
         {
            return;
         }
         var _loc4_:* = param1;
         if("positionChanged" !== _loc4_)
         {
            if("rotationChanged" !== _loc4_)
            {
               if("scaleChanged" === _loc4_)
               {
                  _listenToScaleChanged = false;
               }
            }
            else
            {
               _listenToRotationChanged = false;
            }
         }
         else
         {
            _listenToPositionChanged = false;
         }
      }
      
      private function invalidateRotation() : void
      {
         if(_rotationDirty)
         {
            return;
         }
         _rotationDirty = true;
         invalidateTransform();
         if(_listenToRotationChanged)
         {
            notifyRotationChanged();
         }
      }
      
      private function notifyRotationChanged() : void
      {
         if(!_rotationChanged)
         {
            _rotationChanged = new Object3DEvent("rotationChanged",this);
         }
         dispatchEvent(_rotationChanged);
      }
      
      protected function invalidateScale() : void
      {
         if(_scaleDirty)
         {
            return;
         }
         _scaleDirty = true;
         invalidateTransform();
         if(_listenToScaleChanged)
         {
            notifyScaleChanged();
         }
      }
      
      private function notifyScaleChanged() : void
      {
         if(!_scaleChanged)
         {
            _scaleChanged = new Object3DEvent("scaleChanged",this);
         }
         dispatchEvent(_scaleChanged);
      }
      
      public function get x() : Number
      {
         return _x;
      }
      
      public function set x(param1:Number) : void
      {
         if(_x == param1)
         {
            return;
         }
         _x = param1;
         invalidatePosition();
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set y(param1:Number) : void
      {
         if(_y == param1)
         {
            return;
         }
         _y = param1;
         invalidatePosition();
      }
      
      public function get z() : Number
      {
         return _z;
      }
      
      public function set z(param1:Number) : void
      {
         if(_z == param1)
         {
            return;
         }
         _z = param1;
         invalidatePosition();
      }
      
      public function get rotationX() : Number
      {
         return _rotationX * 57.2957795130823;
      }
      
      public function set rotationX(param1:Number) : void
      {
         if(rotationX == param1)
         {
            return;
         }
         _rotationX = param1 * 0.0174532925199433;
         invalidateRotation();
      }
      
      public function get rotationY() : Number
      {
         return _rotationY * 57.2957795130823;
      }
      
      public function set rotationY(param1:Number) : void
      {
         if(rotationY == param1)
         {
            return;
         }
         _rotationY = param1 * 0.0174532925199433;
         invalidateRotation();
      }
      
      public function get rotationZ() : Number
      {
         return _rotationZ * 57.2957795130823;
      }
      
      public function set rotationZ(param1:Number) : void
      {
         if(rotationZ == param1)
         {
            return;
         }
         _rotationZ = param1 * 0.0174532925199433;
         invalidateRotation();
      }
      
      public function get scaleAll() : Number
      {
         return _scaleX;
      }
      
      public function set scaleAll(param1:Number) : void
      {
         _scaleX = param1;
         _scaleY = param1;
         _scaleZ = param1;
         invalidateScale();
      }
      
      public function get scaleX() : Number
      {
         return _scaleX;
      }
      
      public function set scaleX(param1:Number) : void
      {
         if(_scaleX == param1)
         {
            return;
         }
         _scaleX = param1;
         invalidateScale();
      }
      
      public function get scaleY() : Number
      {
         return _scaleY;
      }
      
      public function set scaleY(param1:Number) : void
      {
         if(_scaleY == param1)
         {
            return;
         }
         _scaleY = param1;
         invalidateScale();
      }
      
      public function get scaleZ() : Number
      {
         return _scaleZ;
      }
      
      public function set scaleZ(param1:Number) : void
      {
         if(_scaleZ == param1)
         {
            return;
         }
         _scaleZ = param1;
         invalidateScale();
      }
      
      public function get eulers() : Vector3D
      {
         _eulers.x = _rotationX * 57.2957795130823;
         _eulers.y = _rotationY * 57.2957795130823;
         _eulers.z = _rotationZ * 57.2957795130823;
         return _eulers;
      }
      
      public function set eulers(param1:Vector3D) : void
      {
         _rotationX = param1.x * 0.0174532925199433;
         _rotationY = param1.y * 0.0174532925199433;
         _rotationZ = param1.z * 0.0174532925199433;
         invalidateRotation();
      }
      
      public function get transform() : Matrix3D
      {
         if(_transformDirty)
         {
            updateTransform();
         }
         return _transform;
      }
      
      public function set transform(param1:Matrix3D) : void
      {
         var _loc4_:* = null;
         var _loc2_:Vector.<Number> = Matrix3DUtils.RAW_DATA_CONTAINER;
         param1.copyRawDataTo(_loc2_);
         if(!_loc2_[0])
         {
            _loc2_[0] = _smallestNumber;
            param1.copyRawDataFrom(_loc2_);
         }
         var _loc3_:Vector.<Vector3D> = Matrix3DUtils.decompose(param1);
         _loc4_ = _loc3_[0];
         if(_x != _loc4_.x || _y != _loc4_.y || _z != _loc4_.z)
         {
            _x = _loc4_.x;
            _y = _loc4_.y;
            _z = _loc4_.z;
            invalidatePosition();
         }
         _loc4_ = _loc3_[1];
         if(_rotationX != _loc4_.x || _rotationY != _loc4_.y || _rotationZ != _loc4_.z)
         {
            _rotationX = _loc4_.x;
            _rotationY = _loc4_.y;
            _rotationZ = _loc4_.z;
            invalidateRotation();
         }
         _loc4_ = _loc3_[2];
         if(_scaleX != _loc4_.x || _scaleY != _loc4_.y || _scaleZ != _loc4_.z)
         {
            _scaleX = _loc4_.x;
            _scaleY = _loc4_.y;
            _scaleZ = _loc4_.z;
            invalidateScale();
         }
      }
      
      public function get pivotPoint() : Vector3D
      {
         return _pivotPoint;
      }
      
      public function set pivotPoint(param1:Vector3D) : void
      {
         _pivotPoint = param1.clone();
         invalidatePivot();
      }
      
      public function get position() : Vector3D
      {
         transform.copyColumnTo(3,_pos);
         return _pos.clone();
      }
      
      public function set position(param1:Vector3D) : void
      {
         _x = param1.x;
         _y = param1.y;
         _z = param1.z;
         invalidatePosition();
      }
      
      public function get forwardVector() : Vector3D
      {
         return Matrix3DUtils.getForward(transform);
      }
      
      public function get rightVector() : Vector3D
      {
         return Matrix3DUtils.getRight(transform);
      }
      
      public function get upVector() : Vector3D
      {
         return Matrix3DUtils.getUp(transform);
      }
      
      public function get backVector() : Vector3D
      {
         var _loc1_:Vector3D = Matrix3DUtils.getForward(transform);
         _loc1_.negate();
         return _loc1_;
      }
      
      public function get leftVector() : Vector3D
      {
         var _loc1_:Vector3D = Matrix3DUtils.getRight(transform);
         _loc1_.negate();
         return _loc1_;
      }
      
      public function get downVector() : Vector3D
      {
         var _loc1_:Vector3D = Matrix3DUtils.getUp(transform);
         _loc1_.negate();
         return _loc1_;
      }
      
      public function scale(param1:Number) : void
      {
         _scaleX = _scaleX * param1;
         _scaleY = _scaleY * param1;
         _scaleZ = _scaleZ * param1;
         invalidateScale();
      }
      
      public function moveForward(param1:Number) : void
      {
         translateLocal(Vector3D.Z_AXIS,param1);
      }
      
      public function moveBackward(param1:Number) : void
      {
         translateLocal(Vector3D.Z_AXIS,-param1);
      }
      
      public function moveLeft(param1:Number) : void
      {
         translateLocal(Vector3D.X_AXIS,-param1);
      }
      
      public function moveRight(param1:Number) : void
      {
         translateLocal(Vector3D.X_AXIS,param1);
      }
      
      public function moveUp(param1:Number) : void
      {
         translateLocal(Vector3D.Y_AXIS,param1);
      }
      
      public function moveDown(param1:Number) : void
      {
         translateLocal(Vector3D.Y_AXIS,-param1);
      }
      
      public function moveTo(param1:Number, param2:Number, param3:Number) : void
      {
         if(_x == param1 && _y == param2 && _z == param3)
         {
            return;
         }
         _x = param1;
         _y = param2;
         _z = param3;
         invalidatePosition();
      }
      
      public function movePivot(param1:Number, param2:Number, param3:Number) : void
      {
         if(!_pivotPoint)
         {
            _pivotPoint = new Vector3D();
         }
         _pivotPoint.x = _pivotPoint.x + param1;
         _pivotPoint.y = _pivotPoint.y + param2;
         _pivotPoint.z = _pivotPoint.z + param3;
         invalidatePivot();
      }
      
      public function translate(param1:Vector3D, param2:Number) : void
      {
         var _loc6_:Number = param1.x;
         var _loc5_:Number = param1.y;
         var _loc4_:Number = param1.z;
         var _loc3_:Number = param2 / Math.sqrt(_loc6_ * _loc6_ + _loc5_ * _loc5_ + _loc4_ * _loc4_);
         _x = _x + _loc6_ * _loc3_;
         _y = _y + _loc5_ * _loc3_;
         _z = _z + _loc4_ * _loc3_;
         invalidatePosition();
      }
      
      public function translateLocal(param1:Vector3D, param2:Number) : void
      {
         var _loc6_:Number = param1.x;
         var _loc5_:Number = param1.y;
         var _loc4_:Number = param1.z;
         var _loc3_:Number = param2 / Math.sqrt(_loc6_ * _loc6_ + _loc5_ * _loc5_ + _loc4_ * _loc4_);
         transform.prependTranslation(_loc6_ * _loc3_,_loc5_ * _loc3_,_loc4_ * _loc3_);
         _transform.copyColumnTo(3,_pos);
         _x = _pos.x;
         _y = _pos.y;
         _z = _pos.z;
         invalidatePosition();
      }
      
      public function pitch(param1:Number) : void
      {
         rotate(Vector3D.X_AXIS,param1);
      }
      
      public function yaw(param1:Number) : void
      {
         rotate(Vector3D.Y_AXIS,param1);
      }
      
      public function roll(param1:Number) : void
      {
         rotate(Vector3D.Z_AXIS,param1);
      }
      
      public function clone(param1:Boolean = true) : Object3D
      {
         var _loc2_:Object3D = new Object3D();
         _loc2_.pivotPoint = pivotPoint;
         _loc2_.transform = transform;
         _loc2_.name = name;
         return _loc2_;
      }
      
      public function rotateTo(param1:Number, param2:Number, param3:Number) : void
      {
         _rotationX = param1 * 0.0174532925199433;
         _rotationY = param2 * 0.0174532925199433;
         _rotationZ = param3 * 0.0174532925199433;
         invalidateRotation();
      }
      
      public function rotate(param1:Vector3D, param2:Number) : void
      {
         transform.prependRotation(param2,param1);
         transform = transform;
      }
      
      public function lookAt(param1:Vector3D, param2:Vector3D = null) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = undefined;
         if(!param2)
         {
            param2 = Vector3D.Y_AXIS;
         }
         _loc5_ = param1.subtract(position);
         _loc5_.normalize();
         _loc6_ = param2.crossProduct(_loc5_);
         _loc6_.normalize();
         if(_loc6_.length < 0.05)
         {
            _loc6_ = param2.crossProduct(Vector3D.Z_AXIS);
         }
         _loc4_ = _loc5_.crossProduct(_loc6_);
         _loc3_ = Matrix3DUtils.RAW_DATA_CONTAINER;
         _loc3_[0] = _scaleX * _loc6_.x;
         _loc3_[1] = _scaleX * _loc6_.y;
         _loc3_[2] = _scaleX * _loc6_.z;
         _loc3_[3] = 0;
         _loc3_[4] = _scaleY * _loc4_.x;
         _loc3_[5] = _scaleY * _loc4_.y;
         _loc3_[6] = _scaleY * _loc4_.z;
         _loc3_[7] = 0;
         _loc3_[8] = _scaleZ * _loc5_.x;
         _loc3_[9] = _scaleZ * _loc5_.y;
         _loc3_[10] = _scaleZ * _loc5_.z;
         _loc3_[11] = 0;
         _loc3_[12] = _x;
         _loc3_[13] = _y;
         _loc3_[14] = _z;
         _loc3_[15] = 1;
         _transform.copyRawDataFrom(_loc3_);
         transform = transform;
         if(_loc5_.z < 0)
         {
            rotationY = 180 - rotationY;
            rotationX = rotationX - 180;
            rotationZ = rotationZ - 180;
         }
      }
      
      public function dispose() : void
      {
      }
      
      public function disposeAsset() : void
      {
         dispose();
      }
      
      function invalidateTransform() : void
      {
         _transformDirty = true;
      }
      
      protected function updateTransform() : void
      {
         _pos.x = _x;
         _pos.y = _y;
         _pos.z = _z;
         _rot.x = _rotationX;
         _rot.y = _rotationY;
         _rot.z = _rotationZ;
         _sca.x = _scaleX;
         _sca.y = _scaleY;
         _sca.z = _scaleZ;
         _transform.recompose(_transformComponents);
         if(!_pivotZero)
         {
            _transform.prependTranslation(-_pivotPoint.x,-_pivotPoint.y,-_pivotPoint.z);
            _transform.appendTranslation(_pivotPoint.x,_pivotPoint.y,_pivotPoint.z);
         }
         _transformDirty = false;
         _positionDirty = false;
         _rotationDirty = false;
         _scaleDirty = false;
      }
   }
}
