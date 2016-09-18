package org.specter3d.configs.particle.node
{
   import org.specter3d.configs.particle.BaseData;
   
   public class UVScrollData extends BaseData
   {
       
      
      public var speedU:Number = 1;
      
      public var speedV:Number = 1;
      
      public var rotation:Number = 0;
      
      public function UVScrollData()
      {
         super();
      }
      
      override public function clone() : BaseData
      {
         var _loc1_:UVScrollData = new UVScrollData();
         _loc1_.usesNode = usesNode;
         _loc1_.speedU = speedU;
         _loc1_.speedV = speedV;
         return _loc1_;
      }
   }
}
