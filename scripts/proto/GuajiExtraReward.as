package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GuajiExtraReward extends Message
   {
      
      public static const REWARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GuajiExtraReward.reward","reward",8 | 2,proto.Reward);
      
      public static const GJSPEED:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiExtraReward.gjSpeed","gjSpeed",16 | 0);
       
      
      private var reward$field:proto.Reward;
      
      private var gjSpeed$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function GuajiExtraReward()
      {
         super();
      }
      
      public function clearReward() : void
      {
         reward$field = null;
      }
      
      public function get hasReward() : Boolean
      {
         return reward$field != null;
      }
      
      public function set reward(param1:proto.Reward) : void
      {
         reward$field = param1;
      }
      
      public function get reward() : proto.Reward
      {
         return reward$field;
      }
      
      public function clearGjSpeed() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         gjSpeed$field = new uint();
      }
      
      public function get hasGjSpeed() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set gjSpeed(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         gjSpeed$field = param1;
      }
      
      public function get gjSpeed() : uint
      {
         return gjSpeed$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasReward)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,reward$field);
         }
         if(hasGjSpeed)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,gjSpeed$field);
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
         var _loc5_:* = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiExtraReward.reward cannot be set twice.");
                  }
                  _loc3_++;
                  this.reward = new proto.Reward();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.reward);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiExtraReward.gjSpeed cannot be set twice.");
                  }
                  _loc4_++;
                  this.gjSpeed = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
