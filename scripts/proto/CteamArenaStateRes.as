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
   
   public class CteamArenaStateRes extends Message
   {
      
      public static const STATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CteamArenaStateRes.state","state",8 | 0);
      
      public static const TEAM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.CteamArenaStateRes.team","team",16 | 2,proto.CTeamInfo);
      
      public static const NUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CteamArenaStateRes.num","num",24 | 0);
       
      
      public var state:uint;
      
      private var team$field:proto.CTeamInfo;
      
      private var num$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function CteamArenaStateRes()
      {
         super();
      }
      
      public function clearTeam() : void
      {
         team$field = null;
      }
      
      public function get hasTeam() : Boolean
      {
         return team$field != null;
      }
      
      public function set team(param1:proto.CTeamInfo) : void
      {
         team$field = param1;
      }
      
      public function get team() : proto.CTeamInfo
      {
         return team$field;
      }
      
      public function clearNum() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         num$field = new uint();
      }
      
      public function get hasNum() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set num(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         num$field = param1;
      }
      
      public function get num() : uint
      {
         return num$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.state);
         if(hasTeam)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,team$field);
         }
         if(hasNum)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,num$field);
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
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CteamArenaStateRes.state cannot be set twice.");
                  }
                  _loc3_++;
                  this.state = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CteamArenaStateRes.team cannot be set twice.");
                  }
                  _loc6_++;
                  this.team = new proto.CTeamInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.team);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CteamArenaStateRes.num cannot be set twice.");
                  }
                  _loc5_++;
                  this.num = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
