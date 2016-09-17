package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ArenaInfoRes extends Message
   {
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaInfoRes.rank","rank",8 | 0);
      
      public static const RESIDUALTIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.ArenaInfoRes.residualTimes","residualTimes",16 | 0);
      
      public static const SCORES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaInfoRes.scores","scores",24 | 0);
      
      public static const ARENACOIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaInfoRes.arenaCoin","arenaCoin",32 | 0);
      
      public static const CDSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaInfoRes.cdStamp","cdStamp",40 | 0);
      
      public static const ISCDRED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.ArenaInfoRes.isCdRed","isCdRed",48 | 0);
      
      public static const ARENAPLAYERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ArenaInfoRes.arenaPlayers","arenaPlayers",56 | 2,ArenaPlayer);
      
      public static const HISTTOPRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaInfoRes.histTopRank","histTopRank",64 | 0);
      
      public static const BUYTIMESDIAMOND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaInfoRes.buyTimesDiamond","buyTimesDiamond",72 | 0);
      
      public static const BUYTIMESCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaInfoRes.buyTimesCount","buyTimesCount",80 | 0);
      
      public static const YESTERDAYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaInfoRes.yesterdayRank","yesterdayRank",88 | 0);
      
      public static const RANKREFRESHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaInfoRes.rankRefreshTime","rankRefreshTime",104 | 0);
      
      public static const PLAYERREFRESHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaInfoRes.playerRefreshTime","playerRefreshTime",112 | 0);
      
      public static const MANIFESTO:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.ArenaInfoRes.manifesto","manifesto",120 | 2);
      
      public static const CANGETSCOREREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.ArenaInfoRes.canGetScoreReward","canGetScoreReward",128 | 0);
      
      public static const RANKREWARDSTATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.ArenaInfoRes.rankRewardStatus","rankRewardStatus",136 | 0,ARENA_REWARD_STATUS);
      
      public static const REPORTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ArenaInfoRes.reports","reports",144 | 2,ArenaReport);
       
      
      private var results$field:Array;
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var residualTimes$field:int;
      
      private var scores$field:uint;
      
      private var arenaCoin$field:uint;
      
      private var cdStamp$field:uint;
      
      private var isCdRed$field:Boolean;
      
      public var arenaPlayers:Array;
      
      private var histTopRank$field:uint;
      
      private var buyTimesDiamond$field:uint;
      
      private var buyTimesCount$field:uint;
      
      private var yesterdayRank$field:uint;
      
      private var rankRefreshTime$field:uint;
      
      private var playerRefreshTime$field:uint;
      
      private var manifesto$field:String;
      
      private var canGetScoreReward$field:Boolean;
      
      private var rankRewardStatus$field:int;
      
      public var reports:Array;
      
      public function ArenaInfoRes()
      {
         arenaPlayers = [];
         reports = [];
         super();
      }
      
      public function set results(param1:Array) : void
      {
         results$field = param1;
      }
      
      public function get results() : Array
      {
         return results$field;
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
      
      public function clearResidualTimes() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         residualTimes$field = new int();
      }
      
      public function get hasResidualTimes() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set residualTimes(param1:int) : void
      {
         hasField$0 = hasField$0 | 2;
         residualTimes$field = param1;
      }
      
      public function get residualTimes() : int
      {
         return residualTimes$field;
      }
      
      public function clearScores() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         scores$field = new uint();
      }
      
      public function get hasScores() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set scores(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         scores$field = param1;
      }
      
      public function get scores() : uint
      {
         return scores$field;
      }
      
      public function clearArenaCoin() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         arenaCoin$field = new uint();
      }
      
      public function get hasArenaCoin() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set arenaCoin(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         arenaCoin$field = param1;
      }
      
      public function get arenaCoin() : uint
      {
         return arenaCoin$field;
      }
      
      public function clearCdStamp() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         cdStamp$field = new uint();
      }
      
      public function get hasCdStamp() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set cdStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         cdStamp$field = param1;
      }
      
      public function get cdStamp() : uint
      {
         return cdStamp$field;
      }
      
      public function clearIsCdRed() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         isCdRed$field = new Boolean();
      }
      
      public function get hasIsCdRed() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set isCdRed(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 32;
         isCdRed$field = param1;
      }
      
      public function get isCdRed() : Boolean
      {
         return isCdRed$field;
      }
      
      public function clearHistTopRank() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         histTopRank$field = new uint();
      }
      
      public function get hasHistTopRank() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set histTopRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         histTopRank$field = param1;
      }
      
      public function get histTopRank() : uint
      {
         return histTopRank$field;
      }
      
      public function clearBuyTimesDiamond() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         buyTimesDiamond$field = new uint();
      }
      
      public function get hasBuyTimesDiamond() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set buyTimesDiamond(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         buyTimesDiamond$field = param1;
      }
      
      public function get buyTimesDiamond() : uint
      {
         return buyTimesDiamond$field;
      }
      
      public function clearBuyTimesCount() : void
      {
         hasField$0 = hasField$0 & 4294967039;
         buyTimesCount$field = new uint();
      }
      
      public function get hasBuyTimesCount() : Boolean
      {
         return (hasField$0 & 256) != 0;
      }
      
      public function set buyTimesCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 256;
         buyTimesCount$field = param1;
      }
      
      public function get buyTimesCount() : uint
      {
         return buyTimesCount$field;
      }
      
      public function clearYesterdayRank() : void
      {
         hasField$0 = hasField$0 & 4294966783;
         yesterdayRank$field = new uint();
      }
      
      public function get hasYesterdayRank() : Boolean
      {
         return (hasField$0 & 512) != 0;
      }
      
      public function set yesterdayRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 512;
         yesterdayRank$field = param1;
      }
      
      public function get yesterdayRank() : uint
      {
         return yesterdayRank$field;
      }
      
      public function clearRankRefreshTime() : void
      {
         hasField$0 = hasField$0 & 4294966271;
         rankRefreshTime$field = new uint();
      }
      
      public function get hasRankRefreshTime() : Boolean
      {
         return (hasField$0 & 1024) != 0;
      }
      
      public function set rankRefreshTime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1024;
         rankRefreshTime$field = param1;
      }
      
      public function get rankRefreshTime() : uint
      {
         return rankRefreshTime$field;
      }
      
      public function clearPlayerRefreshTime() : void
      {
         hasField$0 = hasField$0 & 4294965247;
         playerRefreshTime$field = new uint();
      }
      
      public function get hasPlayerRefreshTime() : Boolean
      {
         return (hasField$0 & 2048) != 0;
      }
      
      public function set playerRefreshTime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2048;
         playerRefreshTime$field = param1;
      }
      
      public function get playerRefreshTime() : uint
      {
         return playerRefreshTime$field;
      }
      
      public function clearManifesto() : void
      {
         manifesto$field = null;
      }
      
      public function get hasManifesto() : Boolean
      {
         return manifesto$field != null;
      }
      
      public function set manifesto(param1:String) : void
      {
         manifesto$field = param1;
      }
      
      public function get manifesto() : String
      {
         return manifesto$field;
      }
      
      public function clearCanGetScoreReward() : void
      {
         hasField$0 = hasField$0 & 4294963199;
         canGetScoreReward$field = new Boolean();
      }
      
      public function get hasCanGetScoreReward() : Boolean
      {
         return (hasField$0 & 4096) != 0;
      }
      
      public function set canGetScoreReward(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 4096;
         canGetScoreReward$field = param1;
      }
      
      public function get canGetScoreReward() : Boolean
      {
         return canGetScoreReward$field;
      }
      
      public function clearRankRewardStatus() : void
      {
         hasField$0 = hasField$0 & 4294959103;
         rankRewardStatus$field = new int();
      }
      
      public function get hasRankRewardStatus() : Boolean
      {
         return (hasField$0 & 8192) != 0;
      }
      
      public function set rankRewardStatus(param1:int) : void
      {
         hasField$0 = hasField$0 | 8192;
         rankRewardStatus$field = param1;
      }
      
      public function get rankRewardStatus() : int
      {
         return rankRewardStatus$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         if(hasRank)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,rank$field);
         }
         if(hasResidualTimes)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_INT32(param1,residualTimes$field);
         }
         if(hasScores)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,scores$field);
         }
         if(hasArenaCoin)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,arenaCoin$field);
         }
         if(hasCdStamp)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,cdStamp$field);
         }
         if(hasIsCdRed)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_BOOL(param1,isCdRed$field);
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.arenaPlayers.length)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.arenaPlayers[_loc3_]);
            _loc3_++;
         }
         if(hasHistTopRank)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,histTopRank$field);
         }
         if(hasBuyTimesDiamond)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,buyTimesDiamond$field);
         }
         if(hasBuyTimesCount)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,buyTimesCount$field);
         }
         if(hasYesterdayRank)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,yesterdayRank$field);
         }
         if(hasRankRefreshTime)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_UINT32(param1,rankRefreshTime$field);
         }
         if(hasPlayerRefreshTime)
         {
            WriteUtils.writeTag(param1,0,14);
            WriteUtils.write$TYPE_UINT32(param1,playerRefreshTime$field);
         }
         if(hasManifesto)
         {
            WriteUtils.writeTag(param1,2,15);
            WriteUtils.write$TYPE_STRING(param1,manifesto$field);
         }
         if(hasCanGetScoreReward)
         {
            WriteUtils.writeTag(param1,0,16);
            WriteUtils.write$TYPE_BOOL(param1,canGetScoreReward$field);
         }
         if(hasRankRewardStatus)
         {
            WriteUtils.writeTag(param1,0,17);
            WriteUtils.write$TYPE_ENUM(param1,rankRewardStatus$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.reports.length)
         {
            WriteUtils.writeTag(param1,2,18);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reports[_loc2_]);
            _loc2_++;
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
         var _loc4_:* = 0;
         var _loc9_:uint = 0;
         var _loc16_:uint = 0;
         var _loc14_:uint = 0;
         var _loc7_:uint = 0;
         var _loc17_:uint = 0;
         var _loc13_:uint = 0;
         var _loc15_:uint = 0;
         var _loc18_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc12_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc8_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaInfoRes.rank cannot be set twice.");
                  }
                  _loc9_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaInfoRes.residualTimes cannot be set twice.");
                  }
                  _loc16_++;
                  this.residualTimes = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 2:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaInfoRes.scores cannot be set twice.");
                  }
                  _loc14_++;
                  this.scores = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaInfoRes.arenaCoin cannot be set twice.");
                  }
                  _loc7_++;
                  this.arenaCoin = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaInfoRes.cdStamp cannot be set twice.");
                  }
                  _loc17_++;
                  this.cdStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaInfoRes.isCdRed cannot be set twice.");
                  }
                  _loc13_++;
                  this.isCdRed = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 6:
                  this.arenaPlayers.push(ReadUtils.read$TYPE_MESSAGE(param1,new ArenaPlayer()));
                  continue;
               case 7:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaInfoRes.histTopRank cannot be set twice.");
                  }
                  _loc15_++;
                  this.histTopRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaInfoRes.buyTimesDiamond cannot be set twice.");
                  }
                  _loc18_++;
                  this.buyTimesDiamond = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaInfoRes.buyTimesCount cannot be set twice.");
                  }
                  _loc3_++;
                  this.buyTimesCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 10:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaInfoRes.yesterdayRank cannot be set twice.");
                  }
                  _loc6_++;
                  this.yesterdayRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               default:
                  super.readUnknown(param1,_loc4_);
                  continue;
               case 12:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaInfoRes.rankRefreshTime cannot be set twice.");
                  }
                  _loc12_++;
                  this.rankRefreshTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 13:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaInfoRes.playerRefreshTime cannot be set twice.");
                  }
                  _loc10_++;
                  this.playerRefreshTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 14:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaInfoRes.manifesto cannot be set twice.");
                  }
                  _loc11_++;
                  this.manifesto = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 15:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaInfoRes.canGetScoreReward cannot be set twice.");
                  }
                  _loc8_++;
                  this.canGetScoreReward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 16:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaInfoRes.rankRewardStatus cannot be set twice.");
                  }
                  _loc5_++;
                  this.rankRewardStatus = ReadUtils.read$TYPE_ENUM(param1);
                  continue;
               case 17:
                  this.reports.push(ReadUtils.read$TYPE_MESSAGE(param1,new ArenaReport()));
                  continue;
            }
         }
      }
   }
}
