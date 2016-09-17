package org.specter3d.configs.particle.node
{
   import org.specter3d.configs.particle.BaseData;
   
   public class OrbitData extends BaseData
   {
       
      
      public var cycleDuration:Number = 1;
      
      public var radiusMin:Number = 100;
      
      public var radiusMax:Number = 100;
      
      public var eulersX:Number = 0;
      
      public var eulersY:Number = 0;
      
      public var eulersZ:Number = 0;
      
      public function OrbitData()
      {
         super();
      }
      
      override public function clone() : BaseData
      {
         var _loc1_:OrbitData = new OrbitData();
         _loc1_.usesNode = usesNode;
         _loc1_.cycleDuration = cycleDuration;
         _loc1_.radiusMin = radiusMin;
         _loc1_.radiusMax = radiusMax;
         _loc1_.eulersX = eulersX;
         _loc1_.eulersY = eulersY;
         _loc1_.eulersZ = eulersZ;
         return _loc1_;
      }
   }
}
