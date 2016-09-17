package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ActivityRewardNotify extends Message
   {
      
      public static const AID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ActivityRewardNotify.aid","aid",8 | 0);
      
      public static const REWARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ActivityRewardNotify.reward","reward",16 | 2,proto.ActivityReward);
       
      
      private var aid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var reward$field:proto.ActivityReward;
      
      public function ActivityRewardNotify()
      {
         super();
      }
      
      public function clearAid() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         aid$field = new uint();
      }
      
      public function get hasAid() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set aid(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         aid$field = param1;
      }
      
      public function get aid() : uint
      {
         return aid$field;
      }
      
      public function clearReward() : void
      {
         reward$field = null;
      }
      
      public function get hasReward() : Boolean
      {
         return reward$field != null;
      }
      
      public function set reward(param1:proto.ActivityReward) : void
      {
         reward$field = param1;
      }
      
      public function get reward() : proto.ActivityReward
      {
         return reward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasAid)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,aid$field);
         }
         if(hasReward)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,reward$field);
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
                     throw new IOError("Bad data format: ActivityRewardNotify.aid cannot be set twice.");
                  }
                  _loc5_++;
                  this.aid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ActivityRewardNotify.reward cannot be set twice.");
                  }
                  _loc3_++;
                  this.reward = new proto.ActivityReward();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.reward);
                  continue;
            }
         }
      }
   }
}
