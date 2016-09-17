package nslm2.modules.globalModules.facebook.control
{
   import flash.events.EventDispatcher;
   
   public class FBControl extends EventDispatcher
   {
      
      private static var _instance:nslm2.modules.globalModules.facebook.control.FBControl;
       
      
      public function FBControl()
      {
         super();
      }
      
      public static function get instance() : nslm2.modules.globalModules.facebook.control.FBControl
      {
         if(_instance == null)
         {
            _instance = new nslm2.modules.globalModules.facebook.control.FBControl();
         }
         return _instance;
      }
   }
}
