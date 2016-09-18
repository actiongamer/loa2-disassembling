package nslm2.modules.test
{
   import nslm2.common.ui.components.comp3ds.Image3D;
   
   public class AutoRotationCtrl
   {
       
      
      private var image:Image3D;
      
      private var speed:Number;
      
      public function AutoRotationCtrl(param1:Image3D, param2:Number = 0.05)
      {
         super();
         image = param1;
         this.speed = param2;
      }
      
      public function start() : void
      {
         App.timer.doLoop(20,this.onLoop);
      }
      
      private function onLoop() : void
      {
         image.rotationY = image.rotationY + 1;
      }
   }
}
