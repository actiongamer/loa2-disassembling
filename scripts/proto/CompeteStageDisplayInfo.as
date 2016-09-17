package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CompeteStageDisplayInfo extends Message
   {
      
      public static const FRONTSTAGEINDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompeteStageDisplayInfo.frontStageIndex","frontStageIndex",8 | 0);
      
      public static const WINNERINDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompeteStageDisplayInfo.winnerIndex","winnerIndex",16 | 0);
       
      
      private var frontStageIndex$field:int;
      
      private var hasField$0:uint = 0;
      
      private var winnerIndex$field:int;
      
      public function CompeteStageDisplayInfo()
      {
         super();
      }
      
      public function clearFrontStageIndex() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         frontStageIndex$field = new int();
      }
      
      public function get hasFrontStageIndex() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set frontStageIndex(param1:int) : void
      {
         hasField$0 = hasField$0 | 1;
         frontStageIndex$field = param1;
      }
      
      public function get frontStageIndex() : int
      {
         return frontStageIndex$field;
      }
      
      public function clearWinnerIndex() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         winnerIndex$field = new int();
      }
      
      public function get hasWinnerIndex() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set winnerIndex(param1:int) : void
      {
         hasField$0 = hasField$0 | 2;
         winnerIndex$field = param1;
      }
      
      public function get winnerIndex() : int
      {
         return winnerIndex$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasFrontStageIndex)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_INT32(param1,frontStageIndex$field);
         }
         if(hasWinnerIndex)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_INT32(param1,winnerIndex$field);
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
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteStageDisplayInfo.frontStageIndex cannot be set twice.");
                  }
                  _loc4_++;
                  this.frontStageIndex = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteStageDisplayInfo.winnerIndex cannot be set twice.");
                  }
                  _loc5_++;
                  this.winnerIndex = ReadUtils.read$TYPE_INT32(param1);
                  continue;
            }
         }
      }
   }
}
