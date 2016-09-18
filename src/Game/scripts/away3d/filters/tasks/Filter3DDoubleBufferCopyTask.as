package away3d.filters.tasks
{
   import flash.display3D.textures.Texture;
   import away3d.core.managers.Stage3DProxy;
   import flash.display.BitmapData;
   import away3d.cameras.Camera3D;
   
   public class Filter3DDoubleBufferCopyTask extends Filter3DTaskBase
   {
       
      
      private var _secondaryInputTexture:Texture;
      
      public function Filter3DDoubleBufferCopyTask()
      {
         super();
      }
      
      public function get secondaryInputTexture() : Texture
      {
         return _secondaryInputTexture;
      }
      
      override protected function getFragmentCode() : String
      {
         return "tex oc, v0, fs0 <2d,nearest,clamp>\n";
      }
      
      override protected function updateTextures(param1:Stage3DProxy) : void
      {
         super.updateTextures(param1);
         if(_secondaryInputTexture)
         {
            _secondaryInputTexture.dispose();
         }
         _secondaryInputTexture = param1.context3D.createTexture(_scaledTextureWidth,_scaledTextureHeight,"bgra",true);
         var _loc2_:BitmapData = new BitmapData(_scaledTextureWidth,_scaledTextureHeight,true,0);
         _mainInputTexture.uploadFromBitmapData(_loc2_);
         _secondaryInputTexture.uploadFromBitmapData(_loc2_);
         _loc2_.dispose();
      }
      
      override public function activate(param1:Stage3DProxy, param2:Camera3D, param3:Texture) : void
      {
         swap();
         super.activate(param1,param2,param3);
      }
      
      private function swap() : void
      {
         var _loc1_:Texture = _secondaryInputTexture;
         _secondaryInputTexture = _mainInputTexture;
         _mainInputTexture = _loc1_;
      }
   }
}
