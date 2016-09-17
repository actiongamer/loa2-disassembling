package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CompeteStageReport extends Message
   {
      
      public static const ROUNDCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CompeteStageReport.roundCount","roundCount",8 | 0);
      
      public static const WINNERPOS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompeteStageReport.winnerPos","winnerPos",16 | 0);
      
      public static const REPORTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CompeteStageReport.reportId","reportId",24 | 2);
      
      public static const CREATETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CompeteStageReport.createTime","createTime",32 | 0);
       
      
      private var roundCount$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var winnerPos$field:int;
      
      private var reportId$field:String;
      
      private var createTime$field:uint;
      
      public function CompeteStageReport()
      {
         super();
      }
      
      public function clearRoundCount() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         roundCount$field = new uint();
      }
      
      public function get hasRoundCount() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set roundCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         roundCount$field = param1;
      }
      
      public function get roundCount() : uint
      {
         return roundCount$field;
      }
      
      public function clearWinnerPos() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         winnerPos$field = new int();
      }
      
      public function get hasWinnerPos() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set winnerPos(param1:int) : void
      {
         hasField$0 = hasField$0 | 2;
         winnerPos$field = param1;
      }
      
      public function get winnerPos() : int
      {
         return winnerPos$field;
      }
      
      public function clearReportId() : void
      {
         reportId$field = null;
      }
      
      public function get hasReportId() : Boolean
      {
         return reportId$field != null;
      }
      
      public function set reportId(param1:String) : void
      {
         reportId$field = param1;
      }
      
      public function get reportId() : String
      {
         return reportId$field;
      }
      
      public function clearCreateTime() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         createTime$field = new uint();
      }
      
      public function get hasCreateTime() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set createTime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         createTime$field = param1;
      }
      
      public function get createTime() : uint
      {
         return createTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasRoundCount)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,roundCount$field);
         }
         if(hasWinnerPos)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_INT32(param1,winnerPos$field);
         }
         if(hasReportId)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,reportId$field);
         }
         if(hasCreateTime)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,createTime$field);
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
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteStageReport.roundCount cannot be set twice.");
                  }
                  _loc7_++;
                  this.roundCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteStageReport.winnerPos cannot be set twice.");
                  }
                  _loc6_++;
                  this.winnerPos = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteStageReport.reportId cannot be set twice.");
                  }
                  _loc3_++;
                  this.reportId = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteStageReport.createTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.createTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
