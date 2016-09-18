package away3d.core.render
{
   import away3d.materials.MaterialBase;
   import away3d.core.traverse.EntityCollector;
   import flash.display3D.textures.TextureBase;
   import flash.display3D.Context3DClearMask;
   import away3d.core.data.RenderableListItem;
   import away3d.cameras.Camera3D;
   
   public class HeatFilterRenderer extends RendererBase
   {
       
      
      private var _activeMaterial:MaterialBase;
      
      private var _useHeatFilter:Boolean = false;
      
      public function HeatFilterRenderer()
      {
         super();
         _backgroundR = 0;
         _backgroundG = 0;
         _backgroundB = 0;
         _backgroundAlpha = 1;
      }
      
      override protected function draw(param1:EntityCollector, param2:TextureBase) : void
      {
         _useHeatFilter = false;
         drawRenderables(param1.effectRenderableHead,param1,true);
         if(_useHeatFilter)
         {
            _context.clear(0,0,0,1,1,0,Context3DClearMask.DEPTH);
            drawRenderables(param1.nameHead,param1,false);
         }
         if(_activeMaterial)
         {
            _activeMaterial.deactivate(_stage3DProxy);
         }
         _activeMaterial = null;
      }
      
      private function drawRenderables(param1:RenderableListItem, param2:EntityCollector, param3:Boolean) : void
      {
         var _loc7_:int = 0;
         var _loc5_:* = 0;
         var _loc9_:* = null;
         var _loc6_:* = null;
         var _loc4_:int = 0;
         var _loc8_:Camera3D = param2.camera;
         while(param1)
         {
            _activeMaterial = param1.renderable.material;
            _activeMaterial.updateMaterial(_stage3DProxy.context3D);
            _loc5_ = uint(_activeMaterial.numPasses);
            _loc7_ = 0;
            do
            {
               _loc9_ = param1;
               _activeMaterial.activatePass(_loc7_,_stage3DProxy,_loc8_,_textureRatioX,_textureRatioY);
               do
               {
                  if(!_loc9_.renderable.postEffectData)
                  {
                     _loc4_ = 0;
                  }
                  else
                  {
                     _loc4_ = _loc9_.renderable.postEffectData.heatFlag;
                  }
                  if(_loc9_.renderable.sourceEntity.visible == true)
                  {
                     if(!param3)
                     {
                        if(_loc4_ == 0)
                        {
                           _context.setBlendFactors("zero","zero");
                        }
                        else if(_loc4_ == 1 || _loc4_ == 2)
                        {
                           _context.setBlendFactors("one","zero");
                        }
                     }
                     if(_loc4_ == 0)
                     {
                        if(!param3)
                        {
                           _activeMaterial.renderPass(_loc7_,_loc9_.renderable,_stage3DProxy,param2);
                        }
                     }
                     else if(_loc4_ == 1 || _loc4_ == 2)
                     {
                        _useHeatFilter = true;
                        _activeMaterial.renderPass(_loc7_,_loc9_.renderable,_stage3DProxy,param2);
                        if(_loc4_ == 2)
                        {
                           if(_loc6_)
                           {
                              _loc6_.next = _loc9_.next;
                           }
                        }
                     }
                  }
                  _loc6_ = _loc9_;
                  _loc9_ = _loc9_.next;
               }
               while(_loc9_ && _loc9_.renderable.material == _activeMaterial);
               
               _activeMaterial.deactivatePass(_loc7_,_stage3DProxy);
               _loc7_++;
            }
            while(_loc7_ < _loc5_);
            
            param1 = _loc9_;
         }
      }
   }
}
