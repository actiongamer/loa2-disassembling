package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GuajiExtraRewardNotify extends Message
   {
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.GuajiExtraRewardNotify.playerId","playerId",8 | 0);
      
      public static const RWD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GuajiExtraRewardNotify.rwd","rwd",16 | 2,proto.Reward);
       
      
      private var playerId$field:UInt64;
      
      private var rwd$field:proto.Reward;
      
      public function GuajiExtraRewardNotify()
      {
         super();
      }
      
      public function clearPlayerId() : void
      {
         playerId$field = null;
      }
      
      public function get hasPlayerId() : Boolean
      {
         return playerId$field != null;
      }
      
      public function set playerId(param1:UInt64) : void
      {
         playerId$field = param1;
      }
      
      public function get playerId() : UInt64
      {
         return playerId$field;
      }
      
      public function clearRwd() : void
      {
         rwd$field = null;
      }
      
      public function get hasRwd() : Boolean
      {
         return rwd$field != null;
      }
      
      public function set rwd(param1:proto.Reward) : void
      {
         rwd$field = param1;
      }
      
      public function get rwd() : proto.Reward
      {
         return rwd$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasPlayerId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT64(param1,playerId$field);
         }
         if(hasRwd)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,rwd$field);
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
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiExtraRewardNotify.playerId cannot be set twice.");
                  }
                  _loc4_++;
                  this.playerId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiExtraRewardNotify.rwd cannot be set twice.");
                  }
                  _loc5_++;
                  this.rwd = new proto.Reward();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.rwd);
                  continue;
            }
         }
      }
   }
}
