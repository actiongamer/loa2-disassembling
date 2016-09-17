package morn.core.events
{
   import flash.events.Event;
   
   public class UIEvent extends Event
   {
      
      public static const MOVE:String = "move";
      
      public static const RENDER_COMPLETED:String = "renderCompleted";
      
      public static const SHOW_TIP:String = "showTip";
      
      public static const HIDE_TIP:String = "hideTip";
      
      public static const IMAGE_LOADED:String = "imageLoaded";
      
      public static const SCROLL:String = "scroll";
      
      public static const FRAME_CHANGED:String = "frameChanged";
      
      public static const ITEM_RENDER:String = "listRender";
      
      public static const ACCORDION_CHANGE_SUB_SELECTED_DATA:String = "accordion_change_sub_selected_data";
       
      
      private var _data;
      
      public function UIEvent(param1:String, param2:*, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         _data = param2;
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
         return new UIEvent(type,_data,bubbles,cancelable);
      }
   }
}
