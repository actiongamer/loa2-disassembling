package org.specter3d.configs.particle.node
{
   import org.specter3d.configs.particle.BaseData;
   
   public class BezierData extends BaseData
   {
       
      
      public var controlX:Number = 0;
      
      public var controlY:Number = 0;
      
      public var controlZ:Number = 0;
      
      public var endX:Number = 0;
      
      public var endY:Number = 0;
      
      public var endZ:Number = 0;
      
      public function BezierData()
      {
         super();
      }
      
      override public function clone() : BaseData
      {
         var _loc1_:BezierData = new BezierData();
         _loc1_.usesNode = usesNode;
         return _loc1_;
      }
   }
}
