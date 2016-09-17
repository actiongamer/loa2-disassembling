package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import org.specter3d.configs.map.MapBinVo;
   import flash.utils.ByteArray;
   import away3d.events.AssetEvent;
   
   public class MapBinParser extends ParserBase
   {
       
      
      public var mapVo:MapBinVo;
      
      public function MapBinParser()
      {
         super("binary");
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc1_:ByteArray = getByteData();
         _loc1_.uncompress();
         mapVo = new MapBinVo();
         mapVo.width = _loc1_.readInt();
         mapVo.height = _loc1_.readInt();
         mapVo.tileWidth = _loc1_.readInt();
         mapVo.tileHeight = _loc1_.readInt();
         readTiles(_loc1_,1);
         readTiles(_loc1_,16);
         if(hasEventListener("assetComplete"))
         {
            dispatchEvent(new AssetEvent("assetComplete",mapVo));
         }
         finishParsing();
         return false;
      }
      
      private function readTiles(param1:ByteArray, param2:int) : void
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:int = param1.readInt();
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = param1.readInt();
            if(false == mapVo.tileDict.hasOwnProperty(_loc4_))
            {
               mapVo.tileDict[_loc4_] = 0;
            }
            var _loc6_:* = _loc4_;
            var _loc7_:* = mapVo.tileDict[_loc6_] + param2;
            mapVo.tileDict[_loc6_] = _loc7_;
            _loc5_++;
         }
      }
   }
}
