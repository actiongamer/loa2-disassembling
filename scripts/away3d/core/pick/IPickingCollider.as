package away3d.core.pick
{
   import flash.geom.Vector3D;
   import away3d.core.base.SubMesh;
   
   public interface IPickingCollider
   {
       
      
      function setLocalRay(param1:Vector3D, param2:Vector3D) : void;
      
      function testSubMeshCollision(param1:SubMesh, param2:PickingCollisionVO, param3:Number, param4:Boolean) : Boolean;
   }
}
