package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class MjtxRankInfo extends Message
   {
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.MjtxRankInfo.baseInfo","baseInfo",8 | 2,proto.PlayerBaseInfo);
      
      public static const NUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MjtxRankInfo.num","num",16 | 0);
       
      
      private var baseInfo$field:proto.PlayerBaseInfo;
      
      private var num$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function MjtxRankInfo()
      {
         super();
      }
      
      public function clearBaseInfo() : void
      {
         baseInfo$field = null;
      }
      
      public function get hasBaseInfo() : Boolean
      {
         return baseInfo$field != null;
      }
      
      public function set baseInfo(param1:proto.PlayerBaseInfo) : void
      {
         baseInfo$field = param1;
      }
      
      public function get baseInfo() : proto.PlayerBaseInfo
      {
         return baseInfo$field;
      }
      
      public function clearNum() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         num$field = new uint();
      }
      
      public function get hasNum() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set num(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         num$field = param1;
      }
      
      public function get num() : uint
      {
         return num$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasBaseInfo)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,baseInfo$field);
         }
         if(hasNum)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,num$field);
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
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: MjtxRankInfo.baseInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.baseInfo = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseInfo);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: MjtxRankInfo.num cannot be set twice.");
                  }
                  _loc5_++;
                  this.num = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
