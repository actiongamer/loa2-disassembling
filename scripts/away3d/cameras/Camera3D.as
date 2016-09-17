package away3d.cameras
{
   import away3d.entities.Entity;
   import flash.geom.Matrix3D;
   import away3d.cameras.lenses.LensBase;
   import away3d.core.math.Plane3D;
   import away3d.events.LensEvent;
   import away3d.core.math.Matrix3DUtils;
   import away3d.core.partition.EntityNode;
   import away3d.core.partition.CameraNode;
   import flash.geom.Vector3D;
   import away3d.cameras.lenses.PerspectiveLens;
   
   public class Camera3D extends Entity
   {
       
      
      private var _viewProjection:Matrix3D;
      
      private var _viewProjectionDirty:Boolean = true;
      
      private var _lens:LensBase;
      
      private var _frustumPlanes:Vector.<Plane3D>;
      
      private var _frustumPlanesDirty:Boolean = true;
      
      public function Camera3D(param1:LensBase = null)
      {
         var _loc2_:int = 0;
         _viewProjection = new Matrix3D();
         super();
         _lens = param1 || new PerspectiveLens();
         _lens.addEventListener("matrixChanged",onLensMatrixChanged);
         _frustumPlanes = new Vector.<Plane3D>(6,true);
         _loc2_ = 0;
         while(_loc2_ < 6)
         {
            _frustumPlanes[_loc2_] = new Plane3D();
            _loc2_++;
         }
         z = -1000;
      }
      
      private function onLensMatrixChanged(param1:LensEvent) : void
      {
         _viewProjectionDirty = true;
         _frustumPlanesDirty = true;
         dispatchEvent(param1);
      }
      
      public function get frustumPlanes() : Vector.<Plane3D>
      {
         var _loc15_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc10_:* = null;
         var _loc1_:* = undefined;
         if(_frustumPlanesDirty)
         {
            _loc1_ = Matrix3DUtils.RAW_DATA_CONTAINER;
            viewProjection.copyRawDataTo(_loc1_);
            _loc13_ = _loc1_[0];
            _loc15_ = _loc1_[4];
            _loc14_ = _loc1_[8];
            _loc17_ = _loc1_[12];
            _loc12_ = _loc1_[1];
            _loc11_ = _loc1_[5];
            _loc18_ = _loc1_[9];
            _loc16_ = _loc1_[13];
            _loc8_ = _loc1_[2];
            _loc3_ = _loc1_[6];
            _loc4_ = _loc1_[10];
            _loc9_ = _loc1_[14];
            _loc2_ = _loc1_[3];
            _loc5_ = _loc1_[7];
            _loc6_ = _loc1_[11];
            _loc7_ = _loc1_[15];
            _loc10_ = _frustumPlanes[0];
            _loc10_.a = _loc2_ + _loc13_;
            _loc10_.b = _loc5_ + _loc15_;
            _loc10_.c = _loc6_ + _loc14_;
            _loc10_.d = _loc7_ + _loc17_;
            _loc10_ = _frustumPlanes[1];
            _loc10_.a = _loc2_ - _loc13_;
            _loc10_.b = _loc5_ - _loc15_;
            _loc10_.c = _loc6_ - _loc14_;
            _loc10_.d = _loc7_ - _loc17_;
            _loc10_ = _frustumPlanes[2];
            _loc10_.a = _loc2_ + _loc12_;
            _loc10_.b = _loc5_ + _loc11_;
            _loc10_.c = _loc6_ + _loc18_;
            _loc10_.d = _loc7_ + _loc16_;
            _loc10_ = _frustumPlanes[3];
            _loc10_.a = _loc2_ - _loc12_;
            _loc10_.b = _loc5_ - _loc11_;
            _loc10_.c = _loc6_ - _loc18_;
            _loc10_.d = _loc7_ - _loc16_;
            _loc10_ = _frustumPlanes[4];
            _loc10_.a = _loc8_;
            _loc10_.b = _loc3_;
            _loc10_.c = _loc4_;
            _loc10_.d = _loc9_;
            _loc10_ = _frustumPlanes[5];
            _loc10_.a = _loc2_ - _loc8_;
            _loc10_.b = _loc5_ - _loc3_;
            _loc10_.c = _loc6_ - _loc4_;
            _loc10_.d = _loc7_ - _loc9_;
            _frustumPlanesDirty = false;
         }
         return _frustumPlanes;
      }
      
      override protected function invalidateSceneTransform() : void
      {
         super.invalidateSceneTransform();
         _viewProjectionDirty = true;
         _frustumPlanesDirty = true;
      }
      
      override protected function updateBounds() : void
      {
         _bounds.nullify();
         _boundsInvalid = false;
      }
      
      override protected function createEntityPartitionNode() : EntityNode
      {
         return new CameraNode(this);
      }
      
      public final function get lens() : LensBase
      {
         return _lens;
      }
      
      public function set lens(param1:LensBase) : void
      {
         if(_lens == param1)
         {
            return;
         }
         if(!param1)
         {
            throw new Error("Lens cannot be null!");
         }
         _lens.removeEventListener("matrixChanged",onLensMatrixChanged);
         _lens = param1;
         _lens.addEventListener("matrixChanged",onLensMatrixChanged);
         dispatchEvent(new LensEvent("matrixChanged",param1));
      }
      
      public final function get viewProjection() : Matrix3D
      {
         if(_viewProjectionDirty)
         {
            _viewProjection.copyFrom(inverseSceneTransform);
            _viewProjection.append(_lens.matrix);
            _viewProjectionDirty = false;
         }
         return _viewProjection;
      }
      
      public function unproject(param1:Number, param2:Number, param3:Number = 0) : Vector3D
      {
         return sceneTransform.transformVector(lens.unproject(param1,param2,param3));
      }
      
      public function getRay(param1:Number, param2:Number, param3:Number = 0) : Vector3D
      {
         return sceneTransform.deltaTransformVector(lens.unproject(param1,param2,param3));
      }
      
      public function project(param1:Vector3D) : Vector3D
      {
         return lens.project(inverseSceneTransform.transformVector(param1));
      }
   }
}
