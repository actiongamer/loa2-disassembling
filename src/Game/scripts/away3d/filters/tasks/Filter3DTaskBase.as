package away3d.filters.tasks
{
   import flash.display3D.textures.Texture;
   import flash.display3D.Program3D;
   import away3d.core.managers.Stage3DProxy;
   import com.adobe.utils.AGALMiniAssembler;
   import away3d.debug.Debug;
   import away3d.errors.AbstractMethodError;
   import away3d.cameras.Camera3D;
   
   public class Filter3DTaskBase
   {
       
      
      protected var _mainInputTexture:Texture;
      
      protected var _scaledTextureWidth:int = -1;
      
      protected var _scaledTextureHeight:int = -1;
      
      protected var _textureWidth:int = -1;
      
      protected var _textureHeight:int = -1;
      
      private var _textureDimensionsInvalid:Boolean = true;
      
      private var _program3DInvalid:Boolean = true;
      
      private var _program3D:Program3D;
      
      private var _target:Texture;
      
      private var _requireDepthRender:Boolean;
      
      protected var _textureScale:int = 0;
      
      public function Filter3DTaskBase(param1:Boolean = false)
      {
         super();
         _requireDepthRender = param1;
      }
      
      public function get textureScale() : int
      {
         return _textureScale;
      }
      
      public function set textureScale(param1:int) : void
      {
         if(_textureScale == param1)
         {
            return;
         }
         _textureScale = param1;
         _scaledTextureWidth = _textureWidth >> _textureScale;
         _scaledTextureHeight = _textureHeight >> _textureScale;
         _textureDimensionsInvalid = true;
      }
      
      public function get target() : Texture
      {
         return _target;
      }
      
      public function set target(param1:Texture) : void
      {
         _target = param1;
      }
      
      public function get textureWidth() : int
      {
         return _textureWidth;
      }
      
      public function set textureWidth(param1:int) : void
      {
         if(_textureWidth == param1)
         {
            return;
         }
         _textureWidth = param1;
         _scaledTextureWidth = _textureWidth >> _textureScale;
         _textureDimensionsInvalid = true;
      }
      
      public function get textureHeight() : int
      {
         return _textureHeight;
      }
      
      public function set textureHeight(param1:int) : void
      {
         if(_textureHeight == param1)
         {
            return;
         }
         _textureHeight = param1;
         _scaledTextureHeight = _textureHeight >> _textureScale;
         _textureDimensionsInvalid = true;
      }
      
      public function getMainInputTexture(param1:Stage3DProxy) : Texture
      {
         if(_textureDimensionsInvalid)
         {
            updateTextures(param1);
         }
         return _mainInputTexture;
      }
      
      public function dispose() : void
      {
         if(_mainInputTexture)
         {
            _mainInputTexture.dispose();
         }
         if(_program3D)
         {
            _program3D.dispose();
         }
      }
      
      protected function invalidateProgram3D() : void
      {
         _program3DInvalid = true;
      }
      
      protected function updateProgram3D(param1:Stage3DProxy) : void
      {
         if(_program3D)
         {
            _program3D.dispose();
         }
         _program3D = param1.context3D.createProgram();
         _program3D.upload(new AGALMiniAssembler(Debug.active).assemble("vertex",getVertexCode()),new AGALMiniAssembler(Debug.active).assemble("fragment",getFragmentCode()));
         _program3DInvalid = false;
      }
      
      protected function getVertexCode() : String
      {
         return "mov op, va0\nmov v0, va1\n";
      }
      
      protected function getFragmentCode() : String
      {
         throw new AbstractMethodError();
      }
      
      protected function updateTextures(param1:Stage3DProxy) : void
      {
         if(_mainInputTexture)
         {
            _mainInputTexture.dispose();
         }
         _mainInputTexture = param1.context3D.createTexture(_scaledTextureWidth,_scaledTextureHeight,"bgra",true);
         _textureDimensionsInvalid = false;
      }
      
      public function getProgram3D(param1:Stage3DProxy) : Program3D
      {
         if(_program3DInvalid)
         {
            updateProgram3D(param1);
         }
         return _program3D;
      }
      
      public function activate(param1:Stage3DProxy, param2:Camera3D, param3:Texture) : void
      {
      }
      
      public function deactivate(param1:Stage3DProxy) : void
      {
      }
      
      public function get requireDepthRender() : Boolean
      {
         return _requireDepthRender;
      }
   }
}
