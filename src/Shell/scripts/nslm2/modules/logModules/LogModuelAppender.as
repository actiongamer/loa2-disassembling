package nslm2.modules.logModules
{
   import com.mz.core.logging.appenders.AbstractAppender;
   import com.mz.core.logging.Log;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import com.mz.core.configs.ClientConfig;
   import nslm2.utils.TimeUtils;
   import org.manager.DateUtils;
   import flash.net.URLVariables;
   import flash.events.Event;
   
   public class LogModuelAppender extends AbstractAppender
   {
      
      private static var _ins:nslm2.modules.logModules.LogModuelAppender;
       
      
      public var history:Array;
      
      private var _ui;
      
      public var sendHistory:Array;
      
      public var urlLoader:URLLoader;
      
      public var urlRequest:URLRequest;
      
      public var lastSendContent:String;
      
      public function LogModuelAppender()
      {
         history = [];
         sendHistory = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.logModules.LogModuelAppender
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.logModules.LogModuelAppender();
            Log.addApender(_ins);
         }
         return _ins;
      }
      
      public function get ui() : *
      {
         return _ui;
      }
      
      public function set ui(param1:*) : void
      {
         if(_ui != param1)
         {
            _ui = param1;
         }
      }
      
      override public function write(param1:int, param2:String, param3:Array) : Boolean
      {
         if(!super.write(param1,param2,param3))
         {
            return false;
         }
         if(sendHistory.length > 20)
         {
            sendHistory.shift();
         }
         sendHistory.push(param1 + "," + param2 + "," + param3);
         switch(int(param1) - 8)
         {
            case 0:
               sendLog(param1 + "," + param2 + "," + param3);
               break;
            default:
               sendLog(param1 + "," + param2 + "," + param3);
               break;
            default:
               sendLog(param1 + "," + param2 + "," + param3);
               break;
            default:
               sendLog(param1 + "," + param2 + "," + param3);
               break;
            default:
               sendLog(param1 + "," + param2 + "," + param3);
               break;
            default:
               sendLog(param1 + "," + param2 + "," + param3);
               break;
            default:
               sendLog(param1 + "," + param2 + "," + param3);
               break;
            default:
               sendLog(param1 + "," + param2 + "," + param3);
               break;
            case 8:
               sendLog(sendHistory.join("\n"));
               sendHistory = [];
         }
         if(ui == null)
         {
            if(history.length > 20)
            {
               history.shift();
            }
            history.push([param1,param2,param3]);
         }
         else
         {
            ui.log(param1,param2,param3);
         }
         return true;
      }
      
      public function showHistroy() : void
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:* = null;
         if(history)
         {
            _loc1_ = history.length;
            _loc3_ = 0;
            while(_loc3_ < _loc1_)
            {
               _loc2_ = history[_loc3_];
               ui.log.apply(null,_loc2_);
               _loc3_++;
            }
            history = [];
         }
      }
      
      private function sendLog(param1:String) : void
      {
         var _loc2_:* = null;
         if(lastSendContent == param1)
         {
            return;
         }
         lastSendContent = param1;
         try
         {
            if(urlLoader == null)
            {
               this.urlLoader = new URLLoader();
               this.urlRequest = new URLRequest(ClientConfig.battleReportUrl.replace("btl","client"));
               this.urlLoader.addEventListener("ioError",onError);
               this.urlLoader.addEventListener("securityError",onError);
               this.urlRequest.method = "POST";
               this.urlRequest.contentType = "application/x-www-form-urlencoded";
            }
            param1 = TimeUtils.getFullTimeStrDate(new DateUtils()) + "," + param1 + "\n";
            _loc2_ = new URLVariables();
            _loc2_.data = param1;
            this.urlRequest.data = _loc2_;
            urlLoader.load(urlRequest);
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      private function onError(param1:Event) : void
      {
      }
      
      override protected function isFiltered(param1:String) : Boolean
      {
         var _loc2_:* = param1;
         if("FPDebug" !== _loc2_)
         {
            return false;
         }
         return true;
      }
   }
}
