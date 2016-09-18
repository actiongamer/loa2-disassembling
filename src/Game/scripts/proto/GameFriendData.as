package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GameFriendData extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.GameFriendData.id","id",8 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.GameFriendData.name","name",16 | 2);
      
      public static const SIGNATUE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.GameFriendData.signatue","signatue",24 | 2);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GameFriendData.level","level",32 | 0);
      
      public static const OFFTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GameFriendData.offtime","offtime",40 | 0);
      
      public static const BASEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GameFriendData.baseid","baseid",48 | 0);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.GameFriendData.ability","ability",56 | 0);
      
      public static const QQINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GameFriendData.qqInfo","qqInfo",72 | 2,proto.PlayerQQInfo);
      
      public static const ACCOUNT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.GameFriendData.account","account",80 | 2);
       
      
      public var gmType:int;
      
      public var id:UInt64;
      
      public var name:String;
      
      private var signatue$field:String;
      
      private var level$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var offtime$field:uint;
      
      private var baseid$field:uint;
      
      private var ability$field:UInt64;
      
      private var qqInfo$field:proto.PlayerQQInfo;
      
      private var account$field:String;
      
      public function GameFriendData()
      {
         super();
      }
      
      public function clearSignatue() : void
      {
         signatue$field = null;
      }
      
      public function get hasSignatue() : Boolean
      {
         return signatue$field != null;
      }
      
      public function set signatue(param1:String) : void
      {
         signatue$field = param1;
      }
      
      public function get signatue() : String
      {
         return signatue$field;
      }
      
      public function clearLevel() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         level$field = param1;
      }
      
      public function get level() : uint
      {
         return level$field;
      }
      
      public function clearOfftime() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         offtime$field = new uint();
      }
      
      public function get hasOfftime() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set offtime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         offtime$field = param1;
      }
      
      public function get offtime() : uint
      {
         return offtime$field;
      }
      
      public function clearBaseid() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         baseid$field = new uint();
      }
      
      public function get hasBaseid() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set baseid(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         baseid$field = param1;
      }
      
      public function get baseid() : uint
      {
         return baseid$field;
      }
      
      public function clearAbility() : void
      {
         ability$field = null;
      }
      
      public function get hasAbility() : Boolean
      {
         return ability$field != null;
      }
      
      public function set ability(param1:UInt64) : void
      {
         ability$field = param1;
      }
      
      public function get ability() : UInt64
      {
         return ability$field;
      }
      
      public function clearQqInfo() : void
      {
         qqInfo$field = null;
      }
      
      public function get hasQqInfo() : Boolean
      {
         return qqInfo$field != null;
      }
      
      public function set qqInfo(param1:proto.PlayerQQInfo) : void
      {
         qqInfo$field = param1;
      }
      
      public function get qqInfo() : proto.PlayerQQInfo
      {
         return qqInfo$field;
      }
      
      public function clearAccount() : void
      {
         account$field = null;
      }
      
      public function get hasAccount() : Boolean
      {
         return account$field != null;
      }
      
      public function set account(param1:String) : void
      {
         account$field = param1;
      }
      
      public function get account() : String
      {
         return account$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         if(hasSignatue)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,signatue$field);
         }
         if(hasLevel)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,level$field);
         }
         if(hasOfftime)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,offtime$field);
         }
         if(hasBaseid)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,baseid$field);
         }
         if(hasAbility)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT64(param1,ability$field);
         }
         if(hasQqInfo)
         {
            WriteUtils.writeTag(param1,2,9);
            WriteUtils.write$TYPE_MESSAGE(param1,qqInfo$field);
         }
         if(hasAccount)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_STRING(param1,account$field);
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
         var _loc6_:* = 0;
         var _loc11_:uint = 0;
         var _loc3_:uint = 0;
         var _loc10_:uint = 0;
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         var _loc12_:uint = 0;
         var _loc9_:uint = 0;
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: GameFriendData.id cannot be set twice.");
                  }
                  _loc11_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: GameFriendData.name cannot be set twice.");
                  }
                  _loc3_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: GameFriendData.signatue cannot be set twice.");
                  }
                  _loc10_++;
                  this.signatue = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GameFriendData.level cannot be set twice.");
                  }
                  _loc4_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: GameFriendData.offtime cannot be set twice.");
                  }
                  _loc8_++;
                  this.offtime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: GameFriendData.baseid cannot be set twice.");
                  }
                  _loc12_++;
                  this.baseid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: GameFriendData.ability cannot be set twice.");
                  }
                  _loc9_++;
                  this.ability = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               default:
                  super.readUnknown(param1,_loc6_);
                  continue;
               case 8:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: GameFriendData.qqInfo cannot be set twice.");
                  }
                  _loc7_++;
                  this.qqInfo = new proto.PlayerQQInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.qqInfo);
                  continue;
               case 9:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: GameFriendData.account cannot be set twice.");
                  }
                  _loc5_++;
                  this.account = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
