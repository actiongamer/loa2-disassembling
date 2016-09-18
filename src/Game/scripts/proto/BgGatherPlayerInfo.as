package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgGatherPlayerInfo extends Message
   {
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BgGatherPlayerInfo.playerId","playerId",8 | 0);
      
      public static const YIELD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgGatherPlayerInfo.yield","yield",16 | 0);
      
      public static const FLAGTIMEOUTSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgGatherPlayerInfo.flagTimeOutStamp","flagTimeOutStamp",24 | 0);
       
      
      public var playerId:UInt64;
      
      public var yield:uint;
      
      private var flagTimeOutStamp$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function BgGatherPlayerInfo()
      {
         super();
      }
      
      public function clearFlagTimeOutStamp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         flagTimeOutStamp$field = new uint();
      }
      
      public function get hasFlagTimeOutStamp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set flagTimeOutStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         flagTimeOutStamp$field = param1;
      }
      
      public function get flagTimeOutStamp() : uint
      {
         return flagTimeOutStamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.playerId);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.yield);
         if(hasFlagTimeOutStamp)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,flagTimeOutStamp$field);
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
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BgGatherPlayerInfo.playerId cannot be set twice.");
                  }
                  _loc6_++;
                  this.playerId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BgGatherPlayerInfo.yield cannot be set twice.");
                  }
                  _loc4_++;
                  this.yield = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BgGatherPlayerInfo.flagTimeOutStamp cannot be set twice.");
                  }
                  _loc3_++;
                  this.flagTimeOutStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
