package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import flash.utils.ByteArray;
   import away3d.events.AssetEvent;
   import flash.net.registerClassAlias;
   import org.specter3d.configs.ui.UIEditorVo;
   
   public class UIEParsers extends ParserBase
   {
       
      
      public function UIEParsers()
      {
         registerClassAlias("org.specter3d.configs.ui.UIEditorVo",UIEditorVo);
         super("binary");
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc1_:ByteArray = getByteData();
         _loc1_.endian = "littleEndian";
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
