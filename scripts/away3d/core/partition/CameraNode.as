package away3d.core.partition
{
   import away3d.core.traverse.PartitionTraverser;
   import away3d.cameras.Camera3D;
   
   public class CameraNode extends EntityNode
   {
       
      
      public function CameraNode(param1:Camera3D)
      {
         super(param1);
      }
      
      override public function acceptTraverser(param1:PartitionTraverser) : void
      {
      }
   }
}
