package away3d.events
{
   import flash.events.Event;
   import away3d.cameras.lenses.LensBase;
   
   public class LensEvent extends Event
   {
      
      public static const MATRIX_CHANGED:String = "matrixChanged";
      
      public static const PROJECTION_HEIGHT_CHANGED:String = "projectionHeightChanged";
       
      
      private var _lens:LensBase;
      
      public function LensEvent(param1:String, param2:LensBase, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         _lens = param2;
      }
      
      public function get lens() : LensBase
      {
         return _lens;
      }
      
      override public function clone() : Event
      {
         return new LensEvent(type,_lens,bubbles,cancelable);
      }
   }
}
