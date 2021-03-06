package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CompeteGroupStageInfoRes extends Message
   {
      
      public static const STAGES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.CompeteGroupStageInfoRes.stages","stages",8 | 2,CompeteStageDisplayInfo);
      
      public static const WINNERDISPLAYINDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompeteGroupStageInfoRes.winnerDisplayIndex","winnerDisplayIndex",16 | 0);
       
      
      public var stages:Array;
      
      private var winnerDisplayIndex$field:int;
      
      private var hasField$0:uint = 0;
      
      public function CompeteGroupStageInfoRes()
      {
         stages = [];
         super();
      }
      
      public function clearWinnerDisplayIndex() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         winnerDisplayIndex$field = new int();
      }
      
      public function get hasWinnerDisplayIndex() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set winnerDisplayIndex(param1:int) : void
      {
         hasField$0 = hasField$0 | 1;
         winnerDisplayIndex$field = param1;
      }
      
      public function get winnerDisplayIndex() : int
      {
         return winnerDisplayIndex$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.stages.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.stages[_loc2_]);
            _loc2_++;
         }
         if(hasWinnerDisplayIndex)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_INT32(param1,winnerDisplayIndex$field);
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
         var _loc4_:* = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  this.stages.push(ReadUtils.read$TYPE_MESSAGE(param1,new CompeteStageDisplayInfo()));
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteGroupStageInfoRes.winnerDisplayIndex cannot be set twice.");
                  }
                  _loc3_++;
                  this.winnerDisplayIndex = ReadUtils.read$TYPE_INT32(param1);
                  continue;
            }
         }
      }
   }
}
