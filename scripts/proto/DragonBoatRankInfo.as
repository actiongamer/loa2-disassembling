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
   
   public class DragonBoatRankInfo extends Message
   {
      
      public static const PLAYER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.DragonBoatRankInfo.player","player",8 | 2,proto.PlayerBaseInfo);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.DragonBoatRankInfo.score","score",16 | 0);
       
      
      private var player$field:proto.PlayerBaseInfo;
      
      private var score$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function DragonBoatRankInfo()
      {
         super();
      }
      
      public function clearPlayer() : void
      {
         player$field = null;
      }
      
      public function get hasPlayer() : Boolean
      {
         return player$field != null;
      }
      
      public function set player(param1:proto.PlayerBaseInfo) : void
      {
         player$field = param1;
      }
      
      public function get player() : proto.PlayerBaseInfo
      {
         return player$field;
      }
      
      public function clearScore() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         score$field = param1;
      }
      
      public function get score() : uint
      {
         return score$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasPlayer)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,player$field);
         }
         if(hasScore)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,score$field);
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
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: DragonBoatRankInfo.player cannot be set twice.");
                  }
                  _loc5_++;
                  this.player = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.player);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: DragonBoatRankInfo.score cannot be set twice.");
                  }
                  _loc4_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
