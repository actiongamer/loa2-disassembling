package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyExpeCrossRankInfo extends Message
   {
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeCrossRankInfo.rank","rank",8 | 0);
      
      public static const FAMILYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeCrossRankInfo.familyName","familyName",16 | 2);
      
      public static const FAMILYDIST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeCrossRankInfo.familyDist","familyDist",24 | 0);
      
      public static const FAMILYABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FamilyExpeCrossRankInfo.familyAbility","familyAbility",32 | 0);
      
      public static const WINTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeCrossRankInfo.winTimes","winTimes",40 | 0);
      
      public static const REPUTATION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeCrossRankInfo.reputation","reputation",48 | 0);
      
      public static const LEADER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeCrossRankInfo.leader","leader",56 | 2,proto.PlayerBaseInfo);
      
      public static const DISTNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeCrossRankInfo.distName","distName",64 | 2);
      
      public static const OPNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeCrossRankInfo.opName","opName",72 | 2);
       
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var familyName$field:String;
      
      private var familyDist$field:uint;
      
      private var familyAbility$field:UInt64;
      
      private var winTimes$field:uint;
      
      private var reputation$field:uint;
      
      private var leader$field:proto.PlayerBaseInfo;
      
      private var distName$field:String;
      
      private var opName$field:String;
      
      public function FamilyExpeCrossRankInfo()
      {
         super();
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
      
      public function clearFamilyDist() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         familyDist$field = new uint();
      }
      
      public function get hasFamilyDist() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set familyDist(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         familyDist$field = param1;
      }
      
      public function get familyDist() : uint
      {
         return familyDist$field;
      }
      
      public function clearFamilyAbility() : void
      {
         familyAbility$field = null;
      }
      
      public function get hasFamilyAbility() : Boolean
      {
         return familyAbility$field != null;
      }
      
      public function set familyAbility(param1:UInt64) : void
      {
         familyAbility$field = param1;
      }
      
      public function get familyAbility() : UInt64
      {
         return familyAbility$field;
      }
      
      public function clearWinTimes() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         winTimes$field = new uint();
      }
      
      public function get hasWinTimes() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set winTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         winTimes$field = param1;
      }
      
      public function get winTimes() : uint
      {
         return winTimes$field;
      }
      
      public function clearReputation() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         reputation$field = new uint();
      }
      
      public function get hasReputation() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set reputation(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         reputation$field = param1;
      }
      
      public function get reputation() : uint
      {
         return reputation$field;
      }
      
      public function clearLeader() : void
      {
         leader$field = null;
      }
      
      public function get hasLeader() : Boolean
      {
         return leader$field != null;
      }
      
      public function set leader(param1:proto.PlayerBaseInfo) : void
      {
         leader$field = param1;
      }
      
      public function get leader() : proto.PlayerBaseInfo
      {
         return leader$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasRank)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,rank$field);
         }
         if(hasFamilyName)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,familyName$field);
         }
         if(hasFamilyDist)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,familyDist$field);
         }
         if(hasFamilyAbility)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT64(param1,familyAbility$field);
         }
         if(hasWinTimes)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,winTimes$field);
         }
         if(hasReputation)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,reputation$field);
         }
         if(hasLeader)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,leader$field);
         }
         if(hasDistName)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_STRING(param1,distName$field);
         }
         if(hasOpName)
         {
            WriteUtils.writeTag(param1,2,9);
            WriteUtils.write$TYPE_STRING(param1,opName$field);
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
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc12_:uint = 0;
         var _loc6_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeCrossRankInfo.rank cannot be set twice.");
                  }
                  _loc4_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeCrossRankInfo.familyName cannot be set twice.");
                  }
                  _loc3_++;
                  this.familyName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeCrossRankInfo.familyDist cannot be set twice.");
                  }
                  _loc7_++;
                  this.familyDist = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeCrossRankInfo.familyAbility cannot be set twice.");
                  }
                  _loc12_++;
                  this.familyAbility = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeCrossRankInfo.winTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.winTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeCrossRankInfo.reputation cannot be set twice.");
                  }
                  _loc10_++;
                  this.reputation = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeCrossRankInfo.leader cannot be set twice.");
                  }
                  _loc11_++;
                  this.leader = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.leader);
                  continue;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeCrossRankInfo.distName cannot be set twice.");
                  }
                  _loc9_++;
                  this.distName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 8:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeCrossRankInfo.opName cannot be set twice.");
                  }
                  _loc8_++;
                  this.opName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
