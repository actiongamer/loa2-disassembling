package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FacebookInviteRes extends Message
   {
      
      public static const TIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FacebookInviteRes.times","times",8 | 0);
       
      
      private var times$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function FacebookInviteRes()
      {
         super();
      }
      
      public function clearTimes() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         times$field = new uint();
      }
      
      public function get hasTimes() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set times(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         times$field = param1;
      }
      
      public function get times() : uint
      {
         return times$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasTimes)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,times$field);
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
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            if(!((_loc3_ >> 3) - 1))
            {
               if(_loc4_ != 0)
               {
                  throw new IOError("Bad data format: FacebookInviteRes.times cannot be set twice.");
               }
               _loc4_++;
               this.times = ReadUtils.read$TYPE_UINT32(param1);
            }
            else
            {
               super.readUnknown(param1,_loc3_);
            }
         }
      }
   }
}
