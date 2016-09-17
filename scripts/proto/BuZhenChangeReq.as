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
   
   public class BuZhenChangeReq extends Message
   {
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BuZhenChangeReq.kind","kind",8 | 0);
      
      public static const FROM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BuZhenChangeReq.from","from",16 | 0);
      
      public static const TO:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BuZhenChangeReq.to","__to",24 | 0);
      
      public static const HERO:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BuZhenChangeReq.hero","hero",32 | 0);
       
      
      public var kind:uint;
      
      private var from$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var to$field:uint;
      
      private var hero$field:UInt64;
      
      public function BuZhenChangeReq()
      {
         super();
      }
      
      public function clearFrom() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         from$field = new uint();
      }
      
      public function get hasFrom() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set from(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         from$field = param1;
      }
      
      public function get from() : uint
      {
         return from$field;
      }
      
      public function clearTo() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         to$field = new uint();
      }
      
      public function get hasTo() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set __to(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         to$field = param1;
      }
      
      public function get __to() : uint
      {
         return to$field;
      }
      
      public function clearHero() : void
      {
         hero$field = null;
      }
      
      public function get hasHero() : Boolean
      {
         return hero$field != null;
      }
      
      public function set hero(param1:UInt64) : void
      {
         hero$field = param1;
      }
      
      public function get hero() : UInt64
      {
         return hero$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.kind);
         if(hasFrom)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,from$field);
         }
         if(hasTo)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,to$field);
         }
         if(hasHero)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT64(param1,hero$field);
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
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BuZhenChangeReq.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BuZhenChangeReq.from cannot be set twice.");
                  }
                  _loc4_++;
                  this.from = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BuZhenChangeReq.__to cannot be set twice.");
                  }
                  _loc6_++;
                  this.__to = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BuZhenChangeReq.hero cannot be set twice.");
                  }
                  _loc7_++;
                  this.hero = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
