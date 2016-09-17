package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   
   public class RetrivalInfoRes extends Message
   {
      
      public static const RES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.RetrivalInfoRes.res","res",8 | 2,MapKey32ValueReward);
      
      public static const NOWNUM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.RetrivalInfoRes.nowNum","nowNum",16 | 2,MapKey32Value32);
      
      public static const NUM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.RetrivalInfoRes.num","num",24 | 2,MapKey32Value32);
       
      
      public var res:Array;
      
      public var nowNum:Array;
      
      public var num:Array;
      
      public function RetrivalInfoRes()
      {
         res = [];
         nowNum = [];
         num = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.res.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.res[_loc2_]);
            _loc2_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.nowNum.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.nowNum[_loc3_]);
            _loc3_++;
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.num.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.num[_loc4_]);
            _loc4_++;
         }
         var _loc7_:int = 0;
         var _loc6_:* = this;
         for(var _loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  this.res.push(ReadUtils.read$TYPE_MESSAGE(param1,new MapKey32ValueReward()));
                  continue;
               case 1:
                  this.nowNum.push(ReadUtils.read$TYPE_MESSAGE(param1,new MapKey32Value32()));
                  continue;
               case 2:
                  this.num.push(ReadUtils.read$TYPE_MESSAGE(param1,new MapKey32Value32()));
                  continue;
            }
         }
      }
   }
}
