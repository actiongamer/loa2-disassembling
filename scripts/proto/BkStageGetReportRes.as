package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BkStageGetReportRes extends Message
   {
      
      public static const REPORTINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BkStageGetReportRes.reportInfos","reportInfos",8 | 2,BkStageReportInfo);
      
      public static const END:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.BkStageGetReportRes.end","end",16 | 0);
       
      
      public var reportInfos:Array;
      
      private var end$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function BkStageGetReportRes()
      {
         reportInfos = [];
         super();
      }
      
      public function clearEnd() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         end$field = new Boolean();
      }
      
      public function get hasEnd() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set end(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         end$field = param1;
      }
      
      public function get end() : Boolean
      {
         return end$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.reportInfos.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reportInfos[_loc2_]);
            _loc2_++;
         }
         if(hasEnd)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_BOOL(param1,end$field);
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  this.reportInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new BkStageReportInfo()));
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BkStageGetReportRes.end cannot be set twice.");
                  }
                  _loc4_++;
                  this.end = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
