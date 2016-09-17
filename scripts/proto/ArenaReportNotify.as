package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ArenaReportNotify extends Message
   {
      
      public static const REPORT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ArenaReportNotify.report","report",8 | 2,proto.ArenaReport);
       
      
      private var report$field:proto.ArenaReport;
      
      public function ArenaReportNotify()
      {
         super();
      }
      
      public function clearReport() : void
      {
         report$field = null;
      }
      
      public function get hasReport() : Boolean
      {
         return report$field != null;
      }
      
      public function set report(param1:proto.ArenaReport) : void
      {
         report$field = param1;
      }
      
      public function get report() : proto.ArenaReport
      {
         return report$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasReport)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,report$field);
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
                  throw new IOError("Bad data format: ArenaReportNotify.report cannot be set twice.");
               }
               _loc4_++;
               this.report = new proto.ArenaReport();
               ReadUtils.read$TYPE_MESSAGE(param1,this.report);
            }
            else
            {
               super.readUnknown(param1,_loc3_);
            }
         }
      }
   }
}
