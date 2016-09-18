package org.qrcode
{
   import org.qrcode.specs.QRSpecs;
   import org.qrcode.utils.QRUtil;
   
   public class QRMask
   {
      
      public static const N1:int = 3;
      
      public static const N2:int = 3;
      
      public static const N3:int = 40;
      
      public static const N4:int = 10;
       
      
      public var frames:Array;
      
      public var runLength:Array;
      
      public function QRMask(param1:Array)
      {
         super();
         this.frames = QRUtil.copyArray(param1);
      }
      
      public function writeFormatInformation(param1:Array, param2:int, param3:int, param4:int) : int
      {
         var _loc5_:Number = NaN;
         var _loc8_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = int(QRSpecs.getFormatInfo(param3,param4));
         _loc8_ = 0;
         while(_loc8_ < 8)
         {
            if(_loc7_ & 1)
            {
               _loc6_ = _loc6_ + 2;
               _loc5_ = 133;
            }
            else
            {
               _loc5_ = 132;
            }
            param1[8][param2 - 1 - _loc8_] = _loc5_;
            if(_loc8_ < 6)
            {
               param1[_loc8_][8] = _loc5_;
            }
            else
            {
               param1[_loc8_ + 1][8] = _loc5_;
            }
            _loc7_ = _loc7_ >> 1;
            _loc8_++;
         }
         _loc8_ = 0;
         while(_loc8_ < 7)
         {
            if(_loc7_ & 1)
            {
               _loc6_ = _loc6_ + 2;
               _loc5_ = 133;
            }
            else
            {
               _loc5_ = 132;
            }
            param1[param2 - 7 + _loc8_][8] = _loc5_;
            if(_loc8_ == 0)
            {
               param1[8][7] = _loc5_;
            }
            else
            {
               param1[8][6 - _loc8_] = _loc5_;
            }
            _loc7_ = _loc7_ >> 1;
            _loc8_++;
         }
         return _loc6_;
      }
      
      public function mask0(param1:Number, param2:Number) : int
      {
         return int((param1 + param2 & 1) == 0);
      }
      
      public function mask1(param1:Number, param2:Number) : int
      {
         return param2 & 0;
      }
      
      public function mask2(param1:Number, param2:Number) : int
      {
         return int(param1 % 3 == 0);
      }
      
      public function mask3(param1:Number, param2:Number) : int
      {
         return int((param1 + param2) % 3 == 0);
      }
      
      public function mask4(param1:Number, param2:Number) : int
      {
         return int((int(param2 * 0.5) + int(param1 / 3) & 1) == 0);
      }
      
      public function mask5(param1:Number, param2:Number) : int
      {
         return int(param1 * param2 % 2 + param1 * param2 % 3 == 0);
      }
      
      public function mask6(param1:Number, param2:Number) : int
      {
         return int(((param1 * param2 & 1) + param1 * param2 % 3 & 1) == 0);
      }
      
      public function mask7(param1:Number, param2:Number) : int
      {
         return int(((param1 + param2 & 1) + param1 * param2 % 3 & 1) == 0);
      }
      
      private function generateMaskNo(param1:int, param2:int) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = QRUtil.array_fill(0,param2,QRUtil.array_fill(0,param2,0));
         while(_loc3_ < param2)
         {
            _loc5_ = 0;
            while(_loc5_ < param2)
            {
               if(this.frames[_loc3_][_loc5_] & 128)
               {
                  _loc4_[_loc3_][_loc5_] = 0;
               }
               else
               {
                  switch(int(param1))
                  {
                     case 0:
                        _loc4_[_loc3_][_loc5_] = this.mask0(_loc5_,_loc3_);
                        break;
                     case 1:
                        _loc4_[_loc3_][_loc5_] = this.mask1(_loc5_,_loc3_);
                        break;
                     case 2:
                        _loc4_[_loc3_][_loc5_] = this.mask2(_loc5_,_loc3_);
                        break;
                     case 3:
                        _loc4_[_loc3_][_loc5_] = this.mask3(_loc5_,_loc3_);
                        break;
                     case 4:
                        _loc4_[_loc3_][_loc5_] = this.mask4(_loc5_,_loc3_);
                        break;
                     case 5:
                        _loc4_[_loc3_][_loc5_] = this.mask5(_loc5_,_loc3_);
                        break;
                     case 6:
                        _loc4_[_loc3_][_loc5_] = this.mask6(_loc5_,_loc3_);
                        break;
                     case 7:
                        _loc4_[_loc3_][_loc5_] = this.mask7(_loc5_,_loc3_);
                  }
               }
               _loc5_++;
            }
            _loc3_++;
         }
         return _loc4_;
      }
      
      public function makeMaskNo(param1:int, param2:int, param3:Boolean = false) : Array
      {
         var _loc8_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = [];
         var _loc4_:Array = QRUtil.copyFrame(this.frames);
         _loc7_ = this.generateMaskNo(param1,param2);
         if(param3)
         {
            return null;
         }
         while(_loc6_ < param2)
         {
            _loc8_ = 0;
            while(_loc8_ < param2)
            {
               if(_loc7_[_loc6_][_loc8_] == 1)
               {
                  _loc4_[_loc6_][_loc8_] = this.frames[_loc6_][_loc8_] ^ 1;
               }
               _loc5_ = _loc5_ + (_loc4_[_loc6_][_loc8_] & 1);
               _loc8_++;
            }
            _loc6_++;
         }
         return [_loc4_,_loc5_];
      }
      
      public function makeMask(param1:int, param2:int, param3:int) : Array
      {
         var _loc4_:Array = this.makeMaskNo(param2,param1);
         this.writeFormatInformation(_loc4_[0],param1,param2,param3);
         return _loc4_[0];
      }
      
      public function calcN1N3(param1:int, param2:Array) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < param1)
         {
            if(param2[_loc5_] >= 5)
            {
               _loc4_ = _loc4_ + (3 + (param2[_loc5_] - 5));
            }
            if(_loc5_ & 1)
            {
               if(_loc5_ >= 3 && _loc5_ < param1 - 2 && param2[_loc5_] % 3 == 0)
               {
                  _loc3_ = param2[_loc5_] / 3;
                  if(param2[_loc5_ - 2] == _loc3_ && param2[_loc5_ - 1] == _loc3_ && param2[_loc5_ + 1] == _loc3_ && param2[_loc5_ + 2] == _loc3_)
                  {
                     if(param2[_loc5_ - 3] < 0 || param2[_loc5_ - 3] >= 4 * _loc3_)
                     {
                        _loc4_ = _loc4_ + 40;
                     }
                     else if(_loc5_ + 3 >= param1 || param2[_loc5_ + 3] >= 4 * _loc3_)
                     {
                        _loc4_ = _loc4_ + 40;
                     }
                  }
               }
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function evaluateSymbol(param1:int, param2:Array) : int
      {
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc10_:* = null;
         var _loc3_:* = null;
         var _loc6_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc8_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:* = undefined;
         var _loc9_:* = undefined;
         var _loc11_:* = undefined;
         this.runLength = QRUtil.array_fill(0,40 + 1,0);
         _loc12_ = 0;
         while(_loc12_ < param1)
         {
            _loc8_ = 0;
            this.runLength[0] = 1;
            _loc10_ = param2[_loc12_];
            _loc3_ = [];
            if(_loc12_ > 0)
            {
               _loc3_ = param2[_loc12_ - 1];
            }
            _loc13_ = 0;
            while(_loc13_ < param1)
            {
               if(_loc13_ > 0 && _loc12_ > 0)
               {
                  _loc6_ = _loc10_[_loc13_] & _loc10_[_loc13_ - 1] & _loc3_[_loc13_] & _loc3_[_loc13_ - 1];
                  _loc4_ = _loc10_[_loc13_] | _loc10_[_loc13_ - 1] | _loc3_[_loc13_] | _loc3_[_loc13_ - 1];
                  if((_loc6_ | _loc4_ ^ 1) & 1)
                  {
                     _loc5_ = _loc5_ + 3;
                  }
               }
               if(_loc13_ == 0 && _loc10_[_loc13_] & 1)
               {
                  this.runLength[0] = -1;
                  _loc8_ = 1;
                  this.runLength[_loc8_] = 1;
               }
               else if(_loc13_ > 0)
               {
                  if((_loc10_[_loc13_] ^ _loc10_[_loc13_ - 1]) & 1)
                  {
                     _loc8_++;
                     this.runLength[_loc8_] = 1;
                  }
                  else
                  {
                     _loc7_ = this.runLength;
                     _loc9_ = _loc8_;
                     _loc11_ = _loc7_[_loc9_] + 1;
                     _loc7_[_loc9_] = _loc11_;
                  }
               }
               _loc13_++;
            }
            _loc5_ = _loc5_ + this.calcN1N3(_loc8_ + 1,this.runLength);
            _loc12_++;
         }
         _loc13_ = 0;
         while(_loc13_ < param1)
         {
            _loc8_ = 0;
            this.runLength[0] = 1;
            _loc12_ = 0;
            while(_loc12_ < param1)
            {
               if(_loc12_ == 0 && param2[_loc12_][_loc13_] & 1)
               {
                  this.runLength[0] = -1;
                  _loc8_ = 1;
                  this.runLength[_loc8_] = 1;
               }
               else if(_loc12_ > 0)
               {
                  if((param2[_loc12_][_loc13_] ^ param2[_loc12_ - 1][_loc13_]) & 1)
                  {
                     _loc8_++;
                     this.runLength[_loc8_] = 1;
                  }
                  else
                  {
                     _loc7_ = this.runLength;
                     _loc9_ = _loc8_;
                     _loc11_ = _loc7_[_loc9_] + 1;
                     _loc7_[_loc9_] = _loc11_;
                  }
               }
               _loc12_++;
            }
            _loc5_ = _loc5_ + this.calcN1N3(_loc8_ + 1,this.runLength);
            _loc13_++;
         }
         return _loc5_;
      }
      
      public function mask(param1:int, param2:int) : Array
      {
         var _loc11_:int = 0;
         var _loc9_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc3_:* = 0;
         var _loc10_:* = 2147483647;
         var _loc4_:* = [];
         var _loc8_:Array = [0,2,3,4,5,6,7];
         _loc4_ = QRUtil.copyArray(this.frames);
         var _loc13_:int = 0;
         var _loc12_:* = _loc8_;
         for each(_loc11_ in _loc8_)
         {
            _loc9_ = 0;
            _loc7_ = 0;
            _loc6_ = this.makeMaskNo(_loc11_,param1);
            _loc5_ = _loc6_[0];
            _loc7_ = _loc6_[1];
            _loc7_ = _loc7_ + this.writeFormatInformation(_loc5_,param1,_loc11_,param2);
            _loc7_ = 100 * _loc7_ / (param1 * param1);
            _loc9_ = int(Math.abs(_loc7_ - 50) / 5) * 10;
            _loc9_ = _loc9_ + this.evaluateSymbol(param1,_loc5_);
            if(_loc9_ < _loc10_)
            {
               _loc10_ = _loc9_;
               _loc4_ = _loc5_;
               _loc3_ = _loc11_;
            }
         }
         return _loc4_;
      }
   }
}
