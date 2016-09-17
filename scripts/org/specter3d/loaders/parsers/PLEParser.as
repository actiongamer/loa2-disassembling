package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import flash.utils.ByteArray;
   import org.specter3d.utils.Tools;
   import flash.utils.getTimer;
   import org.specter3d.display.particle.EffectManager;
   import away3d.events.AssetEvent;
   import org.specter3d.configs.particle.SpecterParticleData;
   import flash.net.registerClassAlias;
   import flash.geom.ColorTransform;
   import org.specter3d.display.particle.SpecterLine;
   import org.specter3d.configs.particle.MeshData;
   import org.specter3d.configs.particle.node.RotationData;
   import org.specter3d.configs.particle.node.FollowData;
   import org.specter3d.configs.particle.node.ScaleData;
   import org.specter3d.configs.particle.node.ColorData;
   import org.specter3d.configs.particle.node.OrbitData;
   import org.specter3d.configs.particle.node.BezierData;
   import org.specter3d.configs.particle.node.OscillatorData;
   import org.specter3d.configs.particle.node.UVSheetData;
   import org.specter3d.configs.particle.node.UVScrollData;
   import org.specter3d.configs.particle.KeyFrameData;
   
   public class PLEParser extends ParserBase
   {
       
      
      public function PLEParser()
      {
         super("binary");
         registerClassAlias("flash.geom.ColorTransform",ColorTransform);
         registerClassAlias("org.specter3d.display.particle.SpecterLine",SpecterLine);
         registerClassAlias("org.specter3d.configs.particle.MeshData",MeshData);
         registerClassAlias("org.specter3d.configs.particle.node.RotationData",RotationData);
         registerClassAlias("org.specter3d.configs.particle.node.FollowData",FollowData);
         registerClassAlias("org.specter3d.configs.particle.node.ScaleData",ScaleData);
         registerClassAlias("org.specter3d.configs.particle.node.ColorData",ColorData);
         registerClassAlias("org.specter3d.configs.particle.node.OrbitData",OrbitData);
         registerClassAlias("org.specter3d.configs.particle.node.BezierData",BezierData);
         registerClassAlias("org.specter3d.configs.particle.node.OscillatorData",OscillatorData);
         registerClassAlias("org.specter3d.configs.particle.node.UVSheetData",UVSheetData);
         registerClassAlias("org.specter3d.configs.particle.node.UVScrollData",UVScrollData);
         registerClassAlias("org.specter3d.configs.particle.KeyFrameData",KeyFrameData);
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc6_:ByteArray = getByteData();
         var _loc3_:int = Tools.importingFileHead(_loc6_);
         if(_loc3_ != _loc6_.bytesAvailable)
         {
            throw new Error("unknown file type.");
         }
         var _loc2_:Number = getTimer();
         var _loc1_:ByteArray = new ByteArray();
         _loc6_.readBytes(_loc1_);
         _loc1_.uncompress();
         _loc1_.endian = "littleEndian";
         var _loc4_:Object = getData(_loc1_);
         var _loc5_:Number = getTimer() - _loc2_;
         EffectManager.parserMax = Math.max(EffectManager.parserMax,_loc5_);
         EffectManager.parserTime = EffectManager.parserTime + _loc5_;
         EffectManager.parserCount++;
         if(hasEventListener("assetComplete"))
         {
            dispatchEvent(new AssetEvent("assetComplete",_loc4_));
         }
         finishParsing();
         return false;
      }
      
      protected function getData(param1:ByteArray) : Object
      {
         return param1.readObject() as SpecterParticleData;
      }
   }
}
