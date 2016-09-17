package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class MobileCheckGetCodeReq extends Message
   {
      
      public static const MOBILENUM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.MobileCheckGetCodeReq.mobilenum","mobilenum",8 | 2);
       
      
      public var mobilenum:String;
      
      public function MobileCheckGetCodeReq()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_STRING(param1,this.mobilenum);
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
                  throw new IOError("Bad data format: MobileCheckGetCodeReq.mobilenum cannot be set twice.");
               }
               _loc4_++;
               this.mobilenum = ReadUtils.read$TYPE_STRING(param1);
            }
            else
            {
               super.readUnknown(param1,_loc3_);
            }
         }
      }
   }
}
