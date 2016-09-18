package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import flash.utils.ByteArray;
   import morn.core.utils.BaUtil;
   import com.mz.core.mgrs.resMgrs.ZipBaVo;
   import away3d.events.AssetEvent;
   
   public class BaParser extends ParserBase
   {
       
      
      public function BaParser()
      {
         super("binary");
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc2_:ByteArray = getByteData();
         var _loc1_:Vector.<ZipBaVo> = BaUtil.unzipArr(_loc2_);
         if(hasEventListener("assetComplete"))
         {
            dispatchEvent(new AssetEvent("assetComplete",_loc1_));
         }
         finishParsing();
         return false;
      }
   }
}
