package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BkStageEndNotify extends Message
   {
      
      public static const WINNERSIDE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkStageEndNotify.winnerSide","winnerSide",8 | 0);
      
      public static const REPORTINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BkStageEndNotify.reportInfos","reportInfos",16 | 2,BkStageReportInfo);
       
      
      private var winnerSide$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var reportInfos:Array;
      
      public function BkStageEndNotify()
      {
         reportInfos = [];
         super();
      }
      
      public function clearWinnerSide() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         winnerSide$field = new uint();
      }
      
      public function get hasWinnerSide() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set winnerSide(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         winnerSide$field = param1;
      }
      
      public function get winnerSide() : uint
      {
         return winnerSide$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasWinnerSide)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,winnerSide$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.reportInfos.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reportInfos[_loc2_]);
            _loc2_++;
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
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BkStageEndNotify.winnerSide cannot be set twice.");
                  }
                  _loc3_++;
                  this.winnerSide = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.reportInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new BkStageReportInfo()));
                  continue;
            }
         }
      }
   }
}
