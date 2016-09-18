package away3d.materials.compilation
{
   public class ShaderRegisterCache
   {
       
      
      private var _fragmentTempCache:away3d.materials.compilation.RegisterPool;
      
      private var _vertexTempCache:away3d.materials.compilation.RegisterPool;
      
      private var _varyingCache:away3d.materials.compilation.RegisterPool;
      
      private var _fragmentConstantsCache:away3d.materials.compilation.RegisterPool;
      
      private var _vertexConstantsCache:away3d.materials.compilation.RegisterPool;
      
      private var _textureCache:away3d.materials.compilation.RegisterPool;
      
      private var _vertexAttributesCache:away3d.materials.compilation.RegisterPool;
      
      protected var _vertexConstantOffset:uint;
      
      private var _vertexAttributesOffset:uint;
      
      private var _varyingsOffset:uint;
      
      protected var _fragmentConstantOffset:uint;
      
      private var _fragmentOutputRegister:away3d.materials.compilation.ShaderRegisterElement;
      
      private var _vertexOutputRegister:away3d.materials.compilation.ShaderRegisterElement;
      
      protected var _numUsedVertexConstants:uint;
      
      protected var _numUsedFragmentConstants:uint;
      
      private var _numUsedStreams:uint;
      
      private var _numUsedTextures:uint;
      
      private var _numUsedVaryings:uint;
      
      public function ShaderRegisterCache()
      {
         super();
      }
      
      public function reset() : void
      {
         var _loc1_:int = 0;
         _fragmentTempCache = new away3d.materials.compilation.RegisterPool("ft",8,false);
         _vertexTempCache = new away3d.materials.compilation.RegisterPool("vt",8,false);
         _varyingCache = new away3d.materials.compilation.RegisterPool("v",8);
         _textureCache = new away3d.materials.compilation.RegisterPool("fs",8);
         _vertexAttributesCache = new away3d.materials.compilation.RegisterPool("va",8);
         _fragmentConstantsCache = new away3d.materials.compilation.RegisterPool("fc",28);
         _vertexConstantsCache = new away3d.materials.compilation.RegisterPool("vc",128);
         _fragmentOutputRegister = new away3d.materials.compilation.ShaderRegisterElement("oc",-1);
         _vertexOutputRegister = new away3d.materials.compilation.ShaderRegisterElement("op",-1);
         _numUsedVertexConstants = 0;
         _numUsedStreams = 0;
         _numUsedTextures = 0;
         _numUsedVaryings = 0;
         _numUsedFragmentConstants = 0;
         _loc1_ = 0;
         while(_loc1_ < _vertexAttributesOffset)
         {
            getFreeVertexAttribute();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < _vertexConstantOffset)
         {
            getFreeVertexConstant();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < _varyingsOffset)
         {
            getFreeVarying();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < _fragmentConstantOffset)
         {
            getFreeFragmentConstant();
            _loc1_++;
         }
      }
      
      public function dispose() : void
      {
         _fragmentTempCache.dispose();
         _vertexTempCache.dispose();
         _varyingCache.dispose();
         _fragmentConstantsCache.dispose();
         _vertexAttributesCache.dispose();
         _fragmentTempCache = null;
         _vertexTempCache = null;
         _varyingCache = null;
         _fragmentConstantsCache = null;
         _vertexAttributesCache = null;
         _fragmentOutputRegister = null;
         _vertexOutputRegister = null;
      }
      
      public function addFragmentTempUsages(param1:away3d.materials.compilation.ShaderRegisterElement, param2:uint) : void
      {
         _fragmentTempCache.addUsage(param1,param2);
      }
      
      public function removeFragmentTempUsage(param1:away3d.materials.compilation.ShaderRegisterElement) : void
      {
         _fragmentTempCache.removeUsage(param1);
      }
      
      public function addVertexTempUsages(param1:away3d.materials.compilation.ShaderRegisterElement, param2:uint) : void
      {
         _vertexTempCache.addUsage(param1,param2);
      }
      
      public function removeVertexTempUsage(param1:away3d.materials.compilation.ShaderRegisterElement) : void
      {
         _vertexTempCache.removeUsage(param1);
      }
      
      public function getFreeFragmentVectorTemp() : away3d.materials.compilation.ShaderRegisterElement
      {
         return _fragmentTempCache.requestFreeVectorReg();
      }
      
      public function getFreeFragmentSingleTemp() : away3d.materials.compilation.ShaderRegisterElement
      {
         return _fragmentTempCache.requestFreeRegComponent();
      }
      
      public function getFreeVarying() : away3d.materials.compilation.ShaderRegisterElement
      {
         _numUsedVaryings = _numUsedVaryings + 1;
         return _varyingCache.requestFreeVectorReg();
      }
      
      public function getFreeFragmentConstant() : away3d.materials.compilation.ShaderRegisterElement
      {
         _numUsedFragmentConstants = _numUsedFragmentConstants + 1;
         return _fragmentConstantsCache.requestFreeVectorReg();
      }
      
      public function getFreeVertexConstant() : away3d.materials.compilation.ShaderRegisterElement
      {
         _numUsedVertexConstants = _numUsedVertexConstants + 1;
         return _vertexConstantsCache.requestFreeVectorReg();
      }
      
      public function getFreeVertexVectorTemp() : away3d.materials.compilation.ShaderRegisterElement
      {
         return _vertexTempCache.requestFreeVectorReg();
      }
      
      public function getFreeVertexSingleTemp() : away3d.materials.compilation.ShaderRegisterElement
      {
         return _vertexTempCache.requestFreeRegComponent();
      }
      
      public function getFreeVertexAttribute() : away3d.materials.compilation.ShaderRegisterElement
      {
         _numUsedStreams = _numUsedStreams + 1;
         return _vertexAttributesCache.requestFreeVectorReg();
      }
      
      public function getFreeTextureReg() : away3d.materials.compilation.ShaderRegisterElement
      {
         _numUsedTextures = _numUsedTextures + 1;
         return _textureCache.requestFreeVectorReg();
      }
      
      public function get vertexConstantOffset() : uint
      {
         return _vertexConstantOffset;
      }
      
      public function set vertexConstantOffset(param1:uint) : void
      {
         _vertexConstantOffset = param1;
      }
      
      public function get vertexAttributesOffset() : uint
      {
         return _vertexAttributesOffset;
      }
      
      public function set vertexAttributesOffset(param1:uint) : void
      {
         _vertexAttributesOffset = param1;
      }
      
      public function get varyingsOffset() : uint
      {
         return _varyingsOffset;
      }
      
      public function set varyingsOffset(param1:uint) : void
      {
         _varyingsOffset = param1;
      }
      
      public function get fragmentConstantOffset() : uint
      {
         return _fragmentConstantOffset;
      }
      
      public function set fragmentConstantOffset(param1:uint) : void
      {
         _fragmentConstantOffset = param1;
      }
      
      public function get fragmentOutputRegister() : away3d.materials.compilation.ShaderRegisterElement
      {
         return _fragmentOutputRegister;
      }
      
      public function get numUsedVertexConstants() : uint
      {
         return _numUsedVertexConstants;
      }
      
      public function get numUsedFragmentConstants() : uint
      {
         return _numUsedFragmentConstants;
      }
      
      public function get numUsedStreams() : uint
      {
         return _numUsedStreams;
      }
      
      public function get numUsedTextures() : uint
      {
         return _numUsedTextures;
      }
      
      public function get numUsedVaryings() : uint
      {
         return _numUsedVaryings;
      }
   }
}
