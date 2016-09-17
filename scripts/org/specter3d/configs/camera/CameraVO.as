package org.specter3d.configs.camera
{
   import org.specter3d.configs.Specter3DConfig;
   
   public class CameraVO extends Specter3DConfig
   {
       
      
      public var currentFrame:int = 0;
      
      public var distance:Number = 0;
      
      public var tiltAngle:Number = 0;
      
      public var panAngle:Number = 0;
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var z:Number = 0;
      
      public function CameraVO()
      {
         super(-1);
      }
      
      public function clone() : CameraVO
      {
         var _loc1_:CameraVO = new CameraVO();
         _loc1_.currentFrame = this.currentFrame;
         _loc1_.distance = this.distance;
         _loc1_.tiltAngle = this.tiltAngle;
         _loc1_.panAngle = this.panAngle;
         _loc1_.x = this.x;
         _loc1_.y = this.y;
         _loc1_.z = this.z;
         return _loc1_;
      }
   }
}
