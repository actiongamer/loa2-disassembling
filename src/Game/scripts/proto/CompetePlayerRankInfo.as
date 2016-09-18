package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CompetePlayerRankInfo extends Message
   {
      
      public static const NUM:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompetePlayerRankInfo.num","num",8 | 0);
      
      public static const RANK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompetePlayerRankInfo.rank","rank",16 | 0);
      
      public static const CREATETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CompetePlayerRankInfo.createTime","createTime",24 | 0);
       
      
      private var num$field:int;
      
      private var hasField$0:uint = 0;
      
      private var rank$field:int;
      
      private var createTime$field:uint;
      
      public function CompetePlayerRankInfo()
      {
         super();
      }
      
      public function clearNum() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         num$field = new int();
      }
      
      public function get hasNum() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set num(param1:int) : void
      {
         hasField$0 = hasField$0 | 1;
         num$field = param1;
      }
      
      public function get num() : int
      {
         return num$field;
      }
      
      public function clearRank() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         rank$field = new int();
      }
      
      public function get hasRank() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set rank(param1:int) : void
      {
         hasField$0 = hasField$0 | 2;
         rank$field = param1;
      }
      
      public function get rank() : int
      {
         return rank$field;
      }
      
      public function clearCreateTime() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         createTime$field = new uint();
      }
      
      public function get hasCreateTime() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set createTime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         createTime$field = param1;
      }
      
      public function get createTime() : uint
      {
         return createTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasNum)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_INT32(param1,num$field);
         }
         if(hasRank)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_INT32(param1,rank$field);
         }
         if(hasCreateTime)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,createTime$field);
         }
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CompetePlayerRankInfo.num cannot be set twice.");
                  }
                  _loc6_++;
                  this.num = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CompetePlayerRankInfo.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CompetePlayerRankInfo.createTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.createTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
