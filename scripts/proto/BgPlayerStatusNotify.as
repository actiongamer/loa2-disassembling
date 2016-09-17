package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgPlayerStatusNotify extends Message
   {
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BgPlayerStatusNotify.playerId","playerId",8 | 0);
      
      public static const STATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgPlayerStatusNotify.status","status",16 | 0);
      
      public static const X:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BgPlayerStatusNotify.x","x",24 | 0);
      
      public static const Y:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BgPlayerStatusNotify.y","y",32 | 0);
      
      public static const KILLERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BgPlayerStatusNotify.killerId","killerId",40 | 0);
      
      public static const ASSISTPLAYERID:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.BgPlayerStatusNotify.assistPlayerId","assistPlayerId",48 | 0);
      
      public static const KILLERHPPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgPlayerStatusNotify.killerHpPercent","killerHpPercent",56 | 0);
      
      public static const KILLERCONKILLNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgPlayerStatusNotify.killerConKillNum","killerConKillNum",64 | 0);
      
      public static const FIRSTKILL:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.BgPlayerStatusNotify.firstKill","firstKill",72 | 0);
      
      public static const DEFENSESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgPlayerStatusNotify.defenseStamp","defenseStamp",80 | 0);
      
      public static const CONDEATHNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgPlayerStatusNotify.conDeathNum","conDeathNum",88 | 0);
      
      public static const FLAGTIMEOUTSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgPlayerStatusNotify.flagTimeOutStamp","flagTimeOutStamp",96 | 0);
      
      public static const FLAGREBORNSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgPlayerStatusNotify.flagRebornStamp","flagRebornStamp",104 | 0);
       
      
      public var playerId:UInt64;
      
      public var status:uint;
      
      public var x:int;
      
      public var y:int;
      
      private var killerId$field:UInt64;
      
      public var assistPlayerId:Array;
      
      private var killerHpPercent$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var killerConKillNum$field:uint;
      
      private var firstKill$field:Boolean;
      
      private var defenseStamp$field:uint;
      
      private var conDeathNum$field:uint;
      
      private var flagTimeOutStamp$field:uint;
      
      private var flagRebornStamp$field:uint;
      
      public function BgPlayerStatusNotify()
      {
         assistPlayerId = [];
         super();
      }
      
      public function clearKillerId() : void
      {
         killerId$field = null;
      }
      
      public function get hasKillerId() : Boolean
      {
         return killerId$field != null;
      }
      
      public function set killerId(param1:UInt64) : void
      {
         killerId$field = param1;
      }
      
      public function get killerId() : UInt64
      {
         return killerId$field;
      }
      
      public function clearKillerHpPercent() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         killerHpPercent$field = new uint();
      }
      
      public function get hasKillerHpPercent() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set killerHpPercent(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         killerHpPercent$field = param1;
      }
      
      public function get killerHpPercent() : uint
      {
         return killerHpPercent$field;
      }
      
      public function clearKillerConKillNum() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         killerConKillNum$field = new uint();
      }
      
      public function get hasKillerConKillNum() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set killerConKillNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         killerConKillNum$field = param1;
      }
      
      public function get killerConKillNum() : uint
      {
         return killerConKillNum$field;
      }
      
      public function clearFirstKill() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         firstKill$field = new Boolean();
      }
      
      public function get hasFirstKill() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set firstKill(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 4;
         firstKill$field = param1;
      }
      
      public function get firstKill() : Boolean
      {
         return firstKill$field;
      }
      
      public function clearDefenseStamp() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         defenseStamp$field = new uint();
      }
      
      public function get hasDefenseStamp() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set defenseStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         defenseStamp$field = param1;
      }
      
      public function get defenseStamp() : uint
      {
         return defenseStamp$field;
      }
      
      public function clearConDeathNum() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         conDeathNum$field = new uint();
      }
      
      public function get hasConDeathNum() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set conDeathNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         conDeathNum$field = param1;
      }
      
      public function get conDeathNum() : uint
      {
         return conDeathNum$field;
      }
      
      public function clearFlagTimeOutStamp() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         flagTimeOutStamp$field = new uint();
      }
      
      public function get hasFlagTimeOutStamp() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set flagTimeOutStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         flagTimeOutStamp$field = param1;
      }
      
      public function get flagTimeOutStamp() : uint
      {
         return flagTimeOutStamp$field;
      }
      
      public function clearFlagRebornStamp() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         flagRebornStamp$field = new uint();
      }
      
      public function get hasFlagRebornStamp() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set flagRebornStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         flagRebornStamp$field = param1;
      }
      
      public function get flagRebornStamp() : uint
      {
         return flagRebornStamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.playerId);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.status);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_INT32(param1,this.x);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_INT32(param1,this.y);
         if(hasKillerId)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT64(param1,killerId$field);
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.assistPlayerId.length)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT64(param1,this.assistPlayerId[_loc3_]);
            _loc3_++;
         }
         if(hasKillerHpPercent)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,killerHpPercent$field);
         }
         if(hasKillerConKillNum)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,killerConKillNum$field);
         }
         if(hasFirstKill)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_BOOL(param1,firstKill$field);
         }
         if(hasDefenseStamp)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,defenseStamp$field);
         }
         if(hasConDeathNum)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,conDeathNum$field);
         }
         if(hasFlagTimeOutStamp)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,flagTimeOutStamp$field);
         }
         if(hasFlagRebornStamp)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_UINT32(param1,flagRebornStamp$field);
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:* = 0;
         var _loc13_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc9_:uint = 0;
         var _loc7_:uint = 0;
         var _loc10_:uint = 0;
         var _loc8_:uint = 0;
         var _loc15_:uint = 0;
         var _loc14_:uint = 0;
         var _loc12_:uint = 0;
         var _loc4_:uint = 0;
         var _loc11_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlayerStatusNotify.playerId cannot be set twice.");
                  }
                  _loc13_++;
                  this.playerId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlayerStatusNotify.status cannot be set twice.");
                  }
                  _loc5_++;
                  this.status = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlayerStatusNotify.x cannot be set twice.");
                  }
                  _loc3_++;
                  this.x = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 3:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlayerStatusNotify.y cannot be set twice.");
                  }
                  _loc9_++;
                  this.y = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlayerStatusNotify.killerId cannot be set twice.");
                  }
                  _loc7_++;
                  this.killerId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 5:
                  if((_loc6_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.assistPlayerId);
                  }
                  else
                  {
                     this.assistPlayerId.push(ReadUtils.read$TYPE_UINT64(param1));
                  }
                  continue;
               case 6:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlayerStatusNotify.killerHpPercent cannot be set twice.");
                  }
                  _loc10_++;
                  this.killerHpPercent = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlayerStatusNotify.killerConKillNum cannot be set twice.");
                  }
                  _loc8_++;
                  this.killerConKillNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlayerStatusNotify.firstKill cannot be set twice.");
                  }
                  _loc15_++;
                  this.firstKill = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 9:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlayerStatusNotify.defenseStamp cannot be set twice.");
                  }
                  _loc14_++;
                  this.defenseStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlayerStatusNotify.conDeathNum cannot be set twice.");
                  }
                  _loc12_++;
                  this.conDeathNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 11:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlayerStatusNotify.flagTimeOutStamp cannot be set twice.");
                  }
                  _loc4_++;
                  this.flagTimeOutStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 12:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlayerStatusNotify.flagRebornStamp cannot be set twice.");
                  }
                  _loc11_++;
                  this.flagRebornStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
