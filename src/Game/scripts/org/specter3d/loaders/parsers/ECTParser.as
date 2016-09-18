package org.specter3d.loaders.parsers
{
   import flash.utils.ByteArray;
   import org.specter3d.configs.particle.SpecterEffectData;
   import flash.net.registerClassAlias;
   import org.specter3d.configs.particle.EmmiterData;
   import org.specter3d.configs.particle.KeyFrameData;
   import flash.geom.Vector3D;
   
   public class ECTParser extends PLEParser
   {
       
      
      public function ECTParser()
      {
         super();
         registerClassAlias("org.specter3d.configs.particle.SpecterEffectData",SpecterEffectData);
         registerClassAlias("org.specter3d.configs.particle.EmmiterData",EmmiterData);
         registerClassAlias("org.specter3d.configs.particle.KeyFrameData",KeyFrameData);
      }
      
      override protected function getData(param1:ByteArray) : Object
      {
         return param1.readObject() as SpecterEffectData;
      }
   }
}
