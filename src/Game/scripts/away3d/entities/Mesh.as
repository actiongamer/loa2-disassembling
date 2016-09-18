package away3d.entities
{
   import away3d.core.base.IMaterialOwner;
   import away3d.library.assets.IAsset;
   import away3d.core.base.SubMesh;
   import away3d.core.base.Geometry;
   import away3d.materials.MaterialBase;
   import away3d.animators.IAnimator;
   import away3d.events.GeometryEvent;
   import away3d.core.base.ISubGeometry;
   import away3d.core.managers.Context3DProxy;
   import away3d.animators.AnimatorBase;
   import §away3d:arcane§._pickingCollisionVO;
   import away3d.core.base.Object3D;
   import away3d.containers.ObjectContainer3D;
   import away3d.core.partition.EntityNode;
   import away3d.core.partition.MeshNode;
   import away3d.core.base.SubGeometry;
   import §away3d:arcane§._pickingCollider;
   import away3d.materials.utils.DefaultMaterialManager;
   
   public class Mesh extends Entity implements IMaterialOwner, IAsset
   {
       
      
      private var _subMeshes:Vector.<SubMesh>;
      
      protected var _geometry:Geometry;
      
      private var _material:MaterialBase;
      
      private var _animator:IAnimator;
      
      private var _castsShadows:Boolean = false;
      
      private var _numSubMesh:int = 0;
      
      public function Mesh(param1:Geometry, param2:MaterialBase = null, param3:Boolean = true)
      {
         super();
         _subMeshes = new Vector.<SubMesh>();
         Context3DProxy.meshCount++;
         this.geometry = param1;
         this.material = param2;
         if(!this.material && param3)
         {
            this.material = DefaultMaterialManager.getDefaultMaterial(this);
         }
      }
      
      public function bakeTransformations() : void
      {
         geometry.applyTransformation(transform);
         transform.identity();
      }
      
      override public function get assetType() : String
      {
         return "mesh";
      }
      
      private function onGeometryBoundsInvalid(param1:GeometryEvent) : void
      {
         invalidateBounds();
      }
      
      public function get castsShadows() : Boolean
      {
         return _castsShadows;
      }
      
      public function set castsShadows(param1:Boolean) : void
      {
         _castsShadows = param1;
      }
      
      public final function get animator() : IAnimator
      {
         return _animator;
      }
      
      public function set animator(param1:IAnimator) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         if(_animator)
         {
            _animator.removeOwner(this);
         }
         _animator = param1;
         var _loc2_:MaterialBase = material;
         material = null;
         material = _loc2_;
         var _loc3_:uint = _subMeshes.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = _subMeshes[_loc5_];
            _loc2_ = _loc4_._material;
            if(_loc2_)
            {
               _loc4_.material = null;
               _loc4_.material = _loc2_;
            }
            _loc5_++;
         }
         if(_animator)
         {
            _animator.addOwner(this);
         }
      }
      
      public function get geometry() : Geometry
      {
         return _geometry;
      }
      
      public function set geometry(param1:Geometry) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = undefined;
         if(_geometry)
         {
            _geometry.removeEventListener("BoundsInvalid",onGeometryBoundsInvalid);
            _geometry.removeEventListener("SubGeometryAdded",onSubGeometryAdded);
            _geometry.removeEventListener("SubGeometryRemoved",onSubGeometryRemoved);
            _loc3_ = uint(0);
            while(_loc3_ < _subMeshes.length)
            {
               _subMeshes[_loc3_].dispose();
               _loc3_++;
            }
            _subMeshes.length = 0;
         }
         _geometry = param1;
         if(_geometry)
         {
            _geometry.addEventListener("BoundsInvalid",onGeometryBoundsInvalid);
            _geometry.addEventListener("SubGeometryAdded",onSubGeometryAdded);
            _geometry.addEventListener("SubGeometryRemoved",onSubGeometryRemoved);
            _loc2_ = _geometry.subGeometries;
            _loc3_ = uint(0);
            while(_loc3_ < _loc2_.length)
            {
               addSubMesh(_loc2_[_loc3_]);
               _loc3_++;
            }
         }
         if(_material)
         {
            _material.removeOwner(this);
            _material.addOwner(this);
         }
      }
      
      public final function get material() : MaterialBase
      {
         return _material;
      }
      
      public final function set material(param1:MaterialBase) : void
      {
         if(param1 == _material)
         {
            return;
         }
         if(_material)
         {
            _material.removeOwner(this);
         }
         _material = param1;
         if(_material)
         {
            _material.addOwner(this);
         }
      }
      
      public function get subMeshes() : Vector.<SubMesh>
      {
         _geometry.validate();
         return _subMeshes;
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         super.dispose();
         Context3DProxy.meshCount--;
         if(_animator)
         {
            (_animator as AnimatorBase).stopOrStartEnterFrame(false);
            _animator.removeOwner(this);
            _animator = null;
         }
         if(_subMeshes)
         {
            _loc1_ = 0;
            while(_loc1_ < _subMeshes.length)
            {
               _subMeshes[_loc1_].dispose();
               _loc1_++;
            }
            _subMeshes.length = 0;
         }
         _zIndices.length = 0;
         mouseChildren = false;
         mouseEnabled = false;
         bounds = null;
         material = null;
         geometry = null;
         _pickingCollisionVO && _loc2_;
         _pickingCollisionVO = null;
      }
      
      override public function clone(param1:Boolean = true) : Object3D
      {
         var _loc4_:int = 0;
         var _loc2_:Mesh = new Mesh(geometry,_material);
         _loc2_.name = this.name + "-->::cloneMesh" + Context3DProxy.meshCount;
         _loc2_.transform = transform;
         _loc2_.pivotPoint = pivotPoint;
         _loc2_.partition = partition;
         _loc2_.bounds = _bounds.clone();
         _loc2_.name = name;
         _loc2_.castsShadows = castsShadows;
         var _loc3_:int = Math.min(_loc2_._subMeshes.length,_subMeshes.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_._subMeshes[_loc4_]._material = _subMeshes[_loc4_]._material;
            _loc4_++;
         }
         if(param1)
         {
            _loc3_ = numChildren;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_.addChild(ObjectContainer3D(getChildAt(_loc4_).clone()));
               _loc4_++;
            }
         }
         return _loc2_;
      }
      
      override protected function updateBounds() : void
      {
         _bounds && _bounds.fromGeometry(_geometry);
         _boundsInvalid = false;
      }
      
      override protected function createEntityPartitionNode() : EntityNode
      {
         return new MeshNode(this);
      }
      
      private function onSubGeometryAdded(param1:GeometryEvent) : void
      {
         addSubMesh(param1.subGeometry);
      }
      
      private function onSubGeometryRemoved(param1:GeometryEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc2_:ISubGeometry = param1.subGeometry;
         if(!_subMeshes)
         {
            return;
         }
         var _loc3_:int = _subMeshes.length;
         _loc5_ = uint(0);
         while(_loc5_ < _loc3_)
         {
            _loc4_ = _subMeshes[_loc5_];
            if(_loc4_.subGeometry == _loc2_)
            {
               _loc4_.dispose();
               _subMeshes.splice(_loc5_,1);
               break;
            }
            _loc5_++;
         }
         _loc3_--;
         while(_loc5_ < _loc3_)
         {
            _subMeshes[_loc5_]._index = _loc5_;
            _loc5_++;
         }
      }
      
      private function addSubMesh(param1:ISubGeometry) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = 0;
         if(_subMeshes.indexOf(param1 as SubMesh) == -1)
         {
            _numSubMesh = Number(_numSubMesh) + 1;
            _loc3_ = new SubMesh(param1,this,null);
            _loc2_ = uint(_subMeshes.length);
            _loc3_._index = _loc2_;
            _subMeshes[_loc2_] = _loc3_;
            invalidateBounds();
         }
      }
      
      public function getSubMeshForSubGeometry(param1:SubGeometry) : SubMesh
      {
         return _subMeshes[_geometry.subGeometries.indexOf(param1)];
      }
      
      override function collidesBefore(param1:Number, param2:Boolean) : Boolean
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         _pickingCollider.setLocalRay(_pickingCollisionVO.localRayPosition,_pickingCollisionVO.localRayDirection);
         _pickingCollisionVO.renderable = null;
         var _loc3_:int = _subMeshes.length;
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc4_ = _subMeshes[_loc6_];
            _loc5_ = !!_material?!_material.bothSides:true;
            if(_pickingCollider.testSubMeshCollision(_loc4_,_pickingCollisionVO,param1,_loc5_))
            {
               param1 = _pickingCollisionVO.rayEntryDistance;
               _pickingCollisionVO.renderable = _loc4_;
               if(!param2)
               {
                  return true;
               }
            }
            _loc6_++;
         }
         return _pickingCollisionVO.renderable != null;
      }
      
      public function get numSubMesh() : int
      {
         return _numSubMesh;
      }
   }
}
