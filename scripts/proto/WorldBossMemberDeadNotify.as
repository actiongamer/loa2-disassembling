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
   
   public class WorldBossMemberDeadNotify extends Message
   {
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.WorldBossMemberDeadNotify.playerid","playerid",8 | 0);
      
      public static const RELIVETIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossMemberDeadNotify.relivetimestamp","relivetimestamp",16 | 0);
       
      
      public var playerid:UInt64;
      
      private var relivetimestamp$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function WorldBossMemberDeadNotify()
      {
         super();
      }
      
      public function clearRelivetimestamp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         relivetimestamp$field = new uint();
      }
      
      public function get hasRelivetimestamp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set relivetimestamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         relivetimestamp$field = param1;
      }
      
      public function get relivetimestamp() : uint
      {
         return relivetimestamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.playerid);
         if(hasRelivetimestamp)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,relivetimestamp$field);
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
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossMemberDeadNotify.playerid cannot be set twice.");
                  }
                  _loc3_++;
                  this.playerid = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossMemberDeadNotify.relivetimestamp cannot be set twice.");
                  }
                  _loc5_++;
                  this.relivetimestamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
