package org.qrcode
{
   import org.qrcode.input.QRInput;
   import org.qrcode.specs.QRSpecs;
   
   public class QRSplit
   {
       
      
      public var dataStr:Array;
      
      public var input:QRInput;
      
      public var modeHint:int;
      
      public function QRSplit(param1:String, param2:QRInput, param3:int)
      {
         this.dataStr = [];
         super();
         this.dataStr = param1.split("");
         this.input = param2;
         this.modeHint = param3;
      }
      
      public static function isdigitat(param1:Array, param2:int) : Boolean
      {
         if(param2 >= param1.length)
         {
            return false;
         }
         return param1[param2].toString().charCodeAt() >= "0".charCodeAt() && param1[param2].toString().charCodeAt() <= "9".charCodeAt();
      }
      
      public static function isalnumat(param1:Array, param2:int) : Boolean
      {
         if(param2 >= param1.length)
         {
            return false;
         }
         return QRInput.lookAnTable(param1[param2].toString().charCodeAt()) >= 0;
      }
      
      public static function splitStringToQRinput(param1:String, param2:QRInput, param3:int, param4:Boolean = true) : QRInput
      {
         if(param1 == null || param1 == "0" || param1 == "")
         {
            throw new Error("empty string!!!");
         }
         var _loc5_:QRSplit = new QRSplit(param1,param2,param3);
         if(!param4)
         {
            _loc5_.toUpper();
         }
         _loc5_.splitString();
         return _loc5_.input;
      }
      
      public function identifyMode(param1:int) : int
      {
         var _loc2_:* = null;
         var _loc4_:* = 0;
         if(param1 >= this.dataStr.length)
         {
            return -1;
         }
         var _loc3_:String = this.dataStr[param1];
         if(isdigitat(this.dataStr,param1))
         {
            return 0;
         }
         if(isalnumat(this.dataStr,param1))
         {
            return 1;
         }
         if(this.modeHint == 3)
         {
            if(param1 + 1 < this.dataStr.length)
            {
               _loc2_ = this.dataStr[param1 + 1];
               _loc4_ = _loc3_.charCodeAt() << 8 | _loc2_.charCodeAt();
               if(_loc4_ >= 33088 && _loc4_ <= 40956 || _loc4_ >= 57408 && _loc4_ <= 60351)
               {
                  return 3;
               }
            }
         }
         return 2;
      }
      
      public function eatNum() : int
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:int = QRSpecs.lengthIndicator(0,this.input.version);
         while(isdigitat(this.dataStr,_loc3_))
         {
            _loc3_++;
         }
         var _loc5_:* = _loc3_;
         var _loc6_:int = this.identifyMode(_loc3_);
         if(_loc6_ == 2)
         {
            _loc4_ = QRInput.estimateBitsModeNum(_loc5_) + 4 + _loc2_ + QRInput.estimateBitsMode8(1) - QRInput.estimateBitsMode8(_loc5_ + 1);
            if(_loc4_ > 0)
            {
               return this.eat8();
            }
         }
         if(_loc6_ == 1)
         {
            _loc4_ = QRInput.estimateBitsModeNum(_loc5_) + 4 + _loc2_ + QRInput.estimateBitsModeAn(1) - QRInput.estimateBitsModeAn(_loc5_ + 1);
            if(_loc4_ > 0)
            {
               return this.eatAn();
            }
         }
         var _loc1_:int = this.input.append(0,_loc5_,this.dataStr);
         if(_loc1_ < 0)
         {
            return -1;
         }
         return _loc5_;
      }
      
      public function eatAn() : int
      {
         var _loc3_:* = 0;
         var _loc6_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:int = QRSpecs.lengthIndicator(1,this.input.version);
         var _loc2_:int = QRSpecs.lengthIndicator(0,this.input.version);
         while(isalnumat(this.dataStr,_loc4_))
         {
            if(isdigitat(this.dataStr,_loc4_))
            {
               _loc3_ = _loc4_;
               while(isdigitat(this.dataStr,_loc3_))
               {
                  _loc3_++;
               }
               _loc6_ = QRInput.estimateBitsModeAn(_loc4_) + QRInput.estimateBitsModeNum(_loc3_ - _loc4_) + 4 + _loc2_ - QRInput.estimateBitsModeAn(_loc3_);
               if(_loc6_ >= 0)
               {
                  _loc4_ = _loc3_;
                  continue;
               }
               break;
            }
            _loc4_++;
         }
         var _loc7_:* = _loc4_;
         if(!isalnumat(this.dataStr,_loc4_))
         {
            _loc6_ = QRInput.estimateBitsModeAn(_loc7_) + 4 + _loc5_ + QRInput.estimateBitsMode8(1) - QRInput.estimateBitsMode8(_loc7_ + 1);
            if(_loc6_ > 0)
            {
               return this.eat8();
            }
         }
         var _loc1_:int = this.input.append(1,_loc7_,this.dataStr);
         if(_loc1_ < 0)
         {
            return -1;
         }
         return _loc7_;
      }
      
      public function eatKanji() : int
      {
         var _loc2_:int = 0;
         while(this.identifyMode(_loc2_) == 3)
         {
            _loc2_ = _loc2_ + 2;
         }
         var _loc3_:* = _loc2_;
         var _loc1_:int = this.input.append(3,_loc2_,this.dataStr);
         if(_loc1_ < 0)
         {
            return -1;
         }
         return _loc3_;
      }
      
      public function eat8() : int
      {
         var _loc9_:int = 0;
         var _loc4_:* = 0;
         var _loc7_:int = 0;
         var _loc6_:int = QRSpecs.lengthIndicator(1,this.input.version);
         var _loc3_:int = QRSpecs.lengthIndicator(0,this.input.version);
         var _loc5_:* = 1;
         var _loc2_:int = this.dataStr.length;
         while(_loc5_ < _loc2_)
         {
            _loc9_ = this.identifyMode(_loc5_);
            if(_loc9_ != 3)
            {
               if(_loc9_ == 0)
               {
                  _loc4_ = _loc5_;
                  while(isdigitat(this.dataStr,_loc4_))
                  {
                     _loc4_++;
                  }
                  _loc7_ = QRInput.estimateBitsMode8(_loc5_) + QRInput.estimateBitsModeNum(_loc4_ - _loc5_) + 4 + _loc3_ - QRInput.estimateBitsMode8(_loc4_);
                  if(_loc7_ >= 0)
                  {
                     _loc5_ = _loc4_;
                     continue;
                  }
                  break;
               }
               if(_loc9_ == 1)
               {
                  _loc4_ = _loc5_;
                  while(isalnumat(this.dataStr,_loc4_))
                  {
                     _loc4_++;
                  }
                  _loc7_ = QRInput.estimateBitsMode8(_loc5_) + QRInput.estimateBitsModeAn(_loc4_ - _loc5_) + 4 + _loc6_ - QRInput.estimateBitsMode8(_loc4_);
                  if(_loc7_ >= 0)
                  {
                     _loc5_ = _loc4_;
                     continue;
                  }
                  break;
               }
               _loc5_++;
               continue;
            }
            break;
         }
         var _loc8_:* = _loc5_;
         var _loc1_:int = this.input.append(2,_loc8_,this.dataStr);
         if(_loc1_ < 0)
         {
            return -1;
         }
         return _loc8_;
      }
      
      public function splitString() : int
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         while(this.dataStr.length > 0)
         {
            _loc2_ = this.identifyMode(0);
            switch(int(_loc2_))
            {
               case 0:
                  _loc1_ = this.eatNum();
                  break;
               case 1:
                  _loc1_ = this.eatAn();
                  break;
               default:
                  _loc1_ = this.eat8();
                  break;
               case 3:
                  if(this.modeHint == 3)
                  {
                     _loc1_ = this.eatKanji();
                  }
                  else
                  {
                     _loc1_ = this.eat8();
                  }
            }
            if(_loc1_ == 0)
            {
               return 0;
            }
            if(_loc1_ < 0)
            {
               return -1;
            }
            this.dataStr = this.dataStr.slice(_loc1_);
         }
         return _loc1_;
      }
      
      public function toUpper() : Array
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc1_:int = this.dataStr.length;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this.identifyMode(this.modeHint);
            if(_loc3_ == 3)
            {
               _loc2_ = _loc2_ + 2;
            }
            else
            {
               if(this.dataStr[_loc2_].charCodeAt() >= "a".charCodeAt() && this.dataStr[_loc2_].charCodeAt() <= "z".charCodeAt())
               {
                  this.dataStr[_loc2_] = String.fromCharCode(this.dataStr[_loc2_].charCodeAt() - 32);
               }
               _loc2_++;
            }
         }
         return this.dataStr;
      }
   }
}
