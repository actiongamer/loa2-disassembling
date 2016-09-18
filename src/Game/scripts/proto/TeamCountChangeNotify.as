package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TeamCountChangeNotify extends Message
   {
      
      public static const TEAMID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.TeamCountChangeNotify.teamId","teamId",8 | 0);
      
      public static const MEMBERCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamCountChangeNotify.memberCount","memberCount",16 | 0);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamCountChangeNotify.kind","kind",24 | 0);
       
      
      private var teamId$field:UInt64;
      
      private var memberCount$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var kind$field:uint;
      
      public function TeamCountChangeNotify()
      {
         super();
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
      
      public function clearMemberCount() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         memberCount$field = new uint();
      }
      
      public function get hasMemberCount() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set memberCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         memberCount$field = param1;
      }
      
      public function get memberCount() : uint
      {
         return memberCount$field;
      }
      
      public function clearKind() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         kind$field = new uint();
      }
      
      public function get hasKind() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set kind(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         kind$field = param1;
      }
      
      public function get kind() : uint
      {
         return kind$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasTeamId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT64(param1,teamId$field);
         }
         if(hasMemberCount)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,memberCount$field);
         }
         if(hasKind)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,kind$field);
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
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: TeamCountChangeNotify.teamId cannot be set twice.");
                  }
                  _loc4_++;
                  this.teamId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: TeamCountChangeNotify.memberCount cannot be set twice.");
                  }
                  _loc6_++;
                  this.memberCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: TeamCountChangeNotify.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
