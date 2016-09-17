package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class SystemTimeNotify extends Message
   {
      
      public static const TIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.SystemTimeNotify.timeStamp","timeStamp",8 | 0);
      
      public static const TIMEZONE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.SystemTimeNotify.timeZone","timeZone",16 | 0);
       
      
      private var timeStamp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var timeZone$field:int;
      
      public function SystemTimeNotify()
      {
         super();
      }
      
      public function clearTimeStamp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         timeStamp$field = new uint();
      }
      
      public function get hasTimeStamp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set timeStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         timeStamp$field = param1;
      }
      
      public function get timeStamp() : uint
      {
         return timeStamp$field;
      }
      
      public function clearTimeZone() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         timeZone$field = new int();
      }
      
      public function get hasTimeZone() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set timeZone(param1:int) : void
      {
         hasField$0 = hasField$0 | 2;
         timeZone$field = param1;
      }
      
      public function get timeZone() : int
      {
         return timeZone$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasTimeStamp)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,timeStamp$field);
         }
         if(hasTimeZone)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_INT32(param1,timeZone$field);
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
                     throw new IOError("Bad data format: SystemTimeNotify.timeStamp cannot be set twice.");
                  }
                  _loc3_++;
                  this.timeStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: SystemTimeNotify.timeZone cannot be set twice.");
                  }
                  _loc5_++;
                  this.timeZone = ReadUtils.read$TYPE_INT32(param1);
                  continue;
            }
         }
      }
   }
}
