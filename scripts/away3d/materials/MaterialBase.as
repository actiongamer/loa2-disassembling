package away3d.materials
{
   import away3d.library.assets.NamedAssetBase;
   import away3d.library.assets.IAsset;
   import away3d.animators.IAnimationSet;
   import away3d.core.base.IMaterialOwner;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.materials.passes.DepthMapPass;
   import away3d.materials.passes.LightMapPass;
   import away3d.materials.passes.DistanceMapPass;
   import away3d.materials.lightpickers.LightPickerBase;
   import §away3d:arcane§._uniqueId;
   import §away3d:arcane§._name;
   import away3d.core.managers.Stage3DProxy;
   import away3d.cameras.Camera3D;
   import away3d.core.base.IRenderable;
   import away3d.core.traverse.EntityCollector;
   import §away3d:arcane§.invalidatePasses;
   import flash.display3D.Context3D;
   import flash.events.Event;
   import §away3d:arcane§._renderOrderId;
   import §away3d:arcane§._depthPassId;
   
   public class MaterialBase extends NamedAssetBase implements IAsset
   {
      
      private static var MATERIAL_ID_COUNT:uint = 0;
      
      public static var AllMaterialCount:uint = 0;
       
      
      public var extra:Object;
      
      var _classification:String;
      
      var _uniqueId:uint;
      
      var _renderOrderId:int;
      
      var _depthPassId:int;
      
      var _name:String = "material";
      
      private var _bothSides:Boolean;
      
      private var _animationSet:IAnimationSet;
      
      private var _owners:Vector.<IMaterialOwner>;
      
      private var _alphaPremultiplied:Boolean;
      
      private var _blendMode:String = "normal";
      
      protected var _numPasses:uint;
      
      protected var _passes:Vector.<MaterialPassBase>;
      
      protected var _mipmap:Boolean = true;
      
      protected var _smooth:Boolean = true;
      
      protected var _repeat:Boolean;
      
      protected var _depthPass:DepthMapPass;
      
      protected var _lightMapPass:LightMapPass;
      
      protected var _distancePass:DistanceMapPass;
      
      protected var _lightPicker:LightPickerBase;
      
      private var _distanceBasedDepthRender:Boolean;
      
      private var _depthCompareMode:String = "lessEqual";
      
      private var _renderPriority:int = 0;
      
      protected var _isDestroy:Boolean = false;
      
      public var isDisposed:Boolean;
      
      public function MaterialBase()
      {
         super();
         _owners = new Vector.<IMaterialOwner>();
         _passes = new Vector.<MaterialPassBase>();
         _depthPass = new DepthMapPass();
         _lightMapPass = new LightMapPass();
         _distancePass = new DistanceMapPass();
         _depthPass.addEventListener("change",onDepthPassChange);
         _distancePass.addEventListener("change",onDistancePassChange);
         alphaPremultiplied = true;
         MATERIAL_ID_COUNT = Number(MATERIAL_ID_COUNT) + 1;
         _uniqueId = Number(MATERIAL_ID_COUNT);
         AllMaterialCount = Number(AllMaterialCount) + 1;
      }
      
      public function get isDestroy() : Boolean
      {
         return _isDestroy;
      }
      
      public function get assetType() : String
      {
         return "material";
      }
      
      public final function get renderPriority() : int
      {
         return _renderPriority;
      }
      
      public function set renderPriority(param1:int) : void
      {
         _renderPriority = param1;
      }
      
      public function get lightPicker() : LightPickerBase
      {
         return _lightPicker;
      }
      
      public function set lightPicker(param1:LightPickerBase) : void
      {
         if(param1 != _lightPicker)
         {
            _lightPicker = param1;
         }
      }
      
      public function get mipmap() : Boolean
      {
         return _mipmap;
      }
      
      public function set mipmap(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         _mipmap = param1;
         _lightMapPass.mipmap = param1;
         _loc2_ = 0;
         while(_loc2_ < _numPasses)
         {
            _passes[_loc2_].mipmap = param1;
            _loc2_++;
         }
      }
      
      public function get smooth() : Boolean
      {
         return _smooth;
      }
      
      public function set smooth(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         _smooth = param1;
         _lightMapPass.smooth = param1;
         _loc2_ = 0;
         while(_loc2_ < _numPasses)
         {
            _passes[_loc2_].smooth = param1;
            _loc2_++;
         }
      }
      
      public function get depthCompareMode() : String
      {
         return _depthCompareMode;
      }
      
      public function set depthCompareMode(param1:String) : void
      {
         _depthCompareMode = param1;
         _lightMapPass.depthCompareMode = param1;
      }
      
      public function get repeat() : Boolean
      {
         return _repeat;
      }
      
      public function set repeat(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         _repeat = param1;
         _lightMapPass.repeat = param1;
         _loc2_ = 0;
         while(_loc2_ < _numPasses)
         {
            _passes[_loc2_].repeat = param1;
            _loc2_++;
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         isDisposed = true;
         while(_numPasses)
         {
            _loc1_ = _passes[0];
            _loc1_.dispose();
            _loc1_.animationSet = null;
            removePass(_loc1_);
            _loc1_ = null;
         }
         _owners.length = 0;
         _passes.length = 0;
         _depthPass && _depthPass.dispose();
         _lightMapPass && _lightMapPass.dispose();
         _distancePass && _distancePass.dispose();
         _depthPass && _depthPass.removeEventListener("change",onDepthPassChange);
         _distancePass && _distancePass.removeEventListener("change",onDistancePassChange);
         _depthPass = null;
         _lightMapPass = null;
         _distancePass = null;
         _isDestroy = true;
         AllMaterialCount = Number(AllMaterialCount) - 1;
      }
      
      public function get bothSides() : Boolean
      {
         return _bothSides;
      }
      
      public function set bothSides(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         _bothSides = param1;
         _loc2_ = 0;
         while(_loc2_ < _numPasses)
         {
            _passes[_loc2_].bothSides = param1;
            _loc2_++;
         }
         _lightMapPass.bothSides = param1;
         _depthPass.bothSides = param1;
         _distancePass.bothSides = param1;
      }
      
      public function get blendMode() : String
      {
         return _blendMode;
      }
      
      public function set blendMode(param1:String) : void
      {
         _blendMode = param1;
      }
      
      public function get alphaPremultiplied() : Boolean
      {
         return _alphaPremultiplied;
      }
      
      public function set alphaPremultiplied(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         _alphaPremultiplied = param1;
         _lightMapPass.alphaPremultiplied = param1;
         _loc2_ = 0;
         while(_loc2_ < _numPasses)
         {
            _passes[_loc2_].alphaPremultiplied = param1;
            _loc2_++;
         }
      }
      
      public function get requiresBlending() : Boolean
      {
         return _blendMode != "normal";
      }
      
      public function get uniqueId() : uint
      {
         return _uniqueId;
      }
      
      override public function get name() : String
      {
         return _name;
      }
      
      override public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      function get numPasses() : uint
      {
         return _numPasses;
      }
      
      function hasDepthAlphaThreshold() : Boolean
      {
         return _depthPass.alphaThreshold > 0;
      }
      
      function activateForDepth(param1:Stage3DProxy, param2:Camera3D, param3:Boolean = false, param4:Number = 1, param5:Number = 1) : void
      {
         _distanceBasedDepthRender = param3;
         if(param3)
         {
            _distancePass.activate(param1,param2,param4,param5);
         }
         else
         {
            _depthPass.activate(param1,param2,param4,param5);
         }
      }
      
      function deactivateForDepth(param1:Stage3DProxy) : void
      {
         if(_distanceBasedDepthRender)
         {
            _distancePass.deactivate(param1);
         }
         else
         {
            _depthPass.deactivate(param1);
         }
      }
      
      function renderDepth(param1:IRenderable, param2:Stage3DProxy, param3:Camera3D) : void
      {
         if(_distanceBasedDepthRender)
         {
            if(param1.animator)
            {
               _distancePass.updateAnimationState(param1,param2,param3);
            }
            _distancePass.render(param1,param2,param3);
         }
         else
         {
            if(param1.animator)
            {
               _depthPass.updateAnimationState(param1,param2,param3);
            }
            _depthPass.render(param1,param2,param3);
         }
      }
      
      function passRendersToTexture(param1:uint) : Boolean
      {
         return _passes[param1].renderToTexture;
      }
      
      function activateForLightMap(param1:Stage3DProxy, param2:Camera3D, param3:Number = 1, param4:Number = 1) : void
      {
         _lightMapPass.activate(param1,param2,param3,param4);
      }
      
      function deactivateForLightMap(param1:Stage3DProxy) : void
      {
         _lightMapPass.deactivate(param1);
      }
      
      function renderLightMap(param1:IRenderable, param2:Stage3DProxy, param3:Camera3D) : void
      {
         if(param1.animator)
         {
            _lightMapPass.updateAnimationState(param1,param2,param3);
         }
         _lightMapPass.render(param1,param2,param3);
      }
      
      function activatePass(param1:uint, param2:Stage3DProxy, param3:Camera3D, param4:Number, param5:Number) : void
      {
         _passes[param1].activate(param2,param3,param4,param5);
      }
      
      function deactivatePass(param1:uint, param2:Stage3DProxy) : void
      {
         _passes[param1].deactivate(param2);
      }
      
      function renderPass(param1:uint, param2:IRenderable, param3:Stage3DProxy, param4:EntityCollector) : void
      {
         if(_lightPicker)
         {
            _lightPicker.collectLights(param2,param4);
         }
         var _loc5_:MaterialPassBase = _passes[param1];
         if(param2.animator)
         {
            _loc5_.updateAnimationState(param2,param3,param4.camera);
         }
         _loc5_.render(param2,param3,param4.camera);
      }
      
      function addOwner(param1:IMaterialOwner) : void
      {
         var _loc2_:int = 0;
         _owners.push(param1);
         if(param1.animator)
         {
            if(_animationSet && param1.animator.animationSet != _animationSet)
            {
               throw new Error("A Material instance cannot be shared across renderables with different animator libraries");
            }
            if(_animationSet != param1.animator.animationSet)
            {
               _animationSet = param1.animator.animationSet;
               _loc2_ = 0;
               while(_loc2_ < _numPasses)
               {
                  _passes[_loc2_].animationSet = _animationSet;
                  _loc2_++;
               }
               _depthPass.animationSet = _animationSet;
               _lightMapPass.animationSet = _animationSet;
               _distancePass.animationSet = _animationSet;
               invalidatePasses(null);
            }
         }
      }
      
      function removeOwner(param1:IMaterialOwner) : void
      {
         var _loc2_:int = 0;
         _owners.splice(_owners.indexOf(param1),1);
         if(_owners.length == 0)
         {
            _animationSet = null;
            if(!_isDestroy)
            {
               _loc2_ = 0;
               while(_loc2_ < _numPasses)
               {
                  _passes[_loc2_].animationSet = _animationSet;
                  _loc2_++;
               }
               _depthPass.animationSet = _animationSet;
               _lightMapPass.animationSet = _animationSet;
               _distancePass.animationSet = _animationSet;
               invalidatePasses(null);
            }
         }
      }
      
      function reOwner() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc1_:int = 0;
         _animationSet = null;
         _loc3_ = 0;
         while(_loc3_ < _numPasses)
         {
            _passes[_loc3_].animationSet = _animationSet;
            _loc3_++;
         }
         _depthPass.animationSet = _animationSet;
         _lightMapPass.animationSet = _animationSet;
         _distancePass.animationSet = _animationSet;
         invalidatePasses(null);
         _loc3_ = 0;
         while(_loc3_ < _owners.length)
         {
            _loc2_ = _owners[_loc3_];
            if(_loc2_.animator)
            {
               if(_animationSet && _loc2_.animator.animationSet != _animationSet)
               {
                  throw new Error("A Material instance cannot be shared across renderables with different animator libraries");
               }
               _animationSet = _loc2_.animator.animationSet;
               _loc1_ = 0;
               while(_loc1_ < _numPasses)
               {
                  _passes[_loc1_].animationSet = _animationSet;
                  _loc1_++;
               }
               _depthPass.animationSet = _animationSet;
               _distancePass.animationSet = _animationSet;
            }
            _loc3_++;
         }
      }
      
      function get owners() : Vector.<IMaterialOwner>
      {
         return _owners;
      }
      
      function updateMaterial(param1:Context3D) : void
      {
      }
      
      function deactivate(param1:Stage3DProxy) : void
      {
         _passes[_numPasses - 1].deactivate(param1);
      }
      
      function invalidatePasses(param1:MaterialPassBase) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(this.isDisposed)
         {
            return;
         }
         _depthPass.invalidateShaderProgram();
         _lightMapPass.invalidateShaderProgram();
         _distancePass.invalidateShaderProgram();
         if(_animationSet)
         {
            _animationSet.resetGPUCompatibility();
            var _loc5_:int = 0;
            var _loc4_:* = _owners;
            for each(_loc2_ in _owners)
            {
               if(_loc2_.animator)
               {
                  _loc2_.animator.testGPUCompatibility(_depthPass);
                  _loc2_.animator.testGPUCompatibility(_distancePass);
               }
            }
         }
         _loc3_ = 0;
         while(_loc3_ < _numPasses)
         {
            if(_passes[_loc3_] != param1)
            {
               _passes[_loc3_].invalidateShaderProgram(false);
            }
            if(_animationSet)
            {
               var _loc7_:int = 0;
               var _loc6_:* = _owners;
               for each(_loc2_ in _owners)
               {
                  if(_loc2_.animator)
                  {
                     _loc2_.animator.testGPUCompatibility(_passes[_loc3_]);
                  }
               }
            }
            _loc3_++;
         }
      }
      
      protected function removePass(param1:MaterialPassBase) : void
      {
         _passes.splice(_passes.indexOf(param1),1);
         _numPasses = _numPasses - 1;
      }
      
      protected function clearPasses() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _numPasses)
         {
            _passes[_loc1_].removeEventListener("change",onPassChange);
            _loc1_++;
         }
         _passes.length = 0;
         _numPasses = 0;
      }
      
      protected function addPass(param1:MaterialPassBase) : void
      {
         _numPasses = Number(_numPasses) + 1;
         _passes[Number(_numPasses)] = param1;
         param1.animationSet = _animationSet;
         param1.alphaPremultiplied = _alphaPremultiplied;
         param1.mipmap = _mipmap;
         param1.smooth = _smooth;
         param1.repeat = _repeat;
         param1.addEventListener("change",onPassChange);
         calculateRenderId();
         invalidatePasses(null);
      }
      
      private function calculateRenderId() : void
      {
      }
      
      private function onPassChange(param1:Event) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = 0;
         var _loc2_:* = 1;
         _renderOrderId = 0;
         _loc6_ = 0;
         while(_loc6_ < _numPasses)
         {
            _loc3_ = _passes[_loc6_]._program3Dids;
            _loc4_ = _loc3_.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               if(_loc3_[_loc5_] != -1)
               {
                  _renderOrderId = _renderOrderId + _loc2_ * _loc3_[_loc5_];
                  _loc5_ = _loc4_;
               }
               _loc5_++;
            }
            _loc2_ = Number(_loc2_ * 1000);
            _loc6_++;
         }
      }
      
      private function onDistancePassChange(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc2_:Vector.<int> = _distancePass._program3Dids;
         var _loc3_:uint = _loc2_.length;
         _depthPassId = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] != -1)
            {
               _depthPassId = _depthPassId + _loc2_[_loc4_];
               _loc4_ = _loc3_;
            }
            _loc4_++;
         }
      }
      
      private function onDepthPassChange(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc2_:Vector.<int> = _depthPass._program3Dids;
         var _loc3_:uint = _loc2_.length;
         _depthPassId = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] != -1)
            {
               _depthPassId = _depthPassId + _loc2_[_loc4_];
               _loc4_ = _loc3_;
            }
            _loc4_++;
         }
      }
   }
}
