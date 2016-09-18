package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BaoWuStrengthReq extends Message
   {
      
      public static const HERO:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BaoWuStrengthReq.hero","hero",8 | 0);
      
      public static const ITEM:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BaoWuStrengthReq.item","item",16 | 0);
      
      public static const COST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BaoWuStrengthReq.cost","cost",24 | 2,MapKey64Value32);
      
      public static const FLAG:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BaoWuStrengthReq.flag","flag",32 | 0);
       
      
      public var hero:UInt64;
      
      public var item:UInt64;
      
      public var cost:Array;
      
      private var flag$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function BaoWuStrengthReq()
      {
         cost = [];
         super();
      }
      
      public function clearFlag() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         flag$field = new uint();
      }
      
      public function get hasFlag() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set flag(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         flag$field = param1;
      }
      
      public function get flag() : uint
      {
         return flag$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.hero);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT64(param1,this.item);
         _loc2_ = uint(0);
         while(_loc2_ < this.cost.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cost[_loc2_]);
            _loc2_++;
         }
         if(hasFlag)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,flag$field);
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
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWuStrengthReq.hero cannot be set twice.");
                  }
                  _loc5_++;
                  this.hero = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWuStrengthReq.item cannot be set twice.");
                  }
                  _loc6_++;
                  this.item = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  this.cost.push(ReadUtils.read$TYPE_MESSAGE(param1,new MapKey64Value32()));
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWuStrengthReq.flag cannot be set twice.");
                  }
                  _loc4_++;
                  this.flag = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
