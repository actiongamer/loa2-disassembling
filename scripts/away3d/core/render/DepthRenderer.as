package away3d.core.render
{
   import away3d.materials.MaterialBase;
   import away3d.core.traverse.EntityCollector;
   import flash.display3D.textures.TextureBase;
   import flash.geom.Rectangle;
   import away3d.core.math.Plane3D;
   import away3d.cameras.Camera3D;
   import away3d.core.data.RenderableListItem;
   import away3d.core.base.IRenderable;
   import away3d.entities.Entity;
   
   public class DepthRenderer extends RendererBase
   {
       
      
      private var _activeMaterial:MaterialBase;
      
      private var _renderBlended:Boolean;
      
      private var _distanceBased:Boolean;
      
      private var _disableColor:Boolean;
      
      public function DepthRenderer(param1:Boolean = false, param2:Boolean = false)
      {
         super();
         _renderBlended = param1;
         _distanceBased = param2;
         _backgroundR = 1;
         _backgroundG = 1;
         _backgroundB = 1;
      }
      
      public function get disableColor() : Boolean
      {
         return _disableColor;
      }
      
      public function set disableColor(param1:Boolean) : void
      {
         _disableColor = param1;
      }
      
      override function set backgroundR(param1:Number) : void
      {
      }
      
      override function set backgroundG(param1:Number) : void
      {
      }
      
      override function set backgroundB(param1:Number) : void
      {
      }
      
      function renderCascades(param1:EntityCollector, param2:TextureBase, param3:uint, param4:Vector.<Rectangle>, param5:Vector.<Plane3D>, param6:Vector.<Camera3D>) : void
      {
         var _loc8_:* = 0;
         _renderTarget = param2;
         _renderTargetSurface = 0;
         _renderableSorter.sort(param1);
         _stage3DProxy.setRenderTarget(param2,true,0);
         _context.clear(1,1,1,1,1,0);
         _context.setBlendFactors("one","zero");
         _context.setDepthTest(true,"less");
         var _loc7_:RenderableListItem = param1.opaqueRenderableHead;
         _loc8_ = uint(0);
         while(_loc8_ < param3)
         {
            _stage3DProxy.scissorRect = param4[_loc8_];
            drawCascadeRenderables(_loc7_,param6[_loc8_]);
            _loc8_++;
         }
         if(_activeMaterial)
         {
            _activeMaterial.deactivateForDepth(_stage3DProxy);
         }
         _activeMaterial = null;
         _context.setDepthTest(false,"lessEqual");
         _stage3DProxy.scissorRect = null;
      }
      
      private function drawCascadeRenderables(param1:RenderableListItem, param2:Camera3D) : void
      {
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         while(param1)
         {
            _loc3_ = param1.renderable;
            _loc4_ = _loc3_.sourceEntity;
            _loc4_.pushModelViewProjection(param2,false);
            if(_loc4_.bounds.isInFrustum(_loc4_.getModelViewProjectionUnsafe()))
            {
               _loc5_ = _loc3_.material;
               if(_activeMaterial != _loc5_)
               {
                  if(_activeMaterial)
                  {
                     _activeMaterial.deactivateForDepth(_stage3DProxy);
                  }
                  _activeMaterial = _loc5_;
                  _activeMaterial.activateForDepth(_stage3DProxy,param2,false,1,1);
               }
               _activeMaterial.renderDepth(_loc3_,_stage3DProxy,param2);
            }
            _loc4_.popModelViewProjection();
            param1 = param1.next;
         }
      }
      
      override protected function draw(param1:EntityCollector, param2:TextureBase) : void
      {
         _context.setBlendFactors("one","zero");
         _context.setDepthTest(true,"less");
         drawRenderables(param1.opaqueRenderableHead,param1);
         if(_disableColor)
         {
            _context.setColorMask(false,false,false,false);
         }
         if(_renderBlended)
         {
            drawRenderables(param1.blendedRenderableHead,param1);
         }
         if(_activeMaterial)
         {
            _activeMaterial.deactivateForDepth(_stage3DProxy);
         }
         if(_disableColor)
         {
            _context.setColorMask(true,true,true,true);
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
            if(_disableColor && _activeMaterial.hasDepthAlphaThreshold())
            {
               _loc3_ = param1;
               do
               {
                  _loc3_ = _loc3_.next;
               }
               while(_loc3_ && _loc3_.renderable.material == _activeMaterial);
               
            }
            else
            {
               _activeMaterial.activateForDepth(_stage3DProxy,_loc4_,_distanceBased,_textureRatioX,_textureRatioY);
               _loc3_ = param1;
               do
               {
                  _activeMaterial.renderDepth(_loc3_.renderable,_stage3DProxy,_loc4_);
                  _loc3_ = _loc3_.next;
               }
               while(_loc3_ && _loc3_.renderable.material == _activeMaterial);
               
               _activeMaterial.deactivateForDepth(_stage3DProxy);
            }
            param1 = _loc3_;
         }
      }
   }
}
