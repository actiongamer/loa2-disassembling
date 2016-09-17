package away3d.core.traverse
{
   import away3d.core.base.IRenderable;
   import away3d.materials.MaterialBase;
   import away3d.core.data.RenderableListItem;
   import away3d.entities.Entity;
   
   public class LightCasterCollector extends EntityCollector
   {
       
      
      public function LightCasterCollector()
      {
         super();
      }
      
      override public function applySkyBox(param1:IRenderable) : void
      {
      }
      
      override public function applyRenderable(param1:IRenderable) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         _numTriangles = _numTriangles + param1.numTriangles;
         _loc3_ = param1.material;
         if(_loc3_)
         {
            _loc2_ = _renderableListItemPool.getItem();
            _loc2_.renderable = param1;
            _loc2_.next = _opaqueRenderableHead;
            _loc2_.zIndex = param1.zIndex;
            _loc2_.renderOrderId = param1.material._uniqueId;
            _loc2_.renderPriority = param1.material.renderPriority;
            if(param1.sourceEntity.renderLayer == Entity.SCENELIGHT_LAYER)
            {
               _loc2_.next = _lightMapRenderableHead;
               _lightMapRenderableHead = _loc2_;
               _numTexLights = _numTexLights + 1;
            }
         }
      }
   }
}
