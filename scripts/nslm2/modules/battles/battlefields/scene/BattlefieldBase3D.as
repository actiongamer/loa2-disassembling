package nslm2.modules.battles.battlefields.scene
{
   import nslm2.modules.scenes.commons.ScenePlayer3D;
   import flash.geom.Point;
   import nslm2.modules.scenes.commons.SceneModel;
   import away3d.containers.ObjectContainer3D;
   
   public class BattlefieldBase3D extends ScenePlayer3D
   {
       
      
      public function BattlefieldBase3D(param1:ObjectContainer3D = null)
      {
         super(param1);
      }
      
      public function initName() : void
      {
      }
      
      override protected function countRunPath(param1:int, param2:int) : Array
      {
         var _loc3_:Point = this.pos2d.clone();
         var _loc4_:Array = SceneModel.ins.findPathMed.getMovePath(_loc3_,new Point(param1,param2),false,side);
         return _loc4_;
      }
   }
}
