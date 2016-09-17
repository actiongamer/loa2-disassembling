package org.qrcode
{
   import org.qrcode.utils.QRUtil;
   
   public class QRbitstream
   {
       
      
      public var data:Array;
      
      public function QRbitstream()
      {
         this.data = [];
         super();
      }
      
      public static function newFromNum(param1:Number, param2:Number) : QRbitstream
      {
         var _loc5_:int = 0;
         var _loc4_:QRbitstream = new QRbitstream();
         _loc4_.allocate(param1);
         var _loc3_:* = 1 << param1 - 1;
         while(_loc5_ < param1)
         {
            if(param2 & _loc3_)
            {
               _loc4_.data[_loc5_] = 1;
            }
            else
            {
               _loc4_.data[_loc5_] = 0;
            }
            _loc3_ = _loc3_ >> 1;
            _loc5_++;
         }
         return _loc4_;
      }
      
      public static function newFromBytes(param1:int, param2:Array) : QRbitstream
      {
         var _loc4_:Number = NaN;
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         var _loc7_:int = 0;
         var _loc5_:QRbitstream = new QRbitstream();
         _loc5_.allocate(param1 * 8);
         while(_loc7_ < param1)
         {
            _loc4_ = 128;
            _loc6_ = 0;
            while(_loc6_ < 8)
            {
               if(param2[_loc7_] & _loc4_)
               {
                  _loc5_.data[_loc3_] = 1;
               }
               else
               {
                  _loc5_.data[_loc3_] = 0;
               }
               _loc3_++;
               _loc4_ = _loc4_ >> 1;
               _loc6_++;
            }
            _loc7_++;
         }
         return _loc5_;
      }
      
      public function get size() : int
      {
         return this.data.length;
      }
      
      public function allocate(param1:int) : void
      {
         this.data = QRUtil.array_fill(0,param1,0);
      }
      
      public function append(param1:QRbitstream) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.size == 0)
         {
            return;
         }
         if(this.size == 0)
         {
            this.data = param1.data;
            return;
         }
         QRUtil.array_merge(this.data,param1.data);
      }
      
      public function appendNum(param1:Number, param2:Number) : void
      {
         if(param1 == 0)
         {
            return;
         }
         var _loc3_:QRbitstream = QRbitstream.newFromNum(param1,param2);
         if(_loc3_ == null)
         {
            return;
         }
         this.append(_loc3_);
      }
      
      public function appendBytes(param1:int, param2:Array) : void
      {
         if(param1 == 0)
         {
            return;
         }
         var _loc3_:QRbitstream = QRbitstream.newFromBytes(param1,param2);
         if(_loc3_ == null)
         {
            return;
         }
         this.append(_loc3_);
      }
      
      public function toByte() : Array
      {
         var _loc1_:* = NaN;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = this.size;
         if(_loc7_ == 0)
         {
            return [];
         }
         var _loc4_:Array = QRUtil.array_fill(0,(_loc7_ + 7) / 8,0);
         var _loc2_:int = _loc7_ / 8;
         while(_loc6_ < _loc2_)
         {
            _loc1_ = 0;
            _loc5_ = 0;
            while(_loc5_ < 8)
            {
               _loc1_ = Number(_loc1_ << 1);
               _loc1_ = Number(_loc1_ | this.data[_loc3_]);
               _loc3_++;
               _loc5_++;
            }
            _loc4_[_loc6_] = _loc1_;
            _loc6_++;
         }
         if(_loc7_ & 7)
         {
            _loc1_ = 0;
            _loc5_ = 0;
            while(_loc5_ < (_loc7_ & 7))
            {
               _loc1_ = Number(_loc1_ << 1);
               _loc1_ = Number(_loc1_ | this.data[_loc3_]);
               _loc3_++;
               _loc5_++;
            }
            _loc4_[_loc2_] = _loc1_;
         }
         return _loc4_;
      }
   }
}
