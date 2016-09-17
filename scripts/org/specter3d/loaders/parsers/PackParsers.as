package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import flash.utils.ByteArray;
   import flash.events.Event;
   import away3d.events.AssetEvent;
   import flash.display.LoaderInfo;
   
   public class PackParsers extends ParserBase
   {
       
      
      private var _bytes:ByteArray;
      
      public function PackParsers()
      {
         super("binary");
      }
      
      override protected function proceedParsing() : Boolean
      {
         return false;
      }
      
      protected function onLoadBytesOver(param1:Event) : void
      {
         if(hasEventListener("assetComplete"))
         {
            dispatchEvent(new AssetEvent("assetComplete",(param1.currentTarget as LoaderInfo).content));
         }
         finishParsing();
      }
   }
}
