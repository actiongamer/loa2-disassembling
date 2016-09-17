package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyInfo extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FamilyInfo.id","id",8 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyInfo.name","name",16 | 2);
      
      public static const LV:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyInfo.lv","lv",24 | 0);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyInfo.exp","exp",32 | 0);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyInfo.count","count",40 | 0);
      
      public static const LEADER:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyInfo.leader","leader",48 | 2);
      
      public static const FUND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyInfo.fund","fund",56 | 0);
      
      public static const INNOTICE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyInfo.inNotice","inNotice",72 | 2);
      
      public static const OUTNOTICE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyInfo.outNotice","outNotice",80 | 2);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyInfo.rank","rank",88 | 0);
      
      public static const INVITE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FamilyInfo.invite","invite",96 | 0);
      
      public static const MAX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyInfo.max","max",104 | 0);
      
      public static const FLAGICON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyInfo.flagIcon","flagIcon",112 | 0);
      
      public static const FLAGBASE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyInfo.flagBase","flagBase",120 | 0);
      
      public static const LEADERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FamilyInfo.leaderId","leaderId",128 | 0);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyInfo.ability","ability",136 | 0);
      
      public static const LEVELUP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FamilyInfo.levelUp","levelUp",144 | 0);
       
      
      public var id:UInt64;
      
      public var name:String;
      
      public var lv:uint;
      
      private var exp$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var count:uint;
      
      public var leader:String;
      
      private var fund$field:uint;
      
      private var inNotice$field:String;
      
      private var outNotice$field:String;
      
      private var rank$field:uint;
      
      private var invite$field:Boolean;
      
      public var max:uint;
      
      private var flagIcon$field:uint;
      
      private var flagBase$field:uint;
      
      private var leaderId$field:UInt64;
      
      private var ability$field:uint;
      
      private var levelUp$field:Boolean;
      
      public function FamilyInfo()
      {
         super();
      }
      
      public function clearExp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         exp$field = new uint();
      }
      
      public function get hasExp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set exp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         exp$field = param1;
      }
      
      public function get exp() : uint
      {
         return exp$field;
      }
      
      public function clearFund() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         fund$field = new uint();
      }
      
      public function get hasFund() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set fund(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         fund$field = param1;
      }
      
      public function get fund() : uint
      {
         return fund$field;
      }
      
      public function clearInNotice() : void
      {
         inNotice$field = null;
      }
      
      public function get hasInNotice() : Boolean
      {
         return inNotice$field != null;
      }
      
      public function set inNotice(param1:String) : void
      {
         inNotice$field = param1;
      }
      
      public function get inNotice() : String
      {
         return inNotice$field;
      }
      
      public function clearOutNotice() : void
      {
         outNotice$field = null;
      }
      
      public function get hasOutNotice() : Boolean
      {
         return outNotice$field != null;
      }
      
      public function set outNotice(param1:String) : void
      {
         outNotice$field = param1;
      }
      
      public function get outNotice() : String
      {
         return outNotice$field;
      }
      
      public function clearRank() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return rank$field;
      }
      
      public function clearInvite() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         invite$field = new Boolean();
      }
      
      public function get hasInvite() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set invite(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 8;
         invite$field = param1;
      }
      
      public function get invite() : Boolean
      {
         return invite$field;
      }
      
      public function clearFlagIcon() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         flagIcon$field = new uint();
      }
      
      public function get hasFlagIcon() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set flagIcon(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         flagIcon$field = param1;
      }
      
      public function get flagIcon() : uint
      {
         return flagIcon$field;
      }
      
      public function clearFlagBase() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         flagBase$field = new uint();
      }
      
      public function get hasFlagBase() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set flagBase(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         flagBase$field = param1;
      }
      
      public function get flagBase() : uint
      {
         return flagBase$field;
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
      
      public function clearAbility() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         ability$field = new uint();
      }
      
      public function get hasAbility() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set ability(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         ability$field = param1;
      }
      
      public function get ability() : uint
      {
         return ability$field;
      }
      
      public function clearLevelUp() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         levelUp$field = new Boolean();
      }
      
      public function get hasLevelUp() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set levelUp(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 128;
         levelUp$field = param1;
      }
      
      public function get levelUp() : Boolean
      {
         return levelUp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.lv);
         if(hasExp)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,exp$field);
         }
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.count);
         WriteUtils.writeTag(param1,2,6);
         WriteUtils.write$TYPE_STRING(param1,this.leader);
         if(hasFund)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,fund$field);
         }
         if(hasInNotice)
         {
            WriteUtils.writeTag(param1,2,9);
            WriteUtils.write$TYPE_STRING(param1,inNotice$field);
         }
         if(hasOutNotice)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_STRING(param1,outNotice$field);
         }
         if(hasRank)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,rank$field);
         }
         if(hasInvite)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_BOOL(param1,invite$field);
         }
         WriteUtils.writeTag(param1,0,13);
         WriteUtils.write$TYPE_UINT32(param1,this.max);
         if(hasFlagIcon)
         {
            WriteUtils.writeTag(param1,0,14);
            WriteUtils.write$TYPE_UINT32(param1,flagIcon$field);
         }
         if(hasFlagBase)
         {
            WriteUtils.writeTag(param1,0,15);
            WriteUtils.write$TYPE_UINT32(param1,flagBase$field);
         }
         if(hasLeaderId)
         {
            WriteUtils.writeTag(param1,0,16);
            WriteUtils.write$TYPE_UINT64(param1,leaderId$field);
         }
         if(hasAbility)
         {
            WriteUtils.writeTag(param1,0,17);
            WriteUtils.write$TYPE_UINT32(param1,ability$field);
         }
         if(hasLevelUp)
         {
            WriteUtils.writeTag(param1,0,18);
            WriteUtils.write$TYPE_BOOL(param1,levelUp$field);
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
         var _loc18_:uint = 0;
         var _loc13_:uint = 0;
         var _loc11_:uint = 0;
         var _loc9_:uint = 0;
         var _loc5_:uint = 0;
         var _loc19_:uint = 0;
         var _loc14_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc15_:uint = 0;
         var _loc10_:uint = 0;
         var _loc20_:uint = 0;
         var _loc3_:uint = 0;
         var _loc17_:uint = 0;
         var _loc16_:uint = 0;
         var _loc8_:uint = 0;
         var _loc12_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.id cannot be set twice.");
                  }
                  _loc18_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.name cannot be set twice.");
                  }
                  _loc13_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.lv cannot be set twice.");
                  }
                  _loc11_++;
                  this.lv = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.exp cannot be set twice.");
                  }
                  _loc9_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.count cannot be set twice.");
                  }
                  _loc5_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.leader cannot be set twice.");
                  }
                  _loc19_++;
                  this.leader = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.fund cannot be set twice.");
                  }
                  _loc14_++;
                  this.fund = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               default:
                  super.readUnknown(param1,_loc4_);
                  continue;
               case 8:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.inNotice cannot be set twice.");
                  }
                  _loc6_++;
                  this.inNotice = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 9:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.outNotice cannot be set twice.");
                  }
                  _loc7_++;
                  this.outNotice = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 10:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.rank cannot be set twice.");
                  }
                  _loc15_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 11:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.invite cannot be set twice.");
                  }
                  _loc10_++;
                  this.invite = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 12:
                  if(_loc20_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.max cannot be set twice.");
                  }
                  _loc20_++;
                  this.max = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 13:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.flagIcon cannot be set twice.");
                  }
                  _loc3_++;
                  this.flagIcon = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 14:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.flagBase cannot be set twice.");
                  }
                  _loc17_++;
                  this.flagBase = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 15:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.leaderId cannot be set twice.");
                  }
                  _loc16_++;
                  this.leaderId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 16:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.ability cannot be set twice.");
                  }
                  _loc8_++;
                  this.ability = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 17:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfo.levelUp cannot be set twice.");
                  }
                  _loc12_++;
                  this.levelUp = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
