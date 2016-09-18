package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class SuperSaleGetRewardRes extends Message
   {
      
      public static const REWARDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.SuperSaleGetRewardRes.rewardId","rewardId",8 | 0);
      
      public static const STATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.SuperSaleGetRewardRes.status","status",16 | 0);
       
      
      private var rewardId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var status$field:uint;
      
      public function SuperSaleGetRewardRes()
      {
         super();
      }
      
      public function clearRewardId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         rewardId$field = new uint();
      }
      
      public function get hasRewardId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set rewardId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         rewardId$field = param1;
      }
      
      public function get rewardId() : uint
      {
         return rewardId$field;
      }
      
      public function clearStatus() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         status$field = new uint();
      }
      
      public function get hasStatus() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set status(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         status$field = param1;
      }
      
      public function get status() : uint
      {
         return status$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasRewardId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,rewardId$field);
         }
         if(hasStatus)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,status$field);
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
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: SuperSaleGetRewardRes.rewardId cannot be set twice.");
                  }
                  _loc5_++;
                  this.rewardId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: SuperSaleGetRewardRes.status cannot be set twice.");
                  }
                  _loc3_++;
                  this.status = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
