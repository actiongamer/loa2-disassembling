package morn.core.events
{
   import flash.events.Event;
   import flash.display.DisplayObject;
   
   public class DragEvent extends Event
   {
      
      public static const DRAG_START:String = "dragStart";
      
      public static const DRAG_DROP:String = "dragDrop";
      
      public static const DRAG_COMPLETE:String = "dragComplete";
       
      
      protected var _data;
      
      protected var _dragInitiator:DisplayObject;
      
      public function DragEvent(param1:String, param2:DisplayObject = null, param3:* = null, param4:Boolean = true, param5:Boolean = false)
      {
         super(param1,param4,param5);
         _dragInitiator = param2;
         _data = param3;
      }
      
      public function get dragInitiator() : DisplayObject
      {
         return _dragInitiator;
      }
      
      public function set dragInitiator(param1:DisplayObject) : void
      {
         _dragInitiator = param1;
      }
      
      public function get data() : *
      {
         return _data;
      }
      
      public function set data(param1:*) : void
      {
         _data = param1;
      }
      
      override public function clone() : Event
      {
         return new DragEvent(type,_dragInitiator,_data,bubbles,cancelable);
      }
   }
}
