package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GuajiReport extends Message
   {
      
      public static const NPCID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiReport.npcId","npcId",8 | 0);
      
      public static const RESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiReport.result","result",16 | 0);
      
      public static const REPORTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.GuajiReport.reportId","reportId",24 | 2);
      
      public static const TURNNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiReport.turnNum","turnNum",32 | 0);
      
      public static const FIGHTCD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiReport.fightCd","fightCd",40 | 0);
       
      
      private var npcId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var result$field:uint;
      
      private var reportId$field:String;
      
      private var turnNum$field:uint;
      
      private var fightCd$field:uint;
      
      public function GuajiReport()
      {
         super();
      }
      
      public function clearNpcId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         npcId$field = new uint();
      }
      
      public function get hasNpcId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set npcId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         npcId$field = param1;
      }
      
      public function get npcId() : uint
      {
         return npcId$field;
      }
      
      public function clearResult() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         result$field = new uint();
      }
      
      public function get hasResult() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set result(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         result$field = param1;
      }
      
      public function get result() : uint
      {
         return result$field;
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
      
      public function clearTurnNum() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         turnNum$field = new uint();
      }
      
      public function get hasTurnNum() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set turnNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         turnNum$field = param1;
      }
      
      public function get turnNum() : uint
      {
         return turnNum$field;
      }
      
      public function clearFightCd() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         fightCd$field = new uint();
      }
      
      public function get hasFightCd() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set fightCd(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         fightCd$field = param1;
      }
      
      public function get fightCd() : uint
      {
         return fightCd$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasNpcId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,npcId$field);
         }
         if(hasResult)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,result$field);
         }
         if(hasReportId)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,reportId$field);
         }
         if(hasTurnNum)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,turnNum$field);
         }
         if(hasFightCd)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,fightCd$field);
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
         var _loc6_:* = 0;
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiReport.npcId cannot be set twice.");
                  }
                  _loc7_++;
                  this.npcId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiReport.result cannot be set twice.");
                  }
                  _loc5_++;
                  this.result = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiReport.reportId cannot be set twice.");
                  }
                  _loc3_++;
                  this.reportId = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiReport.turnNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.turnNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiReport.fightCd cannot be set twice.");
                  }
                  _loc8_++;
                  this.fightCd = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
