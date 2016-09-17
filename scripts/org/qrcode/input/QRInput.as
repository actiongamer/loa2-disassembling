package org.qrcode.input
{
   import org.qrcode.specs.QRSpecs;
   import org.qrcode.QRbitstream;
   
   public class QRInput
   {
      
      public static const anTable:Array = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,36,-1,-1,-1,37,38,-1,-1,-1,-1,39,40,-1,41,42,43,0,1,2,3,4,5,6,7,8,9,44,-1,-1,-1,-1,-1,-1,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
       
      
      public var items:Array;
      
      private var _version:int;
      
      private var _level:int;
      
      public function QRInput(param1:int = 0, param2:int = 0)
      {
         super();
         if(param1 < 0 || param1 > 40 || param2 > 3)
         {
            throw new Error("Invalid version no");
         }
         this.items = [];
         this._version = param1;
         this._level = param2;
      }
      
      public static function checkModeNum(param1:int, param2:Array) : Boolean
      {
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            if(param2[_loc3_].toString().charCodeAt() < "0".charCodeAt() || param2[_loc3_].toString().charCodeAt() > "9".charCodeAt())
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public static function estimateBitsModeNum(param1:int) : int
      {
         var _loc2_:int = param1 / 3;
         var _loc3_:int = _loc2_ * 10;
         var _loc4_:* = param1 - _loc2_ * 3;
         if(1 !== _loc4_)
         {
            if(2 === _loc4_)
            {
               _loc3_ = _loc3_ + 7;
            }
         }
         else
         {
            _loc3_ = _loc3_ + 4;
         }
         return _loc3_;
      }
      
      public static function lookAnTable(param1:int) : int
      {
         return param1 > 127?-1:anTable[param1];
      }
      
      public static function checkModeAn(param1:int, param2:Array) : Boolean
      {
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            if(lookAnTable(param2[_loc3_].toString().charCodeAt()) == -1)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public static function estimateBitsModeAn(param1:int) : int
      {
         var _loc2_:int = param1 / 2;
         var _loc3_:int = _loc2_ * 11;
         if(param1 & 1)
         {
            _loc3_ = _loc3_ + 6;
         }
         return _loc3_;
      }
      
      public static function estimateBitsMode8(param1:int) : int
      {
         return param1 * 8;
      }
      
      public static function estimateBitsModeKanji(param1:int) : int
      {
         return param1 / 2 * 13;
      }
      
      public static function checkModeKanji(param1:int, param2:Array) : Boolean
      {
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         if(param1 & 1)
         {
            return false;
         }
         while(_loc4_ < param1)
         {
            _loc3_ = param2[_loc4_] << 8 | param2[_loc4_ + 1];
            if(_loc3_ < 33088 || _loc3_ > 40956 && _loc3_ < 57408 || _loc3_ > 60351)
            {
               return false;
            }
            _loc4_ = _loc4_ + 2;
         }
         return true;
      }
      
      public static function check(param1:int, param2:int, param3:Array) : Boolean
      {
         if(param2 <= 0)
         {
            return false;
         }
         switch(int(param1))
         {
            case 0:
               return checkModeNum(param2,param3);
            case 1:
               return checkModeAn(param2,param3);
            case 2:
               return true;
            case 3:
               return checkModeKanji(param2,param3);
            case 4:
               return true;
         }
      }
      
      public static function lengthOfCode(param1:int, param2:int, param3:int) : int
      {
         var _loc4_:int = 0;
         var _loc6_:Number = NaN;
         var _loc8_:* = 0;
         var _loc7_:int = param3 - 4 - QRSpecs.lengthIndicator(param1,param2);
         switch(int(param1))
         {
            case 0:
               _loc4_ = _loc7_ / 10;
               _loc6_ = _loc7_ - _loc4_ * 10;
               _loc8_ = int(_loc4_ * 3);
               if(_loc6_ >= 7)
               {
                  _loc8_ = int(_loc8_ + 2);
               }
               else if(_loc6_ >= 4)
               {
                  _loc8_ = int(_loc8_ + 1);
               }
               break;
            case 1:
               _loc4_ = _loc7_ / 11;
               _loc6_ = _loc7_ - _loc4_ * 11;
               _loc8_ = int(_loc4_ * 2);
               if(_loc6_ >= 6)
               {
                  _loc8_++;
               }
               break;
            case 2:
               _loc8_ = int(_loc7_ / 8);
               break;
            case 3:
               _loc8_ = int(_loc7_ / 13 * 2);
               break;
            case 4:
               _loc8_ = int(_loc7_ / 8);
         }
         var _loc5_:int = QRSpecs.maximumWords(param1,param2);
         if(_loc8_ < 0)
         {
            _loc8_ = 0;
         }
         if(_loc8_ > _loc5_)
         {
            _loc8_ = _loc5_;
         }
         return _loc8_;
      }
      
      public function get version() : int
      {
         return this._version;
      }
      
      public function set version(param1:int) : void
      {
         if(param1 < 0 || param1 > 40)
         {
            throw new Error("Invalid version no");
         }
         this._version = param1;
      }
      
      public function get errorCorrectionLevel() : int
      {
         return this._level;
      }
      
      public function set errorCorrectionLevel(param1:int) : void
      {
         if(param1 > 3)
         {
            throw new Error("Invalid ECLEVEL");
         }
         this._level = param1;
      }
      
      public function appendEntry(param1:QRInputItem) : void
      {
         this.items.addItem(param1);
      }
      
      public function append(param1:int, param2:int, param3:Array) : int
      {
         var _loc4_:* = null;
         try
         {
            _loc4_ = new QRInputItem(param1,param2,param3);
            this.items.push(_loc4_);
            var _loc6_:int = 0;
            return _loc6_;
         }
         catch(e:Error)
         {
            var _loc7_:int = -1;
            return _loc7_;
         }
         return 0;
      }
      
      public function insertStructuredAppendHeader(param1:int, param2:int, param3:int) : int
      {
         var _loc4_:* = null;
         if(param1 > 16)
         {
            throw new Error("insertStructuredAppendHeader wrong size");
         }
         if(param2 <= 0 || param2 > 16)
         {
            throw new Error("insertStructuredAppendHeader wrong index");
         }
         var _loc5_:Array = [param1,param2,param3];
         try
         {
            _loc4_ = new QRInputItem(4,3,_loc5_);
            this.items.unshift(_loc4_);
            var _loc7_:int = 0;
            return _loc7_;
         }
         catch(e:Error)
         {
            var _loc8_:int = -1;
            return _loc8_;
         }
         return 0;
      }
      
      public function calcParity() : Number
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc1_:* = 0;
         var _loc5_:int = 0;
         var _loc4_:* = this.items;
         for each(_loc2_ in this.items)
         {
            if(_loc2_.mode != 4)
            {
               _loc3_ = _loc2_.size - 1;
               while(_loc3_ >= 0)
               {
                  _loc1_ = Number(_loc1_ ^ _loc2_.data[_loc3_]);
                  _loc3_--;
               }
               continue;
            }
         }
         return _loc1_;
      }
      
      public function estimateBitStreamSize(param1:int) : int
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = this.items;
         for each(_loc3_ in this.items)
         {
            _loc2_ = _loc2_ + _loc3_.estimateBitStreamSizeOfEntry(param1);
         }
         return _loc2_;
      }
      
      public function estimateVersion() : int
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:* = 0;
         while(true)
         {
            _loc2_ = _loc3_;
            _loc1_ = this.estimateBitStreamSize(_loc2_);
            _loc3_ = QRSpecs.getMinimumVersion((_loc1_ + 7) / 8,this._level);
            if(_loc3_ < 0)
            {
               break;
            }
            if(_loc3_ <= _loc2_)
            {
               return _loc3_;
            }
         }
         return -1;
      }
      
      public function createBitStream() : int
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = this.items;
         for each(_loc3_ in this.items)
         {
            _loc2_ = _loc3_.encodeBitStream(this.version);
            if(_loc2_ < 0)
            {
               return -1;
            }
            _loc1_ = _loc1_ + _loc2_;
         }
         return _loc1_;
      }
      
      public function convertData() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = this.estimateVersion();
         if(_loc2_ > this.version)
         {
            this.version = _loc2_;
         }
         while(true)
         {
            _loc1_ = this.createBitStream();
            if(_loc1_ < 0)
            {
               break;
            }
            _loc2_ = QRSpecs.getMinimumVersion((_loc1_ + 7) / 8,this._level);
            if(_loc2_ < 0)
            {
               throw new Error("WRONG VERSION");
            }
            if(_loc2_ > this.version)
            {
               this.version = _loc2_;
               continue;
            }
            return 0;
         }
         return -1;
      }
      
      public function appendPaddingBit(param1:QRbitstream) : QRbitstream
      {
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc4_:int = param1.size;
         var _loc5_:int = QRSpecs.getDataLength(this._version,this._level);
         var _loc3_:int = _loc5_ * 8;
         if(_loc3_ == _loc4_)
         {
            return param1;
         }
         if(_loc3_ - _loc4_ < 5)
         {
            param1.appendNum(_loc3_ - _loc4_,0);
            return param1;
         }
         _loc4_ = _loc4_ + 4;
         var _loc2_:int = (_loc4_ + 7) / 8;
         var _loc7_:QRbitstream = new QRbitstream();
         _loc7_.appendNum(_loc2_ * 8 - _loc4_ + 4,0);
         var _loc6_:int = _loc5_ - _loc2_;
         if(_loc6_ > 0)
         {
            _loc8_ = [];
            _loc9_ = 0;
            while(_loc9_ < _loc6_)
            {
               _loc8_[_loc9_] = !!(_loc9_ & 1)?17:236;
               _loc9_++;
            }
            _loc7_.appendBytes(_loc6_,_loc8_);
         }
         param1.append(_loc7_);
         return param1;
      }
      
      public function mergeBitStream() : QRbitstream
      {
         var _loc1_:* = null;
         if(this.convertData() < 0)
         {
            return null;
         }
         var _loc2_:QRbitstream = new QRbitstream();
         var _loc4_:int = 0;
         var _loc3_:* = this.items;
         for each(_loc1_ in this.items)
         {
            _loc2_.append(_loc1_.bstream);
         }
         return _loc2_;
      }
      
      public function getBitStream() : QRbitstream
      {
         var _loc1_:QRbitstream = this.mergeBitStream();
         if(_loc1_ == null)
         {
            return null;
         }
         this.appendPaddingBit(_loc1_);
         return _loc1_;
      }
      
      public function getByteStream() : Array
      {
         var _loc1_:QRbitstream = this.getBitStream();
         if(_loc1_ == null)
         {
            return null;
         }
         return _loc1_.toByte();
      }
   }
}
