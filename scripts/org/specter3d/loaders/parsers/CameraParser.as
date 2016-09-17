package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import flash.utils.ByteArray;
   import org.specter3d.utils.Tools;
   import org.specter3d.configs.camera.CameraFileVo;
   import away3d.events.AssetEvent;
   import flash.net.registerClassAlias;
   import org.specter3d.configs.camera.CameraVO;
   
   public class CameraParser extends ParserBase
   {
       
      
      public function CameraParser()
      {
         super("binary");
         registerClassAlias("org.specter3d.configs.camera.CameraFileVo",CameraFileVo);
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc3_:ByteArray = getByteData();
         var _loc2_:int = Tools.importingFileHead(_loc3_);
         if(_loc2_ != _loc3_.bytesAvailable)
         {
            throw new Error("unknown file type.");
         }
         var _loc1_:ByteArray = new ByteArray();
         _loc3_.readBytes(_loc1_);
         _loc1_.uncompress();
         _loc1_.endian = "littleEndian";
         var _loc4_:CameraFileVo = _loc1_.readObject() as CameraFileVo;
         if(hasEventListener("assetComplete"))
         {
            dispatchEvent(new AssetEvent("assetComplete",_loc4_));
         }
         finishParsing();
         return false;
      }
   }
}
