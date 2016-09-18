package nslm2.modules.funnies.teamGuajiScenes.subpalaceBoss
{
   import nslm2.modules.scenes.commons.SceneUnit3D;
   import nslm2.mgrs.MouseIconManager;
   import away3d.containers.ObjectContainer3D;
   
   public class SubpalaceBossUnit3D extends SceneUnit3D
   {
       
      
      public function SubpalaceBossUnit3D(param1:ObjectContainer3D = null)
      {
         super(param1);
         overMethodEnabled = true;
         overMethodColor = 16723968;
      }
      
      override protected function setMouseCursorOver() : void
      {
         MouseIconManager.ins.addMouseFor3D(this);
         MouseIconManager.ins.showSpecialMouseCursor("mouse_fight_big");
      }
   }
}
