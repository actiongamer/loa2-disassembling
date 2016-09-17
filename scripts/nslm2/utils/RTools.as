package nslm2.utils
{
   import flash.system.Capabilities;
   import com.mz.core.utils.MathUtil;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.interFace.IDispose;
   import com.mz.core.utils.DictHash;
   import flash.system.System;
   import org.manager.DateUtils;
   import com.mz.core.logging.Log;
   import proto.StaticOpActivity.Table;
   
   public class RTools
   {
      
      private static var _isMacOS:int;
       
      
      public function RTools()
      {
         super();
      }
      
      public static function isMacOS() : Boolean
      {
         if(_isMacOS == 0)
         {
            _isMacOS = Capabilities.os.indexOf("Mac") > -1?1:2;
         }
         return _isMacOS == 1;
      }
      
      public static function frameRateToMs(param1:int) : int
      {
         return MathUtil.round(1000 / param1);
      }
      
      public static function msToFrame(param1:int) : int
      {
         return param1 / 1000 * ClientConfig.frameRate;
      }
      
      public static function disposeArrOrVector(param1:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(param1 != null)
         {
            _loc3_ = param1.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = param1[_loc4_];
               if(_loc2_ is IDispose)
               {
                  (_loc2_ as IDispose).dispose();
               }
               else if(_loc2_.hasOwnProperty("dispose") && (_loc2_["dispose"] as Function).length == 0)
               {
                  _loc2_["dispose"]();
               }
               _loc4_++;
            }
            param1.length = 0;
         }
      }
      
      public static function disposeDictHash(param1:DictHash) : void
      {
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = param1.dict;
         for(var _loc3_ in param1.dict)
         {
            _loc2_ = param1.dict[_loc3_];
            if(_loc2_ is IDispose)
            {
               (_loc2_ as IDispose).dispose();
            }
            else if(_loc2_.hasOwnProperty("dispose") && (_loc2_["dispose"] as Function).length == 0)
            {
               _loc2_["dispose"]();
            }
            delete param1.dict[_loc3_];
         }
         param1.clear();
      }
      
      public static function gc() : void
      {
         try
         {
            System.gc();
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      public static function checkAndGc() : void
      {
         try
         {
            if(System.totalMemory > 600736576)
            {
               gc();
            }
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      public static function cl(param1:*, param2:*) : *
      {
         var _loc3_:* = App.language;
         if("tw" !== _loc3_)
         {
            if("common" !== _loc3_)
            {
               return param1;
            }
            return param2;
         }
         return param2;
      }
      
      public static function getTimestamp(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int = 0) : Number
      {
         var _loc8_:Date = new Date();
         _loc8_.fullYearUTC = param1;
         _loc8_.monthUTC = 7;
         _loc8_.dateUTC = param3;
         _loc8_.hoursUTC = param4;
         _loc8_.minutesUTC = param5;
         _loc8_.secondsUTC = param6;
         _loc8_.millisecondsUTC = param7;
         _loc8_.monthUTC = param2 - 1;
         _loc8_.time = _loc8_.time - DateUtils.timeZone * 3600 * 1000;
         return _loc8_.time;
      }
      
      public static function getTimestamp1(param1:String) : Number
      {
         var _loc2_:Array = param1.split(" ");
         var _loc4_:Array = _loc2_[0].split("-");
         var _loc3_:Array = _loc2_[1].split(":");
         return getTimestamp(_loc4_[0],_loc4_[1],_loc4_[2],_loc3_[0],_loc3_[1],_loc3_[2],0);
      }
      
      public static function getColorText(param1:String, param2:uint) : String
      {
         return "<font color=\"#" + param2.toString(16) + "\">" + param1 + "</font>";
      }
      
      public static function getZheKou(param1:Number, param2:Boolean = false) : Number
      {
         if(!param2)
         {
            if(ClientConfig.isChineseLang())
            {
               return param1;
            }
            return 100 - 10 * param1;
         }
         return param1;
      }
      
      public static function getShortString(param1:String, param2:int = 15) : String
      {
         if(param1.length > param2)
         {
            param1 = param1.slice(0,param2);
            param1 = param1 + "...";
         }
         return param1;
      }
      
      public static function isAppointServer() : Boolean
      {
         if(ClientConfig.publishPath.indexOf("/st/") != -1 || ClientConfig.publishPath.indexOf("/sn/") != -1 || ClientConfig.publishPath.indexOf("/s0/") != -1)
         {
            return true;
         }
         return false;
      }
      
      public static function getStrByJSON(param1:String) : String
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         try
         {
            _loc2_ = JSON.parse(param1);
            _loc3_ = App.language;
            if(_loc3_ == "common")
            {
               _loc3_ = "cn";
            }
            if(_loc2_[_loc3_])
            {
               var _loc5_:* = _loc2_[_loc3_];
               return _loc5_;
            }
            var _loc6_:* = _loc2_["en"];
            return _loc6_;
         }
         catch(e:Error)
         {
            var _loc7_:* = param1;
            return _loc7_;
         }
         return "";
      }
      
      public static function getTableFieldIndexByFieldName(param1:Table, param2:String) : int
      {
         var _loc5_:int = 0;
         var _loc4_:* = param1.fields;
         for(var _loc3_ in param1.fields)
         {
            if(param1.fields[_loc3_] == param2)
            {
               return int(_loc3_);
            }
         }
         return -1;
      }
   }
}
