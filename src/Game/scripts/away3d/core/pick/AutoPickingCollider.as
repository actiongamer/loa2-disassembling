package away3d.core.pick
{
   import flash.geom.Vector3D;
   import away3d.core.base.SubMesh;
   
   public class AutoPickingCollider implements away3d.core.pick.IPickingCollider
   {
       
      
      private var _pbPickingCollider:away3d.core.pick.PBPickingCollider;
      
      private var _as3PickingCollider:away3d.core.pick.AS3PickingCollider;
      
      private var _activePickingCollider:away3d.core.pick.IPickingCollider;
      
      public var triangleThreshold:uint = 1024;
      
      public function AutoPickingCollider(param1:Boolean = false)
      {
         super();
         _as3PickingCollider = new away3d.core.pick.AS3PickingCollider(param1);
         _pbPickingCollider = new away3d.core.pick.PBPickingCollider(param1);
      }
      
      public function setLocalRay(param1:Vector3D, param2:Vector3D) : void
      {
         _as3PickingCollider.setLocalRay(param1,param2);
         _pbPickingCollider.setLocalRay(param1,param2);
      }
      
      public function testSubMeshCollision(param1:SubMesh, param2:PickingCollisionVO, param3:Number, param4:Boolean) : Boolean
      {
         _activePickingCollider = param1.numTriangles > triangleThreshold?_pbPickingCollider:_as3PickingCollider;
         return _activePickingCollider.testSubMeshCollision(param1,param2,param3,param4);
      }
   }
}
