package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyExpeSingleRankRes extends Message
   {
      
      public static const INFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeSingleRankRes.info","info",8 | 2,FamilyExpeSingleRankInfo);
      
      public static const TOTALNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeSingleRankRes.totalNum","totalNum",16 | 0);
       
      
      public var info:Array;
      
      private var totalNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function FamilyExpeSingleRankRes()
      {
         info = [];
         super();
      }
      
      public function clearTotalNum() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         totalNum$field = new uint();
      }
      
      public function get hasTotalNum() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set totalNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         totalNum$field = param1;
      }
      
      public function get totalNum() : uint
      {
         return totalNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.info.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.info[_loc2_]);
            _loc2_++;
         }
         if(hasTotalNum)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,totalNum$field);
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
                  this.info.push(ReadUtils.read$TYPE_MESSAGE(param1,new FamilyExpeSingleRankInfo()));
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeSingleRankRes.totalNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.totalNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
