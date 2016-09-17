package org.specter3d.configs.map
{
   import flash.utils.Dictionary;
   
   public class MapBinVo
   {
      
      public static const SHELTER:uint = 1;
      
      public static const SWIM:uint = 16;
       
      
      public var width:int = 0;
      
      public var height:int = 0;
      
      public var tileWidth:int = 0;
      
      public var tileHeight:int = 0;
      
      public var tileDict:Dictionary;
      
      public function MapBinVo()
      {
         tileDict = new Dictionary();
         super();
      }
   }
}
