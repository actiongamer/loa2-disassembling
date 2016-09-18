package morn.core.utils
{
   public class NumberUtil
   {
       
      
      public function NumberUtil()
      {
         super();
      }
      
      public static function addZeroFront(param1:Number, param2:int) : String
      {
         if(isNaN(param1))
         {
            param1 = 0;
         }
         var _loc4_:* = param1 < 0;
         var _loc5_:Number = Math.abs(param1);
         var _loc6_:int = _loc5_;
         var _loc3_:String = addZeorFrontInt(_loc6_,param2);
         return String(param1).replace(String(_loc6_),_loc3_);
      }
      
      private static function addZeorFrontInt(param1:uint, param2:int) : String
      {
         return StringUtils.addZeorFront(String(param1),param2);
      }
      
      public static function ceilPow2down(param1:int, param2:int = 2048) : int
      {
         var _loc3_:int = param1.toString(2).length;
         if(Math.pow(2,_loc3_ - 1) == param1)
         {
            return param1;
         }
         return Math.min(param2,Math.pow(2,_loc3_ - 1));
      }
      
      public static function ceilPow2up(param1:int, param2:int = 2048) : int
      {
         var _loc3_:int = param1.toString(2).length;
         if(Math.pow(2,_loc3_ - 1) == param1)
         {
            return param1;
         }
         return Math.min(param2,Math.pow(2,_loc3_));
      }
      
      public static function isOdd(param1:int) : Boolean
      {
         return Boolean(param1 & 1);
      }
      
      public static function isNumber(param1:String) : Boolean
      {
         var _loc2_:Number = param1;
         if(String(_loc2_) == param1)
         {
            return true;
         }
         return false;
      }
      
      public static function isFloatNumber(param1:Number) : Boolean
      {
         var _loc2_:String = param1.toString();
         if(_loc2_.split(".").length > 1)
         {
            return true;
         }
         return false;
      }
   }
}
