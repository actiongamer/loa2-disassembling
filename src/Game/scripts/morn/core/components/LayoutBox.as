package morn.core.components
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class LayoutBox extends Box
   {
       
      
      protected var _space:Number = 0;
      
      protected var _align:String = "none";
      
      protected var _maxX:Number = 0;
      
      protected var _maxY:Number = 0;
      
      public function LayoutBox()
      {
         super();
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         setChild(param1);
         param1.addEventListener("resize",child_onResize);
         callLater(changeItems);
         return super.addChild(param1);
      }
      
      private function setChild(param1:DisplayObject) : void
      {
      }
      
      private function child_onResize(param1:Event) : void
      {
         callLater(changeItems);
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         setChild(param1);
         param1.addEventListener("resize",child_onResize);
         callLater(changeItems);
         return super.addChildAt(param1,param2);
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         param1.removeEventListener("resize",child_onResize);
         callLater(changeItems);
         return super.removeChild(param1);
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         getChildAt(param1).removeEventListener("resize",child_onResize);
         callLater(changeItems);
         return super.removeChildAt(param1);
      }
      
      override public function commitMeasure() : void
      {
         exeCallLater(changeItems);
         super.commitMeasure();
      }
      
      override public function cancelMeasure() : void
      {
         cancelCallLater(changeItems);
         super.cancelMeasure();
      }
      
      public function refresh() : void
      {
         callLater(changeItems);
      }
      
      protected function changeItems() : void
      {
      }
      
      public function get space() : Number
      {
         return _space;
      }
      
      public function set space(param1:Number) : void
      {
         _space = param1;
         callLater(changeItems);
      }
      
      public function get align() : String
      {
         return _align;
      }
      
      public function set align(param1:String) : void
      {
         _align = param1;
         callLater(changeItems);
      }
   }
}
