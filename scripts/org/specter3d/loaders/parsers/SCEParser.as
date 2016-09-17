package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import flash.utils.ByteArray;
   import org.specter3d.utils.Tools;
   import away3d.events.AssetEvent;
   import flash.net.registerClassAlias;
   import org.specter3d.configs.map.MapEffectVo;
   
   public class SCEParser extends ParserBase
   {
       
      
      public function SCEParser()
      {
         registerClassAlias("org.specter3d.configs.map.MapEffectVo",MapEffectVo);
         super("binary");
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc2_:ByteArray = getByteData();
         var _loc4_:int = Tools.importingFileHead(_loc2_);
         if(_loc4_ != _loc2_.bytesAvailable || _loc4_ == 0)
         {
            finishParsing();
            return false;
         }
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.endian = "littleEndian";
         _loc2_.readBytes(_loc1_);
         _loc1_.uncompress();
         var _loc3_:Array = _loc1_.readObject() as Array;
         if(hasEventListener("assetComplete"))
         {
            dispatchEvent(new AssetEvent("assetComplete",_loc3_));
         }
         finishParsing();
         return false;
      }
   }
}
