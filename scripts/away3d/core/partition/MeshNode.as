package away3d.core.partition
{
   import away3d.entities.Mesh;
   import away3d.core.traverse.PartitionTraverser;
   import away3d.core.base.SubMesh;
   import away3d.cameras.Camera3D;
   
   public class MeshNode extends EntityNode
   {
       
      
      private var _mesh:Mesh;
      
      public function MeshNode(param1:Mesh)
      {
         super(param1);
         _mesh = param1;
      }
      
      public function get mesh() : Mesh
      {
         return _mesh;
      }
      
      override public function disopse() : void
      {
         if(_mesh)
         {
            _mesh = null;
         }
         super.disopse();
      }
      
      override public function acceptTraverser(param1:PartitionTraverser) : void
      {
         var _loc2_:* = undefined;
         var _loc4_:int = 0;
         var _loc3_:* = 0;
         if(param1.enterNode(this))
         {
            super.acceptTraverser(param1);
            _loc2_ = _mesh.subMeshes;
            _loc3_ = uint(_loc2_.length);
            while(_loc4_ < _loc3_)
            {
               param1.applyRenderable(_loc2_[_loc4_++]);
            }
         }
      }
      
      override protected function isInFrustumImpl(param1:Camera3D) : Boolean
      {
         return super.isInFrustumImpl(param1);
      }
   }
}
