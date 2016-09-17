package away3d.events
{
   import flash.events.Event;
   
   public class LoaderEvent extends Event
   {
      
      public static const LOAD_ERROR:String = "loadError";
      
      public static const RESOURCE_COMPLETE:String = "resourceComplete";
      
      public static const DEPENDENCY_COMPLETE:String = "dependencyComplete";
       
      
      private var _url:String;
      
      private var _message:String;
      
      private var _isDependency:Boolean;
      
      private var _isDefaultPrevented:Boolean;
      
      public function LoaderEvent(param1:String, param2:String = null, param3:Boolean = false, param4:String = null)
      {
         super(param1);
         _url = param2;
         _message = param4;
         _isDependency = param3;
      }
      
      public function get url() : String
      {
         return _url;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function get isDependency() : Boolean
      {
         return _isDependency;
      }
      
      override public function preventDefault() : void
      {
         _isDefaultPrevented = true;
      }
      
      override public function isDefaultPrevented() : Boolean
      {
         return _isDefaultPrevented;
      }
      
      override public function clone() : Event
      {
         return new LoaderEvent(type,_url,_isDependency,_message);
      }
   }
}
