package org.specter3d.configs.map
{
   import org.specter3d.geom.Triangle;
   import org.specter3d.geom.Line2D;
   import org.specter3d.geom.Polygon;
   
   public class MapVo
   {
       
      
      public var sceneId:String = "";
      
      public var sceneName:String = "";
      
      public var sceneMaxWidth:Number = 0;
      
      public var sceneMaxHeight:Number = 0;
      
      public var triangle:Vector.<Triangle>;
      
      public var line2D:Vector.<Line2D>;
      
      public var polygon:Vector.<Polygon>;
      
      public var perspective:Vector.<Polygon>;
      
      public var persTriangle:Vector.<Triangle>;
      
      public var swimPolygon:Vector.<Polygon>;
      
      public var swimTriangle:Vector.<Triangle>;
      
      public function MapVo()
      {
         super();
      }
   }
}
