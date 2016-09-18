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
   
   public class StaticStartTmAndRoundModel extends Message
   {
      
      public static const START_TM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticStartTmAndRoundModel.start_tm","startTm",8 | 0);
      
      public static const ROUND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticStartTmAndRoundModel.round","round",16 | 0);
      
      public static const STARTDATE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticStartTmAndRoundModel.startDate","startDate",24 | 2);
       
      
      private var start_tm$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var round$field:uint;
      
      private var startDate$field:String;
      
      public function StaticStartTmAndRoundModel()
      {
         super();
      }
      
      public function clearStartTm() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         start_tm$field = new uint();
      }
      
      public function get hasStartTm() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set startTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         start_tm$field = param1;
      }
      
      public function get startTm() : uint
      {
         return start_tm$field;
      }
      
      public function clearRound() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         round$field = new uint();
      }
      
      public function get hasRound() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set round(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         round$field = param1;
      }
      
      public function get round() : uint
      {
         return round$field;
      }
      
      public function clearStartDate() : void
      {
         startDate$field = null;
      }
      
      public function get hasStartDate() : Boolean
      {
         return startDate$field != null;
      }
      
      public function set startDate(param1:String) : void
      {
         startDate$field = param1;
      }
      
      public function get startDate() : String
      {
         return startDate$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasStartTm)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,start_tm$field);
         }
         if(hasRound)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,round$field);
         }
         if(hasStartDate)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,startDate$field);
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
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticStartTmAndRoundModel.startTm cannot be set twice.");
                  }
                  _loc6_++;
                  this.startTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticStartTmAndRoundModel.round cannot be set twice.");
                  }
                  _loc5_++;
                  this.round = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticStartTmAndRoundModel.startDate cannot be set twice.");
                  }
                  _loc3_++;
                  this.startDate = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
