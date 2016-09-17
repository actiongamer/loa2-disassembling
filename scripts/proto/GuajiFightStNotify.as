package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GuajiFightStNotify extends Message
   {
      
      public static const ISFIGHT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GuajiFightStNotify.isFight","isFight",8 | 0);
       
      
      private var isFight$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function GuajiFightStNotify()
      {
         super();
      }
      
      public function clearIsFight() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         isFight$field = new Boolean();
      }
      
      public function get hasIsFight() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set isFight(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         isFight$field = param1;
      }
      
      public function get isFight() : Boolean
      {
         return isFight$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasIsFight)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_BOOL(param1,isFight$field);
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
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            if(!((_loc4_ >> 3) - 1))
            {
               if(_loc3_ != 0)
               {
                  throw new IOError("Bad data format: GuajiFightStNotify.isFight cannot be set twice.");
               }
               _loc3_++;
               this.isFight = ReadUtils.read$TYPE_BOOL(param1);
            }
            else
            {
               super.readUnknown(param1,_loc4_);
            }
         }
      }
   }
}
