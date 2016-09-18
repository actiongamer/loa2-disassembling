package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class PlayerSeeFriendInfoRes extends Message
   {
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.PlayerSeeFriendInfoRes.name","name",8 | 2);
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PlayerSeeFriendInfoRes.id","id",16 | 0);
      
      public static const LV:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerSeeFriendInfoRes.lv","lv",24 | 0);
      
      public static const OFFTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerSeeFriendInfoRes.offtime","offtime",32 | 0);
       
      
      public var name:String;
      
      public var id:UInt64;
      
      private var lv$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var offtime$field:uint;
      
      public function PlayerSeeFriendInfoRes()
      {
         super();
      }
      
      public function clearLv() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         lv$field = new uint();
      }
      
      public function get hasLv() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set lv(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         lv$field = param1;
      }
      
      public function get lv() : uint
      {
         return lv$field;
      }
      
      public function clearOfftime() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         offtime$field = new uint();
      }
      
      public function get hasOfftime() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set offtime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         offtime$field = param1;
      }
      
      public function get offtime() : uint
      {
         return offtime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         if(hasLv)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,lv$field);
         }
         if(hasOfftime)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,offtime$field);
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
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerSeeFriendInfoRes.name cannot be set twice.");
                  }
                  _loc3_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerSeeFriendInfoRes.id cannot be set twice.");
                  }
                  _loc6_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerSeeFriendInfoRes.lv cannot be set twice.");
                  }
                  _loc7_++;
                  this.lv = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerSeeFriendInfoRes.offtime cannot be set twice.");
                  }
                  _loc5_++;
                  this.offtime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
