package away3d.lights
{
   import away3d.textures.CubeTextureBase;
   import away3d.core.partition.EntityNode;
   import away3d.core.partition.LightProbeNode;
   import away3d.bounds.BoundingVolumeBase;
   import away3d.bounds.NullBounds;
   import flash.geom.Matrix3D;
   import away3d.core.base.IRenderable;
   
   public class LightProbe extends LightBase
   {
       
      
      private var _diffuseMap:CubeTextureBase;
      
      private var _specularMap:CubeTextureBase;
      
      public function LightProbe(param1:CubeTextureBase, param2:CubeTextureBase = null)
      {
         super();
         _diffuseMap = param1;
         _specularMap = param2;
      }
      
      override protected function createEntityPartitionNode() : EntityNode
      {
         return new LightProbeNode(this);
      }
      
      public function get diffuseMap() : CubeTextureBase
      {
         return _diffuseMap;
      }
      
      public function set diffuseMap(param1:CubeTextureBase) : void
      {
         _diffuseMap = param1;
      }
      
      public function get specularMap() : CubeTextureBase
      {
         return _specularMap;
      }
      
      public function set specularMap(param1:CubeTextureBase) : void
      {
         _specularMap = param1;
      }
      
      override protected function updateBounds() : void
      {
         _boundsInvalid = false;
      }
      
      override protected function getDefaultBoundingVolume() : BoundingVolumeBase
      {
         return new NullBounds();
      }
      
      override function getObjectProjectionMatrix(param1:IRenderable, param2:Matrix3D = null) : Matrix3D
      {
         param1 = param1;
         param2 = param2;
         throw new Error("Object projection matrices are not supported for LightProbe objects!");
      }
   }
}
