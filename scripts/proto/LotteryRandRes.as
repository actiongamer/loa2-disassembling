package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class LotteryRandRes extends Message
   {
      
      public static const ONETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LotteryRandRes.oneTime","oneTime",8 | 0);
      
      public static const ONECD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LotteryRandRes.oneCd","oneCd",16 | 0);
      
      public static const ONEFREETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LotteryRandRes.oneFreeTimes","oneFreeTimes",24 | 0);
      
      public static const ONECASHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LotteryRandRes.oneCashTime","oneCashTime",32 | 0);
      
      public static const ONECASHCD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LotteryRandRes.oneCashCd","oneCashCd",40 | 0);
      
      public static const ONECASHFREETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LotteryRandRes.oneCashFreeTimes","oneCashFreeTimes",48 | 0);
      
      public static const REWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.LotteryRandRes.rewards","rewards",56 | 2,Reward);
      
      public static const ISFIRSTONE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.LotteryRandRes.isFirstOne","isFirstOne",64 | 0);
      
      public static const ISFIRSTCASHONE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.LotteryRandRes.isFirstCashOne","isFirstCashOne",72 | 0);
      
      public static const ISFIRSTCASHTEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.LotteryRandRes.isFirstCashTen","isFirstCashTen",80 | 0);
      
      public static const CASHYULIANG:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LotteryRandRes.CashYuLiang","cashYuLiang",88 | 0);
      
      public static const POINT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LotteryRandRes.Point","point",96 | 0);
      
      public static const QUALITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LotteryRandRes.quality","quality",104 | 0);
      
      public static const HASFIRST:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.LotteryRandRes.hasfirst","hasfirst",112 | 0);
       
      
      public var oneTime:uint;
      
      public var oneCd:uint;
      
      public var oneFreeTimes:uint;
      
      public var oneCashTime:uint;
      
      public var oneCashCd:uint;
      
      public var oneCashFreeTimes:uint;
      
      public var rewards:Array;
      
      private var isFirstOne$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var isFirstCashOne$field:Boolean;
      
      private var isFirstCashTen$field:Boolean;
      
      private var CashYuLiang$field:uint;
      
      private var Point$field:uint;
      
      private var quality$field:uint;
      
      private var hasfirst$field:Boolean;
      
      public function LotteryRandRes()
      {
         rewards = [];
         super();
      }
      
      public function clearIsFirstOne() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         isFirstOne$field = new Boolean();
      }
      
      public function get hasIsFirstOne() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set isFirstOne(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         isFirstOne$field = param1;
      }
      
      public function get isFirstOne() : Boolean
      {
         return isFirstOne$field;
      }
      
      public function clearIsFirstCashOne() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         isFirstCashOne$field = new Boolean();
      }
      
      public function get hasIsFirstCashOne() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set isFirstCashOne(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 2;
         isFirstCashOne$field = param1;
      }
      
      public function get isFirstCashOne() : Boolean
      {
         return isFirstCashOne$field;
      }
      
      public function clearIsFirstCashTen() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         isFirstCashTen$field = new Boolean();
      }
      
      public function get hasIsFirstCashTen() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set isFirstCashTen(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 4;
         isFirstCashTen$field = param1;
      }
      
      public function get isFirstCashTen() : Boolean
      {
         return isFirstCashTen$field;
      }
      
      public function clearCashYuLiang() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         CashYuLiang$field = new uint();
      }
      
      public function get hasCashYuLiang() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set cashYuLiang(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         CashYuLiang$field = param1;
      }
      
      public function get cashYuLiang() : uint
      {
         return CashYuLiang$field;
      }
      
      public function clearPoint() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         Point$field = new uint();
      }
      
      public function get hasPoint() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set point(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         Point$field = param1;
      }
      
      public function get point() : uint
      {
         return Point$field;
      }
      
      public function clearQuality() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         quality$field = new uint();
      }
      
      public function get hasQuality() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set quality(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         quality$field = param1;
      }
      
      public function get quality() : uint
      {
         return quality$field;
      }
      
      public function clearHasfirst() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         hasfirst$field = new Boolean();
      }
      
      public function get hasHasfirst() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set hasfirst(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 64;
         hasfirst$field = param1;
      }
      
      public function get hasfirst() : Boolean
      {
         return hasfirst$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.oneTime);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.oneCd);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.oneFreeTimes);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.oneCashTime);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.oneCashCd);
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_UINT32(param1,this.oneCashFreeTimes);
         _loc2_ = uint(0);
         while(_loc2_ < this.rewards.length)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewards[_loc2_]);
            _loc2_++;
         }
         if(hasIsFirstOne)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_BOOL(param1,isFirstOne$field);
         }
         if(hasIsFirstCashOne)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_BOOL(param1,isFirstCashOne$field);
         }
         if(hasIsFirstCashTen)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_BOOL(param1,isFirstCashTen$field);
         }
         if(hasCashYuLiang)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,CashYuLiang$field);
         }
         if(hasPoint)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,Point$field);
         }
         if(hasQuality)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_UINT32(param1,quality$field);
         }
         if(hasHasfirst)
         {
            WriteUtils.writeTag(param1,0,14);
            WriteUtils.write$TYPE_BOOL(param1,hasfirst$field);
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = 0;
         var _loc7_:uint = 0;
         var _loc4_:uint = 0;
         var _loc14_:uint = 0;
         var _loc15_:uint = 0;
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         var _loc16_:uint = 0;
         var _loc5_:uint = 0;
         var _loc11_:uint = 0;
         var _loc6_:uint = 0;
         var _loc10_:uint = 0;
         var _loc13_:uint = 0;
         var _loc12_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: LotteryRandRes.oneTime cannot be set twice.");
                  }
                  _loc7_++;
                  this.oneTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: LotteryRandRes.oneCd cannot be set twice.");
                  }
                  _loc4_++;
                  this.oneCd = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: LotteryRandRes.oneFreeTimes cannot be set twice.");
                  }
                  _loc14_++;
                  this.oneFreeTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: LotteryRandRes.oneCashTime cannot be set twice.");
                  }
                  _loc15_++;
                  this.oneCashTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: LotteryRandRes.oneCashCd cannot be set twice.");
                  }
                  _loc9_++;
                  this.oneCashCd = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: LotteryRandRes.oneCashFreeTimes cannot be set twice.");
                  }
                  _loc8_++;
                  this.oneCashFreeTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  this.rewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Reward()));
                  continue;
               case 7:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: LotteryRandRes.isFirstOne cannot be set twice.");
                  }
                  _loc16_++;
                  this.isFirstOne = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 8:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: LotteryRandRes.isFirstCashOne cannot be set twice.");
                  }
                  _loc5_++;
                  this.isFirstCashOne = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: LotteryRandRes.isFirstCashTen cannot be set twice.");
                  }
                  _loc11_++;
                  this.isFirstCashTen = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 10:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: LotteryRandRes.cashYuLiang cannot be set twice.");
                  }
                  _loc6_++;
                  this.cashYuLiang = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 11:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: LotteryRandRes.point cannot be set twice.");
                  }
                  _loc10_++;
                  this.point = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 12:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: LotteryRandRes.quality cannot be set twice.");
                  }
                  _loc13_++;
                  this.quality = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 13:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: LotteryRandRes.hasfirst cannot be set twice.");
                  }
                  _loc12_++;
                  this.hasfirst = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
