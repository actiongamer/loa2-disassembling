package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GetStageInfoReq extends Message
   {
      
      public static const CHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetStageInfoReq.chapterId","chapterId",8 | 0);
       
      
      private var chapterId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function GetStageInfoReq()
      {
         super();
      }
      
      public function clearChapterId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         chapterId$field = new uint();
      }
      
      public function get hasChapterId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set chapterId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         chapterId$field = param1;
      }
      
      public function get chapterId() : uint
      {
         return chapterId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasChapterId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,chapterId$field);
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
                  throw new IOError("Bad data format: GetStageInfoReq.chapterId cannot be set twice.");
               }
               _loc4_++;
               this.chapterId = ReadUtils.read$TYPE_UINT32(param1);
            }
            else
            {
               super.readUnknown(param1,_loc3_);
            }
         }
      }
   }
}
