package org.specter3d.camera
{
   import away3d.controllers.HoverController;
   import away3d.cameras.Camera3D;
   import away3d.containers.ObjectContainer3D;
   
   public class Specter3DCameraController extends HoverController
   {
       
      
      public function Specter3DCameraController(param1:Camera3D = null, param2:ObjectContainer3D = null, param3:Number = 45, param4:Number = 700)
      {
         super(param1,param2,180,param3,param4,-90,90,0,0,60);
      }
   }
}
