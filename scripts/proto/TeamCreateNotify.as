package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TeamCreateNotify extends Message
   {
      
      public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.TeamCreateNotify.info","info",8 | 2,proto.TeamBasicInfo);
       
      
      public var info:proto.TeamBasicInfo;
      
      public function TeamCreateNotify()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.info);
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
                  throw new IOError("Bad data format: TeamCreateNotify.info cannot be set twice.");
               }
               _loc4_++;
               this.info = new proto.TeamBasicInfo();
               ReadUtils.read$TYPE_MESSAGE(param1,this.info);
            }
            else
            {
               super.readUnknown(param1,_loc3_);
            }
         }
      }
   }
}
