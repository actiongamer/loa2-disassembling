package away3d.animators.data
{
   import flash.geom.ColorTransform;
   
   public class ColorSegmentPoint
   {
       
      
      private var _color:ColorTransform;
      
      private var _life:Number;
      
      public function ColorSegmentPoint(param1:Number, param2:ColorTransform)
      {
         super();
         if(param1 <= 0 || param1 >= 1)
         {
            throw new Error("life exceeds range (0,1)");
         }
         _life = param1;
         _color = param2;
      }
      
      public function get color() : ColorTransform
      {
         return _color;
      }
      
      public function get life() : Number
      {
         return _life;
      }
   }
}
