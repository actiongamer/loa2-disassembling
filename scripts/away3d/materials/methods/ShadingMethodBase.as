package away3d.materials.methods
{
   import flash.events.EventDispatcher;
   import away3d.materials.compilation.ShaderRegisterData;
   import away3d.materials.passes.MaterialPassBase;
   import §away3d:arcane§.cleanCompilationData;
   import away3d.materials.compilation.ShaderRegisterCache;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.cameras.Camera3D;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.textures.TextureProxyBase;
   import org.specter3d.context.AppGlobalContext;
   import com.mz.core.configs.Client3DConfig;
   import away3d.events.ShadingMethodEvent;
   
   public class ShadingMethodBase extends EventDispatcher
   {
       
      
      protected var _sharedRegisters:ShaderRegisterData;
      
      protected var _passes:Vector.<MaterialPassBase>;
      
      public var isDisposed:Boolean = false;
      
      public function ShadingMethodBase()
      {
         super();
      }
      
      function initVO(param1:MethodVO) : void
      {
      }
      
      function initConstants(param1:MethodVO) : void
      {
      }
      
      function get sharedRegisters() : ShaderRegisterData
      {
         return _sharedRegisters;
      }
      
      function set sharedRegisters(param1:ShaderRegisterData) : void
      {
         _sharedRegisters = param1;
      }
      
      public function get passes() : Vector.<MaterialPassBase>
      {
         return _passes;
      }
      
      public function dispose() : void
      {
         this.isDisposed = true;
      }
      
      function createMethodVO() : MethodVO
      {
         return new MethodVO();
      }
      
      function reset() : void
      {
         cleanCompilationData();
      }
      
      function cleanCompilationData() : void
      {
      }
      
      function getVertexCode(param1:MethodVO, param2:ShaderRegisterCache) : String
      {
         return "";
      }
      
      function activate(param1:MethodVO, param2:Stage3DProxy) : void
      {
      }
      
      function setRenderState(param1:MethodVO, param2:IRenderable, param3:Stage3DProxy, param4:Camera3D) : void
      {
      }
      
      function deactivate(param1:MethodVO, param2:Stage3DProxy) : void
      {
      }
      
      protected function getTex2DSampleCodeOld(param1:MethodVO, param2:ShaderRegisterElement, param3:ShaderRegisterElement, param4:TextureProxyBase, param5:ShaderRegisterElement = null, param6:String = null) : String
      {
         var _loc11_:* = null;
         var _loc7_:String = param6 || (!!param1.repeatTextures?"wrap":"clamp");
         var _loc10_:String = getFormatStringForTexture(param4);
         var _loc8_:Boolean = param1.useMipmapping && param4.hasMipMaps;
         if(param1.useSmoothTextures)
         {
            _loc11_ = !!_loc8_?"linear,miplinear":"linear";
         }
         else
         {
            _loc11_ = !!_loc8_?"nearest,mipnearest":"nearest";
         }
         if(!param5)
         {
            param5 = _sharedRegisters.uvVarying;
         }
         var _loc9_:String = "tex " + param2 + ", " + param5 + ", " + param3 + " <2d," + _loc11_ + "," + _loc10_ + _loc7_ + ">\n";
         return _loc9_;
      }
      
      protected function getTex2DSampleCode(param1:MethodVO, param2:ShaderRegisterElement, param3:ShaderRegisterElement, param4:TextureProxyBase, param5:ShaderRegisterElement = null, param6:String = null) : String
      {
         var _loc11_:* = null;
         var _loc7_:String = param6 || (!!param1.repeatTextures?"wrap":"clamp");
         var _loc10_:String = getFormatStringForTexture(param4);
         var _loc8_:Boolean = param1.useMipmapping && param4.hasMipMaps;
         if(param1.useSmoothTextures)
         {
            if(AppGlobalContext.FLASH_VERSION >= 14)
            {
               _loc11_ = !!_loc8_?"anisotropic2x,mipnearest":"anisotropic2x";
            }
            else
            {
               _loc11_ = !!_loc8_?"linear,mipnearest":"linear";
            }
         }
         else
         {
            _loc11_ = !!_loc8_?"nearest,mipnearest":"nearest";
         }
         if(!param5)
         {
            param5 = _sharedRegisters.uvVarying;
         }
         var _loc9_:String = "tex " + param2 + ", " + param5 + ", " + param3 + " <2d," + _loc11_ + "," + _loc10_ + _loc7_ + ">\n";
         if(Client3DConfig.useGamma)
         {
            _loc9_ = _loc9_ + ("mul " + param2 + ", " + param2 + ", " + param2 + "\n");
         }
         return _loc9_;
      }
      
      protected function getTexSampleCode(param1:MethodVO, param2:ShaderRegisterElement, param3:ShaderRegisterElement, param4:ShaderRegisterElement = null, param5:String = null) : String
      {
         var _loc7_:* = null;
         var _loc6_:String = param5 || (!!param1.repeatTextures?"wrap":"clamp");
         if(param1.useSmoothTextures)
         {
            _loc7_ = !!param1.useMipmapping?"linear,miplinear":"linear";
         }
         else
         {
            _loc7_ = !!param1.useMipmapping?"nearest,mipnearest":"nearest";
         }
         if(!param4)
         {
            param4 = _sharedRegisters.uvVarying;
         }
         return "tex " + param2.toString() + ", " + param4.toString() + ", " + param3.toString() + " <2d," + _loc7_ + "," + _loc6_ + ">\n";
      }
      
      protected function getTexCubeSampleCode(param1:MethodVO, param2:ShaderRegisterElement, param3:ShaderRegisterElement, param4:TextureProxyBase, param5:ShaderRegisterElement) : String
      {
         var _loc8_:* = null;
         var _loc7_:String = getFormatStringForTexture(param4);
         var _loc6_:Boolean = param1.useMipmapping && param4.hasMipMaps;
         if(param1.useSmoothTextures)
         {
            _loc8_ = !!_loc6_?"linear,miplinear":"linear";
         }
         else
         {
            _loc8_ = !!_loc6_?"nearest,mipnearest":"nearest";
         }
         return "tex " + param2 + ", " + param5 + ", " + param3 + " <cube," + _loc7_ + _loc8_ + ">\n";
      }
      
      private function getFormatStringForTexture(param1:TextureProxyBase) : String
      {
         var _loc2_:* = param1.format;
         if("compressed" !== _loc2_)
         {
            if("compressedAlpha" !== _loc2_)
            {
               return "";
            }
            return "dxt5,";
         }
         return "dxt1,";
      }
      
      protected function invalidateShaderProgram() : void
      {
         dispatchEvent(new ShadingMethodEvent("ShaderInvalidated"));
      }
      
      public function copyFrom(param1:ShadingMethodBase) : void
      {
      }
   }
}
