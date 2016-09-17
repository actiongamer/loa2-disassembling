package nslm2.modules.scenes.commons
{
   import flash.geom.Point;
   import away3d.containers.ObjectContainer3D;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class UIUnit3DS2 extends Unit3DBase
   {
       
      
      public function UIUnit3DS2(param1:ObjectContainer3D = null)
      {
         super(param1);
         this.inUI = true;
         this.useBigTex = true;
         this.buttonMode = true;
         this.moveSpeed = 200;
         this.box3D2.scaleAll = DefindConsts.SCENE_AVATAR_SCALE_UI / DefindConsts.SCENE_AVATAR_SCALE_SCENE;
      }
      
      public function moveToAndFaceFoward(param1:Point) : void
      {
         if(!param1.equals(this.pos2d))
         {
            this.runTo(param1.x,param1.y,moveToRunHandler);
         }
      }
      
      private function moveToRunHandler() : void
      {
         this.setRotation(-90,true);
      }
   }
}
