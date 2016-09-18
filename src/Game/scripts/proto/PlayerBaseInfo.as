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
   
   public class PlayerBaseInfo extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PlayerBaseInfo.id","id",8 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.PlayerBaseInfo.name","name",16 | 2);
      
      public static const VIP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerBaseInfo.vip","vip",24 | 0);
      
      public static const MILITARYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerBaseInfo.militaryRank","militaryRank",32 | 0);
      
      public static const NPCID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerBaseInfo.npcId","npcId",40 | 0);
      
      public static const LV:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerBaseInfo.lv","lv",48 | 0);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PlayerBaseInfo.ability","ability",56 | 0);
      
      public static const WING:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerBaseInfo.wing","wing",64 | 0);
      
      public static const CLOTHES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerBaseInfo.clothes","clothes",72 | 0);
      
      public static const HORSE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerBaseInfo.horse","horse",80 | 0);
      
      public static const FAMILYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.PlayerBaseInfo.familyName","familyName",88 | 2);
      
      public static const DIST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerBaseInfo.dist","dist",96 | 0);
      
      public static const GMTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerBaseInfo.gmType","gmType",104 | 0);
      
      public static const DISTNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.PlayerBaseInfo.distName","distName",112 | 2);
      
      public static const OPNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.PlayerBaseInfo.opName","opName",120 | 2);
      
      public static const QQINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.PlayerBaseInfo.qqInfo","qqInfo",128 | 2,proto.PlayerQQInfo);
      
      public static const FAMILYID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PlayerBaseInfo.familyId","familyId",144 | 0);
       
      
      public var playId:String;
      
      public var playerIP:String;
      
      private var id$field:UInt64;
      
      private var name$field:String;
      
      private var vip$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var militaryRank$field:uint;
      
      private var npcId$field:uint;
      
      private var lv$field:uint;
      
      private var ability$field:UInt64;
      
      private var wing$field:uint;
      
      private var clothes$field:uint;
      
      private var horse$field:uint;
      
      private var familyName$field:String;
      
      private var dist$field:uint;
      
      private var gmType$field:uint;
      
      private var distName$field:String;
      
      private var opName$field:String;
      
      private var qqInfo$field:proto.PlayerQQInfo;
      
      private var familyId$field:UInt64;
      
      public function PlayerBaseInfo()
      {
         super();
      }
      
      public function clearId() : void
      {
         id$field = null;
      }
      
      public function get hasId() : Boolean
      {
         return id$field != null;
      }
      
      public function set id(param1:UInt64) : void
      {
         id$field = param1;
      }
      
      public function get id() : UInt64
      {
         return id$field;
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
      
      public function clearVip() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         vip$field = new uint();
      }
      
      public function get hasVip() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set vip(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         vip$field = param1;
      }
      
      public function get vip() : uint
      {
         return vip$field;
      }
      
      public function clearMilitaryRank() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         militaryRank$field = new uint();
      }
      
      public function get hasMilitaryRank() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set militaryRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         militaryRank$field = param1;
      }
      
      public function get militaryRank() : uint
      {
         return militaryRank$field;
      }
      
      public function clearNpcId() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         npcId$field = new uint();
      }
      
      public function get hasNpcId() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set npcId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         npcId$field = param1;
      }
      
      public function get npcId() : uint
      {
         return npcId$field;
      }
      
      public function clearLv() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         lv$field = new uint();
      }
      
      public function get hasLv() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set lv(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         lv$field = param1;
      }
      
      public function get lv() : uint
      {
         return lv$field;
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
      
      public function clearWing() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         wing$field = new uint();
      }
      
      public function get hasWing() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set wing(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         wing$field = param1;
      }
      
      public function get wing() : uint
      {
         return wing$field;
      }
      
      public function clearClothes() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         clothes$field = new uint();
      }
      
      public function get hasClothes() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set clothes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         clothes$field = param1;
      }
      
      public function get clothes() : uint
      {
         return clothes$field;
      }
      
      public function clearHorse() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         horse$field = new uint();
      }
      
      public function get hasHorse() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set horse(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         horse$field = param1;
      }
      
      public function get horse() : uint
      {
         return horse$field;
      }
      
      public function clearFamilyName() : void
      {
         familyName$field = null;
      }
      
      public function get hasFamilyName() : Boolean
      {
         return familyName$field != null;
      }
      
      public function set familyName(param1:String) : void
      {
         familyName$field = param1;
      }
      
      public function get familyName() : String
      {
         return familyName$field;
      }
      
      public function clearDist() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         dist$field = new uint();
      }
      
      public function get hasDist() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set dist(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         dist$field = param1;
      }
      
      public function get dist() : uint
      {
         return dist$field;
      }
      
      public function clearGmType() : void
      {
         hasField$0 = hasField$0 & 4294967039;
         gmType$field = new uint();
      }
      
      public function get hasGmType() : Boolean
      {
         return (hasField$0 & 256) != 0;
      }
      
      public function set gmType(param1:uint) : void
      {
         hasField$0 = hasField$0 | 256;
         gmType$field = param1;
      }
      
      public function get gmType() : uint
      {
         return gmType$field;
      }
      
      public function clearDistName() : void
      {
         distName$field = null;
      }
      
      public function get hasDistName() : Boolean
      {
         return distName$field != null;
      }
      
      public function set distName(param1:String) : void
      {
         distName$field = param1;
      }
      
      public function get distName() : String
      {
         return distName$field;
      }
      
      public function clearOpName() : void
      {
         opName$field = null;
      }
      
      public function get hasOpName() : Boolean
      {
         return opName$field != null;
      }
      
      public function set opName(param1:String) : void
      {
         opName$field = param1;
      }
      
      public function get opName() : String
      {
         return opName$field;
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
      
      public function clearFamilyId() : void
      {
         familyId$field = null;
      }
      
      public function get hasFamilyId() : Boolean
      {
         return familyId$field != null;
      }
      
      public function set familyId(param1:UInt64) : void
      {
         familyId$field = param1;
      }
      
      public function get familyId() : UInt64
      {
         return familyId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT64(param1,id$field);
         }
         if(hasName)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,name$field);
         }
         if(hasVip)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,vip$field);
         }
         if(hasMilitaryRank)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,militaryRank$field);
         }
         if(hasNpcId)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,npcId$field);
         }
         if(hasLv)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,lv$field);
         }
         if(hasAbility)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT64(param1,ability$field);
         }
         if(hasWing)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,wing$field);
         }
         if(hasClothes)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,clothes$field);
         }
         if(hasHorse)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,horse$field);
         }
         if(hasFamilyName)
         {
            WriteUtils.writeTag(param1,2,11);
            WriteUtils.write$TYPE_STRING(param1,familyName$field);
         }
         if(hasDist)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,dist$field);
         }
         if(hasGmType)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_UINT32(param1,gmType$field);
         }
         if(hasDistName)
         {
            WriteUtils.writeTag(param1,2,14);
            WriteUtils.write$TYPE_STRING(param1,distName$field);
         }
         if(hasOpName)
         {
            WriteUtils.writeTag(param1,2,15);
            WriteUtils.write$TYPE_STRING(param1,opName$field);
         }
         if(hasQqInfo)
         {
            WriteUtils.writeTag(param1,2,16);
            WriteUtils.write$TYPE_MESSAGE(param1,qqInfo$field);
         }
         if(hasFamilyId)
         {
            WriteUtils.writeTag(param1,0,18);
            WriteUtils.write$TYPE_UINT64(param1,familyId$field);
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
         var _loc19_:uint = 0;
         var _loc14_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         var _loc16_:uint = 0;
         var _loc12_:uint = 0;
         var _loc11_:uint = 0;
         var _loc13_:uint = 0;
         var _loc5_:uint = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc17_:uint = 0;
         var _loc10_:uint = 0;
         var _loc20_:uint = 0;
         var _loc18_:uint = 0;
         var _loc9_:uint = 0;
         var _loc15_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.id cannot be set twice.");
                  }
                  _loc19_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.name cannot be set twice.");
                  }
                  _loc14_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.vip cannot be set twice.");
                  }
                  _loc4_++;
                  this.vip = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.militaryRank cannot be set twice.");
                  }
                  _loc7_++;
                  this.militaryRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.npcId cannot be set twice.");
                  }
                  _loc16_++;
                  this.npcId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.lv cannot be set twice.");
                  }
                  _loc12_++;
                  this.lv = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.ability cannot be set twice.");
                  }
                  _loc11_++;
                  this.ability = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 7:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.wing cannot be set twice.");
                  }
                  _loc13_++;
                  this.wing = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.clothes cannot be set twice.");
                  }
                  _loc5_++;
                  this.clothes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.horse cannot be set twice.");
                  }
                  _loc8_++;
                  this.horse = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 10:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.familyName cannot be set twice.");
                  }
                  _loc3_++;
                  this.familyName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 11:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.dist cannot be set twice.");
                  }
                  _loc17_++;
                  this.dist = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 12:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.gmType cannot be set twice.");
                  }
                  _loc10_++;
                  this.gmType = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 13:
                  if(_loc20_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.distName cannot be set twice.");
                  }
                  _loc20_++;
                  this.distName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 14:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.opName cannot be set twice.");
                  }
                  _loc18_++;
                  this.opName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 15:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.qqInfo cannot be set twice.");
                  }
                  _loc9_++;
                  this.qqInfo = new proto.PlayerQQInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.qqInfo);
                  continue;
               default:
                  super.readUnknown(param1,_loc6_);
                  continue;
               case 17:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerBaseInfo.familyId cannot be set twice.");
                  }
                  _loc15_++;
                  this.familyId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
