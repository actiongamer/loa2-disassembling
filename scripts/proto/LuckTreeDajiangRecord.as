package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class LuckTreeDajiangRecord extends Message
   {
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.LuckTreeDajiangRecord.playerid","playerid",8 | 0);
      
      public static const TIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeDajiangRecord.timestamp","timestamp",16 | 0);
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeDajiangRecord.itemid","itemid",24 | 0);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeDajiangRecord.level","level",32 | 0);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeDajiangRecord.kind","kind",40 | 0);
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.LuckTreeDajiangRecord.baseinfo","baseinfo",48 | 2,proto.PlayerBaseInfo);
      
      public static const AUTOID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeDajiangRecord.autoid","autoid",56 | 0);
       
      
      public var playerid:UInt64;
      
      public var timestamp:uint;
      
      public var itemid:uint;
      
      public var level:uint;
      
      public var kind:uint;
      
      public var baseinfo:proto.PlayerBaseInfo;
      
      private var autoid$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function LuckTreeDajiangRecord()
      {
         super();
      }
      
      public function clearAutoid() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         autoid$field = new uint();
      }
      
      public function get hasAutoid() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set autoid(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         autoid$field = param1;
      }
      
      public function get autoid() : uint
      {
         return autoid$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.playerid);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.timestamp);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.itemid);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.level);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.kind);
         WriteUtils.writeTag(param1,2,6);
         WriteUtils.write$TYPE_MESSAGE(param1,this.baseinfo);
         if(hasAutoid)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,autoid$field);
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
         var _loc5_:uint = 0;
         var _loc9_:uint = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc10_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc8_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeDajiangRecord.playerid cannot be set twice.");
                  }
                  _loc5_++;
                  this.playerid = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeDajiangRecord.timestamp cannot be set twice.");
                  }
                  _loc9_++;
                  this.timestamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeDajiangRecord.itemid cannot be set twice.");
                  }
                  _loc6_++;
                  this.itemid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeDajiangRecord.level cannot be set twice.");
                  }
                  _loc4_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeDajiangRecord.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeDajiangRecord.baseinfo cannot be set twice.");
                  }
                  _loc10_++;
                  this.baseinfo = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseinfo);
                  continue;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeDajiangRecord.autoid cannot be set twice.");
                  }
                  _loc7_++;
                  this.autoid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
