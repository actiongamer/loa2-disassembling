package org.qrcode.utils
{
   import org.qrcode.rs.QRRsItem;
   
   public class QRUtil
   {
      
      public static var items:Array = [];
       
      
      public function QRUtil()
      {
         super();
      }
      
      public static function memset(param1:Array, param2:int, param3:int, param4:int, param5:int) : Array
      {
         var _loc6_:int = 0;
         while(_loc6_ < param5)
         {
            param1[param2][_loc6_ + param3] = param4;
            _loc6_++;
         }
         return param1;
      }
      
      public static function str_repeat(param1:String, param2:int) : String
      {
         var _loc4_:int = 0;
         var _loc3_:String = "";
         while(_loc4_ < param2)
         {
            _loc3_ = _loc3_ + param1;
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function array_fill(param1:int, param2:int, param3:Object) : Array
      {
         var _loc5_:int = 0;
         var _loc4_:Array = [];
         while(_loc5_ < param2)
         {
            if(param3 is Array)
            {
               _loc4_[param1 + _loc5_] = copyArray(param3 as Array);
            }
            else
            {
               _loc4_[param1 + _loc5_] = param3;
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public static function array_merge(param1:Array, param2:Array) : Array
      {
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            param1.push(param2[_loc3_]);
            _loc3_++;
         }
         return param1;
      }
      
      public static function copyFrame(param1:Array) : Array
      {
         var _loc3_:* = null;
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for(_loc3_ in param1)
         {
            _loc2_[_loc3_] = QRUtil.copyArray(param1[_loc3_]);
         }
         return _loc2_;
      }
      
      public static function copyArray(param1:Array) : Array
      {
         var _loc3_:* = undefined;
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(_loc3_ in param1)
         {
            _loc2_.push(_loc3_);
         }
         return _loc2_;
      }
      
      public static function initRs(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : QRRsItem
      {
         var _loc8_:* = null;
         var _loc7_:* = null;
         var _loc10_:int = 0;
         var _loc9_:* = items;
         for each(_loc8_ in items)
         {
            if(_loc8_.pad == param6)
            {
               if(_loc8_.nroots == param5)
               {
                  if(_loc8_.mm == param1)
                  {
                     if(_loc8_.gfpoly == param2)
                     {
                        if(_loc8_.fcr == param3)
                        {
                           if(_loc8_.prim == param4)
                           {
                              return _loc8_;
                           }
                        }
                     }
                  }
               }
            }
         }
         _loc7_ = QRRsItem.init_rs_char(param1,param2,param3,param4,param5,param6);
         items.unshift(_loc7_);
         return _loc7_;
      }
   }
}
