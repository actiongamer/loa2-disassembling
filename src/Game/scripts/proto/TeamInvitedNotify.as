package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TeamInvitedNotify extends Message
   {
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamInvitedNotify.kind","kind",8 | 0);
      
      public static const TEAMID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.TeamInvitedNotify.teamId","teamId",16 | 0);
      
      public static const BGPLAYER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.TeamInvitedNotify.bgPlayer","bgPlayer",24 | 2,proto.BgPlayerInfo);
      
      public static const PLAYER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.TeamInvitedNotify.player","player",32 | 2,proto.PlayerBaseInfo);
       
      
      public var kind:uint;
      
      public var teamId:UInt64;
      
      private var bgPlayer$field:proto.BgPlayerInfo;
      
      private var player$field:proto.PlayerBaseInfo;
      
      public function TeamInvitedNotify()
      {
         super();
      }
      
      public function clearBgPlayer() : void
      {
         bgPlayer$field = null;
      }
      
      public function get hasBgPlayer() : Boolean
      {
         return bgPlayer$field != null;
      }
      
      public function set bgPlayer(param1:proto.BgPlayerInfo) : void
      {
         bgPlayer$field = param1;
      }
      
      public function get bgPlayer() : proto.BgPlayerInfo
      {
         return bgPlayer$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.kind);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT64(param1,this.teamId);
         if(hasBgPlayer)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,bgPlayer$field);
         }
         if(hasPlayer)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,player$field);
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
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: TeamInvitedNotify.kind cannot be set twice.");
                  }
                  _loc4_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: TeamInvitedNotify.teamId cannot be set twice.");
                  }
                  _loc3_++;
                  this.teamId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: TeamInvitedNotify.bgPlayer cannot be set twice.");
                  }
                  _loc6_++;
                  this.bgPlayer = new proto.BgPlayerInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.bgPlayer);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: TeamInvitedNotify.player cannot be set twice.");
                  }
                  _loc7_++;
                  this.player = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.player);
                  continue;
            }
         }
      }
   }
}
