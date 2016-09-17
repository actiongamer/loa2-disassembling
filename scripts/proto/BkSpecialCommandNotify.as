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
   
   public class BkSpecialCommandNotify extends Message
   {
      
      public static const COMMAND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkSpecialCommandNotify.command","command",8 | 0);
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BkSpecialCommandNotify.playerId","playerId",16 | 0);
      
      public static const PARAM1:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkSpecialCommandNotify.param1","param1",24 | 0);
      
      public static const PARAM2:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkSpecialCommandNotify.param2","param2",32 | 0);
       
      
      public var command:uint;
      
      private var playerId$field:UInt64;
      
      private var param1$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var param2$field:uint;
      
      public function BkSpecialCommandNotify()
      {
         super();
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
      
      public function clearParam1() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         param1$field = new uint();
      }
      
      public function get hasParam1() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set param1(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         param1$field = param1;
      }
      
      public function get param1() : uint
      {
         return param1$field;
      }
      
      public function clearParam2() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         param2$field = new uint();
      }
      
      public function get hasParam2() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set param2(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         param2$field = param1;
      }
      
      public function get param2() : uint
      {
         return param2$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.command);
         if(hasPlayerId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT64(param1,playerId$field);
         }
         if(hasParam1)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,param1$field);
         }
         if(hasParam2)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,param2$field);
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
         var _loc3_:* = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BkSpecialCommandNotify.command cannot be set twice.");
                  }
                  _loc6_++;
                  this.command = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BkSpecialCommandNotify.playerId cannot be set twice.");
                  }
                  _loc5_++;
                  this.playerId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BkSpecialCommandNotify.param1 cannot be set twice.");
                  }
                  _loc4_++;
                  this.param1 = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BkSpecialCommandNotify.param2 cannot be set twice.");
                  }
                  _loc7_++;
                  this.param2 = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
