package org.qrcode.input
{
   import org.qrcode.QRbitstream;
   import org.qrcode.specs.QRSpecs;
   import org.qrcode.utils.QRUtil;
   
   public class QRInputItem
   {
      
      public static const STRUCTURE_HEADER_BITS:int = 20;
      
      public static const MAX_STRUCTURED_SYMBOLS:int = 16;
       
      
      public var mode:int;
      
      public var size:int;
      
      public var data:Array;
      
      public var bstream:QRbitstream;
      
      public function QRInputItem(param1:int, param2:int, param3:Array, param4:QRbitstream = null)
      {
         super();
         var _loc5_:Array = param3.slice(0,param2);
         if(_loc5_.length < param2)
         {
            _loc5_ = QRUtil.array_merge(_loc5_,QRUtil.array_fill(0,param2 - _loc5_.length,0));
         }
         if(!QRInput.check(param1,param2,_loc5_))
         {
            throw new Error("Error m:" + param1 + ",s:" + param2 + ",d:" + _loc5_.join(","));
         }
         this.mode = param1;
         this.size = param2;
         this.data = _loc5_;
         this.bstream = param4;
      }
      
      public function encodeModeNum(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         try
         {
            _loc3_ = this.size / 3;
            _loc4_ = new QRbitstream();
            _loc2_ = 1;
            _loc4_.appendNum(4,_loc2_);
            _loc4_.appendNum(QRSpecs.lengthIndicator(0,param1),this.size);
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc2_ = (this.data[_loc5_ * 3].toString().charCodeAt() - "0".charCodeAt()) * 100;
               _loc2_ = _loc2_ + (this.data[_loc5_ * 3 + 1].toString().charCodeAt() - "0".charCodeAt()) * 10;
               _loc2_ = _loc2_ + (this.data[_loc5_ * 3 + 2].toString().charCodeAt() - "0".charCodeAt());
               _loc4_.appendNum(10,_loc2_);
               _loc5_ = _loc5_ + 1;
            }
            if(this.size - _loc3_ * 3 == 1)
            {
               _loc2_ = this.data[_loc3_ * 3].toString().charCodeAt() - "0".charCodeAt();
               _loc4_.appendNum(4,_loc2_);
            }
            else if(this.size - _loc3_ * 3 == 2)
            {
               _loc2_ = (this.data[_loc3_ * 3].toString().charCodeAt() - "0".charCodeAt()) * 10;
               _loc2_ = _loc2_ + (this.data[_loc3_ * 3 + 1].toString().charCodeAt() - "0".charCodeAt());
               _loc4_.appendNum(7,_loc2_);
            }
            this.bstream = _loc4_;
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
      
      public function encodeModeAn(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         try
         {
            _loc3_ = this.size / 2;
            _loc4_ = new QRbitstream();
            _loc4_.appendNum(4,2);
            _loc4_.appendNum(QRSpecs.lengthIndicator(1,param1),this.size);
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc2_ = QRInput.lookAnTable(this.data[_loc5_ * 2].toString().charCodeAt()) * 45;
               _loc2_ = _loc2_ + QRInput.lookAnTable(this.data[_loc5_ * 2 + 1].toString().charCodeAt());
               _loc4_.appendNum(11,_loc2_);
               _loc5_ = _loc5_ + 1;
            }
            if(this.size & 1)
            {
               _loc2_ = QRInput.lookAnTable(this.data[_loc3_ * 2].toString().charCodeAt());
               _loc4_.appendNum(6,_loc2_);
            }
            this.bstream = _loc4_;
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
      
      public function encodeMode8(param1:int) : int
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         try
         {
            _loc2_ = new QRbitstream();
            _loc2_.appendNum(4,4);
            _loc2_.appendNum(QRSpecs.lengthIndicator(2,param1),this.size);
            _loc3_ = 0;
            while(_loc3_ < this.size)
            {
               _loc2_.appendNum(8,this.data[_loc3_].toString().charCodeAt());
               _loc3_ = _loc3_ + 1;
            }
            this.bstream = _loc2_;
            var _loc5_:int = 0;
            return _loc5_;
         }
         catch(e:Error)
         {
            var _loc6_:int = -1;
            return _loc6_;
         }
         return 0;
      }
      
      public function encodeModeKanji(param1:int) : int
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc2_:* = 0;
         var _loc4_:int = 0;
         try
         {
            _loc3_ = new QRbitstream();
            _loc3_.appendNum(4,8);
            _loc3_.appendNum(QRSpecs.lengthIndicator(3,param1),this.size / 2);
            _loc5_ = 0;
            while(_loc5_ < this.size)
            {
               _loc2_ = this.data[_loc5_].toString().charCodeAt() << 8 | this.data[_loc5_ + 1].toString().charCodeAt();
               if(_loc2_ <= 40956)
               {
                  _loc2_ = int(_loc2_ - 33088);
               }
               else
               {
                  _loc2_ = int(_loc2_ - 49472);
               }
               _loc4_ = (_loc2_ >> 8) * 192;
               _loc2_ = int((_loc2_ & 255) + _loc4_);
               _loc3_.appendNum(13,_loc2_);
               _loc5_ = _loc5_ + 2;
            }
            this.bstream = _loc3_;
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
      
      public function encodeModeStructure() : int
      {
         var _loc1_:* = null;
         try
         {
            _loc1_ = new QRbitstream();
            _loc1_.appendNum(4,3);
            _loc1_.appendNum(4,this.data[1].toString().charCodeAt() - 1);
            _loc1_.appendNum(4,this.data[0].toString().charCodeAt() - 1);
            _loc1_.appendNum(8,this.data[2].toString().charCodeAt());
            this.bstream = _loc1_;
            var _loc3_:int = 0;
            return _loc3_;
         }
         catch(e:Error)
         {
            var _loc4_:int = -1;
            return _loc4_;
         }
         return 0;
      }
      
      public function estimateBitStreamSizeOfEntry(param1:int) : int
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         if(param1 == 0)
         {
            param1 = 1;
         }
         switch(int(this.mode))
         {
            case 0:
               _loc3_ = QRInput.estimateBitsModeNum(this.size);
               break;
            case 1:
               _loc3_ = QRInput.estimateBitsModeAn(this.size);
               break;
            case 2:
               _loc3_ = QRInput.estimateBitsMode8(this.size);
               break;
            case 3:
               _loc3_ = QRInput.estimateBitsModeKanji(this.size);
               break;
            case 4:
               return 20;
         }
         var _loc4_:int = QRSpecs.lengthIndicator(this.mode,param1);
         var _loc5_:* = 1 << _loc4_;
         var _loc2_:int = (this.size + _loc5_ - 1) / _loc5_;
         _loc3_ = _loc3_ + _loc2_ * (4 + _loc4_);
         return _loc3_;
      }
      
      public function encodeBitStream(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:int = 0;
         try
         {
            this.bstream = null;
            _loc3_ = QRSpecs.maximumWords(this.mode,param1);
            if(this.size > _loc3_)
            {
               _loc4_ = new QRInputItem(this.mode,_loc3_,this.data);
               _loc5_ = new QRInputItem(this.mode,this.size - _loc3_,this.data.slice(_loc3_));
               _loc4_.encodeBitStream(param1);
               _loc5_.encodeBitStream(param1);
               this.bstream = new QRbitstream();
               this.bstream.append(_loc4_.bstream);
               this.bstream.append(_loc5_.bstream);
            }
            else
            {
               _loc2_ = 0;
               switch(int(this.mode))
               {
                  case 0:
                     _loc2_ = this.encodeModeNum(param1);
                     break;
                  case 1:
                     _loc2_ = this.encodeModeAn(param1);
                     break;
                  case 2:
                     _loc2_ = this.encodeMode8(param1);
                     break;
                  case 3:
                     _loc2_ = this.encodeModeKanji(param1);
                  case 4:
                     _loc2_ = this.encodeModeStructure();
               }
               if(_loc2_ < 0)
               {
                  var _loc8_:int = -1;
                  return _loc8_;
               }
            }
            var _loc9_:* = this.bstream.size;
            return _loc9_;
         }
         catch(e:Error)
         {
            var _loc10_:int = -1;
            return _loc10_;
         }
         return 0;
      }
   }
}
