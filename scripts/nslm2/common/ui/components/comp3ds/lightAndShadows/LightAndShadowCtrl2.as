package nslm2.common.ui.components.comp3ds.lightAndShadows
{
   import away3d.lights.DirectionalLight;
   import away3d.containers.ObjectContainer3D;
   
   public class LightAndShadowCtrl2 extends LightAndShadowCtrl
   {
       
      
      public function LightAndShadowCtrl2(param1:ObjectContainer3D)
      {
         super(param1);
      }
      
      override protected function configLight(param1:DirectionalLight, param2:int) : void
      {
         super.configLight(param1,param2);
         switch(int(param2))
         {
            case 0:
               param1.rotationX = 84;
               param1.rotationY = -44;
               param1.rotationZ = 0;
               break;
            case 1:
               param1.rotationX = 33;
               param1.rotationY = 343;
               param1.rotationZ = -40;
         }
      }
   }
}
