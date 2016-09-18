package org.specter3d.configs.particle.node
{
   import org.specter3d.configs.particle.BaseData;
   
   public class FollowData extends BaseData
   {
       
      
      public var usesPosition:Boolean = true;
      
      public var usesRotation:Boolean = false;
      
      public function FollowData()
      {
         super();
      }
      
      override public function clone() : BaseData
      {
         var _loc1_:FollowData = new FollowData();
         _loc1_.usesNode = usesNode;
         _loc1_.usesPosition = usesPosition;
         _loc1_.usesRotation = usesRotation;
         return _loc1_;
      }
   }
}
