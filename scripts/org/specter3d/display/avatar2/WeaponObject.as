package org.specter3d.display.avatar2
{
   import org.specter3d.context.AppGlobalContext;
   
   public class WeaponObject extends AvatarEffect3D
   {
       
      
      public function WeaponObject(param1:String = "WeaponBone_R")
      {
         super(param1);
         bothSides = true;
         rotationY = -90;
         AppGlobalContext.animatorManager.register(this);
      }
      
      override protected function onLoadMeshDone() : void
      {
         super.onLoadMeshDone();
         if(this.avatarMesh)
         {
            this.avatarMesh.rotationY = rotationY;
            rotationY = 0;
         }
      }
      
      override public function dispose() : void
      {
         AppGlobalContext.animatorManager.unregister(this);
         super.dispose();
      }
   }
}
