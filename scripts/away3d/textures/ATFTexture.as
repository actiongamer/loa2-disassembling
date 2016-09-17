package away3d.textures
{
   import flash.display3D.textures.Texture;
   import flash.display3D.textures.TextureBase;
   import org.specter3d.debug.DevLog;
   import away3d.events.TextureEvent;
   import org.specter3d.debug.DebugEngineLog;
   import flash.events.Event;
   import flash.display3D.Context3D;
   import flash.utils.ByteArray;
   
   public class ATFTexture extends Texture2DBase
   {
       
      
      private var _atfData:away3d.textures.ATFData;
      
      private var url:String;
      
      private var _nativeTexture:Texture;
      
      private var _isDestroy:Boolean = false;
      
      private var _isAsync:Boolean = false;
      
      public function ATFTexture(param1:ByteArray, param2:String = null)
      {
         this.url = param2;
         super();
         param1.position = 0;
         atfData = new away3d.textures.ATFData(param1);
         _format = atfData.format;
         _hasMipmaps = _atfData.numTextures > 1;
      }
      
      public function get atfData() : away3d.textures.ATFData
      {
         return _atfData;
      }
      
      public function set atfData(param1:away3d.textures.ATFData) : void
      {
         _atfData = param1;
         invalidateContent();
      }
      
      override protected function uploadContent(param1:TextureBase) : void
      {
         if(_atfData == null || _atfData.data && _atfData.data.length == 0)
         {
            DevLog.debug("all_log","texture " + url + " length is invalid");
            return;
         }
         _nativeTexture = Texture(param1);
         if(_nativeTexture)
         {
            _isAsync && _nativeTexture.addEventListener("textureReady",_onTextureReady);
            try
            {
               _nativeTexture.uploadCompressedTextureFromByteArray(_atfData.data,0,_isAsync);
               return;
            }
            catch(e:Error)
            {
               DebugEngineLog.toChat(url + "," + e.message);
               return;
            }
         }
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         if(param1 == "upload_texture_complete")
         {
            _isAsync = true;
         }
      }
      
      private function _onTextureReady(param1:Event) : void
      {
         _nativeTexture.removeEventListener("textureReady",_onTextureReady);
         _nativeTexture = null;
         _isUploadDone = true;
         if(_isDestroy)
         {
            disposeAtf();
         }
         else if(_isAsync)
         {
            dispatchEvent(new TextureEvent("upload_texture_complete"));
         }
      }
      
      override protected function createTexture(param1:Context3D) : TextureBase
      {
         if(_atfData == null || param1 == null)
         {
            return null;
         }
         try
         {
            var _loc3_:* = param1.createTexture(_width,_height,_atfData.format,false);
            return _loc3_;
         }
         catch(e:Error)
         {
            DebugEngineLog.toWindowError(url + "显卡贴图创建错误");
         }
         return null;
      }
      
      public function disposeAtf() : void
      {
      }
      
      public function disposeAtf_real() : void
      {
         if(_isDestroy)
         {
            return;
         }
         _isDestroy = true;
         if(!_isUploadDone && _isAsync)
         {
            return;
         }
         if(_nativeTexture)
         {
            _nativeTexture.removeEventListener("textureReady",_onTextureReady);
            _nativeTexture.dispose();
            _nativeTexture = null;
         }
         if(_atfData)
         {
            _atfData.dispose();
            _atfData = null;
         }
         super.dispose();
      }
      
      override public function dispose() : void
      {
      }
   }
}
