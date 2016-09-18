package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgStageResInfo extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageResInfo.id","id",8 | 0);
      
      public static const STATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageResInfo.status","status",16 | 0);
      
      public static const RESIDUALNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageResInfo.residualNum","residualNum",24 | 0);
      
      public static const RUNOUTSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageResInfo.runOutStamp","runOutStamp",32 | 0);
      
      public static const OWNER:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BgStageResInfo.owner","owner",40 | 0);
      
      public static const REBORNSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageResInfo.rebornStamp","rebornStamp",48 | 0);
      
      public static const FLAGTIMEOUTSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageResInfo.flagTimeOutStamp","flagTimeOutStamp",56 | 0);
      
      public static const RESIDUALTOTALNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageResInfo.residualTotalNum","residualTotalNum",64 | 0);
      
      public static const NPCGROUPID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageResInfo.npcGroupId","npcGroupId",72 | 0);
       
      
      public var id:uint;
      
      public var status:uint;
      
      public var residualNum:uint;
      
      private var runOutStamp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var owner$field:UInt64;
      
      private var rebornStamp$field:uint;
      
      private var flagTimeOutStamp$field:uint;
      
      private var residualTotalNum$field:uint;
      
      private var npcGroupId$field:uint;
      
      public function BgStageResInfo()
      {
         super();
      }
      
      public function clearRunOutStamp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         runOutStamp$field = new uint();
      }
      
      public function get hasRunOutStamp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set runOutStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         runOutStamp$field = param1;
      }
      
      public function get runOutStamp() : uint
      {
         return runOutStamp$field;
      }
      
      public function clearOwner() : void
      {
         owner$field = null;
      }
      
      public function get hasOwner() : Boolean
      {
         return owner$field != null;
      }
      
      public function set owner(param1:UInt64) : void
      {
         owner$field = param1;
      }
      
      public function get owner() : UInt64
      {
         return owner$field;
      }
      
      public function clearRebornStamp() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         rebornStamp$field = new uint();
      }
      
      public function get hasRebornStamp() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set rebornStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         rebornStamp$field = param1;
      }
      
      public function get rebornStamp() : uint
      {
         return rebornStamp$field;
      }
      
      public function clearFlagTimeOutStamp() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         flagTimeOutStamp$field = new uint();
      }
      
      public function get hasFlagTimeOutStamp() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set flagTimeOutStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         flagTimeOutStamp$field = param1;
      }
      
      public function get flagTimeOutStamp() : uint
      {
         return flagTimeOutStamp$field;
      }
      
      public function clearResidualTotalNum() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         residualTotalNum$field = new uint();
      }
      
      public function get hasResidualTotalNum() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set residualTotalNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         residualTotalNum$field = param1;
      }
      
      public function get residualTotalNum() : uint
      {
         return residualTotalNum$field;
      }
      
      public function clearNpcGroupId() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         npcGroupId$field = new uint();
      }
      
      public function get hasNpcGroupId() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set npcGroupId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         npcGroupId$field = param1;
      }
      
      public function get npcGroupId() : uint
      {
         return npcGroupId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.status);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.residualNum);
         if(hasRunOutStamp)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,runOutStamp$field);
         }
         if(hasOwner)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT64(param1,owner$field);
         }
         if(hasRebornStamp)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,rebornStamp$field);
         }
         if(hasFlagTimeOutStamp)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,flagTimeOutStamp$field);
         }
         if(hasResidualTotalNum)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,residualTotalNum$field);
         }
         if(hasNpcGroupId)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,npcGroupId$field);
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
         var _loc8_:* = 0;
         var _loc11_:uint = 0;
         var _loc7_:uint = 0;
         var _loc12_:uint = 0;
         var _loc10_:uint = 0;
         var _loc5_:uint = 0;
         var _loc9_:uint = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc8_ >> 3) - 1)
            {
               case 0:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageResInfo.id cannot be set twice.");
                  }
                  _loc11_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageResInfo.status cannot be set twice.");
                  }
                  _loc7_++;
                  this.status = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageResInfo.residualNum cannot be set twice.");
                  }
                  _loc12_++;
                  this.residualNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageResInfo.runOutStamp cannot be set twice.");
                  }
                  _loc10_++;
                  this.runOutStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageResInfo.owner cannot be set twice.");
                  }
                  _loc5_++;
                  this.owner = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 5:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageResInfo.rebornStamp cannot be set twice.");
                  }
                  _loc9_++;
                  this.rebornStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageResInfo.flagTimeOutStamp cannot be set twice.");
                  }
                  _loc4_++;
                  this.flagTimeOutStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageResInfo.residualTotalNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.residualTotalNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageResInfo.npcGroupId cannot be set twice.");
                  }
                  _loc3_++;
                  this.npcGroupId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
