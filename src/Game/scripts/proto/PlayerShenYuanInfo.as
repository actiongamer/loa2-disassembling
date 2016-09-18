package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class PlayerShenYuanInfo extends Message
   {
      
      public static const UID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PlayerShenYuanInfo.uid","uid",8 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.PlayerShenYuanInfo.name","name",16 | 2);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerShenYuanInfo.rank","rank",24 | 0);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerShenYuanInfo.level","level",32 | 0);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PlayerShenYuanInfo.ability","ability",40 | 0);
      
      public static const FAMILYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.PlayerShenYuanInfo.familyName","familyName",48 | 2);
      
      public static const STCNPCID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerShenYuanInfo.stcNpcId","stcNpcId",56 | 0);
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerShenYuanInfo.star","star",64 | 0);
      
      public static const HUIZHANG:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerShenYuanInfo.huizhang","huizhang",72 | 0);
       
      
      private var uid$field:UInt64;
      
      private var name$field:String;
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var level$field:uint;
      
      private var ability$field:UInt64;
      
      private var familyName$field:String;
      
      private var stcNpcId$field:uint;
      
      private var star$field:uint;
      
      private var huizhang$field:uint;
      
      public function PlayerShenYuanInfo()
      {
         super();
      }
      
      public function clearUid() : void
      {
         uid$field = null;
      }
      
      public function get hasUid() : Boolean
      {
         return uid$field != null;
      }
      
      public function set uid(param1:UInt64) : void
      {
         uid$field = param1;
      }
      
      public function get uid() : UInt64
      {
         return uid$field;
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
      
      public function clearRank() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return rank$field;
      }
      
      public function clearLevel() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         level$field = param1;
      }
      
      public function get level() : uint
      {
         return level$field;
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
      
      public function clearStcNpcId() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         stcNpcId$field = new uint();
      }
      
      public function get hasStcNpcId() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set stcNpcId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         stcNpcId$field = param1;
      }
      
      public function get stcNpcId() : uint
      {
         return stcNpcId$field;
      }
      
      public function clearStar() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         star$field = new uint();
      }
      
      public function get hasStar() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set star(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         star$field = param1;
      }
      
      public function get star() : uint
      {
         return star$field;
      }
      
      public function clearHuizhang() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         huizhang$field = new uint();
      }
      
      public function get hasHuizhang() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set huizhang(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         huizhang$field = param1;
      }
      
      public function get huizhang() : uint
      {
         return huizhang$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasUid)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT64(param1,uid$field);
         }
         if(hasName)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,name$field);
         }
         if(hasRank)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,rank$field);
         }
         if(hasLevel)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,level$field);
         }
         if(hasAbility)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT64(param1,ability$field);
         }
         if(hasFamilyName)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,familyName$field);
         }
         if(hasStcNpcId)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,stcNpcId$field);
         }
         if(hasStar)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,star$field);
         }
         if(hasHuizhang)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,huizhang$field);
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
         var _loc9_:* = 0;
         var _loc8_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc7_:uint = 0;
         var _loc10_:uint = 0;
         var _loc4_:uint = 0;
         var _loc12_:uint = 0;
         var _loc11_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc9_ >> 3) - 1)
            {
               case 0:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerShenYuanInfo.uid cannot be set twice.");
                  }
                  _loc8_++;
                  this.uid = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerShenYuanInfo.name cannot be set twice.");
                  }
                  _loc6_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerShenYuanInfo.rank cannot be set twice.");
                  }
                  _loc5_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerShenYuanInfo.level cannot be set twice.");
                  }
                  _loc7_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerShenYuanInfo.ability cannot be set twice.");
                  }
                  _loc10_++;
                  this.ability = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 5:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerShenYuanInfo.familyName cannot be set twice.");
                  }
                  _loc4_++;
                  this.familyName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerShenYuanInfo.stcNpcId cannot be set twice.");
                  }
                  _loc12_++;
                  this.stcNpcId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerShenYuanInfo.star cannot be set twice.");
                  }
                  _loc11_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerShenYuanInfo.huizhang cannot be set twice.");
                  }
                  _loc3_++;
                  this.huizhang = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
