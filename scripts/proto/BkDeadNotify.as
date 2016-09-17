package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BkDeadNotify extends Message
   {
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BkDeadNotify.playerId","playerId",8 | 0);
      
      public static const X:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BkDeadNotify.x","x",16 | 0);
      
      public static const Y:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BkDeadNotify.y","y",24 | 0);
      
      public static const ASSISTPLAYERID:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.BkDeadNotify.assistPlayerId","assistPlayerId",32 | 0);
       
      
      public var playerId:UInt64;
      
      public var x:int;
      
      public var y:int;
      
      public var assistPlayerId:Array;
      
      public function BkDeadNotify()
      {
         assistPlayerId = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.playerId);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_INT32(param1,this.x);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_INT32(param1,this.y);
         _loc3_ = uint(0);
         while(_loc3_ < this.assistPlayerId.length)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT64(param1,this.assistPlayerId[_loc3_]);
            _loc3_++;
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
         var _loc4_:* = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BkDeadNotify.playerId cannot be set twice.");
                  }
                  _loc6_++;
                  this.playerId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BkDeadNotify.x cannot be set twice.");
                  }
                  _loc3_++;
                  this.x = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BkDeadNotify.y cannot be set twice.");
                  }
                  _loc5_++;
                  this.y = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 3:
                  if((_loc4_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.assistPlayerId);
                  }
                  else
                  {
                     this.assistPlayerId.push(ReadUtils.read$TYPE_UINT64(param1));
                  }
                  continue;
            }
         }
      }
   }
}
