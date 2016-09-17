package org.specter3d.debug
{
   import flash.utils.Dictionary;
   import org.specter3d.loaders.AssetLib;
   import org.specter3d.mvc.Facade;
   import com.mz.core.logging.Log;
   
   public class DebugEngineLog
   {
      
      public static const THROW_ERROR_TO_CHAT:String = "throw_error_to_chat";
      
      public static const THROW_ERROR_TO_WINDOW_ERROR:String = "throw_error_to_window_error";
      
      private static var _popErrors:Dictionary = new Dictionary();
       
      
      public function DebugEngineLog()
      {
         super();
      }
      
      public static function toChat(param1:String) : void
      {
         if(true && AssetLib.checkLocalAndDevelopServer())
         {
            Facade.instance.sendNotification("throw_error_to_chat",param1);
         }
         Log.warn(DebugEngineLog,param1);
      }
      
      public static function toWindowError(param1:String) : void
      {
         var _loc2_:* = null;
         if(true && AssetLib.checkLocalAndDevelopServer() && !_popErrors[param1])
         {
            _loc2_ = "<font color=\'#ff0000\'>开发服BUG提示！</font>" + param1;
            Facade.instance.sendNotification("throw_error_to_window_error",_loc2_);
            _popErrors[param1] = true;
         }
         Log.error(DebugEngineLog,param1);
      }
   }
}
