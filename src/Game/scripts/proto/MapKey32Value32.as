package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class MapKey32Value32 extends Message
   {
      
      public static const KEY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MapKey32Value32.key","key",8 | 0);
      
      public static const VALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MapKey32Value32.value","value",16 | 0);
       
      
      private var key$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var value$field:uint;
      
      public function MapKey32Value32()
      {
         super();
      }
      
      public function clearKey() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         key$field = new uint();
      }
      
      public function get hasKey() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set key(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         key$field = param1;
      }
      
      public function get key() : uint
      {
         return key$field;
      }
      
      public function clearValue() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         value$field = new uint();
      }
      
      public function get hasValue() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set value(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         value$field = param1;
      }
      
      public function get value() : uint
      {
         return value$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasKey)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,key$field);
         }
         if(hasValue)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,value$field);
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
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: MapKey32Value32.key cannot be set twice.");
                  }
                  _loc3_++;
                  this.key = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: MapKey32Value32.value cannot be set twice.");
                  }
                  _loc4_++;
                  this.value = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
