package com.mz.core.utils
{
   public class DictUtils
   {
       
      
      public function DictUtils()
      {
         super();
      }
      
      public static function count(param1:Object) : int
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for(var _loc3_ in param1)
         {
            _loc2_++;
         }
         return _loc2_;
      }
   }
}
