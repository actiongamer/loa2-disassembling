package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TeamBasicInfo extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.TeamBasicInfo.id","id",8 | 0);
      
      public static const LV:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamBasicInfo.lv","lv",16 | 0);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamBasicInfo.count","count",24 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.TeamBasicInfo.name","name",32 | 2);
      
      public static const PWD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.TeamBasicInfo.pwd","pwd",40 | 0);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamBasicInfo.kind","kind",48 | 0);
      
      public static const NPCID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamBasicInfo.npcId","npcId",56 | 0);
      
      public static const SETTING:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.TeamBasicInfo.setting","setting",64 | 2,proto.TeamSetting);
      
      public static const LEADERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.TeamBasicInfo.leaderId","leaderId",72 | 0);
       
      
      public var id:UInt64;
      
      private var lv$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var count$field:uint;
      
      private var name$field:String;
      
      private var pwd$field:Boolean;
      
      private var kind$field:uint;
      
      private var npcId$field:uint;
      
      private var setting$field:proto.TeamSetting;
      
      private var leaderId$field:UInt64;
      
      public function TeamBasicInfo()
      {
         super();
      }
      
      public function clearLv() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         lv$field = new uint();
      }
      
      public function get hasLv() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set lv(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         lv$field = param1;
      }
      
      public function get lv() : uint
      {
         return lv$field;
      }
      
      public function clearCount() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         count$field = new uint();
      }
      
      public function get hasCount() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set count(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         count$field = param1;
      }
      
      public function get count() : uint
      {
         return count$field;
      }
      
      public function clearName() : void
      {
         name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         name$field = param1;
      }
      
      public function get name() : String
      {
         return name$field;
      }
      
      public function clearPwd() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         pwd$field = new Boolean();
      }
      
      public function get hasPwd() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set pwd(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 4;
         pwd$field = param1;
      }
      
      public function get pwd() : Boolean
      {
         return pwd$field;
      }
      
      public function clearKind() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         kind$field = new uint();
      }
      
      public function get hasKind() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set kind(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         kind$field = param1;
      }
      
      public function get kind() : uint
      {
         return kind$field;
      }
      
      public function clearNpcId() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         npcId$field = new uint();
      }
      
      public function get hasNpcId() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set npcId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         npcId$field = param1;
      }
      
      public function get npcId() : uint
      {
         return npcId$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         if(hasLv)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,lv$field);
         }
         if(hasCount)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,count$field);
         }
         if(hasName)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,name$field);
         }
         if(hasPwd)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_BOOL(param1,pwd$field);
         }
         if(hasKind)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,kind$field);
         }
         if(hasNpcId)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,npcId$field);
         }
         if(hasSetting)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_MESSAGE(param1,setting$field);
         }
         if(hasLeaderId)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT64(param1,leaderId$field);
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
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc8_:uint = 0;
         var _loc4_:uint = 0;
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc12_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: TeamBasicInfo.id cannot be set twice.");
                  }
                  _loc10_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: TeamBasicInfo.lv cannot be set twice.");
                  }
                  _loc11_++;
                  this.lv = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: TeamBasicInfo.count cannot be set twice.");
                  }
                  _loc8_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: TeamBasicInfo.name cannot be set twice.");
                  }
                  _loc4_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: TeamBasicInfo.pwd cannot be set twice.");
                  }
                  _loc9_++;
                  this.pwd = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: TeamBasicInfo.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: TeamBasicInfo.npcId cannot be set twice.");
                  }
                  _loc7_++;
                  this.npcId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: TeamBasicInfo.setting cannot be set twice.");
                  }
                  _loc12_++;
                  this.setting = new proto.TeamSetting();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.setting);
                  continue;
               case 8:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: TeamBasicInfo.leaderId cannot be set twice.");
                  }
                  _loc6_++;
                  this.leaderId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
