package away3d.materials
{
   import flash.geom.ColorTransform;
   import away3d.textures.Texture2DBase;
   
   public class TextureMaterial extends SinglePassMaterialBase
   {
       
      
      public function TextureMaterial(param1:Texture2DBase = null, param2:Boolean = true, param3:Boolean = false, param4:Boolean = false)
      {
         super();
         this.texture = param1;
         this.smooth = param2;
         this.repeat = param3;
         this.mipmap = param4;
      }
      
      public function get animateUVs() : Boolean
      {
         return _screenPass.animateUVs;
      }
      
      public function set animateUVs(param1:Boolean) : void
      {
         _screenPass.animateUVs = param1;
      }
      
      public function get alpha() : Number
      {
         return !!_screenPass.colorTransform?_screenPass.colorTransform.alphaMultiplier:1;
      }
      
      public function set alpha(param1:Number) : void
      {
         if(!_isDestroy)
         {
            if(param1 > 1)
            {
               param1 = 1;
            }
            else if(param1 < 0)
            {
               param1 = 0;
            }
            if(!colorTransform)
            {
               colorTransform = new ColorTransform();
            }
            colorTransform.alphaMultiplier = param1;
            _screenPass.preserveAlpha = requiresBlending;
            _screenPass.setBlendMode(blendMode,requiresBlending);
         }
      }
      
      public function get texture() : Texture2DBase
      {
         var _loc1_:Texture2DBase = null;
         if(!_isDestroy)
         {
            _loc1_ = _screenPass.diffuseMethod.texture;
         }
         return _loc1_;
      }
      
      public function set texture(param1:Texture2DBase) : void
      {
         _screenPass.diffuseMethod.texture = param1;
         if(param1 && param1.format == "compressedAlpha")
         {
            alphaPremultiplied = false;
         }
      }
      
      public function get ambientTexture() : Texture2DBase
      {
         return _screenPass.ambientMethod.texture;
      }
      
      public function set ambientTexture(param1:Texture2DBase) : void
      {
         _screenPass.diffuseMethod._useDiffuseTexture = true;
         _screenPass.ambientMethod.texture = param1;
      }
      
      override public function dispose() : void
      {
         texture && null;
         super.dispose();
      }
   }
}
