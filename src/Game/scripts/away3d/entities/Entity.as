package away3d.entities
{
   import away3d.containers.ObjectContainer3D;
   import away3d.core.partition.EntityNode;
   import away3d.core.pick.PickingCollisionVO;
   import away3d.core.pick.IPickingCollider;
   import flash.geom.Matrix3D;
   import away3d.bounds.BoundingVolumeBase;
   import §away3d:arcane§._staticNode;
   import §away3d:arcane§._pickingCollisionVO;
   import away3d.core.partition.Partition3D;
   import §away3d:arcane§.implicitPartition;
   import away3d.containers.Scene3D;
   import §away3d:arcane§._pickingCollider;
   import away3d.cameras.Camera3D;
   import away3d.core.math.Matrix3DUtils;
   import flash.geom.Vector3D;
   import away3d.errors.AbstractMethodError;
   import away3d.bounds.AxisAlignedBoundingBox;
   import §away3d:arcane§._controller;
   
   public class Entity extends ObjectContainer3D
   {
      
      public static const MOUSE_PRIORITY_1:int = 1;
      
      public static const MOUSE_PRIORITY_2:int = 2;
      
      public static const MOUSE_PRIORITY_3:int = 3;
      
      public static const MOUSE_PRIORITY_4:int = 4;
      
      public static const MOUSE_PRIORITY_5:int = 5;
      
      public static var DECAL_LAYER:uint = 5;
      
      public static var SCENELIGHT_LAYER:uint = 4;
      
      public static var EFFECT_LAYER:uint = 3;
      
      public static var TOP_LAYER:uint = 2;
      
      public static var MAP_TILE_LAYER:uint = 1;
      
      public static var ALL_LAYER:uint = 0;
       
      
      public var mousePriority:int = 3;
      
      private var _showBounds:Boolean;
      
      private var _partitionNode:EntityNode;
      
      private var _boundsIsShown:Boolean = false;
      
      private var _shaderPickingDetails:Boolean;
      
      var _pickingCollisionVO:PickingCollisionVO;
      
      var _pickingCollider:IPickingCollider = null;
      
      var _staticNode:Boolean;
      
      protected var _mvpTransformStack:Vector.<Matrix3D>;
      
      protected var _zIndices:Vector.<Number>;
      
      protected var _mvpIndex:int = -1;
      
      protected var _stackLen:uint;
      
      protected var _bounds:BoundingVolumeBase;
      
      protected var _boundsInvalid:Boolean = true;
      
      private var _renderLayer:uint;
      
      private var EntityNumber:int;
      
      private var _forceRenderWithoutFrustum:Boolean = false;
      
      protected var _ignoreCameraRotation:Boolean = false;
      
      public function Entity()
      {
         _mvpTransformStack = new Vector.<Matrix3D>();
         _zIndices = new Vector.<Number>();
         _renderLayer = ALL_LAYER;
         EntityNumber = Number(EntityNumber) + 1;
         super();
         _bounds = getDefaultBoundingVolume();
      }
      
      public function get forceRenderWithoutFrustum() : Boolean
      {
         return _forceRenderWithoutFrustum;
      }
      
      public function set forceRenderWithoutFrustum(param1:Boolean) : void
      {
         _forceRenderWithoutFrustum = param1;
      }
      
      public final function set renderLayer(param1:uint) : void
      {
         _renderLayer = param1;
      }
      
      public final function get renderLayer() : uint
      {
         return _renderLayer;
      }
      
      override public function set ignoreTransform(param1:Boolean) : void
      {
         if(_scene)
         {
            _scene.invalidateEntityBounds(this);
         }
         .super.ignoreTransform = param1;
      }
      
      public function get shaderPickingDetails() : Boolean
      {
         return _shaderPickingDetails;
      }
      
      public function set shaderPickingDetails(param1:Boolean) : void
      {
         _shaderPickingDetails = param1;
      }
      
      public function get staticNode() : Boolean
      {
         return _staticNode;
      }
      
      public function set staticNode(param1:Boolean) : void
      {
         _staticNode = param1;
      }
      
      public function get pickingCollisionVO() : PickingCollisionVO
      {
         if(!_pickingCollisionVO)
         {
            _pickingCollisionVO = new PickingCollisionVO(this);
         }
         return _pickingCollisionVO;
      }
      
      function collidesBefore(param1:Number, param2:Boolean) : Boolean
      {
         return true;
      }
      
      public function get showBounds() : Boolean
      {
         return _showBounds;
      }
      
      public function set showBounds(param1:Boolean) : void
      {
         if(param1 == _showBounds)
         {
            return;
         }
         _showBounds = param1;
         if(_showBounds)
         {
            addBounds();
         }
         else
         {
            removeBounds();
         }
      }
      
      override public function get minX() : Number
      {
         if(_boundsInvalid)
         {
            updateBounds();
         }
         return _bounds.min.x;
      }
      
      override public function get minY() : Number
      {
         if(_boundsInvalid)
         {
            updateBounds();
         }
         return _bounds.min.y;
      }
      
      override public function get minZ() : Number
      {
         if(_boundsInvalid)
         {
            updateBounds();
         }
         return _bounds.min.z;
      }
      
      override public function get maxX() : Number
      {
         if(_boundsInvalid)
         {
            updateBounds();
         }
         return _bounds.max.x;
      }
      
      override public function get maxY() : Number
      {
         if(_boundsInvalid)
         {
            updateBounds();
         }
         return _bounds.max.y;
      }
      
      override public function get maxZ() : Number
      {
         if(_boundsInvalid)
         {
            updateBounds();
         }
         return _bounds.max.z;
      }
      
      public function get bounds() : BoundingVolumeBase
      {
         if(_boundsInvalid)
         {
            updateBounds();
         }
         return _bounds;
      }
      
      public function set bounds(param1:BoundingVolumeBase) : void
      {
         removeBounds();
         _bounds = param1;
         _boundsInvalid = true;
         if(_showBounds && _bounds)
         {
            addBounds();
         }
         if(_bounds)
         {
            this.showBounds = false;
         }
      }
      
      override function set implicitPartition(param1:Partition3D) : void
      {
         if(param1 == _implicitPartition)
         {
            return;
         }
         if(_implicitPartition)
         {
            notifyPartitionUnassigned();
         }
         .super.implicitPartition = param1;
         notifyPartitionAssigned();
      }
      
      override public function set scene(param1:Scene3D) : void
      {
         if(param1 == _scene)
         {
            return;
         }
         if(_scene)
         {
            _scene.unregisterEntity(this);
         }
         if(param1)
         {
            param1.registerEntity(this);
         }
         .super.scene = param1;
      }
      
      override public function get assetType() : String
      {
         return "entity";
      }
      
      public function get modelViewProjection() : Matrix3D
      {
         return _mvpTransformStack[uint((uint(_mvpIndex > 0)) * _mvpIndex)];
      }
      
      public function get zIndex() : Number
      {
         return _zIndices[_mvpIndex];
      }
      
      public function get pickingCollider() : IPickingCollider
      {
         return _pickingCollider;
      }
      
      public function set pickingCollider(param1:IPickingCollider) : void
      {
         _pickingCollider = param1;
      }
      
      public function get ignoreCameraRotation() : Boolean
      {
         return _ignoreCameraRotation;
      }
      
      public function set ignoreCameraRotation(param1:Boolean) : void
      {
         if(_ignoreCameraRotation != param1)
         {
            _ignoreCameraRotation = param1;
            invalidateSceneTransform();
         }
      }
      
      public function pushModelViewProjection(param1:Camera3D, param2:Boolean = true) : void
      {
         var _loc5_:* = null;
         var _loc4_:* = undefined;
         var _loc3_:* = null;
         _mvpIndex = _mvpIndex + 1;
         if(_ignoreTransform)
         {
            var _loc6_:* = param1.viewProjection;
            _mvpTransformStack[_mvpIndex] = _loc6_;
            _loc5_ = _loc6_;
         }
         else
         {
            if(_mvpIndex == _stackLen)
            {
               _mvpTransformStack[_mvpIndex] = new Matrix3D();
               _stackLen = _stackLen + 1;
            }
            if(_ignoreCameraRotation == true)
            {
               _loc5_ = _mvpTransformStack[_mvpIndex];
               _loc5_.copyFrom(sceneTransform);
               _loc5_.append(param1.inverseSceneTransform);
               _loc4_ = Matrix3DUtils.decompose(_loc5_);
               _loc3_ = _loc4_[1];
               _loc6_ = 0;
               _loc3_.z = _loc6_;
               _loc6_ = _loc6_;
               _loc3_.y = _loc6_;
               _loc3_.x = _loc6_;
               _loc5_.recompose(_loc4_);
               _loc5_.append(param1.lens.matrix);
            }
            else
            {
               _loc5_ = _mvpTransformStack[_mvpIndex];
               _loc5_.copyFrom(sceneTransform);
               _loc5_.append(param1.viewProjection);
            }
         }
         if(param2)
         {
            _loc5_.copyColumnTo(3,_pos);
            _zIndices[_mvpIndex] = -_pos.z;
         }
      }
      
      public final function getModelViewProjectionUnsafe() : Matrix3D
      {
         return _mvpTransformStack[_mvpIndex];
      }
      
      public final function popModelViewProjection() : void
      {
         _mvpIndex = _mvpIndex - 1;
      }
      
      public final function getEntityPartitionNode() : EntityNode
      {
         return _partitionNode || createEntityPartitionNode();
      }
      
      protected function createEntityPartitionNode() : EntityNode
      {
         throw new AbstractMethodError();
      }
      
      protected function getDefaultBoundingVolume() : BoundingVolumeBase
      {
         return new AxisAlignedBoundingBox();
      }
      
      protected function updateBounds() : void
      {
         throw new AbstractMethodError();
      }
      
      override protected function invalidateSceneTransform() : void
      {
         if(!_ignoreTransform)
         {
            super.invalidateSceneTransform();
            notifySceneBoundsInvalid();
         }
      }
      
      protected function invalidateBounds() : void
      {
         _boundsInvalid = true;
         notifySceneBoundsInvalid();
      }
      
      override protected function updateMouseChildren() : void
      {
         var _loc1_:* = null;
         if(_parent && !pickingCollider)
         {
            if(_parent is Entity)
            {
               _loc1_ = Entity(_parent).pickingCollider;
               if(_loc1_)
               {
                  pickingCollider = _loc1_;
               }
            }
         }
         super.updateMouseChildren();
      }
      
      private function notifySceneBoundsInvalid() : void
      {
         if(_scene)
         {
            _scene.invalidateEntityBounds(this);
         }
      }
      
      private function notifyPartitionAssigned() : void
      {
         if(_scene)
         {
            _scene.registerPartition(this);
         }
      }
      
      private function notifyPartitionUnassigned() : void
      {
         if(_scene)
         {
            _scene.unregisterPartition(this);
         }
      }
      
      private function addBounds() : void
      {
         if(!_boundsIsShown)
         {
            _boundsIsShown = true;
            addChild(_bounds.boundingRenderable);
         }
      }
      
      private function removeBounds() : void
      {
         if(_boundsIsShown)
         {
            _boundsIsShown = false;
            removeChild(_bounds.boundingRenderable);
            _bounds.disposeRenderable();
         }
      }
      
      function internalUpdate() : void
      {
         if(_controller)
         {
            _controller.update();
         }
      }
      
      override public function dispose() : void
      {
         EntityNumber = Number(EntityNumber) - 1;
         super.dispose();
      }
   }
}
