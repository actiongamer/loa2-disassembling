package away3d.core.traverse
{
   import away3d.core.base.IRenderable;
   import away3d.materials.MaterialBase;
   import away3d.core.data.RenderableListItem;
   import away3d.lights.LightBase;
   import away3d.lights.DirectionalLight;
   import away3d.lights.PointLight;
   import away3d.lights.LightProbe;
   
   public class ShadowCasterCollector extends EntityCollector
   {
       
      
      public function ShadowCasterCollector()
      {
         super();
      }
      
      override public function applyRenderable(param1:IRenderable) : void
      {
         var _loc2_:* = null;
         var _loc3_:MaterialBase = param1.material;
         if(param1.castsShadows && _loc3_)
         {
            _loc2_ = _renderableListItemPool.getItem();
            _loc2_.renderable = param1;
            _loc2_.next = _opaqueRenderableHead;
            _loc2_.zIndex = param1.zIndex;
            _loc2_.renderOrderId = _loc3_._depthPassId;
            _opaqueRenderableHead = _loc2_;
         }
      }
      
      override public function applyUnknownLight(param1:LightBase) : void
      {
      }
      
      override public function applyDirectionalLight(param1:DirectionalLight) : void
      {
      }
      
      override public function applyPointLight(param1:PointLight) : void
      {
      }
      
      override public function applyLightProbe(param1:LightProbe) : void
      {
      }
      
      override public function applySkyBox(param1:IRenderable) : void
      {
      }
   }
}
