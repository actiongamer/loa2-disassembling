package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyCreateReq extends Message
   {
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyCreateReq.name","name",8 | 2);
       
      
      public var name:String;
      
      public function FamilyCreateReq()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_STRING(param1,this.name);
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
                  throw new IOError("Bad data format: FamilyCreateReq.name cannot be set twice.");
               }
               _loc3_++;
               this.name = ReadUtils.read$TYPE_STRING(param1);
            }
            else
            {
               super.readUnknown(param1,_loc4_);
            }
         }
      }
   }
}
