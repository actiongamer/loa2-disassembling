package away3d.controllers
{
   import away3d.entities.Entity;
   import away3d.containers.ObjectContainer3D;
   
   public class FollowController extends HoverController
   {
       
      
      public function FollowController(param1:Entity = null, param2:ObjectContainer3D = null, param3:Number = 45, param4:Number = 700)
      {
         super(param1,param2,0,param3,param4);
      }
      
      override public function update() : void
      {
         if(!lookAtObject)
         {
            return;
         }
         panAngle = _lookAtObject.rotationY - 180;
         super.update();
      }
   }
}
