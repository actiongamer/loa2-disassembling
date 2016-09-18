package away3d.animators.data
{
   import away3d.core.math.Quaternion;
   import flash.geom.Vector3D;
   import flash.geom.Matrix3D;
   
   public class JointPose
   {
       
      
      public var name:String;
      
      public var orientation:Quaternion;
      
      public var translation:Vector3D;
      
      public function JointPose()
      {
         orientation = new Quaternion();
         translation = new Vector3D();
         super();
      }
      
      public function toMatrix3D(param1:Matrix3D = null) : Matrix3D
      {
         if(!param1)
         {
            param1 = new Matrix3D();
         }
         orientation.toMatrix3D(param1);
         param1.appendTranslation(translation.x,translation.y,translation.z);
         return param1;
      }
      
      public function copyFrom(param1:JointPose) : void
      {
         var _loc3_:Quaternion = param1.orientation;
         var _loc2_:Vector3D = param1.translation;
         orientation.copyFrom(_loc3_);
         translation.copyFrom(_loc2_);
      }
   }
}
