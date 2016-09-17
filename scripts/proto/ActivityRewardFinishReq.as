package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ActivityRewardFinishReq extends Message
   {
      
      public static const AID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ActivityRewardFinishReq.aid","aid",8 | 0);
      
      public static const RID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ActivityRewardFinishReq.rid","rid",16 | 0);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ActivityRewardFinishReq.count","count",24 | 0);
       
      
      public var aid:uint;
      
      public var rid:uint;
      
      private var count$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function ActivityRewardFinishReq()
      {
         super();
      }
      
      public function clearCount() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         count$field = new uint();
      }
      
      public function get hasCount() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set count(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         count$field = param1;
      }
      
      public function get count() : uint
      {
         return count$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.aid);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.rid);
         if(hasCount)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,count$field);
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
         var _loc3_:* = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: ActivityRewardFinishReq.aid cannot be set twice.");
                  }
                  _loc6_++;
                  this.aid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ActivityRewardFinishReq.rid cannot be set twice.");
                  }
                  _loc5_++;
                  this.rid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ActivityRewardFinishReq.count cannot be set twice.");
                  }
                  _loc4_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
