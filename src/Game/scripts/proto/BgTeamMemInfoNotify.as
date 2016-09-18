package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgTeamMemInfoNotify extends Message
   {
      
      public static const PLAYERINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BgTeamMemInfoNotify.playerInfos","playerInfos",8 | 2,BgPlayerInfo);
      
      public static const LEADERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BgTeamMemInfoNotify.leaderId","leaderId",16 | 0);
      
      public static const TEAMID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BgTeamMemInfoNotify.teamId","teamId",24 | 0);
       
      
      public var playerInfos:Array;
      
      private var leaderId$field:UInt64;
      
      private var teamId$field:UInt64;
      
      public function BgTeamMemInfoNotify()
      {
         playerInfos = [];
         super();
      }
      
      public function clearLeaderId() : void
      {
         leaderId$field = null;
      }
      
      public function get hasLeaderId() : Boolean
      {
         return leaderId$field != null;
      }
      
      public function set leaderId(param1:UInt64) : void
      {
         leaderId$field = param1;
      }
      
      public function get leaderId() : UInt64
      {
         return leaderId$field;
      }
      
      public function clearTeamId() : void
      {
         teamId$field = null;
      }
      
      public function get hasTeamId() : Boolean
      {
         return teamId$field != null;
      }
      
      public function set teamId(param1:UInt64) : void
      {
         teamId$field = param1;
      }
      
      public function get teamId() : UInt64
      {
         return teamId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.playerInfos.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.playerInfos[_loc2_]);
            _loc2_++;
         }
         if(hasLeaderId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT64(param1,leaderId$field);
         }
         if(hasTeamId)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT64(param1,teamId$field);
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
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  this.playerInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new BgPlayerInfo()));
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BgTeamMemInfoNotify.leaderId cannot be set twice.");
                  }
                  _loc5_++;
                  this.leaderId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BgTeamMemInfoNotify.teamId cannot be set twice.");
                  }
                  _loc3_++;
                  this.teamId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
