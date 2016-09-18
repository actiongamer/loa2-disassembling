package nslm2.common.ui.components.comp3ds.lightAndShadows
{
   import away3d.lights.DirectionalLight;
   import away3d.containers.ObjectContainer3D;
   
   public class LightAndShadowCtrl3 extends LightAndShadowCtrl
   {
       
      
      public function LightAndShadowCtrl3(param1:ObjectContainer3D)
      {
         super(param1,2);
      }
      
      override protected function configLight(param1:DirectionalLight, param2:int) : void
      {
         super.configLight(param1,param2);
         switch(int(param2))
         {
            case 0:
               param1.rotationX = 31;
               param1.rotationY = 334;
               param1.rotationZ = -9;
               param1.color = 16777215;
               param1.ambientColor = 16777215;
               param1.ambient = 0.1;
               param1.diffuse = 0.75;
               param1.specular = 0.74;
               break;
            case 1:
               param1.rotationX = 193;
               param1.rotationY = 283;
               param1.rotationZ = -41;
               param1.color = 16777215;
               param1.ambientColor = 16777215;
               param1.ambient = 0;
               param1.diffuse = 0.3;
               param1.specular = 0.6;
         }
      }
   }
}
