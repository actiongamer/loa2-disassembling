package away3d.materials.utils
{
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.display.BitmapData;
   import flash.display3D.textures.TextureBase;
   import flash.display3D.textures.Texture;
   import flash.display3D.textures.CubeTexture;
   
   public class MipmapGenerator
   {
      
      private static var _matrix:Matrix = new Matrix();
      
      private static var _rect:Rectangle = new Rectangle();
       
      
      public function MipmapGenerator()
      {
         super();
      }
      
      public static function generateMipMaps(param1:BitmapData, param2:TextureBase, param3:BitmapData = null, param4:Boolean = false, param5:int = -1) : void
      {
         var _loc9_:int = 0;
         var _loc6_:uint = param1.width;
         var _loc8_:uint = param1.height;
         var _loc7_:* = param3 != null;
         if(!param3)
         {
            param3 = new BitmapData(_loc6_,_loc8_,param4);
         }
         _rect.width = _loc6_;
         _rect.height = _loc8_;
         while(_loc6_ >= 1 || _loc8_ >= 1)
         {
            if(param4)
            {
               param3.fillRect(_rect,0);
            }
            _matrix.a = _rect.width / param1.width;
            _matrix.d = _rect.height / param1.height;
            param3.draw(param1,_matrix,null,null,null,true);
            if(param2 is Texture)
            {
               Texture(param2).uploadFromBitmapData(param3,_loc9_++);
            }
            else
            {
               CubeTexture(param2).uploadFromBitmapData(param3,param5,_loc9_++);
            }
            _loc6_ = _loc6_ >> 1;
            _loc8_ = _loc8_ >> 1;
            _rect.width = _loc6_ > 1?_loc6_:1;
            _rect.height = _loc8_ > 1?_loc8_:1;
         }
         if(!_loc7_)
         {
            param3.dispose();
         }
      }
   }
}
