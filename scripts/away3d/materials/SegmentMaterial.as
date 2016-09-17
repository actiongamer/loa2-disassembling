package away3d.materials
{
   import away3d.materials.passes.SegmentPass;
   
   public class SegmentMaterial extends MaterialBase
   {
       
      
      private var _screenPass:SegmentPass;
      
      public function SegmentMaterial(param1:Number = 1.25)
      {
         super();
         bothSides = true;
         _screenPass = new SegmentPass(param1);
         addPass(new SegmentPass(param1));
         _screenPass.material = this;
      }
   }
}
