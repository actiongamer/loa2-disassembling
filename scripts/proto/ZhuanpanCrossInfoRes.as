package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ZhuanpanCrossInfoRes extends Message
   {
      
      public static const SCORE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.ZhuanpanCrossInfoRes.score","score",8 | 0);
      
      public static const INFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ZhuanpanCrossInfoRes.info","info",16 | 2,MineSweepShopInfo);
      
      public static const SCOREGETS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.ZhuanpanCrossInfoRes.scoregets","scoregets",24 | 0);
       
      
      public var score:int;
      
      public var info:Array;
      
      public var scoregets:Array;
      
      public function ZhuanpanCrossInfoRes()
      {
         info = [];
         scoregets = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc4_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_INT32(param1,this.score);
         _loc2_ = uint(0);
         while(_loc2_ < this.info.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.info[_loc2_]);
            _loc2_++;
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.scoregets.length)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,this.scoregets[_loc4_]);
            _loc4_++;
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
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
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ZhuanpanCrossInfoRes.score cannot be set twice.");
                  }
                  _loc4_++;
                  this.score = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 1:
                  this.info.push(ReadUtils.read$TYPE_MESSAGE(param1,new MineSweepShopInfo()));
                  continue;
               case 2:
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.scoregets);
                  }
                  else
                  {
                     this.scoregets.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
            }
         }
      }
   }
}
