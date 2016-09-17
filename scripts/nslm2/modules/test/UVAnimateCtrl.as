package nslm2.modules.test
{
   import nslm2.common.ui.components.comp3ds.Image3D;
   import away3d.materials.TextureMaterial;
   
   public class UVAnimateCtrl
   {
       
      
      private var image:Image3D;
      
      private var speed:Number;
      
      private var offsetU:Number = 0;
      
      public function UVAnimateCtrl(param1:Image3D, param2:Number = 0.05)
      {
         super();
         image = param1;
         this.speed = param2;
      }
      
      public function start() : void
      {
         image.material.repeat = true;
         (image.material as TextureMaterial).animateUVs = true;
         offsetU = image.subMeshes[0].offsetU;
         App.timer.doLoop(20,this.onLoop);
      }
      
      private function onLoop() : void
      {
         offsetU = offsetU + speed;
         while(offsetU >= 1)
         {
            offsetU = offsetU - 1;
         }
         while(offsetU < 0)
         {
            offsetU = offsetU + 1;
         }
         image.subMeshes[0].offsetU = offsetU;
      }
   }
}
