package nslm2.modules.logModules
{
   import com.mz.core.logging.appenders.AbstractAppender;
   import flash.net.LocalConnection;
   import flash.events.StatusEvent;
   import com.mz.core.logging.Log;
   import com.mz.core.configs.ClientConfig;
   
   public class LCAppender extends AbstractAppender
   {
      
      public static var ignoreStatus:Boolean = true;
      
      public static var secure:Boolean = false;
      
      public static var secureDomain:String = "*";
      
      private static var lc:LocalConnection = new LocalConnection();
      
      private static var hasEventListeners:Boolean = false;
       
      
      public function LCAppender()
      {
         super();
         write(2,"LCAppender",["===========================Start========================"]);
      }
      
      private static function status(param1:StatusEvent) : void
      {
         Log.debug(LCAppender,"Arthropod status:\n" + param1.toString());
      }
      
      private static function ignore(param1:StatusEvent) : void
      {
      }
      
      override public function write(param1:int, param2:String, param3:Array) : Boolean
      {
         if(ClientConfig.showLog)
         {
            if(!secure)
            {
               lc.allowInsecureDomain("*");
            }
            else
            {
               lc.allowDomain(secureDomain);
            }
            if(!hasEventListeners)
            {
               if(ignoreStatus)
               {
                  lc.addEventListener("status",ignore);
               }
               else
               {
                  lc.addEventListener("status",status);
               }
               hasEventListeners = true;
            }
            try
            {
               lc.send("LCLog","log",param1,param2,param3.join(" "));
               lc.send("app#LogTools:LCLog","log",param1,param2,param3.join(" "));
               var _loc5_:Boolean = true;
               return _loc5_;
            }
            catch(e:*)
            {
               var _loc6_:Boolean = false;
               return _loc6_;
            }
            return false;
         }
         return false;
      }
   }
}
