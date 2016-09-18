package nslm2.utils
{
   import nslm2.common.configs.StcLanguageConfig;
   import morn.core.utils.StringUtils;
   import org.manager.DateUtils;
   import com.mz.core.configs.ClientConfig;
   import morn.core.utils.NumberUtil;
   
   public class TimeUtils
   {
       
      
      public function TimeUtils()
      {
         super();
      }
      
      public static function oneCN(param1:int) : String
      {
         if(param1 > 2592000)
         {
            return int(param1 / 2592000) + StcLanguageConfig.ins.getLanguage(999000575);
         }
         if(param1 > 86400)
         {
            return int(param1 / 86400) + StcLanguageConfig.ins.getLanguage(999000566);
         }
         if(param1 > 3600)
         {
            return int(param1 / 3600) + StcLanguageConfig.ins.getLanguage(999000567);
         }
         return Math.max(1,int(param1 / 60)) + StcLanguageConfig.ins.getLanguage(999000568);
      }
      
      public static function getTimeStr(param1:Date) : String
      {
         var _loc2_:String = "";
         _loc2_ = _loc2_ + (StringUtils.addZeorFront(param1.getMonth() + 1,2) + "/" + StringUtils.addZeorFront(param1.getDate(),2) + "/" + param1.getFullYear() + " " + StringUtils.addZeorFront(param1.getHours(),2) + ":" + StringUtils.addZeorFront(param1.getMinutes(),2) + ":" + StringUtils.addZeorFront(param1.getSeconds(),2));
         return _loc2_;
      }
      
      public static function ymdCN(param1:int) : String
      {
         var _loc2_:DateUtils = new DateUtils();
         _loc2_.time = param1 * 1000;
         var _loc3_:String = "";
         _loc3_ = _loc3_ + _loc2_.fullYear;
         _loc3_ = _loc3_ + ("/" + (_loc2_.month + 1) + "/" + _loc2_.date);
         return _loc3_;
      }
      
      public static function ymdhisCN(param1:uint) : String
      {
         var _loc2_:DateUtils = new DateUtils();
         _loc2_.time = param1 * 1000;
         var _loc3_:String = "";
         _loc3_ = _loc3_ + _loc2_.fullYear;
         _loc3_ = _loc3_ + ("/" + (_loc2_.month + 1) + "/" + _loc2_.date);
         _loc3_ = _loc3_ + (" " + StringUtils.addZeorFront(String(_loc2_.hours),2) + ":" + StringUtils.addZeorFront(String(_loc2_.minutes),2) + ":" + StringUtils.addZeorFront(String(_loc2_.seconds),2));
         return _loc3_;
      }
      
      public static function getFullTimeStr(param1:int, param2:Boolean = true, param3:Boolean = true) : String
      {
         var _loc4_:DateUtils = new DateUtils();
         _loc4_.time = param1 * 1000;
         return getFullTimeStrDate(_loc4_,false,param2,param3);
      }
      
      public static function getFullTimeStrDate(param1:DateUtils, param2:Boolean = false, param3:Boolean = true, param4:Boolean = true, param5:Boolean = true) : String
      {
         var _loc7_:String = "";
         var _loc9_:String = param1.fullYear + "";
         var _loc8_:String = StringUtils.addZeorFront(String(param1.month + 1),2);
         var _loc11_:String = StringUtils.addZeorFront(String(param1.date),2);
         var _loc12_:String = StringUtils.addZeorFront(String(param1.hours),2);
         var _loc10_:String = StringUtils.addZeorFront(String(param1.minutes),2);
         var _loc6_:String = StringUtils.addZeorFront(String(param1.seconds),2);
         if(!param2)
         {
            if(param3)
            {
               _loc7_ = _loc8_ + "/" + _loc11_ + "/" + _loc9_ + " " + _loc12_ + ":" + _loc10_;
            }
            else
            {
               _loc7_ = _loc8_ + "/" + _loc11_ + " " + _loc12_ + ":" + _loc10_;
            }
            if(param4)
            {
               _loc7_ = _loc7_ + (":" + _loc6_);
            }
         }
         else
         {
            if(param3)
            {
               _loc7_ = _loc9_ + StcLanguageConfig.ins.getLanguage(999000572) + _loc8_ + StcLanguageConfig.ins.getLanguage(999000573) + _loc11_ + StcLanguageConfig.ins.getLanguage(999000574) + (!!param5?" " + _loc12_ + ":" + _loc10_:"");
            }
            else
            {
               _loc7_ = _loc8_ + StcLanguageConfig.ins.getLanguage(999000573) + _loc11_ + StcLanguageConfig.ins.getLanguage(999000574) + (!!param5?" " + _loc12_ + ":" + _loc10_:"");
            }
            if(param4)
            {
               _loc7_ = _loc7_ + (":" + _loc6_);
            }
         }
         return _loc7_;
      }
      
      public static function getFullTimeStrCN(param1:int, param2:Boolean = true, param3:Boolean = true, param4:Boolean = true, param5:Boolean = true) : String
      {
         var _loc6_:DateUtils = new DateUtils();
         _loc6_.time = param1 * 1000;
         return getFullTimeStrDate(_loc6_,param4,param2,param3,param5);
      }
      
      public static function getShortTimeStr(param1:int) : String
      {
         var _loc3_:String = "";
         var _loc2_:DateUtils = new DateUtils();
         _loc2_.time = param1 * 1000;
         var _loc5_:String = _loc2_.fullYear + "";
         var _loc4_:String = StringUtils.addZeorFront(String(_loc2_.month + 1),2);
         var _loc6_:String = StringUtils.addZeorFront(String(_loc2_.date),2);
         if(ClientConfig.isRuLang())
         {
            _loc3_ = StringUtils.addZeorFront(_loc6_,2) + "/" + StringUtils.addZeorFront(_loc4_,2) + "/" + _loc5_;
         }
         else
         {
            _loc3_ = StringUtils.addZeorFront(_loc4_,2) + "/" + StringUtils.addZeorFront(_loc6_,2) + "/" + _loc5_;
         }
         return _loc3_;
      }
      
      public static function getShortTimeStrCN(param1:int, param2:Boolean) : String
      {
         var _loc4_:String = "";
         var _loc3_:DateUtils = new DateUtils();
         _loc3_.time = param1 * 1000;
         var _loc6_:String = _loc3_.fullYear + "";
         var _loc5_:String = StringUtils.addZeorFront(String(_loc3_.month + 1),2);
         var _loc7_:String = StringUtils.addZeorFront(String(_loc3_.date),2);
         if(param2)
         {
            _loc4_ = _loc6_ + " " + _loc5_ + "-" + _loc7_;
         }
         else
         {
            _loc4_ = _loc5_ + "-" + _loc7_;
         }
         return _loc4_;
      }
      
      public static function getSimpleTimeStr(param1:int) : String
      {
         var _loc2_:int = Math.floor(param1 / 3600);
         var _loc4_:int = Math.floor(param1 % 3600 / 60);
         var _loc3_:int = param1 % 60;
         return StringUtils.addZeorFront(String(_loc2_),2) + ":" + StringUtils.addZeorFront(String(_loc4_),2) + ":" + StringUtils.addZeorFront(String(_loc3_),2);
      }
      
      public static function getSimpleTimeStr1(param1:int) : String
      {
         var _loc2_:int = Math.floor(param1 / 3600);
         var _loc4_:int = Math.floor(param1 % 3600 / 60);
         var _loc3_:int = param1 % 60;
         return StringUtils.addZeorFront(String(_loc2_),2) + ":" + StringUtils.addZeorFront(String(_loc4_),2);
      }
      
      public static function getSimpleTimeStr2(param1:int) : String
      {
         var _loc4_:String = "";
         var _loc2_:DateUtils = new DateUtils();
         _loc2_.time = param1 * 1000;
         var _loc5_:String = StringUtils.addZeorFront(String(_loc2_.month + 1),2);
         var _loc7_:String = StringUtils.addZeorFront(String(_loc2_.date),2);
         var _loc6_:String = StringUtils.addZeorFront(String(_loc2_.hours),2);
         var _loc3_:String = StringUtils.addZeorFront(String(_loc2_.minutes),2);
         _loc4_ = StringUtils.addZeorFront(_loc5_,2) + "/" + StringUtils.addZeorFront(_loc7_,2) + " " + _loc6_ + ":" + _loc3_;
         return _loc4_;
      }
      
      public static function hiWithZero(param1:DateUtils) : String
      {
         var _loc2_:String = StringUtils.addZeorFront(String(param1.hours),2);
         var _loc3_:String = StringUtils.addZeorFront(String(param1.minutes),2);
         return _loc2_ + ":" + _loc3_;
      }
      
      public static function isColonWithZero(param1:int, param2:Boolean = false) : String
      {
         var _loc5_:int = param1 / 60;
         if(param2)
         {
            _loc5_ = _loc5_ % 60;
         }
         var _loc4_:String = StringUtils.addZeorFront(String(_loc5_),2);
         var _loc3_:String = StringUtils.addZeorFront(String(param1 % 60),2);
         return _loc4_ + ":" + _loc3_;
      }
      
      public static function hisCN(param1:int) : String
      {
         var _loc3_:int = Math.floor(param1 / 3600);
         var _loc5_:int = Math.floor(param1 % 3600 / 60);
         var _loc4_:int = param1 % 60;
         var _loc2_:String = "";
         if(_loc3_ > 0)
         {
            _loc2_ = _loc2_ + (_loc3_ + StcLanguageConfig.ins.getLanguage(999000570));
         }
         if(_loc5_ > 0)
         {
            _loc2_ = _loc2_ + (_loc5_ + StcLanguageConfig.ins.getLanguage(999000571));
         }
         _loc2_ = _loc2_ + (_loc4_ + StcLanguageConfig.ins.getLanguage(999000569));
         return _loc2_;
      }
      
      public static function hisCNWithDay(param1:int) : String
      {
         var _loc4_:int = Math.floor(param1 / 3600 / 24);
         var _loc3_:int = Math.floor(param1 % 86400 / 3600);
         var _loc6_:int = Math.floor(param1 % 3600 / 60);
         var _loc5_:int = param1 % 60;
         var _loc2_:String = "";
         if(_loc4_ > 0)
         {
            _loc2_ = _loc2_ + (_loc4_ + StcLanguageConfig.ins.getLanguage(999000566));
         }
         if(_loc3_ > 0)
         {
            _loc2_ = _loc2_ + (_loc3_ + StcLanguageConfig.ins.getLanguage(999000570));
         }
         if(_loc6_ > 0)
         {
            _loc2_ = _loc2_ + (_loc6_ + StcLanguageConfig.ins.getLanguage(999000571));
         }
         _loc2_ = _loc2_ + (_loc5_ + StcLanguageConfig.ins.getLanguage(999000569));
         return _loc2_;
      }
      
      public static function getOffLineTime(param1:int) : String
      {
         var _loc3_:int = Math.floor(param1 / 1440);
         var _loc2_:int = Math.floor(param1 / 60);
         if(_loc3_ > 0)
         {
            return _loc3_ + StcLanguageConfig.ins.getLanguage(999000566);
         }
         if(_loc2_ > 0)
         {
            return _loc2_ + StcLanguageConfig.ins.getLanguage(999000567);
         }
         return param1 + StcLanguageConfig.ins.getLanguage(999000568);
      }
      
      public static function hisCNFull2(param1:int) : String
      {
         var _loc3_:int = Math.floor(param1 / 3600);
         var _loc5_:int = Math.floor(param1 % 3600 / 60);
         var _loc4_:int = param1 % 60;
         var _loc2_:String = "";
         if(_loc3_ > 0)
         {
            _loc2_ = _loc2_ + (_loc3_ + StcLanguageConfig.ins.getLanguage(999000567));
         }
         if(_loc5_ > 0)
         {
            _loc2_ = _loc2_ + (_loc5_ + StcLanguageConfig.ins.getLanguage(999000568));
         }
         _loc2_ = _loc2_ + (_loc4_ + StcLanguageConfig.ins.getLanguage(999000569));
         return _loc2_;
      }
      
      public static function hisColonAddZero2(param1:int) : String
      {
         var _loc4_:int = Math.floor(param1 / 3600);
         var _loc3_:int = Math.floor(param1 % 3600 / 60);
         var _loc5_:int = param1 % 60;
         var _loc2_:String = "";
         if(_loc4_ > 0)
         {
            _loc2_ = _loc2_ + (NumberUtil.addZeroFront(_loc4_,2) + ":");
         }
         _loc2_ = _loc2_ + (NumberUtil.addZeroFront(_loc3_,2) + ":");
         _loc2_ = _loc2_ + (NumberUtil.addZeroFront(_loc5_,2) + "");
         return _loc2_;
      }
      
      public static function hisColonFullAddZero(param1:int) : String
      {
         var _loc4_:int = Math.floor(param1 / 3600);
         var _loc3_:int = Math.floor(param1 % 3600 / 60);
         var _loc5_:int = param1 % 60;
         var _loc2_:String = "";
         return NumberUtil.addZeroFront(_loc4_,2) + ":" + NumberUtil.addZeroFront(_loc3_,2) + ":" + NumberUtil.addZeroFront(_loc5_,2);
      }
      
      public static function countDayToSecond(param1:int) : int
      {
         return param1 * 24 * 3600;
      }
      
      public static function pareseSecondToDate(param1:uint) : DateUtils
      {
         var _loc2_:DateUtils = new DateUtils();
         _loc2_.time = param1 * 1000;
         return _loc2_;
      }
      
      public static function parseStringToSecond(param1:String) : uint
      {
         var _loc2_:Number = getTimestamp1(param1);
         return _loc2_ / 1000;
      }
      
      private static function getTimestamp(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int = 0) : Number
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
      
      private static function getTimestamp1(param1:String) : Number
      {
         var _loc2_:Array = param1.split(" ");
         var _loc4_:Array = _loc2_[0].split("-");
         var _loc3_:Array = _loc2_[1].split(":");
         return getTimestamp(_loc4_[0],_loc4_[1],_loc4_[2],_loc3_[0],_loc3_[1],_loc3_[2],0);
      }
   }
}
