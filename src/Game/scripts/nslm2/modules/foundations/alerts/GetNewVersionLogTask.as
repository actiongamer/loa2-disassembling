package nslm2.modules.foundations.alerts
{
   import com.mz.core.utils2.task.TaskBase;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.foundations.setting.service.SettingService;
   import flash.events.Event;
   import com.mz.core.logging.Log;
   
   public class GetNewVersionLogTask extends TaskBase
   {
      
      public static var needShow:Boolean = false;
      
      public static var stamp:int;
      
      public static var content:String;
       
      
      private var isCheck:Boolean;
      
      public var urlLoader:URLLoader;
      
      public var urlRequest:URLRequest;
      
      public function GetNewVersionLogTask(param1:Boolean)
      {
         super();
         isCheck = param1;
      }
      
      override public function exec() : void
      {
         super.exec();
         se_getVersion();
      }
      
      private function se_getVersion() : void
      {
         if(EnvConfig.ins.showDebugModule)
         {
            this.onComplete();
            return;
         }
         this.urlLoader = new URLLoader();
         var _loc1_:String = ClientConfig.battleReportUrl.replace("btl","vernotice?stamp=");
         if(this.isCheck)
         {
            _loc1_ = _loc1_ + SettingService.ins.getValue(43);
         }
         else
         {
            _loc1_ = _loc1_ + "0";
         }
         this.urlRequest = new URLRequest(_loc1_);
         this.urlLoader.addEventListener("complete",vernotice_cpl);
         this.urlLoader.addEventListener("ioError",onError);
         this.urlLoader.addEventListener("securityError",onError);
         urlLoader.load(urlRequest);
      }
      
      private function vernotice_cpl(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:String = "";
         _loc3_ = _loc3_ + String(urlLoader.data);
         try
         {
            _loc2_ = JSON.parse(_loc3_);
            _loc4_ = _loc2_["status"];
            if(_loc4_)
            {
               stamp = _loc2_["stamp"];
               content = _loc2_["data"];
               if(this.isCheck && content)
               {
                  needShow = true;
               }
            }
         }
         catch(err:Error)
         {
            Log.fatal(this,"更新公告解析错误",err);
         }
         this.onComplete();
      }
      
      private function onError(param1:Event) : void
      {
         Log.warn("get new version log error",param1);
         this.onComplete();
      }
   }
}
