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
   
   public class CTeamMemberInfo extends Message
   {
      
      public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.CTeamMemberInfo.info","info",8 | 2,proto.PlayerBaseInfo);
      
      public static const WIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CTeamMemberInfo.win","win",16 | 0);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CTeamMemberInfo.score","score",24 | 0);
       
      
      public var info:proto.PlayerBaseInfo;
      
      private var win$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var score$field:uint;
      
      public function CTeamMemberInfo()
      {
         super();
      }
      
      public function clearWin() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         win$field = new uint();
      }
      
      public function get hasWin() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set win(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         win$field = param1;
      }
      
      public function get win() : uint
      {
         return win$field;
      }
      
      public function clearScore() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         score$field = param1;
      }
      
      public function get score() : uint
      {
         return score$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.info);
         if(hasWin)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,win$field);
         }
         if(hasScore)
         {
            WriteUtils.writeTag(param1,0,3);
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
                     throw new IOError("Bad data format: CTeamMemberInfo.info cannot be set twice.");
                  }
                  _loc6_++;
                  this.info = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.info);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamMemberInfo.win cannot be set twice.");
                  }
                  _loc3_++;
                  this.win = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamMemberInfo.score cannot be set twice.");
                  }
                  _loc5_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
