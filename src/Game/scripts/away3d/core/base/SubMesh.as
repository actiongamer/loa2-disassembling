package away3d.core.base
{
   import away3d.materials.MaterialBase;
   import away3d.entities.Mesh;
   import flash.geom.Matrix;
   import away3d.core.base.data.PostEffectData;
   import away3d.animators.data.AnimationSubGeometry;
   import flash.display3D.VertexBuffer3D;
   import away3d.core.managers.Stage3DProxy;
   import away3d.entities.Entity;
   import §away3d:arcane§._material;
   import flash.geom.Matrix3D;
   import flash.display3D.IndexBuffer3D;
   import away3d.animators.IAnimator;
   import away3d.bounds.BoundingVolumeBase;
   
   public class SubMesh implements IRenderable
   {
       
      
      var _material:MaterialBase;
      
      private var _parentMesh:Mesh;
      
      private var _subGeometry:away3d.core.base.ISubGeometry;
      
      var _index:uint;
      
      private var _uvTransform:Matrix;
      
      private var _uvTransformDirty:Boolean;
      
      private var _uvRotation:Number = 0;
      
      private var _scaleU:Number = 1;
      
      private var _scaleV:Number = 1;
      
      private var _offsetU:Number = 0;
      
      private var _offsetV:Number = 0;
      
      private var _postEffectData:PostEffectData;
      
      public var animationSubGeometry:AnimationSubGeometry;
      
      public var animatorSubGeometry:AnimationSubGeometry;
      
      public function SubMesh(param1:away3d.core.base.ISubGeometry, param2:Mesh, param3:MaterialBase = null)
      {
         super();
         _parentMesh = param2;
         _subGeometry = param1;
         this.material = param3;
         _postEffectData = new PostEffectData();
      }
      
      public function get postEffectData() : PostEffectData
      {
         return _postEffectData;
      }
      
      public function get shaderPickingDetails() : Boolean
      {
         return sourceEntity.shaderPickingDetails;
      }
      
      public function get offsetU() : Number
      {
         return _offsetU;
      }
      
      public function getSecondaryUVBuffer(param1:Stage3DProxy) : VertexBuffer3D
      {
         return (_subGeometry as SubGeometry).getSecondaryUVBuffer(param1);
      }
      
      public function set offsetU(param1:Number) : void
      {
         if(param1 == _offsetU)
         {
            return;
         }
         _offsetU = param1;
         _uvTransformDirty = true;
      }
      
      public function get offsetV() : Number
      {
         return _offsetV;
      }
      
      public function set offsetV(param1:Number) : void
      {
         if(param1 == _offsetV)
         {
            return;
         }
         _offsetV = param1;
         _uvTransformDirty = true;
      }
      
      public function get scaleU() : Number
      {
         return _scaleU;
      }
      
      public function set scaleU(param1:Number) : void
      {
         if(param1 == _scaleU)
         {
            return;
         }
         _scaleU = param1;
         _uvTransformDirty = true;
      }
      
      public function get scaleV() : Number
      {
         return _scaleV;
      }
      
      public function set scaleV(param1:Number) : void
      {
         if(param1 == _scaleV)
         {
            return;
         }
         _scaleV = param1;
         _uvTransformDirty = true;
      }
      
      public function get uvRotation() : Number
      {
         return _uvRotation;
      }
      
      public function set uvRotation(param1:Number) : void
      {
         if(param1 == _uvRotation)
         {
            return;
         }
         _uvRotation = param1;
         _uvTransformDirty = true;
      }
      
      public final function get sourceEntity() : Entity
      {
         return _parentMesh;
      }
      
      public function get subGeometry() : away3d.core.base.ISubGeometry
      {
         return _subGeometry;
      }
      
      public function set subGeometry(param1:away3d.core.base.ISubGeometry) : void
      {
         _subGeometry = param1;
      }
      
      public final function get material() : MaterialBase
      {
         if(_material)
         {
            return _material;
         }
         if(_parentMesh)
         {
            return _parentMesh.material;
         }
         return null;
      }
      
      public final function set material(param1:MaterialBase) : void
      {
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
      
      public function get zIndex() : Number
      {
         if(_parentMesh)
         {
            return _parentMesh.zIndex;
         }
         return 0;
      }
      
      public function get sceneTransform() : Matrix3D
      {
         if(_parentMesh)
         {
            return _parentMesh.sceneTransform;
         }
         return null;
      }
      
      public function get inverseSceneTransform() : Matrix3D
      {
         if(_parentMesh)
         {
            return _parentMesh.inverseSceneTransform;
         }
         return null;
      }
      
      public final function activateVertexBuffer(param1:int, param2:Stage3DProxy) : void
      {
         _subGeometry.activateVertexBuffer(param1,param2);
      }
      
      public function activateVertexNormalBuffer(param1:int, param2:Stage3DProxy) : void
      {
         _subGeometry.activateVertexNormalBuffer(param1,param2);
      }
      
      public function activateVertexTangentBuffer(param1:int, param2:Stage3DProxy) : void
      {
         _subGeometry.activateVertexTangentBuffer(param1,param2);
      }
      
      public final function activateUVBuffer(param1:int, param2:Stage3DProxy) : void
      {
         _subGeometry.activateUVBuffer(param1,param2);
      }
      
      public function activateSecondaryUVBuffer(param1:int, param2:Stage3DProxy) : void
      {
         _subGeometry.activateSecondaryUVBuffer(param1,param2);
      }
      
      public function getIndexBuffer(param1:Stage3DProxy) : IndexBuffer3D
      {
         return _subGeometry.getIndexBuffer(param1);
      }
      
      public function get modelViewProjection() : Matrix3D
      {
         return _parentMesh.modelViewProjection;
      }
      
      public function getModelViewProjectionUnsafe() : Matrix3D
      {
         return _parentMesh.getModelViewProjectionUnsafe();
      }
      
      public final function get numTriangles() : uint
      {
         return _subGeometry.numTriangles;
      }
      
      public final function get animator() : IAnimator
      {
         return _parentMesh.animator;
      }
      
      public function get mouseEnabled() : Boolean
      {
         if(_parentMesh)
         {
            return _parentMesh.mouseEnabled || _parentMesh._ancestorsAllowMouseEnabled;
         }
         return false;
      }
      
      public function get castsShadows() : Boolean
      {
         if(_parentMesh)
         {
            return _parentMesh.castsShadows;
         }
         return false;
      }
      
      function get parentMesh() : Mesh
      {
         return _parentMesh;
      }
      
      function set parentMesh(param1:Mesh) : void
      {
         _parentMesh = param1;
      }
      
      public function get uvTransform() : Matrix
      {
         if(_uvTransformDirty)
         {
            updateUVTransform();
         }
         return _uvTransform;
      }
      
      private function updateUVTransform() : void
      {
         if(!_uvTransform)
         {
            _uvTransform = new Matrix();
         }
         _uvTransform.identity();
         if(_uvRotation != 0)
         {
            _uvTransform.rotate(_uvRotation);
         }
         if(_scaleU != 1 || _scaleV != 1)
         {
            _uvTransform.scale(_scaleU,_scaleV);
         }
         _uvTransform.translate(_offsetU,_offsetV);
         _uvTransformDirty = false;
      }
      
      public function dispose() : void
      {
         material = null;
         if(animatorSubGeometry)
         {
            animatorSubGeometry.dispose();
         }
         _postEffectData = null;
      }
      
      public function get vertexData() : Vector.<Number>
      {
         return _subGeometry.vertexData;
      }
      
      public function get indexData() : Vector.<uint>
      {
         return _subGeometry.indexData;
      }
      
      public function get UVData() : Vector.<Number>
      {
         return _subGeometry.UVData;
      }
      
      public function get bounds() : BoundingVolumeBase
      {
         return _parentMesh.bounds;
      }
      
      public function get visible() : Boolean
      {
         return _parentMesh.visible;
      }
      
      public function get numVertices() : uint
      {
         return _subGeometry.numVertices;
      }
      
      public function get vertexStride() : uint
      {
         return _subGeometry.vertexStride;
      }
      
      public function get UVStride() : uint
      {
         return _subGeometry.UVStride;
      }
      
      public function get vertexNormalData() : Vector.<Number>
      {
         return _subGeometry.vertexNormalData;
      }
      
      public function get vertexTangentData() : Vector.<Number>
      {
         return _subGeometry.vertexTangentData;
      }
      
      public function get UVOffset() : uint
      {
         return _subGeometry.UVOffset;
      }
      
      public function get vertexOffset() : uint
      {
         return _subGeometry.vertexOffset;
      }
      
      public function get vertexNormalOffset() : uint
      {
         return _subGeometry.vertexNormalOffset;
      }
      
      public function get vertexTangentOffset() : uint
      {
         return _subGeometry.vertexTangentOffset;
      }
   }
}
