package org.qrcode.utils
{
   public class QRCodeTool
   {
       
      
      public function QRCodeTool()
      {
         super();
      }
      
      public static function binarize(param1:Array) : Array
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc3_:int = param1.length;
         var _loc7_:int = 0;
         var _loc6_:* = param1;
         for(_loc2_ in param1)
         {
            _loc4_ = param1[_loc2_];
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc4_[_loc5_] = _loc4_[_loc5_] & 1;
               _loc5_++;
            }
            param1[_loc2_] = _loc4_;
         }
         return param1;
      }
      
      public static function dumpMask(param1:Array) : String
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:String = "";
         var _loc2_:int = param1.length;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc2_)
            {
               _loc3_ = _loc3_ + (param1[_loc4_][_loc5_].toString().charCodeAt() + ",");
               _loc5_++;
            }
            _loc4_++;
         }
         return _loc3_;
      }
   }
}
