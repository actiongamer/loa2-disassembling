package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import flash.utils.ByteArray;
   import com.spriteSheet.SpriteSheetData;
   import away3d.events.AssetEvent;
   import flash.net.registerClassAlias;
   import flash.utils.Dictionary;
   import com.spriteSheet.SpriteFrame;
   
   public class SSDParser extends ParserBase
   {
       
      
      public function SSDParser()
      {
         registerClassAlias("flash.utils.ByteArray",ByteArray);
         registerClassAlias("flash.utils.Dictionary",Dictionary);
         registerClassAlias("com.spriteSheet.SpriteSheetData",SpriteSheetData);
         registerClassAlias("com.spriteSheet.SpriteFrame",SpriteFrame);
         super("binary");
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc2_:ByteArray = getByteData();
         var _loc1_:SpriteSheetData = _loc2_.readObject() as SpriteSheetData;
         if(_loc1_ && hasEventListener("assetComplete"))
         {
            dispatchEvent(new AssetEvent("assetComplete",_loc1_));
         }
         return true;
      }
   }
}
