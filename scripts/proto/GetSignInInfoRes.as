package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GetSignInInfoRes extends Message
   {
      
      public static const IDS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.GetSignInInfoRes.ids","ids",8 | 0);
      
      public static const TURN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetSignInInfoRes.turn","turn",16 | 0);
      
      public static const SIGNIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GetSignInInfoRes.signIn","signIn",24 | 0);
      
      public static const NOWORDER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetSignInInfoRes.nowOrder","nowOrder",32 | 0);
      
      public static const MONTH:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetSignInInfoRes.month","month",40 | 0);
      
      public static const DAYS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetSignInInfoRes.days","days",48 | 0);
      
      public static const EXTRAREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GetSignInInfoRes.extraReward","extraReward",56 | 0);
      
      public static const EXTRAORDER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetSignInInfoRes.extraOrder","extraOrder",64 | 0);
       
      
      public var ids:Array;
      
      public var turn:uint;
      
      public var signIn:Boolean;
      
      private var nowOrder$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var month$field:uint;
      
      private var days$field:uint;
      
      private var extraReward$field:Boolean;
      
      private var extraOrder$field:uint;
      
      public function GetSignInInfoRes()
      {
         ids = [];
         super();
      }
      
      public function clearNowOrder() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         nowOrder$field = new uint();
      }
      
      public function get hasNowOrder() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set nowOrder(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         nowOrder$field = param1;
      }
      
      public function get nowOrder() : uint
      {
         return nowOrder$field;
      }
      
      public function clearMonth() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         month$field = new uint();
      }
      
      public function get hasMonth() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set month(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         month$field = param1;
      }
      
      public function get month() : uint
      {
         return month$field;
      }
      
      public function clearDays() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         days$field = new uint();
      }
      
      public function get hasDays() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set days(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         days$field = param1;
      }
      
      public function get days() : uint
      {
         return days$field;
      }
      
      public function clearExtraReward() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         extraReward$field = new Boolean();
      }
      
      public function get hasExtraReward() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set extraReward(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 8;
         extraReward$field = param1;
      }
      
      public function get extraReward() : Boolean
      {
         return extraReward$field;
      }
      
      public function clearExtraOrder() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         extraOrder$field = new uint();
      }
      
      public function get hasExtraOrder() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set extraOrder(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         extraOrder$field = param1;
      }
      
      public function get extraOrder() : uint
      {
         return extraOrder$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.ids.length)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,this.ids[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.turn);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_BOOL(param1,this.signIn);
         if(hasNowOrder)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,nowOrder$field);
         }
         if(hasMonth)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,month$field);
         }
         if(hasDays)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,days$field);
         }
         if(hasExtraReward)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_BOOL(param1,extraReward$field);
         }
         if(hasExtraOrder)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,extraOrder$field);
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
         var _loc4_:* = 0;
         var _loc5_:uint = 0;
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc10_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if((_loc4_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.ids);
                  }
                  else
                  {
                     this.ids.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: GetSignInInfoRes.turn cannot be set twice.");
                  }
                  _loc5_++;
                  this.turn = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: GetSignInInfoRes.signIn cannot be set twice.");
                  }
                  _loc9_++;
                  this.signIn = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: GetSignInInfoRes.nowOrder cannot be set twice.");
                  }
                  _loc3_++;
                  this.nowOrder = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: GetSignInInfoRes.month cannot be set twice.");
                  }
                  _loc10_++;
                  this.month = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: GetSignInInfoRes.days cannot be set twice.");
                  }
                  _loc6_++;
                  this.days = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: GetSignInInfoRes.extraReward cannot be set twice.");
                  }
                  _loc7_++;
                  this.extraReward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: GetSignInInfoRes.extraOrder cannot be set twice.");
                  }
                  _loc8_++;
                  this.extraOrder = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
