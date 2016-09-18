package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BkStagePlayerInfo extends Message
   {
      
      public static const PLAYERINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BkStagePlayerInfo.playerInfo","playerInfo",8 | 2,proto.BkPlayerInfo);
      
      public static const X:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BkStagePlayerInfo.x","x",16 | 0);
      
      public static const Y:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BkStagePlayerInfo.y","y",24 | 0);
      
      public static const SIDE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkStagePlayerInfo.side","side",32 | 0);
      
      public static const STATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkStagePlayerInfo.status","status",40 | 0);
      
      public static const HPPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkStagePlayerInfo.hpPercent","hpPercent",48 | 0);
      
      public static const DEFENSESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkStagePlayerInfo.defenseStamp","defenseStamp",56 | 0);
      
      public static const REBORNSTAMP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BkStagePlayerInfo.rebornStamp","rebornStamp",64 | 0);
      
      public static const CONDEATHNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkStagePlayerInfo.conDeathNum","conDeathNum",72 | 0);
       
      
      public var playerInfo:proto.BkPlayerInfo;
      
      public var x:int;
      
      public var y:int;
      
      public var side:uint;
      
      public var status:uint;
      
      public var hpPercent:uint;
      
      private var defenseStamp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var rebornStamp$field:int;
      
      private var conDeathNum$field:uint;
      
      public function BkStagePlayerInfo()
      {
         super();
      }
      
      public function clearDefenseStamp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         defenseStamp$field = new uint();
      }
      
      public function get hasDefenseStamp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set defenseStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         defenseStamp$field = param1;
      }
      
      public function get defenseStamp() : uint
      {
         return defenseStamp$field;
      }
      
      public function clearRebornStamp() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         rebornStamp$field = new int();
      }
      
      public function get hasRebornStamp() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set rebornStamp(param1:int) : void
      {
         hasField$0 = hasField$0 | 2;
         rebornStamp$field = param1;
      }
      
      public function get rebornStamp() : int
      {
         return rebornStamp$field;
      }
      
      public function clearConDeathNum() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         conDeathNum$field = new uint();
      }
      
      public function get hasConDeathNum() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set conDeathNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         conDeathNum$field = param1;
      }
      
      public function get conDeathNum() : uint
      {
         return conDeathNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.playerInfo);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_INT32(param1,this.x);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_INT32(param1,this.y);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.side);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.status);
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_UINT32(param1,this.hpPercent);
         if(hasDefenseStamp)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,defenseStamp$field);
         }
         if(hasRebornStamp)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_INT32(param1,rebornStamp$field);
         }
         if(hasConDeathNum)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,conDeathNum$field);
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
         var _loc12_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc11_:uint = 0;
         var _loc4_:uint = 0;
         var _loc10_:uint = 0;
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: BkStagePlayerInfo.playerInfo cannot be set twice.");
                  }
                  _loc12_++;
                  this.playerInfo = new proto.BkPlayerInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.playerInfo);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BkStagePlayerInfo.x cannot be set twice.");
                  }
                  _loc3_++;
                  this.x = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BkStagePlayerInfo.y cannot be set twice.");
                  }
                  _loc6_++;
                  this.y = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 3:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: BkStagePlayerInfo.side cannot be set twice.");
                  }
                  _loc11_++;
                  this.side = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BkStagePlayerInfo.status cannot be set twice.");
                  }
                  _loc4_++;
                  this.status = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: BkStagePlayerInfo.hpPercent cannot be set twice.");
                  }
                  _loc10_++;
                  this.hpPercent = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: BkStagePlayerInfo.defenseStamp cannot be set twice.");
                  }
                  _loc9_++;
                  this.defenseStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: BkStagePlayerInfo.rebornStamp cannot be set twice.");
                  }
                  _loc8_++;
                  this.rebornStamp = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 8:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BkStagePlayerInfo.conDeathNum cannot be set twice.");
                  }
                  _loc7_++;
                  this.conDeathNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
