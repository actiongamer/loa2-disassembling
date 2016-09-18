package away3d.core.render
{
   import away3d.materials.MaterialBase;
   import away3d.containers.View3D;
   import away3d.core.managers.Stage3DProxy;
   import §away3d:arcane§.stage3DProxy;
   import away3d.core.traverse.EntityCollector;
   import flash.display3D.textures.TextureBase;
   import flash.geom.Rectangle;
   import away3d.filters.Filter3DBase;
   import away3d.filters.HeatFilter3D;
   import away3d.lights.DirectionalLight;
   import away3d.lights.PointLight;
   import away3d.lights.LightBase;
   import away3d.lights.shadowmaps.ShadowMapperBase;
   import flash.display3D.Context3DClearMask;
   import away3d.core.base.IRenderable;
   import away3d.cameras.Camera3D;
   import away3d.core.data.RenderableListItem;
   
   public class DefaultRenderer extends RendererBase
   {
      
      private static var RTT_PASSES:int = 1;
      
      private static var SCREEN_PASSES:int = 2;
      
      private static var ALL_PASSES:int = 3;
       
      
      private var _activeMaterial:MaterialBase;
      
      private var _distanceRenderer:away3d.core.render.DepthRenderer;
      
      private var _depthRenderer:away3d.core.render.DepthRenderer;
      
      private var _lightMapRenderer:away3d.core.render.LightMapRenderer;
      
      private var _view3D:View3D;
      
      public function DefaultRenderer(param1:View3D = null)
      {
         super();
         _depthRenderer = new away3d.core.render.DepthRenderer();
         _distanceRenderer = new away3d.core.render.DepthRenderer(false,true);
         _lightMapRenderer = new away3d.core.render.LightMapRenderer();
         _lightMapRenderer.backgroundR = 0.1;
         _lightMapRenderer.backgroundG = 0.1;
         _lightMapRenderer.backgroundB = 0.1;
         _view3D = param1;
      }
      
      public function get lightMapRenderer() : away3d.core.render.LightMapRenderer
      {
         return _lightMapRenderer;
      }
      
      override function set stage3DProxy(param1:Stage3DProxy) : void
      {
         .super.stage3DProxy = param1;
         var _loc2_:* = param1;
         _depthRenderer.stage3DProxy = _loc2_;
         _loc2_ = _loc2_;
         _distanceRenderer.stage3DProxy = _loc2_;
         _lightMapRenderer.stage3DProxy = _loc2_;
      }
      
      override protected function executeRender(param1:EntityCollector, param2:TextureBase = null, param3:Rectangle = null, param4:int = 0) : void
      {
         var _loc5_:* = null;
         updateLights(param1);
         if(_view3D && _view3D.filters3d)
         {
            var _loc7_:int = 0;
            var _loc6_:* = _view3D.filters3d;
            for each(_loc5_ in _view3D.filters3d)
            {
               if(_loc5_ is HeatFilter3D)
               {
                  _loc5_.filterRender(_stage3DProxy,param1,_textureRatioX,_textureRatioY);
                  break;
               }
            }
         }
         if(param2)
         {
            drawRenderables(param1.opaqueRenderableHead,param1,RTT_PASSES);
            drawRenderables(param1.blendedRenderableHead,param1,RTT_PASSES);
         }
         super.executeRender(param1,param2,param3,param4);
      }
      
      private function updateLights(param1:EntityCollector) : void
      {
         var _loc7_:* = 0;
         var _loc4_:* = 0;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc2_:Vector.<DirectionalLight> = param1.directionalLights;
         var _loc3_:Vector.<PointLight> = param1.pointLights;
         _loc4_ = uint(_loc2_.length);
         _loc7_ = uint(0);
         while(_loc7_ < _loc4_)
         {
            _loc6_ = _loc2_[_loc7_];
            if(_loc6_.castsLightMap && _loc6_.visible)
            {
               _loc6_.lightMapper.renderLightMap(_stage3DProxy,param1,_lightMapRenderer);
            }
            _loc7_++;
         }
         _loc4_ = uint(_loc2_.length);
         _loc7_ = uint(0);
         while(_loc7_ < _loc4_)
         {
            _loc6_ = _loc2_[_loc7_];
            _loc5_ = _loc6_.shadowMapper;
            if(_loc6_.castsShadows && (_loc5_.autoUpdateShadows || _loc5_._shadowsInvalid))
            {
               _loc5_.renderDepthMap(_stage3DProxy,param1,_depthRenderer);
            }
            _loc7_++;
         }
         _loc4_ = uint(_loc3_.length);
         _loc7_ = uint(0);
         while(_loc7_ < _loc4_)
         {
            _loc6_ = _loc3_[_loc7_];
            _loc5_ = _loc6_.shadowMapper;
            if(_loc6_.castsShadows && (_loc5_.autoUpdateShadows || _loc5_._shadowsInvalid))
            {
               _loc5_.renderDepthMap(_stage3DProxy,param1,_distanceRenderer);
            }
            _loc7_++;
         }
      }
      
      override protected function draw(param1:EntityCollector, param2:TextureBase) : void
      {
         _context.setBlendFactors("one","zero");
         if(param1.skyBox)
         {
            if(_activeMaterial)
            {
               _activeMaterial.deactivate(_stage3DProxy);
            }
            _activeMaterial = null;
            _context.setDepthTest(false,"always");
            drawSkyBox(param1);
         }
         _context.setDepthTest(true,"lessEqual");
         var _loc3_:int = !!param2?SCREEN_PASSES:int(ALL_PASSES);
         drawRenderables(param1.mapHead,param1,_loc3_);
         drawRenderables(param1.decalRenderableHead,param1,_loc3_);
         _context.clear(0,0,0,1,1,0,Context3DClearMask.DEPTH);
         drawRenderables(param1.opaqueRenderableHead,param1,_loc3_);
         drawRenderables(param1.blendedRenderableHead,param1,_loc3_);
         drawRenderables(param1.effectRenderableHead,param1,_loc3_);
         _context.clear(0,0,0,1,1,0,Context3DClearMask.DEPTH);
         drawRenderables(param1.nameHead,param1,_loc3_);
         _context.setDepthTest(false,"lessEqual");
         if(_activeMaterial)
         {
            _activeMaterial.deactivate(_stage3DProxy);
         }
         _activeMaterial = null;
      }
      
      private function drawSkyBox(param1:EntityCollector) : void
      {
         var _loc2_:IRenderable = param1.skyBox;
         var _loc4_:MaterialBase = _loc2_.material;
         var _loc3_:Camera3D = param1.camera;
         _loc4_.activatePass(0,_stage3DProxy,_loc3_,_textureRatioX,_textureRatioY);
         _loc4_.renderPass(0,_loc2_,_stage3DProxy,param1);
         _loc4_.deactivatePass(0,_stage3DProxy);
      }
      
      private final function drawRenderables(param1:RenderableListItem, param2:EntityCollector, param3:int) : void
      {
         var _loc5_:* = 0;
         var _loc8_:* = 0;
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc7_:Camera3D = param2.camera;
         while(param1)
         {
            if(param1.renderable.postEffectData && param1.renderable.postEffectData.heatFlag == 2)
            {
               param1 = param1.next;
            }
            else
            {
               _activeMaterial = param1.renderable.material;
               _activeMaterial.updateMaterial(_context);
               _loc5_ = uint(_activeMaterial.numPasses);
               _loc8_ = uint(0);
               do
               {
                  _loc4_ = param1;
                  _loc6_ = !!_activeMaterial.passRendersToTexture(_loc8_)?1:2;
                  if((_loc6_ & param3) != 0)
                  {
                     _activeMaterial.activatePass(_loc8_,_stage3DProxy,_loc7_,_textureRatioX,_textureRatioY);
                     do
                     {
                        _activeMaterial.renderPass(_loc8_,_loc4_.renderable,_stage3DProxy,param2);
                        _loc4_ = _loc4_.next;
                     }
                     while(_loc4_ && _loc4_.renderable.material == _activeMaterial);
                     
                     _activeMaterial.deactivatePass(_loc8_,_stage3DProxy);
                  }
                  else
                  {
                     do
                     {
                        _loc4_ = _loc4_.next;
                     }
                     while(_loc4_ && _loc4_.renderable.material == _activeMaterial);
                     
                  }
               }
               while(++_loc8_ < _loc5_);
               
               param1 = _loc4_;
            }
         }
      }
      
      override function dispose() : void
      {
         super.dispose();
         _depthRenderer.dispose();
         _distanceRenderer.dispose();
         _lightMapRenderer.dispose();
         _depthRenderer = null;
         _distanceRenderer = null;
         _lightMapRenderer = null;
      }
   }
}
