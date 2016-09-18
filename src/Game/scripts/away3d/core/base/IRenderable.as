package away3d.core.base
{
   import flash.geom.Matrix3D;
   import away3d.entities.Entity;
   import flash.geom.Matrix;
   import away3d.core.managers.Stage3DProxy;
   import flash.display3D.IndexBuffer3D;
   import away3d.core.base.data.PostEffectData;
   
   public interface IRenderable extends IMaterialOwner
   {
       
      
      function get sceneTransform() : Matrix3D;
      
      function get inverseSceneTransform() : Matrix3D;
      
      function get modelViewProjection() : Matrix3D;
      
      function getModelViewProjectionUnsafe() : Matrix3D;
      
      function get zIndex() : Number;
      
      function get mouseEnabled() : Boolean;
      
      function get sourceEntity() : Entity;
      
      function get castsShadows() : Boolean;
      
      function get uvTransform() : Matrix;
      
      function get shaderPickingDetails() : Boolean;
      
      function get numVertices() : uint;
      
      function get numTriangles() : uint;
      
      function get vertexStride() : uint;
      
      function activateVertexBuffer(param1:int, param2:Stage3DProxy) : void;
      
      function activateUVBuffer(param1:int, param2:Stage3DProxy) : void;
      
      function activateSecondaryUVBuffer(param1:int, param2:Stage3DProxy) : void;
      
      function activateVertexNormalBuffer(param1:int, param2:Stage3DProxy) : void;
      
      function activateVertexTangentBuffer(param1:int, param2:Stage3DProxy) : void;
      
      function getIndexBuffer(param1:Stage3DProxy) : IndexBuffer3D;
      
      function get vertexData() : Vector.<Number>;
      
      function get vertexNormalData() : Vector.<Number>;
      
      function get vertexTangentData() : Vector.<Number>;
      
      function get indexData() : Vector.<uint>;
      
      function get UVData() : Vector.<Number>;
      
      function get postEffectData() : PostEffectData;
   }
}
