package org.qrcode.rs
{
   import org.qrcode.utils.QRUtil;
   
   public class QRRsItem
   {
      
      private static var A0:uint;
      
      private static var NN:uint;
       
      
      public var mm:uint;
      
      public var nn:uint;
      
      public var alpha_to:Array;
      
      public var index_of:Array;
      
      public var genpoly:Array;
      
      public var nroots:uint;
      
      public var fcr:uint;
      
      public var prim:uint;
      
      public var iprim:uint;
      
      public var pad:uint;
      
      public var gfpoly:uint;
      
      public function QRRsItem()
      {
         this.alpha_to = [];
         this.index_of = [];
         this.genpoly = [];
         super();
      }
      
      public static function init_rs_char(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : QRRsItem
      {
         var _loc12_:int = 0;
         var _loc9_:* = 0;
         var _loc11_:* = 0;
         var _loc10_:* = null;
         if(param1 < 0 || param1 > 8)
         {
            return _loc10_;
         }
         if(param3 < 0 || param3 >= 1 << param1)
         {
            return _loc10_;
         }
         if(param4 <= 0 || param4 >= 1 << param1)
         {
            return _loc10_;
         }
         if(param5 < 0 || param5 >= 1 << param1)
         {
            return _loc10_;
         }
         if(param6 < 0 || param6 > (1 << param1) - 1 - param5)
         {
            return _loc10_;
         }
         _loc10_ = new QRRsItem();
         _loc10_.mm = param1;
         _loc10_.nn = (1 << param1) - 1;
         _loc10_.pad = param6;
         _loc10_.alpha_to = QRUtil.array_fill(0,_loc10_.nn + 1,0);
         _loc10_.index_of = QRUtil.array_fill(0,_loc10_.nn + 1,0);
         NN = _loc10_.nn;
         A0 = NN;
         _loc10_.index_of[0] = A0;
         _loc10_.alpha_to[A0] = 0;
         var _loc8_:* = 1;
         _loc12_ = 0;
         while(_loc12_ < _loc10_.nn)
         {
            _loc10_.index_of[_loc8_] = _loc12_;
            _loc10_.alpha_to[_loc12_] = _loc8_;
            _loc8_ = _loc8_ << 1;
            if(_loc8_ & 1 << param1)
            {
               _loc8_ = _loc8_ ^ param2;
            }
            _loc8_ = _loc8_ & _loc10_.nn;
            _loc12_++;
         }
         if(_loc8_ != 1)
         {
            _loc10_ = null;
            return _loc10_;
         }
         _loc10_.genpoly = QRUtil.array_fill(0,param5 + 1,0);
         _loc10_.fcr = param3;
         _loc10_.prim = param4;
         _loc10_.nroots = param5;
         _loc10_.gfpoly = param2;
         _loc9_ = uint(1);
         while(_loc9_ % param4 != 0)
         {
            _loc9_ = uint(_loc9_ + _loc10_.nn);
         }
         _loc10_.iprim = int(_loc9_ / param4);
         _loc10_.genpoly[0] = 1;
         _loc12_ = 0;
         var _loc7_:* = param3 * param4;
         while(_loc12_ < param5)
         {
            _loc10_.genpoly[_loc12_ + 1] = 1;
            _loc11_ = _loc12_;
            while(_loc11_ > 0)
            {
               if(_loc10_.genpoly[_loc11_] != 0)
               {
                  _loc10_.genpoly[_loc11_] = _loc10_.genpoly[_loc11_ - 1] ^ _loc10_.alpha_to[_loc10_.modnn(_loc10_.index_of[_loc10_.genpoly[_loc11_]] + _loc7_)];
               }
               else
               {
                  _loc10_.genpoly[_loc11_] = _loc10_.genpoly[_loc11_ - 1];
               }
               _loc11_--;
            }
            _loc10_.genpoly[0] = _loc10_.alpha_to[_loc10_.modnn(_loc10_.index_of[_loc10_.genpoly[0]] + _loc7_)];
            _loc12_++;
            _loc7_ = _loc7_ + param4;
         }
         _loc12_ = 0;
         while(_loc12_ <= param5)
         {
            _loc10_.genpoly[_loc12_] = _loc10_.index_of[_loc10_.genpoly[_loc12_]];
            _loc12_++;
         }
         return _loc10_;
      }
      
      public function modnn(param1:int) : int
      {
         while(param1 >= this.nn)
         {
            param1 = param1 - this.nn;
            param1 = (param1 >> this.mm) + (param1 & this.nn);
         }
         return param1;
      }
      
      public function encode_rs_char(param1:Array) : Array
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:* = this;
         var _loc4_:Number = _loc6_.nn;
         var _loc3_:Array = QRUtil.array_fill(0,_loc6_.nroots,0);
         while(_loc7_ < _loc6_.nn - _loc6_.nroots - _loc6_.pad)
         {
            _loc2_ = _loc6_.index_of[param1[_loc7_] ^ _loc3_[0]];
            if(_loc2_ != _loc4_)
            {
               _loc2_ = this.modnn(_loc6_.nn - _loc6_.genpoly[_loc6_.nroots] + _loc2_);
               _loc5_ = 1;
               while(_loc5_ < _loc6_.nroots)
               {
                  _loc3_[_loc5_] = _loc3_[_loc5_] ^ _loc6_.alpha_to[this.modnn(_loc2_ + _loc6_.genpoly[_loc6_.nroots - _loc5_])];
                  _loc5_++;
               }
            }
            _loc3_.shift();
            if(_loc2_ != this.nn)
            {
               _loc3_.push(_loc6_.alpha_to[this.modnn(_loc2_ + _loc6_.genpoly[0])]);
            }
            else
            {
               _loc3_.push(0);
            }
            _loc7_++;
         }
         return _loc3_;
      }
   }
}
