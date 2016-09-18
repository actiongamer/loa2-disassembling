package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgInfoRes extends Message
   {
      
      public static const DEGREE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgInfoRes.degree","degree",8 | 0);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgInfoRes.score","score",16 | 0);
      
      public static const RESIDUALDAY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgInfoRes.residualDay","residualDay",24 | 0);
      
      public static const OPEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.BgInfoRes.open","open",32 | 0);
      
      public static const STATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.BgInfoRes.status","status",40 | 0,BG_STATUS);
      
      public static const ELOSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgInfoRes.eloScore","eloScore",48 | 0);
      
      public static const OPENDAY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgInfoRes.openDay","openDay",56 | 0);
      
      public static const WINTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgInfoRes.winTimes","winTimes",64 | 0);
      
      public static const FAILTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgInfoRes.failTimes","failTimes",72 | 0);
      
      public static const LASTMONTHLOCALRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgInfoRes.lastMonthLocalRank","lastMonthLocalRank",80 | 0);
      
      public static const LASTMONTHCROSSRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgInfoRes.lastMonthCrossRank","lastMonthCrossRank",88 | 0);
      
      public static const PENALTYSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgInfoRes.penaltyStamp","penaltyStamp",96 | 0);
      
      public static const TODAYWINTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgInfoRes.todayWinTimes","todayWinTimes",104 | 0);
       
      
      public var degree:uint;
      
      public var score:uint;
      
      public var residualDay:uint;
      
      public var open:Boolean;
      
      public var status:int;
      
      private var eloScore$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var openDay$field:uint;
      
      private var winTimes$field:uint;
      
      private var failTimes$field:uint;
      
      private var lastMonthLocalRank$field:uint;
      
      private var lastMonthCrossRank$field:uint;
      
      private var penaltyStamp$field:uint;
      
      private var todayWinTimes$field:uint;
      
      public function BgInfoRes()
      {
         super();
      }
      
      public function clearEloScore() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         eloScore$field = new uint();
      }
      
      public function get hasEloScore() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set eloScore(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         eloScore$field = param1;
      }
      
      public function get eloScore() : uint
      {
         return eloScore$field;
      }
      
      public function clearOpenDay() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         openDay$field = new uint();
      }
      
      public function get hasOpenDay() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set openDay(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         openDay$field = param1;
      }
      
      public function get openDay() : uint
      {
         return openDay$field;
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
      
      public function clearFailTimes() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         failTimes$field = new uint();
      }
      
      public function get hasFailTimes() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set failTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         failTimes$field = param1;
      }
      
      public function get failTimes() : uint
      {
         return failTimes$field;
      }
      
      public function clearLastMonthLocalRank() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         lastMonthLocalRank$field = new uint();
      }
      
      public function get hasLastMonthLocalRank() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set lastMonthLocalRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         lastMonthLocalRank$field = param1;
      }
      
      public function get lastMonthLocalRank() : uint
      {
         return lastMonthLocalRank$field;
      }
      
      public function clearLastMonthCrossRank() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         lastMonthCrossRank$field = new uint();
      }
      
      public function get hasLastMonthCrossRank() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set lastMonthCrossRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         lastMonthCrossRank$field = param1;
      }
      
      public function get lastMonthCrossRank() : uint
      {
         return lastMonthCrossRank$field;
      }
      
      public function clearPenaltyStamp() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         penaltyStamp$field = new uint();
      }
      
      public function get hasPenaltyStamp() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set penaltyStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         penaltyStamp$field = param1;
      }
      
      public function get penaltyStamp() : uint
      {
         return penaltyStamp$field;
      }
      
      public function clearTodayWinTimes() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         todayWinTimes$field = new uint();
      }
      
      public function get hasTodayWinTimes() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set todayWinTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         todayWinTimes$field = param1;
      }
      
      public function get todayWinTimes() : uint
      {
         return todayWinTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.degree);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.score);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.residualDay);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_BOOL(param1,this.open);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_ENUM(param1,this.status);
         if(hasEloScore)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,eloScore$field);
         }
         if(hasOpenDay)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,openDay$field);
         }
         if(hasWinTimes)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,winTimes$field);
         }
         if(hasFailTimes)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,failTimes$field);
         }
         if(hasLastMonthLocalRank)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,lastMonthLocalRank$field);
         }
         if(hasLastMonthCrossRank)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,lastMonthCrossRank$field);
         }
         if(hasPenaltyStamp)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,penaltyStamp$field);
         }
         if(hasTodayWinTimes)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_UINT32(param1,todayWinTimes$field);
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
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         var _loc13_:uint = 0;
         var _loc14_:uint = 0;
         var _loc5_:uint = 0;
         var _loc11_:uint = 0;
         var _loc9_:uint = 0;
         var _loc7_:uint = 0;
         var _loc16_:uint = 0;
         var _loc10_:uint = 0;
         var _loc12_:uint = 0;
         var _loc3_:uint = 0;
         var _loc15_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BgInfoRes.degree cannot be set twice.");
                  }
                  _loc4_++;
                  this.degree = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: BgInfoRes.score cannot be set twice.");
                  }
                  _loc8_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: BgInfoRes.residualDay cannot be set twice.");
                  }
                  _loc13_++;
                  this.residualDay = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: BgInfoRes.open cannot be set twice.");
                  }
                  _loc14_++;
                  this.open = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BgInfoRes.status cannot be set twice.");
                  }
                  _loc5_++;
                  this.status = ReadUtils.read$TYPE_ENUM(param1);
                  continue;
               case 5:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: BgInfoRes.eloScore cannot be set twice.");
                  }
                  _loc11_++;
                  this.eloScore = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: BgInfoRes.openDay cannot be set twice.");
                  }
                  _loc9_++;
                  this.openDay = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BgInfoRes.winTimes cannot be set twice.");
                  }
                  _loc7_++;
                  this.winTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: BgInfoRes.failTimes cannot be set twice.");
                  }
                  _loc16_++;
                  this.failTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: BgInfoRes.lastMonthLocalRank cannot be set twice.");
                  }
                  _loc10_++;
                  this.lastMonthLocalRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: BgInfoRes.lastMonthCrossRank cannot be set twice.");
                  }
                  _loc12_++;
                  this.lastMonthCrossRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 11:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BgInfoRes.penaltyStamp cannot be set twice.");
                  }
                  _loc3_++;
                  this.penaltyStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 12:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: BgInfoRes.todayWinTimes cannot be set twice.");
                  }
                  _loc15_++;
                  this.todayWinTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
