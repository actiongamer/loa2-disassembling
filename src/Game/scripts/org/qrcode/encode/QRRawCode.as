package org.qrcode.encode
{
   import org.qrcode.specs.QRSpecs;
   import org.qrcode.utils.QRUtil;
   import org.qrcode.rs.QRRsItem;
   import org.qrcode.rs.QRRsBlock;
   import org.qrcode.input.QRInput;
   
   public class QRRawCode
   {
       
      
      public var version:int;
      
      public var datacode:Array;
      
      public var ecccode:Array;
      
      public var blocks:int;
      
      public var rsblocks:Array;
      
      public var count:int;
      
      public var dataLength:int;
      
      public var eccLength:int;
      
      public var b1:int;
      
      public function QRRawCode(param1:QRInput)
      {
         this.ecccode = [];
         super();
         this.rsblocks = [];
         var _loc3_:Array = [0,0,0,0,0];
         this.datacode = param1.getByteStream();
         if(this.datacode == null)
         {
            throw new Error("null imput string");
         }
         _loc3_ = QRSpecs.getEccSpec(param1.version,param1.errorCorrectionLevel,_loc3_);
         this.version = param1.version;
         this.b1 = QRSpecs.rsBlockNum1(_loc3_);
         this.dataLength = QRSpecs.rsDataLength(_loc3_);
         this.eccLength = QRSpecs.rsEccLength(_loc3_);
         this.ecccode = QRUtil.array_fill(0,this.eccLength,0);
         this.blocks = QRSpecs.rsBlockNum(_loc3_);
         var _loc2_:int = this.init(_loc3_);
         if(_loc2_ < 0)
         {
            throw new Error("block alloc error");
         }
         this.count = 0;
      }
      
      public function init(param1:Array) : int
      {
         var _loc9_:int = 0;
         var _loc8_:* = null;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:int = QRSpecs.rsDataCodes1(param1);
         var _loc3_:int = QRSpecs.rsEccCodes1(param1);
         var _loc5_:QRRsItem = QRUtil.initRs(8,285,0,1,_loc3_,255 - _loc6_ - _loc3_);
         _loc9_ = 0;
         while(_loc9_ < QRSpecs.rsBlockNum1(param1))
         {
            _loc8_ = this.ecccode.slice(_loc4_);
            this.rsblocks[_loc9_] = new QRRsBlock(_loc6_,this.datacode.slice(_loc2_),_loc3_,_loc8_,_loc5_);
            _loc8_ = _loc5_.encode_rs_char((this.rsblocks[_loc9_] as QRRsBlock).data);
            (this.rsblocks[_loc9_] as QRRsBlock).ecc = _loc8_;
            this.ecccode = QRUtil.array_merge(this.ecccode.slice(0,_loc4_),_loc8_);
            _loc2_ = _loc2_ + _loc6_;
            _loc4_ = _loc4_ + _loc3_;
            _loc7_++;
            _loc9_++;
         }
         if(QRSpecs.rsBlockNum2(param1) == 0)
         {
            return 0;
         }
         _loc6_ = QRSpecs.rsDataCodes2(param1);
         _loc3_ = QRSpecs.rsEccCodes2(param1);
         _loc5_ = QRUtil.initRs(8,285,0,1,_loc3_,255 - _loc6_ - _loc3_);
         if(_loc5_ == null)
         {
            return -1;
         }
         _loc9_ = 0;
         while(_loc9_ < QRSpecs.rsBlockNum2(param1))
         {
            _loc8_ = this.ecccode.slice(_loc4_);
            this.rsblocks.push(new QRRsBlock(_loc6_,this.datacode.slice(_loc2_),_loc3_,_loc8_,_loc5_),_loc7_);
            this.ecccode = QRUtil.array_merge(this.ecccode.slice(0,_loc4_),_loc8_);
            _loc2_ = _loc2_ + _loc6_;
            _loc4_ = _loc4_ + _loc3_;
            _loc7_++;
            _loc9_++;
         }
         return 0;
      }
      
      public function getCode() : int
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         if(this.count < this.dataLength)
         {
            _loc3_ = this.count % this.blocks;
            _loc2_ = this.count / this.blocks;
            if(_loc2_ >= this.rsblocks[0].dataLength)
            {
               _loc3_ = _loc3_ + this.b1;
            }
            _loc1_ = this.rsblocks[_loc3_].data[_loc2_];
         }
         else if(this.count < this.dataLength + this.eccLength)
         {
            _loc3_ = (this.count - this.dataLength) % this.blocks;
            _loc2_ = (this.count - this.dataLength) / this.blocks;
            _loc1_ = this.rsblocks[_loc3_].ecc[_loc2_];
         }
         else
         {
            return 0;
         }
         this.count++;
         return _loc1_;
      }
   }
}
