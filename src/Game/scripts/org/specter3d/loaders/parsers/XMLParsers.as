package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import flash.utils.ByteArray;
   import away3d.events.AssetEvent;
   
   public class XMLParsers extends ParserBase
   {
       
      
      private var _bytes:ByteArray;
      
      public function XMLParsers()
      {
         super("binary");
      }
      
      override protected function proceedParsing() : Boolean
      {
         if(_bytes)
         {
            return false;
         }
         _bytes = getByteData();
         var _loc1_:String = _bytes.readMultiByte(_bytes.length,"utf-8");
         _loc1_ = _loc1_.substr(_loc1_.indexOf("<"),_loc1_.lastIndexOf(">") + 1);
         var _loc2_:XML = new XML(_loc1_);
         if(hasEventListener("assetComplete"))
         {
            dispatchEvent(new AssetEvent("assetComplete",_loc2_));
         }
         finishParsing();
         _bytes.clear();
         _bytes = null;
         return false;
      }
   }
}
