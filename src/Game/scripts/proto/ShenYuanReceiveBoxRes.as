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
   
   public class ShenYuanReceiveBoxRes extends Message
   {
      
      public static const LUCKVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ShenYuanReceiveBoxRes.luckValue","luckValue",8 | 0);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ShenYuanReceiveBoxRes.reward","reward",16 | 2,Reward);
       
      
      private var luckValue$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var reward:Array;
      
      public function ShenYuanReceiveBoxRes()
      {
         reward = [];
         super();
      }
      
      public function clearLuckValue() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         luckValue$field = new uint();
      }
      
      public function get hasLuckValue() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set luckValue(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         luckValue$field = param1;
      }
      
      public function get luckValue() : uint
      {
         return luckValue$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasLuckValue)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,luckValue$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc2_]);
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
                     throw new IOError("Bad data format: ShenYuanReceiveBoxRes.luckValue cannot be set twice.");
                  }
                  _loc4_++;
                  this.luckValue = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Reward()));
                  continue;
            }
         }
      }
   }
}
