package nslm2.modules.foundations.worldMap
{
   import nslm2.modules.scenes.commons.Unit3DBase;
   import flash.geom.Point;
   import away3d.containers.ObjectContainer3D;
   
   public class WorldMapUnit3D extends Unit3DBase
   {
       
      
      public function WorldMapUnit3D(param1:ObjectContainer3D = null)
      {
         super(param1);
      }
      
      override protected function countRunRo(param1:Point, param2:Point) : int
      {
         return 0;
      }
   }
}
