package nslm2.modules.funnies.championShip.ctr
{
   import com.mz.core.interFace.IDispose;
   import morn.customs.components.GRect;
   import morn.core.components.View;
   import morn.customs.FilterLib;
   
   public class ProgressLineCtr implements IDispose
   {
      
      public static const LINE_1:String = "line1";
      
      public static const LINE_2:String = "line2";
       
      
      private var line1:GRect;
      
      private var line2:GRect;
      
      private var view:View;
      
      public function ProgressLineCtr(param1:View)
      {
         super();
         view = param1;
         line1 = ref_Line_1;
         line2 = ref_Line_2;
      }
      
      public function set highlight(param1:Boolean) : void
      {
         if(!line1)
         {
            line1 = ref_Line_1;
         }
         if(!line2)
         {
            line2 = ref_Line_2;
         }
         if(param1)
         {
            if(line1)
            {
               line1.filters = [FilterLib.BORDER_RED];
            }
            if(line2)
            {
               line2.filters = [FilterLib.BORDER_RED];
            }
         }
         else
         {
            if(line1)
            {
               line1.filters = null;
            }
            if(line2)
            {
               line2.filters = null;
            }
         }
      }
      
      public function set lineColor(param1:uint) : void
      {
         if(!line1)
         {
            line1 = ref_Line_1;
         }
         if(!line2)
         {
            line2 = ref_Line_2;
         }
         if(line1)
         {
            line1.fillColor = param1;
            line1.draw();
         }
         if(line2)
         {
            line2.fillColor = param1;
            line2.draw();
         }
      }
      
      protected function get ref_Line_1() : GRect
      {
         if(view.hasOwnProperty("line1"))
         {
            return view["line1"] as GRect;
         }
         return null;
      }
      
      protected function get ref_Line_2() : GRect
      {
         if(view.hasOwnProperty("line2"))
         {
            return view["line2"] as GRect;
         }
         return null;
      }
      
      public function dispose() : void
      {
         view = null;
         line1 = null;
         line2 = null;
      }
   }
}
