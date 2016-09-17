package away3d.materials
{
   public class ColorMaterial extends SinglePassMaterialBase
   {
       
      
      private var _diffuseAlpha:Number = 1;
      
      public function ColorMaterial(param1:uint = 13421772, param2:Number = 1)
      {
         super();
         this.color = param1;
         this.alpha = param2;
      }
      
      public function get alpha() : Number
      {
         return _screenPass.diffuseMethod.diffuseAlpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         if(param1 > 1)
         {
            param1 = 1;
         }
         else if(param1 < 0)
         {
            param1 = 0;
         }
         _diffuseAlpha = param1;
         _screenPass.diffuseMethod.diffuseAlpha = param1;
         _screenPass.preserveAlpha = requiresBlending;
         _screenPass.setBlendMode(blendMode,requiresBlending);
      }
      
      public function get color() : uint
      {
         return _screenPass.diffuseMethod.diffuseColor;
      }
      
      public function set color(param1:uint) : void
      {
         _screenPass.diffuseMethod.diffuseColor = param1;
      }
      
      override public function get requiresBlending() : Boolean
      {
         return super.requiresBlending || _diffuseAlpha < 1;
      }
   }
}
