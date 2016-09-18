package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CompeteGambleInfo extends Message
   {
      
      public static const GSTAGEINDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompeteGambleInfo.gStageIndex","gStageIndex",8 | 0);
      
      public static const FRONTSTAGEINDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompeteGambleInfo.frontStageIndex","frontStageIndex",16 | 0);
      
      public static const STATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.CompeteGambleInfo.status","status",24 | 0,COMP_STATUS);
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.CompeteGambleInfo.playerId","playerId",32 | 0);
      
      public static const PLAYERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CompeteGambleInfo.playerName","playerName",40 | 2);
      
      public static const GAMBLEDIAMOND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CompeteGambleInfo.gambleDiamond","gambleDiamond",48 | 0);
      
      public static const REWARDSTATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.CompeteGambleInfo.rewardStatus","rewardStatus",56 | 0,COMP_REWARD_STATUS);
      
      public static const REWARDDIAMOND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CompeteGambleInfo.rewardDiamond","rewardDiamond",64 | 0);
       
      
      private var gStageIndex$field:int;
      
      private var hasField$0:uint = 0;
      
      private var frontStageIndex$field:int;
      
      private var status$field:int;
      
      private var playerId$field:UInt64;
      
      private var playerName$field:String;
      
      private var gambleDiamond$field:uint;
      
      private var rewardStatus$field:int;
      
      private var rewardDiamond$field:uint;
      
      public function CompeteGambleInfo()
      {
         super();
      }
      
      public function clearGStageIndex() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         gStageIndex$field = new int();
      }
      
      public function get hasGStageIndex() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set gStageIndex(param1:int) : void
      {
         hasField$0 = hasField$0 | 1;
         gStageIndex$field = param1;
      }
      
      public function get gStageIndex() : int
      {
         return gStageIndex$field;
      }
      
      public function clearFrontStageIndex() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         frontStageIndex$field = new int();
      }
      
      public function get hasFrontStageIndex() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set frontStageIndex(param1:int) : void
      {
         hasField$0 = hasField$0 | 2;
         frontStageIndex$field = param1;
      }
      
      public function get frontStageIndex() : int
      {
         return frontStageIndex$field;
      }
      
      public function clearStatus() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         status$field = new int();
      }
      
      public function get hasStatus() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set status(param1:int) : void
      {
         hasField$0 = hasField$0 | 4;
         status$field = param1;
      }
      
      public function get status() : int
      {
         return status$field;
      }
      
      public function clearPlayerId() : void
      {
         playerId$field = null;
      }
      
      public function get hasPlayerId() : Boolean
      {
         return playerId$field != null;
      }
      
      public function set playerId(param1:UInt64) : void
      {
         playerId$field = param1;
      }
      
      public function get playerId() : UInt64
      {
         return playerId$field;
      }
      
      public function clearPlayerName() : void
      {
         playerName$field = null;
      }
      
      public function get hasPlayerName() : Boolean
      {
         return playerName$field != null;
      }
      
      public function set playerName(param1:String) : void
      {
         playerName$field = param1;
      }
      
      public function get playerName() : String
      {
         return playerName$field;
      }
      
      public function clearGambleDiamond() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         gambleDiamond$field = new uint();
      }
      
      public function get hasGambleDiamond() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set gambleDiamond(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         gambleDiamond$field = param1;
      }
      
      public function get gambleDiamond() : uint
      {
         return gambleDiamond$field;
      }
      
      public function clearRewardStatus() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         rewardStatus$field = new int();
      }
      
      public function get hasRewardStatus() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set rewardStatus(param1:int) : void
      {
         hasField$0 = hasField$0 | 16;
         rewardStatus$field = param1;
      }
      
      public function get rewardStatus() : int
      {
         return rewardStatus$field;
      }
      
      public function clearRewardDiamond() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         rewardDiamond$field = new uint();
      }
      
      public function get hasRewardDiamond() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set rewardDiamond(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         rewardDiamond$field = param1;
      }
      
      public function get rewardDiamond() : uint
      {
         return rewardDiamond$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasGStageIndex)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_INT32(param1,gStageIndex$field);
         }
         if(hasFrontStageIndex)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_INT32(param1,frontStageIndex$field);
         }
         if(hasStatus)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_ENUM(param1,status$field);
         }
         if(hasPlayerId)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT64(param1,playerId$field);
         }
         if(hasPlayerName)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,playerName$field);
         }
         if(hasGambleDiamond)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,gambleDiamond$field);
         }
         if(hasRewardStatus)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_ENUM(param1,rewardStatus$field);
         }
         if(hasRewardDiamond)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,rewardDiamond$field);
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
         var _loc7_:* = 0;
         var _loc11_:uint = 0;
         var _loc10_:uint = 0;
         var _loc6_:uint = 0;
         var _loc9_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteGambleInfo.gStageIndex cannot be set twice.");
                  }
                  _loc11_++;
                  this.gStageIndex = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 1:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteGambleInfo.frontStageIndex cannot be set twice.");
                  }
                  _loc10_++;
                  this.frontStageIndex = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteGambleInfo.status cannot be set twice.");
                  }
                  _loc6_++;
                  this.status = ReadUtils.read$TYPE_ENUM(param1);
                  continue;
               case 3:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteGambleInfo.playerId cannot be set twice.");
                  }
                  _loc9_++;
                  this.playerId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteGambleInfo.playerName cannot be set twice.");
                  }
                  _loc5_++;
                  this.playerName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteGambleInfo.gambleDiamond cannot be set twice.");
                  }
                  _loc4_++;
                  this.gambleDiamond = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteGambleInfo.rewardStatus cannot be set twice.");
                  }
                  _loc8_++;
                  this.rewardStatus = ReadUtils.read$TYPE_ENUM(param1);
                  continue;
               case 7:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteGambleInfo.rewardDiamond cannot be set twice.");
                  }
                  _loc3_++;
                  this.rewardDiamond = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
