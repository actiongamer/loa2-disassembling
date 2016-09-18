package away3d.core.render
{
   import away3d.materials.MaterialBase;
   import away3d.core.traverse.EntityCollector;
   import flash.display3D.textures.TextureBase;
   import away3d.core.data.RenderableListItem;
   import away3d.cameras.Camera3D;
   
   public class LightMapRenderer extends RendererBase
   {
       
      
      private var _activeMaterial:MaterialBase;
      
      public function LightMapRenderer(param1:Boolean = false)
      {
         super(param1);
      }
      
      override protected function draw(param1:EntityCollector, param2:TextureBase) : void
      {
         _context.setBlendFactors("one","one");
         _context.setCulling("none");
         _context.setDepthTest(false,"always");
         drawRenderables(param1.lightMapRenderableHead,param1);
         if(_activeMaterial)
         {
            _activeMaterial.deactivateForLightMap(_stage3DProxy);
         }
         _activeMaterial = null;
      }
      
      private function drawRenderables(param1:RenderableListItem, param2:EntityCollector) : void
      {
         var _loc3_:* = null;
         var _loc4_:Camera3D = param2.camera;
         while(param1)
         {
            _activeMaterial = param1.renderable.material;
            _activeMaterial.activateForLightMap(_stage3DProxy,_loc4_);
            _loc3_ = param1;
            do
            {
               _activeMaterial.renderLightMap(_loc3_.renderable,_stage3DProxy,_loc4_);
               _loc3_ = _loc3_.next;
            }
            while(_loc3_ && _loc3_.renderable.material == _activeMaterial);
            
            _activeMaterial.deactivateForLightMap(_stage3DProxy);
            param1 = _loc3_;
         }
      }
   }
}
