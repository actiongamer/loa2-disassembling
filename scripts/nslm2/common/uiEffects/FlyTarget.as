package nslm2.common.uiEffects
{
   import flash.geom.Point;
   
   public class FlyTarget
   {
       
      
      public var target;
      
      public var offset:Point;
      
      public function FlyTarget(param1:*, param2:Point)
      {
         super();
         this.target = param1;
         if(param2 == null)
         {
            param2 = new Point();
         }
         this.offset = param2;
      }
   }
}
