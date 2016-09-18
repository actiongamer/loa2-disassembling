package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class PlayerInfo extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PlayerInfo.id","id",8 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.PlayerInfo.name","name",16 | 2);
      
      public static const WING:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerInfo.wing","wing",24 | 0);
      
      public static const SUIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerInfo.suit","suit",32 | 0);
      
      public static const PLAYERHERO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.PlayerInfo.playerHero","playerHero",40 | 2,proto.HeroInfo);
      
      public static const MILITARYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerInfo.militaryrank","militaryrank",48 | 0);
      
      public static const FAMILYID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PlayerInfo.familyId","familyId",56 | 0);
      
      public static const FAMILYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.PlayerInfo.familyName","familyName",64 | 2);
      
      public static const HORSE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerInfo.horse","horse",72 | 0);
      
      public static const ARENARANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerInfo.arenaRank","arenaRank",80 | 0);
      
      public static const GMTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerInfo.gmType","gmType",88 | 0);
      
      public static const VIP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerInfo.vip","vip",96 | 0);
      
      public static const ARENAHISTTOPRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerInfo.arenaHistTopRank","arenaHistTopRank",104 | 0);
      
      public static const QQINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.PlayerInfo.qqInfo","qqInfo",112 | 2,proto.PlayerQQInfo);
      
      public static const SHOWTITLEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerInfo.showTitleId","showTitleId",120 | 0);
      
      public static const SUPPORT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerInfo.support","support",128 | 2,MapKey32Value32);
       
      
      public var id:UInt64;
      
      private var name$field:String;
      
      private var wing$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var suit$field:uint;
      
      private var playerHero$field:proto.HeroInfo;
      
      private var militaryrank$field:uint;
      
      private var familyId$field:UInt64;
      
      private var familyName$field:String;
      
      private var horse$field:uint;
      
      private var arenaRank$field:uint;
      
      private var gmType$field:uint;
      
      private var vip$field:uint;
      
      private var arenaHistTopRank$field:uint;
      
      private var qqInfo$field:proto.PlayerQQInfo;
      
      private var showTitleId$field:uint;
      
      public var support:Array;
      
      public function PlayerInfo()
      {
         support = [];
         super();
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
      
      public function clearWing() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         wing$field = new uint();
      }
      
      public function get hasWing() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set wing(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         wing$field = param1;
      }
      
      public function get wing() : uint
      {
         return wing$field;
      }
      
      public function clearSuit() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         suit$field = new uint();
      }
      
      public function get hasSuit() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set suit(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         suit$field = param1;
      }
      
      public function get suit() : uint
      {
         return suit$field;
      }
      
      public function clearPlayerHero() : void
      {
         playerHero$field = null;
      }
      
      public function get hasPlayerHero() : Boolean
      {
         return playerHero$field != null;
      }
      
      public function set playerHero(param1:proto.HeroInfo) : void
      {
         playerHero$field = param1;
      }
      
      public function get playerHero() : proto.HeroInfo
      {
         return playerHero$field;
      }
      
      public function clearMilitaryrank() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         militaryrank$field = new uint();
      }
      
      public function get hasMilitaryrank() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set militaryrank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         militaryrank$field = param1;
      }
      
      public function get militaryrank() : uint
      {
         return militaryrank$field;
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
      
      public function clearHorse() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         horse$field = new uint();
      }
      
      public function get hasHorse() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set horse(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         horse$field = param1;
      }
      
      public function get horse() : uint
      {
         return horse$field;
      }
      
      public function clearArenaRank() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         arenaRank$field = new uint();
      }
      
      public function get hasArenaRank() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set arenaRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         arenaRank$field = param1;
      }
      
      public function get arenaRank() : uint
      {
         return arenaRank$field;
      }
      
      public function clearGmType() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         gmType$field = new uint();
      }
      
      public function get hasGmType() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set gmType(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         gmType$field = param1;
      }
      
      public function get gmType() : uint
      {
         return gmType$field;
      }
      
      public function clearVip() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         vip$field = new uint();
      }
      
      public function get hasVip() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set vip(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         vip$field = param1;
      }
      
      public function get vip() : uint
      {
         return vip$field;
      }
      
      public function clearArenaHistTopRank() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         arenaHistTopRank$field = new uint();
      }
      
      public function get hasArenaHistTopRank() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set arenaHistTopRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         arenaHistTopRank$field = param1;
      }
      
      public function get arenaHistTopRank() : uint
      {
         return arenaHistTopRank$field;
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
      
      public function clearShowTitleId() : void
      {
         hasField$0 = hasField$0 & 4294967039;
         showTitleId$field = new uint();
      }
      
      public function get hasShowTitleId() : Boolean
      {
         return (hasField$0 & 256) != 0;
      }
      
      public function set showTitleId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 256;
         showTitleId$field = param1;
      }
      
      public function get showTitleId() : uint
      {
         return showTitleId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         if(hasName)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,name$field);
         }
         if(hasWing)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,wing$field);
         }
         if(hasSuit)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,suit$field);
         }
         if(hasPlayerHero)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,playerHero$field);
         }
         if(hasMilitaryrank)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,militaryrank$field);
         }
         if(hasFamilyId)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT64(param1,familyId$field);
         }
         if(hasFamilyName)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_STRING(param1,familyName$field);
         }
         if(hasHorse)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,horse$field);
         }
         if(hasArenaRank)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,arenaRank$field);
         }
         if(hasGmType)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,gmType$field);
         }
         if(hasVip)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,vip$field);
         }
         if(hasArenaHistTopRank)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_UINT32(param1,arenaHistTopRank$field);
         }
         if(hasQqInfo)
         {
            WriteUtils.writeTag(param1,2,14);
            WriteUtils.write$TYPE_MESSAGE(param1,qqInfo$field);
         }
         if(hasShowTitleId)
         {
            WriteUtils.writeTag(param1,0,15);
            WriteUtils.write$TYPE_UINT32(param1,showTitleId$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.support.length)
         {
            WriteUtils.writeTag(param1,2,16);
            WriteUtils.write$TYPE_MESSAGE(param1,this.support[_loc2_]);
            _loc2_++;
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
         var _loc6_:* = 0;
         var _loc17_:uint = 0;
         var _loc13_:uint = 0;
         var _loc12_:uint = 0;
         var _loc16_:uint = 0;
         var _loc11_:uint = 0;
         var _loc18_:uint = 0;
         var _loc14_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc15_:uint = 0;
         var _loc10_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerInfo.id cannot be set twice.");
                  }
                  _loc17_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerInfo.name cannot be set twice.");
                  }
                  _loc13_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerInfo.wing cannot be set twice.");
                  }
                  _loc12_++;
                  this.wing = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerInfo.suit cannot be set twice.");
                  }
                  _loc16_++;
                  this.suit = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerInfo.playerHero cannot be set twice.");
                  }
                  _loc11_++;
                  this.playerHero = new proto.HeroInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.playerHero);
                  continue;
               case 5:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerInfo.militaryrank cannot be set twice.");
                  }
                  _loc18_++;
                  this.militaryrank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerInfo.familyId cannot be set twice.");
                  }
                  _loc14_++;
                  this.familyId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 7:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerInfo.familyName cannot be set twice.");
                  }
                  _loc3_++;
                  this.familyName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 8:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerInfo.horse cannot be set twice.");
                  }
                  _loc7_++;
                  this.horse = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerInfo.arenaRank cannot be set twice.");
                  }
                  _loc15_++;
                  this.arenaRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 10:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerInfo.gmType cannot be set twice.");
                  }
                  _loc10_++;
                  this.gmType = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 11:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerInfo.vip cannot be set twice.");
                  }
                  _loc4_++;
                  this.vip = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 12:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerInfo.arenaHistTopRank cannot be set twice.");
                  }
                  _loc5_++;
                  this.arenaHistTopRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 13:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerInfo.qqInfo cannot be set twice.");
                  }
                  _loc9_++;
                  this.qqInfo = new proto.PlayerQQInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.qqInfo);
                  continue;
               case 14:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerInfo.showTitleId cannot be set twice.");
                  }
                  _loc8_++;
                  this.showTitleId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 15:
                  this.support.push(ReadUtils.read$TYPE_MESSAGE(param1,new MapKey32Value32()));
                  continue;
            }
         }
      }
   }
}
