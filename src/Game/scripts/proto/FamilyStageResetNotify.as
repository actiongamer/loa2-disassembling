package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyStageResetNotify extends Message
   {
      
      public static const CHAPTERINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyStageResetNotify.chapterinfo","chapterinfo",8 | 2,proto.FamilyStageChapterInfo);
       
      
      public var chapterinfo:proto.FamilyStageChapterInfo;
      
      public function FamilyStageResetNotify()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.chapterinfo);
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
                  throw new IOError("Bad data format: FamilyStageResetNotify.chapterinfo cannot be set twice.");
               }
               _loc3_++;
               this.chapterinfo = new proto.FamilyStageChapterInfo();
               ReadUtils.read$TYPE_MESSAGE(param1,this.chapterinfo);
            }
            else
            {
               super.readUnknown(param1,_loc4_);
            }
         }
      }
   }
}
