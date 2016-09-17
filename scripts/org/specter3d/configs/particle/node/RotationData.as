package org.specter3d.configs.particle.node
{
   import org.specter3d.configs.particle.BaseData;
   
   public class RotationData extends BaseData
   {
       
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var z:Number = 0;
      
      public var duration:Number = 0.01;
      
      public function RotationData()
      {
         super();
      }
      
      override public function clone() : BaseData
      {
         var _loc1_:RotationData = new RotationData();
         _loc1_.usesNode = usesNode;
         _loc1_.duration = duration;
         _loc1_.usesNode = usesNode;
         _loc1_.x = x;
         _loc1_.y = y;
         _loc1_.z = z;
         return _loc1_;
      }
   }
}
