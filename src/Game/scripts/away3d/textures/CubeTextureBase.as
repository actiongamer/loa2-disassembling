package away3d.textures
{
   import flash.display3D.textures.TextureBase;
   import flash.display3D.Context3D;
   
   public class CubeTextureBase extends TextureProxyBase
   {
       
      
      public function CubeTextureBase()
      {
         super();
      }
      
      public function get size() : int
      {
         return _width;
      }
      
      override protected function createTexture(param1:Context3D) : TextureBase
      {
         return param1.createCubeTexture(width,"bgra",false);
      }
   }
}
