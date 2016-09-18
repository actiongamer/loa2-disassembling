package com.mz.core.logging
{
   public class LogConsts
   {
      
      public static const DEBUG:int = 1;
      
      public static const INFO:int = 2;
      
      public static const WARN:int = 4;
      
      public static const ERROR:int = 8;
      
      public static const FATAL:int = 16;
      
      public static const NONE:int = 0;
      
      private static var _levelColorOb:Object;
       
      
      public function LogConsts()
      {
         super();
      }
      
      public static function levelColor(param1:int) : uint
      {
         if(_levelColorOb == null)
         {
            _levelColorOb = {};
            _levelColorOb[2] = 39423;
            _levelColorOb[1] = 65280;
            _levelColorOb[4] = 16729344;
            _levelColorOb[8] = 16711935;
            _levelColorOb[16] = 16711680;
            _levelColorOb[0] = 14540253;
         }
         return _levelColorOb[param1];
      }
      
      public static function levelToString(param1:int) : String
      {
         switch(int(param1))
         {
            case 0:
               return "";
            case 1:
               return "DEBUG";
            case 2:
               return "INFO";
            default:
               return "???";
            case 4:
            default:
            default:
            default:
               return "WARN";
            case 8:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               return "ERROR";
            case 16:
               return "FATAL";
         }
      }
   }
}
