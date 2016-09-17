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
   
   public class BgPlaceFlagNotify extends Message
   {
      
      public static const FLAGID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgPlaceFlagNotify.flagId","flagId",8 | 0);
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BgPlaceFlagNotify.playerId","playerId",16 | 0);
      
      public static const TEAMSIDE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgPlaceFlagNotify.teamSide","teamSide",24 | 0);
      
      public static const TOTALNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgPlaceFlagNotify.totalNum","totalNum",32 | 0);
      
      public static const REBORNFLAGID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgPlaceFlagNotify.rebornFlagId","rebornFlagId",40 | 0);
      
      public static const REBORNSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgPlaceFlagNotify.rebornStamp","rebornStamp",48 | 0);
       
      
      public var flagId:uint;
      
      public var playerId:UInt64;
      
      public var teamSide:uint;
      
      public var totalNum:uint;
      
      private var rebornFlagId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var rebornStamp$field:uint;
      
      public function BgPlaceFlagNotify()
      {
         super();
      }
      
      public function clearRebornFlagId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         rebornFlagId$field = new uint();
      }
      
      public function get hasRebornFlagId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set rebornFlagId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         rebornFlagId$field = param1;
      }
      
      public function get rebornFlagId() : uint
      {
         return rebornFlagId$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.flagId);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT64(param1,this.playerId);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.teamSide);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.totalNum);
         if(hasRebornFlagId)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,rebornFlagId$field);
         }
         if(hasRebornStamp)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,rebornStamp$field);
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
         var _loc8_:uint = 0;
         var _loc7_:uint = 0;
         var _loc9_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlaceFlagNotify.flagId cannot be set twice.");
                  }
                  _loc8_++;
                  this.flagId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlaceFlagNotify.playerId cannot be set twice.");
                  }
                  _loc7_++;
                  this.playerId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlaceFlagNotify.teamSide cannot be set twice.");
                  }
                  _loc9_++;
                  this.teamSide = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlaceFlagNotify.totalNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.totalNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlaceFlagNotify.rebornFlagId cannot be set twice.");
                  }
                  _loc3_++;
                  this.rebornFlagId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlaceFlagNotify.rebornStamp cannot be set twice.");
                  }
                  _loc6_++;
                  this.rebornStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
