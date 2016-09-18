package nslm2.modules.logModules.tests
{
   import org.specter3d.display.Specter3D;
   import away3d.lights.DirectionalLight;
   import away3d.entities.Mesh;
   import away3d.materials.ColorMaterial;
   import away3d.materials.MaterialBase;
   import away3d.entities.Entity;
   import away3d.primitives.SphereGeometry;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class LightEntity extends Specter3D
   {
       
      
      private var light:DirectionalLight;
      
      private var mesh:Mesh;
      
      private var color:uint;
      
      public function LightEntity(param1:DirectionalLight)
      {
         super(null);
         this.light = param1;
         mesh = new Mesh(null);
         mesh.z = -400;
         mesh.renderLayer = Entity.TOP_LAYER;
         mesh.geometry = new SphereGeometry(15);
         color = param1.color;
         changeColor();
         this.addChild(mesh);
         TimerManager.ins.doLoop(1,this.onLoop);
      }
      
      private function onLoop() : void
      {
         if(this.light)
         {
            this.eulers = this.light.eulers;
            if(this.color != this.light.color)
            {
               color = this.light.color;
               this.changeColor();
            }
         }
      }
      
      private function changeColor() : void
      {
         var _loc1_:MaterialBase = new ColorMaterial(color);
         _loc1_.alphaPremultiplied = true;
         _loc1_.bothSides = true;
         mesh.material = _loc1_;
      }
   }
}
