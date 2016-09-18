package org.specter3d.configs.particle
{
   public class SpecterEffectData
   {
      
      public static const DISPOSE_TYPE_NONE:int = 0;
      
      public static const DISPOSE_TYPE_FADE_OUT:int = 1;
       
      
      public var scale:Number = 1;
      
      public var timeOffset:Number = 0;
      
      public var disposeType:int = 0;
      
      public var lastTime:Number = 0;
      
      public var emmiterArr:Vector.<org.specter3d.configs.particle.EmmiterData>;
      
      public function SpecterEffectData()
      {
         super();
      }
   }
}
