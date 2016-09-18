package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TeamInfo extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.TeamInfo.id","id",8 | 0);
      
      public static const LEADER:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.TeamInfo.leader","leader",16 | 0);
      
      public static const PWD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.TeamInfo.pwd","pwd",24 | 0);
      
      public static const ALL:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.TeamInfo.all","all",32 | 2,TeamMemberState);
      
      public static const TEAMNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.TeamInfo.teamname","teamname",40 | 2);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamInfo.kind","kind",48 | 0);
      
      public static const APPLYS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.TeamInfo.applys","applys",56 | 2,TeamMember);
      
      public static const SETTING:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.TeamInfo.setting","setting",64 | 2,proto.TeamSetting);
      
      public static const SHIPQUALITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamInfo.shipquality","shipquality",72 | 0);
       
      
      public var id:UInt64;
      
      public var leader:UInt64;
      
      public var pwd:Boolean;
      
      public var all:Array;
      
      private var teamname$field:String;
      
      public var kind:uint;
      
      public var applys:Array;
      
      private var setting$field:proto.TeamSetting;
      
      private var shipquality$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function TeamInfo()
      {
         all = [];
         applys = [];
         super();
      }
      
      public function clearTeamname() : void
      {
         teamname$field = null;
      }
      
      public function get hasTeamname() : Boolean
      {
         return teamname$field != null;
      }
      
      public function set teamname(param1:String) : void
      {
         teamname$field = param1;
      }
      
      public function get teamname() : String
      {
         return teamname$field;
      }
      
      public function clearSetting() : void
      {
         setting$field = null;
      }
      
      public function get hasSetting() : Boolean
      {
         return setting$field != null;
      }
      
      public function set setting(param1:proto.TeamSetting) : void
      {
         setting$field = param1;
      }
      
      public function get setting() : proto.TeamSetting
      {
         return setting$field;
      }
      
      public function clearShipquality() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         shipquality$field = new uint();
      }
      
      public function get hasShipquality() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set shipquality(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         shipquality$field = param1;
      }
      
      public function get shipquality() : uint
      {
         return shipquality$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT64(param1,this.leader);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_BOOL(param1,this.pwd);
         _loc2_ = uint(0);
         while(_loc2_ < this.all.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.all[_loc2_]);
            _loc2_++;
         }
         if(hasTeamname)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,teamname$field);
         }
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_UINT32(param1,this.kind);
         _loc3_ = uint(0);
         while(_loc3_ < this.applys.length)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.applys[_loc3_]);
            _loc3_++;
         }
         if(hasSetting)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_MESSAGE(param1,setting$field);
         }
         if(hasShipquality)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,shipquality$field);
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc10_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: TeamInfo.id cannot be set twice.");
                  }
                  _loc8_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: TeamInfo.leader cannot be set twice.");
                  }
                  _loc9_++;
                  this.leader = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: TeamInfo.pwd cannot be set twice.");
                  }
                  _loc7_++;
                  this.pwd = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 3:
                  this.all.push(ReadUtils.read$TYPE_MESSAGE(param1,new TeamMemberState()));
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: TeamInfo.teamname cannot be set twice.");
                  }
                  _loc6_++;
                  this.teamname = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: TeamInfo.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  this.applys.push(ReadUtils.read$TYPE_MESSAGE(param1,new TeamMember()));
                  continue;
               case 7:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: TeamInfo.setting cannot be set twice.");
                  }
                  _loc10_++;
                  this.setting = new proto.TeamSetting();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.setting);
                  continue;
               case 8:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: TeamInfo.shipquality cannot be set twice.");
                  }
                  _loc4_++;
                  this.shipquality = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
