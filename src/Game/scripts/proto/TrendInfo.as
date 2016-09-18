package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TrendInfo extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.TrendInfo.id","id",8 | 0);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TrendInfo.kind","kind",16 | 0);
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.TrendInfo.playerid","playerid",24 | 0);
      
      public static const CONGRATULATEABLE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.TrendInfo.congratulateable","congratulateable",32 | 0);
      
      public static const TIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TrendInfo.timestamp","timestamp",40 | 0);
      
      public static const CONTENTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.TrendInfo.contents","contents",48 | 2,Para);
      
      public static const ISCONGRATULATE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.TrendInfo.iscongratulate","iscongratulate",56 | 0);
       
      
      public var id:UInt64;
      
      public var kind:uint;
      
      public var playerid:UInt64;
      
      public var congratulateable:Boolean;
      
      public var timestamp:uint;
      
      public var contents:Array;
      
      private var iscongratulate$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function TrendInfo()
      {
         contents = [];
         super();
      }
      
      public function clearIscongratulate() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         iscongratulate$field = new Boolean();
      }
      
      public function get hasIscongratulate() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set iscongratulate(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         iscongratulate$field = param1;
      }
      
      public function get iscongratulate() : Boolean
      {
         return iscongratulate$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.kind);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT64(param1,this.playerid);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_BOOL(param1,this.congratulateable);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.timestamp);
         _loc2_ = uint(0);
         while(_loc2_ < this.contents.length)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.contents[_loc2_]);
            _loc2_++;
         }
         if(hasIscongratulate)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_BOOL(param1,iscongratulate$field);
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc9_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: TrendInfo.id cannot be set twice.");
                  }
                  _loc8_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: TrendInfo.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: TrendInfo.playerid cannot be set twice.");
                  }
                  _loc4_++;
                  this.playerid = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: TrendInfo.congratulateable cannot be set twice.");
                  }
                  _loc6_++;
                  this.congratulateable = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 4:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: TrendInfo.timestamp cannot be set twice.");
                  }
                  _loc9_++;
                  this.timestamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  this.contents.push(ReadUtils.read$TYPE_MESSAGE(param1,new Para()));
                  continue;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: TrendInfo.iscongratulate cannot be set twice.");
                  }
                  _loc7_++;
                  this.iscongratulate = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
