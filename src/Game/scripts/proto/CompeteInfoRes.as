package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CompeteInfoRes extends Message
   {
      
      public static const TIMEKIND:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.CompeteInfoRes.timeKind","timeKind",8 | 0,COMP_TIME_KIND);
      
      public static const NEXTSTARTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CompeteInfoRes.nextStartTime","nextStartTime",16 | 0);
      
      public static const CURSTATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.CompeteInfoRes.curStatus","curStatus",24 | 0,COMP_STATUS);
      
      public static const NEXTAVAISTATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.CompeteInfoRes.nextAvaiStatus","nextAvaiStatus",32 | 0,COMP_STATUS);
      
      public static const ISPLAYERIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.CompeteInfoRes.isPlayerIn","isPlayerIn",40 | 0);
      
      public static const PLAYERGSTAGEINDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompeteInfoRes.playerGStageIndex","playerGStageIndex",48 | 0);
      
      public static const PLAYERDISPLAYINDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompeteInfoRes.playerDisplayIndex","playerDisplayIndex",56 | 0);
      
      public static const PLAYERRANK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompeteInfoRes.playerRank","playerRank",64 | 0);
      
      public static const RANKREWARDSTATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.CompeteInfoRes.rankRewardStatus","rankRewardStatus",72 | 0,COMP_REWARD_STATUS);
      
      public static const CANGETGAMBLEREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.CompeteInfoRes.canGetGambleReward","canGetGambleReward",80 | 0);
       
      
      private var timeKind$field:int;
      
      private var hasField$0:uint = 0;
      
      private var nextStartTime$field:uint;
      
      private var curStatus$field:int;
      
      private var nextAvaiStatus$field:int;
      
      private var isPlayerIn$field:Boolean;
      
      private var playerGStageIndex$field:int;
      
      private var playerDisplayIndex$field:int;
      
      private var playerRank$field:int;
      
      private var rankRewardStatus$field:int;
      
      private var canGetGambleReward$field:Boolean;
      
      public function CompeteInfoRes()
      {
         super();
      }
      
      public function clearTimeKind() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         timeKind$field = new int();
      }
      
      public function get hasTimeKind() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set timeKind(param1:int) : void
      {
         hasField$0 = hasField$0 | 1;
         timeKind$field = param1;
      }
      
      public function get timeKind() : int
      {
         return timeKind$field;
      }
      
      public function clearNextStartTime() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         nextStartTime$field = new uint();
      }
      
      public function get hasNextStartTime() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set nextStartTime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         nextStartTime$field = param1;
      }
      
      public function get nextStartTime() : uint
      {
         return nextStartTime$field;
      }
      
      public function clearCurStatus() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         curStatus$field = new int();
      }
      
      public function get hasCurStatus() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set curStatus(param1:int) : void
      {
         hasField$0 = hasField$0 | 4;
         curStatus$field = param1;
      }
      
      public function get curStatus() : int
      {
         return curStatus$field;
      }
      
      public function clearNextAvaiStatus() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         nextAvaiStatus$field = new int();
      }
      
      public function get hasNextAvaiStatus() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set nextAvaiStatus(param1:int) : void
      {
         hasField$0 = hasField$0 | 8;
         nextAvaiStatus$field = param1;
      }
      
      public function get nextAvaiStatus() : int
      {
         return nextAvaiStatus$field;
      }
      
      public function clearIsPlayerIn() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         isPlayerIn$field = new Boolean();
      }
      
      public function get hasIsPlayerIn() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set isPlayerIn(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 16;
         isPlayerIn$field = param1;
      }
      
      public function get isPlayerIn() : Boolean
      {
         return isPlayerIn$field;
      }
      
      public function clearPlayerGStageIndex() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         playerGStageIndex$field = new int();
      }
      
      public function get hasPlayerGStageIndex() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set playerGStageIndex(param1:int) : void
      {
         hasField$0 = hasField$0 | 32;
         playerGStageIndex$field = param1;
      }
      
      public function get playerGStageIndex() : int
      {
         return playerGStageIndex$field;
      }
      
      public function clearPlayerDisplayIndex() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         playerDisplayIndex$field = new int();
      }
      
      public function get hasPlayerDisplayIndex() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set playerDisplayIndex(param1:int) : void
      {
         hasField$0 = hasField$0 | 64;
         playerDisplayIndex$field = param1;
      }
      
      public function get playerDisplayIndex() : int
      {
         return playerDisplayIndex$field;
      }
      
      public function clearPlayerRank() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         playerRank$field = new int();
      }
      
      public function get hasPlayerRank() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set playerRank(param1:int) : void
      {
         hasField$0 = hasField$0 | 128;
         playerRank$field = param1;
      }
      
      public function get playerRank() : int
      {
         return playerRank$field;
      }
      
      public function clearRankRewardStatus() : void
      {
         hasField$0 = hasField$0 & 4294967039;
         rankRewardStatus$field = new int();
      }
      
      public function get hasRankRewardStatus() : Boolean
      {
         return (hasField$0 & 256) != 0;
      }
      
      public function set rankRewardStatus(param1:int) : void
      {
         hasField$0 = hasField$0 | 256;
         rankRewardStatus$field = param1;
      }
      
      public function get rankRewardStatus() : int
      {
         return rankRewardStatus$field;
      }
      
      public function clearCanGetGambleReward() : void
      {
         hasField$0 = hasField$0 & 4294966783;
         canGetGambleReward$field = new Boolean();
      }
      
      public function get hasCanGetGambleReward() : Boolean
      {
         return (hasField$0 & 512) != 0;
      }
      
      public function set canGetGambleReward(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 512;
         canGetGambleReward$field = param1;
      }
      
      public function get canGetGambleReward() : Boolean
      {
         return canGetGambleReward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasTimeKind)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_ENUM(param1,timeKind$field);
         }
         if(hasNextStartTime)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,nextStartTime$field);
         }
         if(hasCurStatus)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_ENUM(param1,curStatus$field);
         }
         if(hasNextAvaiStatus)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_ENUM(param1,nextAvaiStatus$field);
         }
         if(hasIsPlayerIn)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_BOOL(param1,isPlayerIn$field);
         }
         if(hasPlayerGStageIndex)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_INT32(param1,playerGStageIndex$field);
         }
         if(hasPlayerDisplayIndex)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_INT32(param1,playerDisplayIndex$field);
         }
         if(hasPlayerRank)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_INT32(param1,playerRank$field);
         }
         if(hasRankRewardStatus)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_ENUM(param1,rankRewardStatus$field);
         }
         if(hasCanGetGambleReward)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_BOOL(param1,canGetGambleReward$field);
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
         var _loc13_:uint = 0;
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         var _loc12_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc5_:uint = 0;
         var _loc11_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteInfoRes.timeKind cannot be set twice.");
                  }
                  _loc13_++;
                  this.timeKind = ReadUtils.read$TYPE_ENUM(param1);
                  continue;
               case 1:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteInfoRes.nextStartTime cannot be set twice.");
                  }
                  _loc10_++;
                  this.nextStartTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteInfoRes.curStatus cannot be set twice.");
                  }
                  _loc3_++;
                  this.curStatus = ReadUtils.read$TYPE_ENUM(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteInfoRes.nextAvaiStatus cannot be set twice.");
                  }
                  _loc7_++;
                  this.nextAvaiStatus = ReadUtils.read$TYPE_ENUM(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteInfoRes.isPlayerIn cannot be set twice.");
                  }
                  _loc6_++;
                  this.isPlayerIn = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 5:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteInfoRes.playerGStageIndex cannot be set twice.");
                  }
                  _loc12_++;
                  this.playerGStageIndex = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteInfoRes.playerDisplayIndex cannot be set twice.");
                  }
                  _loc8_++;
                  this.playerDisplayIndex = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteInfoRes.playerRank cannot be set twice.");
                  }
                  _loc9_++;
                  this.playerRank = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 8:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteInfoRes.rankRewardStatus cannot be set twice.");
                  }
                  _loc5_++;
                  this.rankRewardStatus = ReadUtils.read$TYPE_ENUM(param1);
                  continue;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteInfoRes.canGetGambleReward cannot be set twice.");
                  }
                  _loc11_++;
                  this.canGetGambleReward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
