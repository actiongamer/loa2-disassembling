package morn.core.utils
{
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.configs.ClientConfig;
   import flash.external.ExternalInterface;
   import com.mz.core.logging.Log;
   import flash.net.navigateToURL;
   import flash.net.URLRequest;
   
   public class URLUtils
   {
      
      public static const TARGET_SELF:String = "_self";
      
      public static const TARGET_BLANK:String = "_blank";
      
      protected static const WINDOW_OPEN_FUNCTION:String = "window.open";
       
      
      public function URLUtils()
      {
         super();
      }
      
      public static function hadMainPage() : Boolean
      {
         if(EnvConfig.ins.ptId == 361)
         {
            return true;
         }
         if(EnvConfig.ins.ptId == 117)
         {
            return true;
         }
         if(EnvConfig.ins.ptId == 2212)
         {
            return true;
         }
         if(EnvConfig.ins.ptId == 31)
         {
            return true;
         }
         if(EnvConfig.ins.ptId == 590)
         {
            return true;
         }
         if(EnvConfig.ins.ptId == 33)
         {
            return true;
         }
         return false;
      }
      
      public static function toMainPageSelf() : Boolean
      {
         if(ClientConfig.mainPageURL != "")
         {
            openWindow(ClientConfig.mainPageURL,"_self");
            return true;
         }
         return false;
      }
      
      public static function refreshCurPage() : void
      {
         if(ClientConfig.airData != null)
         {
            ClientConfig.airData.airReFresh();
         }
         else if(ClientConfig.reStartCallBack)
         {
            ClientConfig.reStartCallBack();
         }
         else if(ExternalInterface.available)
         {
            ExternalInterface.call("location.reload");
         }
      }
      
      public static function callJS(param1:String) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call(param1);
         }
      }
      
      public static function callJSAndReturn(param1:String) : *
      {
         if(ExternalInterface.available)
         {
            return ExternalInterface.call(param1);
         }
         return null;
      }
      
      public static function openWindow(param1:String, param2:String = "_blank", param3:String = "") : void
      {
         Log.info("URLUtils","openWindow:",param1,param2);
         var _loc4_:String = getBrowserName();
         if(_loc4_ == "IE")
         {
            ExternalInterface.call("function setWMWindow() {window.open(\'" + param1 + "\');}");
         }
         else if(_loc4_ == "Safari")
         {
            navigateToURL(new URLRequest(param1),param2);
         }
         else if(_loc4_ == "Opera")
         {
            navigateToURL(new URLRequest(param1),param2);
         }
         else
         {
            navigateToURL(new URLRequest(param1),param2);
         }
      }
      
      private static function getBrowserName() : String
      {
         var _loc1_:* = null;
         var _loc2_:String = "";
         if(ExternalInterface.available)
         {
            _loc2_ = ExternalInterface.call("function getBrowser(){return navigator.userAgent;}");
         }
         if(_loc2_ != null && _loc2_.indexOf("Firefox") >= 0)
         {
            _loc1_ = "Firefox";
         }
         else if(_loc2_ != null && _loc2_.indexOf("Safari") >= 0)
         {
            _loc1_ = "Safari";
         }
         else if(_loc2_ == null || _loc2_.indexOf("MSIE") >= 0)
         {
            _loc1_ = "IE";
         }
         else if(_loc2_ != null && _loc2_.indexOf("Opera") >= 0)
         {
            _loc1_ = "Opera";
         }
         else
         {
            _loc1_ = "Undefined";
         }
         return _loc1_;
      }
   }
}
