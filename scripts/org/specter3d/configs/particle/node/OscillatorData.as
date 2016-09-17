package org.specter3d.configs.particle.node
{
   import org.specter3d.configs.particle.BaseData;
   
   public class OscillatorData extends BaseData
   {
       
      
      public var cycleDuration:Number = 1;
      
      public var oscillatorX:Number = 0;
      
      public var oscillatorY:Number = 0;
      
      public var oscillatorZ:Number = 0;
      
      public function OscillatorData()
      {
         super();
      }
      
      override public function clone() : BaseData
      {
         var _loc1_:OscillatorData = new OscillatorData();
         _loc1_.usesNode = usesNode;
         _loc1_.cycleDuration = cycleDuration;
         _loc1_.oscillatorX = oscillatorX;
         _loc1_.oscillatorY = oscillatorY;
         _loc1_.oscillatorZ = oscillatorZ;
         return _loc1_;
      }
   }
}
