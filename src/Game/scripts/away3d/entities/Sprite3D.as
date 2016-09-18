package away3d.entities
{
   import away3d.core.base.IRenderable;
   import away3d.core.base.SubGeometry;
   import away3d.materials.MaterialBase;
   import flash.geom.Matrix3D;
   import away3d.animators.IAnimator;
   import §away3d:arcane§.invalidateTransform;
   import away3d.core.managers.Stage3DProxy;
   import flash.display3D.IndexBuffer3D;
   import away3d.cameras.Camera3D;
   import away3d.core.math.Matrix3DUtils;
   import flash.geom.Vector3D;
   import away3d.bounds.BoundingVolumeBase;
   import away3d.bounds.BoundingSphere;
   import away3d.core.partition.EntityNode;
   import away3d.core.partition.RenderableNode;
   import flash.geom.Matrix;
   import away3d.core.base.data.PostEffectData;
   
   public class Sprite3D extends Entity implements IRenderable
   {
      
      private static var _geometry:SubGeometry;
       
      
      private var _material:MaterialBase;
      
      private var _spriteMatrix:Matrix3D;
      
      private var _animator:IAnimator;
      
      private var _shadowCaster:Boolean = false;
      
      private var _width:Number;
      
      private var _height:Number;
      
      public function Sprite3D(param1:MaterialBase, param2:Number, param3:Number)
      {
         super();
         this.material = param1;
         _width = param2;
         _height = param3;
         _spriteMatrix = new Matrix3D();
         if(!_geometry)
         {
            _geometry = new SubGeometry();
            _geometry.updateVertexData(Vector.<Number>([-0.5,0.5,0,0.5,0.5,0,0.5,-0.5,0,-0.5,-0.5,0]));
            _geometry.updateUVData(Vector.<Number>([0,0,1,0,1,1,0,1]));
            _geometry.updateIndexData(Vector.<uint>([0,1,2,0,2,3]));
            _geometry.updateVertexTangentData(Vector.<Number>([1,0,0,1,0,0,1,0,0,1,0,0]));
            _geometry.updateVertexNormalData(Vector.<Number>([0,0,-1,0,0,-1,0,0,-1,0,0,-1]));
         }
      }
      
      public function get castsShadows() : Boolean
      {
         return _shadowCaster;
      }
      
      public function get width() : Number
      {
         return _width;
      }
      
      public function set width(param1:Number) : void
      {
         if(_width == param1)
         {
            return;
         }
         _width = param1;
         invalidateTransform();
      }
      
      public function get height() : Number
      {
         return _height;
      }
      
      public function set height(param1:Number) : void
      {
         if(_height == param1)
         {
            return;
         }
         _height = param1;
         invalidateTransform();
      }
      
      public function activateVertexBuffer(param1:int, param2:Stage3DProxy) : void
      {
         _geometry.activateVertexBuffer(param1,param2);
      }
      
      public function activateUVBuffer(param1:int, param2:Stage3DProxy) : void
      {
         _geometry.activateUVBuffer(param1,param2);
      }
      
      public function activateSecondaryUVBuffer(param1:int, param2:Stage3DProxy) : void
      {
         _geometry.activateSecondaryUVBuffer(param1,param2);
      }
      
      public function activateVertexNormalBuffer(param1:int, param2:Stage3DProxy) : void
      {
         _geometry.activateVertexNormalBuffer(param1,param2);
      }
      
      public function activateVertexTangentBuffer(param1:int, param2:Stage3DProxy) : void
      {
         _geometry.activateVertexTangentBuffer(param1,param2);
      }
      
      public function getIndexBuffer(param1:Stage3DProxy) : IndexBuffer3D
      {
         return _geometry.getIndexBuffer(param1);
      }
      
      override public function pushModelViewProjection(param1:Camera3D, param2:Boolean = true) : void
      {
         var _loc4_:* = undefined;
         var _loc3_:* = null;
         _mvpIndex = _mvpIndex + 1;
         if(_mvpIndex + 1 == _stackLen)
         {
            _mvpTransformStack[_mvpIndex] = new Matrix3D();
            _stackLen = _stackLen + 1;
         }
         var _loc5_:Matrix3D = _mvpTransformStack[_mvpIndex];
         _loc5_.copyFrom(sceneTransform);
         _loc5_.append(param1.inverseSceneTransform);
         _loc4_ = Matrix3DUtils.decompose(_loc5_);
         _loc3_ = _loc4_[1];
         var _loc6_:* = 0;
         _loc3_.z = _loc6_;
         _loc6_ = _loc6_;
         _loc3_.y = _loc6_;
         _loc3_.x = _loc6_;
         _loc5_.recompose(_loc4_);
         _loc5_.append(param1.lens.matrix);
         if(param2)
         {
            _loc5_.copyColumnTo(3,_pos);
            _zIndices[_mvpIndex] = -_pos.z;
         }
      }
      
      public function get numTriangles() : uint
      {
         return 2;
      }
      
      public final function get sourceEntity() : Entity
      {
         return this;
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
      
      public function get animator() : IAnimator
      {
         return _animator;
      }
      
      override protected function getDefaultBoundingVolume() : BoundingVolumeBase
      {
         return new BoundingSphere();
      }
      
      override protected function updateBounds() : void
      {
         _bounds.fromExtremes(-0.5 * _scaleX,-0.5 * _scaleY,0,0.5 * _scaleX,0.5 * _scaleY,0);
         _boundsInvalid = false;
      }
      
      override protected function createEntityPartitionNode() : EntityNode
      {
         return new RenderableNode(this);
      }
      
      override protected function updateTransform() : void
      {
         super.updateTransform();
         _transform.prependScale(_width,_height,1);
      }
      
      public function get uvTransform() : Matrix
      {
         return null;
      }
      
      public function get vertexData() : Vector.<Number>
      {
         return _geometry.vertexData;
      }
      
      public function get indexData() : Vector.<uint>
      {
         return _geometry.indexData;
      }
      
      public function get UVData() : Vector.<Number>
      {
         return _geometry.UVData;
      }
      
      public function get numVertices() : uint
      {
         return _geometry.numVertices;
      }
      
      public function get vertexStride() : uint
      {
         return _geometry.vertexStride;
      }
      
      public function get vertexNormalData() : Vector.<Number>
      {
         return _geometry.vertexNormalData;
      }
      
      public function get vertexTangentData() : Vector.<Number>
      {
         return _geometry.vertexTangentData;
      }
      
      public function get vertexOffset() : int
      {
         return _geometry.vertexOffset;
      }
      
      public function get vertexNormalOffset() : int
      {
         return _geometry.vertexNormalOffset;
      }
      
      public function get vertexTangentOffset() : int
      {
         return _geometry.vertexTangentOffset;
      }
      
      override public function dispose() : void
      {
         if(_material)
         {
            _material.dispose();
            _material = null;
         }
         super.dispose();
      }
      
      public function get postEffectData() : PostEffectData
      {
         return null;
      }
   }
}
