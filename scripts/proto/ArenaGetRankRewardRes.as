package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ArenaGetRankRewardRes extends Message
   {
      
      public static const REWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ArenaGetRankRewardRes.rewards","rewards",8 | 2,Reward);
      
      public static const CANGETRANKREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.ArenaGetRankRewardRes.canGetRankReward","canGetRankReward",16 | 0);
       
      
      public var rewards:Array;
      
      private var canGetRankReward$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function ArenaGetRankRewardRes()
      {
         rewards = [];
         super();
      }
      
      public function clearCanGetRankReward() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         canGetRankReward$field = new Boolean();
      }
      
      public function get hasCanGetRankReward() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set canGetRankReward(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         canGetRankReward$field = param1;
      }
      
      public function get canGetRankReward() : Boolean
      {
         return canGetRankReward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.rewards.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewards[_loc2_]);
            _loc2_++;
         }
         if(hasCanGetRankReward)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_BOOL(param1,canGetRankReward$field);
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
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  this.rewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Reward()));
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaGetRankRewardRes.canGetRankReward cannot be set twice.");
                  }
                  _loc3_++;
                  this.canGetRankReward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
