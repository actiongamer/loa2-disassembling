package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TeamMemInfoNotify extends Message
   {
      
      public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.TeamMemInfoNotify.info","info",8 | 2,proto.TeamInfo);
       
      
      private var info$field:proto.TeamInfo;
      
      public function TeamMemInfoNotify()
      {
         super();
      }
      
      public function clearInfo() : void
      {
         info$field = null;
      }
      
      public function get hasInfo() : Boolean
      {
         return info$field != null;
      }
      
      public function set info(param1:proto.TeamInfo) : void
      {
         info$field = param1;
      }
      
      public function get info() : proto.TeamInfo
      {
         return info$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasInfo)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,info$field);
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
                  throw new IOError("Bad data format: TeamMemInfoNotify.info cannot be set twice.");
               }
               _loc4_++;
               this.info = new proto.TeamInfo();
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
