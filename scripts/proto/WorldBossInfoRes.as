package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class WorldBossInfoRes extends Message
   {
      
      public static const STATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossInfoRes.state","state",8 | 0);
      
      public static const AUTOFIGHT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.WorldBossInfoRes.autofight","autofight",16 | 0);
      
      public static const SIMPLEREPORT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.WorldBossInfoRes.simplereport","simplereport",24 | 0);
      
      public static const CURRSTARTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossInfoRes.currstarttime","currstarttime",32 | 0);
      
      public static const NEXTRESETTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossInfoRes.nextresettime","nextresettime",40 | 0);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossInfoRes.rank","rank",48 | 0);
      
      public static const BOSSINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.WorldBossInfoRes.bossinfo","bossinfo",56 | 2,WorldBossInfo);
      
      public static const HURTRANKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.WorldBossInfoRes.hurtranks","hurtranks",64 | 2,WorldBossRankData);
      
      public static const TOTALHURT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossInfoRes.totalhurt","totalhurt",72 | 0);
      
      public static const ISDEAD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.WorldBossInfoRes.isdead","isdead",80 | 0);
      
      public static const LASTDEADTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossInfoRes.lastdeadtime","lastdeadtime",88 | 0);
      
      public static const BUFFIDS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.WorldBossInfoRes.buffids","buffids",96 | 0);
      
      public static const NEXTSTATETIMELONG:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossInfoRes.nextstatetimelong","nextstatetimelong",104 | 0);
      
      public static const REWARDIDS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.WorldBossInfoRes.rewardids","rewardids",112 | 0);
      
      public static const HASGETREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.WorldBossInfoRes.hasgetreward","hasgetreward",120 | 0);
      
      public static const NEXTSTARTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossInfoRes.nextstarttime","nextstarttime",128 | 0);
      
      public static const RANKNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossInfoRes.ranknum","ranknum",136 | 0);
      
      public static const CANGETREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.WorldBossInfoRes.cangetreward","cangetreward",144 | 0);
       
      
      public var state:uint;
      
      public var autofight:Boolean;
      
      public var simplereport:Boolean;
      
      public var currstarttime:uint;
      
      public var nextresettime:uint;
      
      public var rank:uint;
      
      public var bossinfo:Array;
      
      public var hurtranks:Array;
      
      public var totalhurt:uint;
      
      public var isdead:Boolean;
      
      public var lastdeadtime:uint;
      
      public var buffids:Array;
      
      public var nextstatetimelong:uint;
      
      public var rewardids:Array;
      
      private var hasgetreward$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var nextstarttime$field:uint;
      
      private var ranknum$field:uint;
      
      private var cangetreward$field:Boolean;
      
      public function WorldBossInfoRes()
      {
         bossinfo = [];
         hurtranks = [];
         buffids = [];
         rewardids = [];
         super();
      }
      
      public function clearHasgetreward() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         hasgetreward$field = new Boolean();
      }
      
      public function get hasHasgetreward() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set hasgetreward(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         hasgetreward$field = param1;
      }
      
      public function get hasgetreward() : Boolean
      {
         return hasgetreward$field;
      }
      
      public function clearNextstarttime() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         nextstarttime$field = new uint();
      }
      
      public function get hasNextstarttime() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set nextstarttime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         nextstarttime$field = param1;
      }
      
      public function get nextstarttime() : uint
      {
         return nextstarttime$field;
      }
      
      public function clearRanknum() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         ranknum$field = new uint();
      }
      
      public function get hasRanknum() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set ranknum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         ranknum$field = param1;
      }
      
      public function get ranknum() : uint
      {
         return ranknum$field;
      }
      
      public function clearCangetreward() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         cangetreward$field = new Boolean();
      }
      
      public function get hasCangetreward() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set cangetreward(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 8;
         cangetreward$field = param1;
      }
      
      public function get cangetreward() : Boolean
      {
         return cangetreward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc6_:* = 0;
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.state);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_BOOL(param1,this.autofight);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_BOOL(param1,this.simplereport);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.currstarttime);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.nextresettime);
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_UINT32(param1,this.rank);
         _loc6_ = uint(0);
         while(_loc6_ < this.bossinfo.length)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.bossinfo[_loc6_]);
            _loc6_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.hurtranks.length)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.hurtranks[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,9);
         WriteUtils.write$TYPE_UINT32(param1,this.totalhurt);
         WriteUtils.writeTag(param1,0,10);
         WriteUtils.write$TYPE_BOOL(param1,this.isdead);
         WriteUtils.writeTag(param1,0,11);
         WriteUtils.write$TYPE_UINT32(param1,this.lastdeadtime);
         _loc3_ = uint(0);
         while(_loc3_ < this.buffids.length)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,this.buffids[_loc3_]);
            _loc3_++;
         }
         WriteUtils.writeTag(param1,0,13);
         WriteUtils.write$TYPE_UINT32(param1,this.nextstatetimelong);
         _loc4_ = uint(0);
         while(_loc4_ < this.rewardids.length)
         {
            WriteUtils.writeTag(param1,0,14);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardids[_loc4_]);
            _loc4_++;
         }
         if(hasHasgetreward)
         {
            WriteUtils.writeTag(param1,0,15);
            WriteUtils.write$TYPE_BOOL(param1,hasgetreward$field);
         }
         if(hasNextstarttime)
         {
            WriteUtils.writeTag(param1,0,16);
            WriteUtils.write$TYPE_UINT32(param1,nextstarttime$field);
         }
         if(hasRanknum)
         {
            WriteUtils.writeTag(param1,0,17);
            WriteUtils.write$TYPE_UINT32(param1,ranknum$field);
         }
         if(hasCangetreward)
         {
            WriteUtils.writeTag(param1,0,18);
            WriteUtils.write$TYPE_BOOL(param1,cangetreward$field);
         }
         var _loc8_:int = 0;
         var _loc7_:* = this;
         for(var _loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc3_:uint = 0;
         var _loc14_:uint = 0;
         var _loc15_:uint = 0;
         var _loc17_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         var _loc8_:uint = 0;
         var _loc6_:uint = 0;
         var _loc9_:uint = 0;
         var _loc16_:uint = 0;
         var _loc10_:uint = 0;
         var _loc7_:uint = 0;
         var _loc13_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfoRes.state cannot be set twice.");
                  }
                  _loc3_++;
                  this.state = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfoRes.autofight cannot be set twice.");
                  }
                  _loc14_++;
                  this.autofight = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 2:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfoRes.simplereport cannot be set twice.");
                  }
                  _loc15_++;
                  this.simplereport = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 3:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfoRes.currstarttime cannot be set twice.");
                  }
                  _loc17_++;
                  this.currstarttime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfoRes.nextresettime cannot be set twice.");
                  }
                  _loc11_++;
                  this.nextresettime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfoRes.rank cannot be set twice.");
                  }
                  _loc12_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  this.bossinfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new WorldBossInfo()));
                  continue;
               case 7:
                  this.hurtranks.push(ReadUtils.read$TYPE_MESSAGE(param1,new WorldBossRankData()));
                  continue;
               case 8:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfoRes.totalhurt cannot be set twice.");
                  }
                  _loc8_++;
                  this.totalhurt = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfoRes.isdead cannot be set twice.");
                  }
                  _loc6_++;
                  this.isdead = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 10:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfoRes.lastdeadtime cannot be set twice.");
                  }
                  _loc9_++;
                  this.lastdeadtime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 11:
                  if((_loc5_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.buffids);
                  }
                  else
                  {
                     this.buffids.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 12:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfoRes.nextstatetimelong cannot be set twice.");
                  }
                  _loc16_++;
                  this.nextstatetimelong = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 13:
                  if((_loc5_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.rewardids);
                  }
                  else
                  {
                     this.rewardids.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 14:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfoRes.hasgetreward cannot be set twice.");
                  }
                  _loc10_++;
                  this.hasgetreward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 15:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfoRes.nextstarttime cannot be set twice.");
                  }
                  _loc7_++;
                  this.nextstarttime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 16:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfoRes.ranknum cannot be set twice.");
                  }
                  _loc13_++;
                  this.ranknum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 17:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfoRes.cangetreward cannot be set twice.");
                  }
                  _loc4_++;
                  this.cangetreward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
