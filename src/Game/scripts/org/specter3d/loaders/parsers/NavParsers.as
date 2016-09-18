package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import flash.utils.ByteArray;
   import org.specter3d.utils.Tools;
   import org.specter3d.configs.map.MapVo;
   import away3d.events.AssetEvent;
   import flash.net.registerClassAlias;
   import org.specter3d.geom.Vector2f;
   import org.specter3d.geom.Triangle;
   import org.specter3d.geom.Polygon;
   import org.specter3d.geom.Node;
   import org.specter3d.geom.Line2D;
   
   public class NavParsers extends ParserBase
   {
       
      
      public function NavParsers()
      {
         registerClassAlias("org.specter3d.geom.Vector2f",Vector2f);
         registerClassAlias("org.specter3d.geom.Triangle",Triangle);
         registerClassAlias("org.specter3d.geom.Polygon",Polygon);
         registerClassAlias("org.specter3d.geom.Node",Node);
         registerClassAlias("org.specter3d.geom.Line2D",Line2D);
         registerClassAlias("VecVector2f",Vector.<Vector2f> as Class);
         registerClassAlias("VecTriangle",Vector.<Triangle> as Class);
         registerClassAlias("VecLine2D",Vector.<Line2D> as Class);
         registerClassAlias("VecPolygon",Vector.<Polygon> as Class);
         registerClassAlias("org.specter3d.configs.map.MapVo",MapVo);
         super("binary");
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc2_:ByteArray = getByteData();
         var _loc3_:int = Tools.importingFileHead(_loc2_);
         if(_loc3_ != _loc2_.bytesAvailable || _loc3_ == 0)
         {
            finishParsing();
            return false;
         }
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.endian = "littleEndian";
         _loc2_.readBytes(_loc1_);
         _loc1_.uncompress();
         var _loc4_:MapVo = _loc1_.readObject() as MapVo;
         if(hasEventListener("assetComplete"))
         {
            dispatchEvent(new AssetEvent("assetComplete",_loc4_));
         }
         finishParsing();
         return false;
      }
   }
}
