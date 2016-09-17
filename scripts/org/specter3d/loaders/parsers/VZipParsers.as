package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import flash.utils.ByteArray;
   import org.specter3d.debug.DevLog;
   import nochump.util.zip.ZipFile;
   import nochump.util.zip.ZipEntry;
   import org.specter3d.loaders.AssetLib;
   import away3d.events.AssetEvent;
   
   public class VZipParsers extends ParserBase
   {
       
      
      private var _bytes:ByteArray;
      
      public function VZipParsers()
      {
         super("binary");
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc9_:int = 0;
         var _loc8_:* = null;
         var _loc2_:* = null;
         var _loc7_:* = null;
         var _loc1_:* = null;
         var _loc6_:int = 0;
         var _loc4_:* = null;
         if(_bytes)
         {
            return false;
         }
         DevLog.debug("kongjl","解析版本文件=" + this.name);
         _bytes = getByteData();
         var _loc3_:ZipFile = new ZipFile(_bytes);
         var _loc5_:Array = _loc3_.entries;
         _loc9_ = 0;
         while(_loc9_ < _loc5_.length)
         {
            _loc8_ = _loc5_[_loc9_] as ZipEntry;
            if(!_loc8_.isDirectory())
            {
               _loc2_ = _loc3_.getInput(_loc3_.getEntry(_loc8_.name));
               _loc7_ = _loc2_.readUTFBytes(_loc2_.bytesAvailable);
               _loc1_ = _loc7_.split("\r\n");
               _loc6_ = 0;
               while(_loc6_ < _loc1_.length)
               {
                  if(_loc1_[_loc6_] != null && _loc1_[_loc6_] != "")
                  {
                     _loc4_ = _loc1_[_loc6_].split("=");
                     AssetLib.resourceHashes.put(String(AssetLib.relativePath + _loc4_[0]),_loc4_[1]);
                  }
                  _loc6_++;
               }
            }
            _loc9_++;
         }
         if(hasEventListener("assetComplete"))
         {
            dispatchEvent(new AssetEvent("assetComplete","true"));
         }
         finishParsing();
         _bytes.clear();
         _bytes = null;
         return false;
      }
   }
}
