package org.manager
{
   public class DateUtils
   {
      
      public static var timeZone:int = 0;
       
      
      private var _date:Date;
      
      public function DateUtils(param1:* = null, param2:* = null, param3:* = null, param4:* = null, param5:* = null, param6:* = null, param7:* = null)
      {
         super();
         if(param1 != null && param2 != null && param3 != null && param4 != null && param5 != null && param6 != null && param7 != null)
         {
            _date = new Date(param1,param2,param3,param4,param5,param6,param7);
         }
         else if(param1 != null && param2 != null && param3 != null && param4 != null && param5 != null && param6 != null)
         {
            _date = new Date(param1,param2,param3,param4,param5,param6);
         }
         else if(param1 != null && param2 != null && param3 != null && param4 != null && param5 != null)
         {
            _date = new Date(param1,param2,param3,param4,param5);
         }
         else if(param1 != null && param2 != null && param3 != null && param4 != null)
         {
            _date = new Date(param1,param2,param3,param4);
         }
         else if(param1 != null && param2 != null && param3 != null)
         {
            _date = new Date(param1,param2,param3);
         }
         else if(param1 != null && param2 != null)
         {
            _date = new Date(param1,param2);
         }
         else if(param1 != null)
         {
            _date = new Date(param1);
         }
         else
         {
            _date = new Date();
         }
         _date.time = _date.time + timeZone * 3600 * 1000;
      }
      
      public function get date() : Number
      {
         return _date.dateUTC;
      }
      
      public function set date(param1:Number) : void
      {
         _date.date = param1;
      }
      
      public function get dateUTC() : Number
      {
         return _date.dateUTC;
      }
      
      public function set dateUTC(param1:Number) : void
      {
         _date.dateUTC = param1;
      }
      
      public function get day() : Number
      {
         return _date.dayUTC;
      }
      
      public function get dayUTC() : Number
      {
         return _date.dayUTC;
      }
      
      public function get fullYear() : Number
      {
         return _date.fullYearUTC;
      }
      
      public function set fullYear(param1:Number) : void
      {
         _date.setUTCFullYear(param1);
      }
      
      public function get fullYearUTC() : Number
      {
         return _date.fullYearUTC;
      }
      
      public function set fullYearUTC(param1:Number) : void
      {
         _date.fullYearUTC = param1;
      }
      
      public function get hours() : Number
      {
         return _date.hoursUTC;
      }
      
      public function set hours(param1:Number) : void
      {
         _date.hoursUTC = param1;
      }
      
      public function get hoursUTC() : Number
      {
         return _date.hoursUTC;
      }
      
      public function set hoursUTC(param1:Number) : void
      {
         _date.hoursUTC = param1;
      }
      
      public function get milliseconds() : Number
      {
         return _date.millisecondsUTC;
      }
      
      public function set milliseconds(param1:Number) : void
      {
         _date.millisecondsUTC = param1;
      }
      
      public function get millisecondsUTC() : Number
      {
         return _date.millisecondsUTC;
      }
      
      public function set millisecondsUTC(param1:Number) : void
      {
         _date.millisecondsUTC = param1;
      }
      
      public function get minutes() : Number
      {
         return _date.minutesUTC;
      }
      
      public function set minutes(param1:Number) : void
      {
         _date.minutesUTC = param1;
      }
      
      public function get minutesUTC() : Number
      {
         return _date.minutesUTC;
      }
      
      public function set minutesUTC(param1:Number) : void
      {
         _date.minutesUTC = param1;
      }
      
      public function get month() : Number
      {
         return _date.monthUTC;
      }
      
      public function set month(param1:Number) : void
      {
         _date.monthUTC = param1;
      }
      
      public function get monthUTC() : Number
      {
         return _date.monthUTC;
      }
      
      public function set monthUTC(param1:Number) : void
      {
         _date.monthUTC = param1;
      }
      
      public function get seconds() : Number
      {
         return _date.secondsUTC;
      }
      
      public function set seconds(param1:Number) : void
      {
         _date.secondsUTC = param1;
      }
      
      public function get secondsUTC() : Number
      {
         return _date.secondsUTC;
      }
      
      public function set secondsUTC(param1:Number) : void
      {
         _date.secondsUTC = param1;
      }
      
      public function get time() : Number
      {
         return _date.time;
      }
      
      public function set time(param1:Number) : void
      {
         param1 = param1 + timeZone * 3600 * 1000;
         _date.time = param1;
      }
      
      public function get timezoneOffset() : Number
      {
         return _date.timezoneOffset;
      }
      
      §-§ function getDate() : Number
      {
         return _date.getUTCDate();
      }
      
      §-§ function getDay() : Number
      {
         return _date.getUTCDate();
      }
      
      §-§ function getFullYear() : Number
      {
         return _date.getUTCFullYear();
      }
      
      §-§ function getHours() : Number
      {
         return _date.getUTCHours();
      }
      
      §-§ function getMilliseconds() : Number
      {
         return _date.getUTCMilliseconds();
      }
      
      §-§ function getMinutes() : Number
      {
         return _date.getUTCMinutes();
      }
      
      §-§ function getMonth() : Number
      {
         return _date.getUTCMonth();
      }
      
      §-§ function getSeconds() : Number
      {
         return _date.getUTCSeconds();
      }
      
      §-§ function getTime() : Number
      {
         return _date.getTime();
      }
      
      §-§ function getTimezoneOffset() : Number
      {
         return _date.getTimezoneOffset();
      }
      
      §-§ function getUTCDate() : Number
      {
         return _date.getUTCDate();
      }
      
      §-§ function getUTCDay() : Number
      {
         return _date.getUTCDay();
      }
      
      §-§ function getUTCFullYear() : Number
      {
         return _date.getUTCFullYear();
      }
      
      §-§ function getUTCHours() : Number
      {
         return _date.getUTCHours();
      }
      
      §-§ function getUTCMilliseconds() : Number
      {
         return _date.getUTCMilliseconds();
      }
      
      §-§ function getUTCMinutes() : Number
      {
         return _date.getUTCMinutes();
      }
      
      §-§ function getUTCMonth() : Number
      {
         return _date.getUTCMonth();
      }
      
      §-§ function getUTCSeconds() : Number
      {
         return _date.getUTCSeconds();
      }
      
      §-§ function setDate(param1:* = null) : Number
      {
         return _date.setUTCDate(param1);
      }
      
      §-§ function setFullYear(param1:* = null, param2:* = null, param3:* = null) : Number
      {
         return _date.setUTCFullYear(param1,param2,param3);
      }
      
      §-§ function setHours(param1:* = null, param2:* = null, param3:* = null, param4:* = null) : Number
      {
         return _date.setUTCHours(param1,param2,param3,param4);
      }
      
      §-§ function setMilliseconds(param1:* = null) : Number
      {
         return _date.setUTCMilliseconds(param1);
      }
      
      §-§ function setMinutes(param1:* = null, param2:* = null, param3:* = null) : Number
      {
         return _date.setUTCMinutes(param1,param2,param3);
      }
      
      §-§ function setMonth(param1:* = null, param2:* = null) : Number
      {
         return _date.setUTCMonth(param1,param2);
      }
      
      §-§ function setSeconds(param1:* = null, param2:* = null) : Number
      {
         return _date.setUTCSeconds(param1,param2);
      }
      
      §-§ function setTime(param1:* = null) : Number
      {
         return _date.setTime(param1);
      }
      
      §-§ function setUTCDate(param1:* = null) : Number
      {
         return _date.setUTCDate(param1);
      }
      
      §-§ function setUTCFullYear(param1:* = null, param2:* = null, param3:* = null) : Number
      {
         return _date.setUTCFullYear(param1,param2,param3);
      }
      
      §-§ function setUTCHours(param1:* = null, param2:* = null, param3:* = null, param4:* = null) : Number
      {
         return _date.setUTCHours(param1,param2,param3,param4);
      }
      
      §-§ function setUTCMilliseconds(param1:* = null) : Number
      {
         return _date.setUTCMilliseconds(param1);
      }
      
      §-§ function setUTCMinutes(param1:* = null, param2:* = null, param3:* = null) : Number
      {
         return _date.setUTCMinutes(param1,param2,param3);
      }
      
      §-§ function setUTCMonth(param1:* = null, param2:* = null) : Number
      {
         return _date.setUTCMonth(param1,param2);
      }
      
      §-§ function setUTCSeconds(param1:* = null, param2:* = null) : Number
      {
         return _date.setUTCSeconds(param1,param2);
      }
      
      §-§ function toDateString() : String
      {
         return _date.toDateString();
      }
      
      §-§ function toLocaleDateString() : String
      {
         return _date.toLocaleDateString();
      }
      
      §-§ function toLocaleString() : String
      {
         return _date.toLocaleString();
      }
      
      §-§ function toLocaleTimeString() : String
      {
         return _date.toLocaleTimeString();
      }
      
      §-§ function toString() : String
      {
         return _date.toString();
      }
      
      §-§ function toTimeString() : String
      {
         return _date.toTimeString();
      }
      
      §-§ function toUTCString() : String
      {
         return _date.toUTCString();
      }
      
      §-§ function valueOf() : Number
      {
         return _date.valueOf();
      }
   }
}
