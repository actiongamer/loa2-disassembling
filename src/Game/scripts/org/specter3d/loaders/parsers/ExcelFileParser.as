package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import flash.utils.ByteArray;
   import away3d.events.AssetEvent;
   
   public class ExcelFileParser extends ParserBase
   {
       
      
      public function ExcelFileParser()
      {
         super("binary");
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc3_:ByteArray = getByteData();
         var _loc1_:ByteArray = new ByteArray();
         _loc3_.readBytes(_loc1_);
         _loc1_.uncompress();
         var _loc2_:Array = _loc1_.readObject() as Array;
         if(hasEventListener("assetComplete"))
         {
            dispatchEvent(new AssetEvent("assetComplete",_loc2_));
         }
         finishParsing();
         return false;
      }
   }
}
