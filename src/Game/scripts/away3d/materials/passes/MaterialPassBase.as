package away3d.materials.passes
{
   import flash.events.EventDispatcher;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.animators.IAnimationSet;
   import away3d.materials.lightpickers.LightPickerBase;
   import away3d.materials.MaterialBase;
   import flash.display3D.Program3D;
   import flash.display3D.Context3D;
   import flash.geom.Rectangle;
   import flash.display3D.textures.TextureBase;
   import §away3d:arcane§.invalidateShaderProgram;
   import §away3d:arcane§._program3Ds;
   import away3d.core.managers.AGALProgram3DCache;
   import §away3d:arcane§._program3Dids;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import §away3d:arcane§.updateProgram;
   import flash.events.Event;
   import away3d.errors.AbstractMethodError;
   import away3d.core.base.IRenderable;
   import §away3d:arcane§.getVertexCode;
   import §away3d:arcane§.getFragmentCode;
   import away3d.debug.Debug;
   
   public class MaterialPassBase extends EventDispatcher
   {
      
      private static var _previousUsedStreams:Vector.<int> = Vector.<int>([0,0,0,0,0,0,0,0]);
      
      private static var _previousUsedTexs:Vector.<int> = Vector.<int>([0,0,0,0,0,0,0,0]);
      
      private static var _rttData:Vector.<Number>;
       
      
      public var animationRegisterCache:AnimationRegisterCache;
      
      public var isXRay:Boolean = false;
      
      public var rendAlways:Boolean = false;
      
      protected var _UVSource:String;
      
      protected var _UVTarget:String;
      
      protected var _alphaPremultiplied:Boolean;
      
      protected var _animatableAttributes:Vector.<String>;
      
      protected var _animationSet:IAnimationSet;
      
      protected var _animationTargetRegisters:Vector.<String>;
      
      protected var _defaultCulling:String = "back";
      
      protected var _depthCompareMode:String = "lessEqual";
      
      protected var _lightPicker:LightPickerBase;
      
      protected var _material:MaterialBase;
      
      protected var _mipmap:Boolean = true;
      
      protected var _needFragmentAnimation:Boolean;
      
      protected var _needUVAnimation:Boolean;
      
      protected var _numUsedFragmentConstants:uint;
      
      protected var _numUsedStreams:uint;
      
      protected var _numUsedTextures:uint;
      
      protected var _numUsedVaryings:uint;
      
      protected var _numUsedVertexConstants:uint;
      
      protected var _repeat:Boolean = false;
      
      protected var _shadedTarget:String = "ft0";
      
      protected var _smooth:Boolean = true;
      
      var _program3Dids:Vector.<int>;
      
      var _program3Ds:Vector.<Program3D>;
      
      private var _bothSides:Boolean;
      
      private var _context3Ds:Vector.<Context3D>;
      
      private var _destBlend:String = "zero";
      
      private var _enableBlending:Boolean;
      
      private var _oldDepthStencil:Boolean;
      
      private var _oldRect:Rectangle;
      
      private var _oldSurface:int;
      
      private var _oldTarget:TextureBase;
      
      private var _renderToTexture:Boolean;
      
      private var _srcBlend:String = "one";
      
      public var isDisposed:Boolean = false;
      
      private var _blendMode:String;
      
      public function MaterialPassBase(param1:Boolean = false)
      {
         _animatableAttributes = Vector.<String>(["va0"]);
         _animationTargetRegisters = Vector.<String>(["vt0"]);
         _program3Dids = Vector.<int>([-1,-1,-1,-1,-1,-1,-1,-1]);
         _program3Ds = new Vector.<Program3D>(8);
         _context3Ds = new Vector.<Context3D>(8);
         super();
         _renderToTexture = param1;
         _numUsedStreams = 1;
         _numUsedVertexConstants = 5;
         if(!_rttData)
         {
            _rttData = new <Number>[1,1,1,1];
         }
      }
      
      public function get alphaPremultiplied() : Boolean
      {
         return _alphaPremultiplied;
      }
      
      public function set alphaPremultiplied(param1:Boolean) : void
      {
         _alphaPremultiplied = param1;
      }
      
      public function get animationSet() : IAnimationSet
      {
         return _animationSet;
      }
      
      public function set animationSet(param1:IAnimationSet) : void
      {
         if(_animationSet == param1)
         {
            return;
         }
         _animationSet = param1;
         invalidateShaderProgram();
      }
      
      public function get bothSides() : Boolean
      {
         return _bothSides;
      }
      
      public function set bothSides(param1:Boolean) : void
      {
         _bothSides = param1;
      }
      
      public function get depthCompareMode() : String
      {
         return _depthCompareMode;
      }
      
      public function set depthCompareMode(param1:String) : void
      {
         _depthCompareMode = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = 0;
         isDisposed = true;
         if(isDisposed)
         {
            return;
         }
         if(_lightPicker)
         {
            _lightPicker.removeEventListener("change",onLightsChange);
         }
         _loc1_ = uint(0);
         while(_loc1_ < 8)
         {
            if(_program3Ds[_loc1_])
            {
               if(AGALProgram3DCache.getInstanceFromIndex(_loc1_))
               {
                  AGALProgram3DCache.getInstanceFromIndex(_loc1_).freeProgram3D(_program3Dids[_loc1_]);
               }
               _program3Ds[_loc1_] = null;
            }
            _loc1_++;
         }
      }
      
      public function get material() : MaterialBase
      {
         return _material;
      }
      
      public function set material(param1:MaterialBase) : void
      {
         _material = param1;
      }
      
      public function get mipmap() : Boolean
      {
         return _mipmap;
      }
      
      public function set mipmap(param1:Boolean) : void
      {
         if(_mipmap == param1)
         {
            return;
         }
         _mipmap = param1;
         invalidateShaderProgram();
      }
      
      public function get needFragmentAnimation() : Boolean
      {
         return _needFragmentAnimation;
      }
      
      public function get needUVAnimation() : Boolean
      {
         return _needUVAnimation;
      }
      
      public function get numUsedFragmentConstants() : uint
      {
         return _numUsedFragmentConstants;
      }
      
      public function get numUsedStreams() : uint
      {
         return _numUsedStreams;
      }
      
      public function get numUsedVaryings() : uint
      {
         return _numUsedVaryings;
      }
      
      public function get numUsedVertexConstants() : uint
      {
         return _numUsedVertexConstants;
      }
      
      public final function get renderToTexture() : Boolean
      {
         return _renderToTexture;
      }
      
      public function get repeat() : Boolean
      {
         return _repeat;
      }
      
      public function set repeat(param1:Boolean) : void
      {
         if(_repeat == param1)
         {
            return;
         }
         _repeat = param1;
         invalidateShaderProgram();
      }
      
      public function setBlendMode(param1:String, param2:Boolean = false) : void
      {
         _blendMode = param1;
         var _loc3_:* = param1;
         if("normal" !== _loc3_)
         {
            if("layer" !== _loc3_)
            {
               if("multiply" !== _loc3_)
               {
                  if("addx2" !== _loc3_)
                  {
                     if("add" !== _loc3_)
                     {
                        if("overlay" !== _loc3_)
                        {
                           if("alpha" !== _loc3_)
                           {
                              if("subtract" !== _loc3_)
                              {
                                 if("screen" !== _loc3_)
                                 {
                                    throw new ArgumentError("Unsupported blend mode!");
                                 }
                                 _srcBlend = "one";
                                 _destBlend = "oneMinusSourceColor";
                                 _enableBlending = true;
                              }
                              else
                              {
                                 _srcBlend = "destinationColor";
                                 _destBlend = "oneMinusSourceAlpha";
                                 _enableBlending = true;
                              }
                           }
                           else
                           {
                              _srcBlend = "zero";
                              _destBlend = "sourceAlpha";
                              _enableBlending = true;
                           }
                        }
                        else
                        {
                           _srcBlend = "destinationAlpha";
                           _destBlend = "one";
                           _enableBlending = true;
                        }
                     }
                  }
                  _srcBlend = "sourceAlpha";
                  _destBlend = "one";
                  _enableBlending = true;
               }
               else
               {
                  _srcBlend = "zero";
                  _destBlend = "sourceColor";
                  _enableBlending = true;
               }
            }
            addr153:
            return;
         }
         if(param2)
         {
            _srcBlend = "sourceAlpha";
            _destBlend = "oneMinusSourceAlpha";
         }
         else
         {
            _srcBlend = "one";
            _destBlend = "zero";
         }
         _enableBlending = param2;
         §§goto(addr153);
      }
      
      public function get smooth() : Boolean
      {
         return _smooth;
      }
      
      public function set smooth(param1:Boolean) : void
      {
         if(_smooth == param1)
         {
            return;
         }
         _smooth = param1;
         invalidateShaderProgram();
      }
      
      protected function updateLights() : void
      {
      }
      
      function activate(param1:Stage3DProxy, param2:Camera3D, param3:Number, param4:Number) : void
      {
         var _loc8_:* = 0;
         var _loc7_:int = param1._stage3DIndex;
         var _loc5_:Context3D = param1._context3D;
         if(_blendMode == "normal")
         {
            _loc5_.setDepthTest(true,_depthCompareMode);
         }
         else
         {
            _loc5_.setDepthTest(!_enableBlending,_depthCompareMode);
         }
         if(_enableBlending)
         {
            _loc5_.setBlendFactors(_srcBlend,_destBlend);
         }
         if(_context3Ds[_loc7_] != _loc5_ || !_program3Ds[_loc7_])
         {
            _context3Ds[_loc7_] = _loc5_;
            updateProgram(param1);
            dispatchEvent(new Event("change"));
         }
         var _loc6_:int = _previousUsedStreams[_loc7_];
         _loc8_ = uint(_numUsedStreams);
         while(_loc8_ < _loc6_)
         {
            _loc5_.setVertexBufferAt(_loc8_,null);
            _loc8_++;
         }
         _loc6_ = _previousUsedTexs[_loc7_];
         _loc8_ = uint(_numUsedTextures);
         while(_loc8_ < _loc6_)
         {
            param1.setTextureAt(_loc8_,null);
            _loc8_++;
         }
         if(_animationSet && !_animationSet.usesCPU)
         {
            _animationSet.activate(param1,this);
         }
         param1.setProgram(_program3Ds[_loc7_]);
         _loc5_.setCulling(!!_bothSides?"none":_defaultCulling);
         if(_renderToTexture)
         {
            _rttData[0] = 1;
            _rttData[1] = 1;
            _oldTarget = param1.renderTarget;
            _oldSurface = param1.renderSurfaceSelector;
            _oldDepthStencil = param1.enableDepthAndStencil;
            _oldRect = param1.scissorRect;
         }
         else
         {
            _rttData[0] = param3;
            _rttData[1] = param4;
            param1._context3D.setProgramConstantsFromVector("vertex",4,_rttData,1);
         }
      }
      
      function deactivate(param1:Stage3DProxy) : void
      {
         var _loc2_:uint = param1._stage3DIndex;
         _previousUsedStreams[_loc2_] = _numUsedStreams;
         _previousUsedTexs[_loc2_] = _numUsedTextures;
         if(_animationSet && !_animationSet.usesCPU)
         {
            _animationSet.deactivate(param1,this);
         }
         if(_renderToTexture)
         {
            param1.setRenderTarget(_oldTarget,_oldDepthStencil,_oldSurface);
            param1.scissorRect = _oldRect;
         }
         if(_enableBlending)
         {
            param1._context3D.setBlendFactors("one","zero");
         }
         param1._context3D.setDepthTest(true,"lessEqual");
      }
      
      function getFragmentCode(param1:String) : String
      {
         throw new AbstractMethodError();
      }
      
      function getVertexCode() : String
      {
         throw new AbstractMethodError();
      }
      
      function invalidateShaderProgram(param1:Boolean = true) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < 8)
         {
            _program3Ds[_loc2_] = null;
            _loc2_++;
         }
         if(_material && param1)
         {
            _material.invalidatePasses(this);
         }
      }
      
      function get lightPicker() : LightPickerBase
      {
         return _lightPicker;
      }
      
      function set lightPicker(param1:LightPickerBase) : void
      {
         if(_lightPicker)
         {
            _lightPicker.removeEventListener("change",onLightsChange);
         }
         _lightPicker = param1;
         if(_lightPicker)
         {
            _lightPicker.addEventListener("change",onLightsChange);
         }
         updateLights();
      }
      
      function render(param1:IRenderable, param2:Stage3DProxy, param3:Camera3D) : void
      {
         throw new AbstractMethodError();
      }
      
      function updateAnimationState(param1:IRenderable, param2:Stage3DProxy, param3:Camera3D) : void
      {
         param1.animator.setRenderState(param2,param1,_numUsedVertexConstants,_numUsedStreams,param3);
      }
      
      function updateProgram(param1:Stage3DProxy) : void
      {
         var _loc6_:* = 0;
         var _loc8_:* = 0;
         var _loc3_:String = "";
         var _loc5_:String = "";
         var _loc7_:String = "";
         var _loc4_:String = getVertexCode();
         if(_animationSet && !_animationSet.usesCPU)
         {
            _loc3_ = _animationSet.getAGALVertexCode(this,_animatableAttributes,_animationTargetRegisters);
            if(_needFragmentAnimation)
            {
               _loc7_ = _animationSet.getAGALFragmentCode(this,_shadedTarget);
            }
            if(_needUVAnimation)
            {
               _loc5_ = _animationSet.getAGALUVCode(this,_UVSource,_UVTarget);
            }
            _animationSet.doneAGALCode(this);
         }
         else
         {
            _loc6_ = uint(_animatableAttributes.length);
            _loc8_ = uint(0);
            while(_loc8_ < _loc6_)
            {
               _loc3_ = _loc3_ + ("mov " + _animationTargetRegisters[_loc8_] + ", " + _animatableAttributes[_loc8_] + "\n");
               _loc8_++;
            }
            if(_needUVAnimation)
            {
               _loc5_ = "mov " + _UVTarget + "," + _UVSource + "\n";
            }
         }
         _loc4_ = _loc3_ + _loc5_ + _loc4_;
         var _loc2_:String = getFragmentCode(_loc7_);
         if(Debug.active)
         {
            trace("Compiling AGAL Code:");
            trace("--------------------");
            trace(_loc4_);
            trace("--------------------");
            trace(_loc2_);
         }
         AGALProgram3DCache.getInstance(param1).setProgram3D(this,_loc4_,_loc2_);
      }
      
      private function onLightsChange(param1:Event) : void
      {
         updateLights();
      }
   }
}
