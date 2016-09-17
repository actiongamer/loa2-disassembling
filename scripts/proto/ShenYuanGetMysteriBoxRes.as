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
   
   public class ShenYuanGetMysteriBoxRes extends Message
   {
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ShenYuanGetMysteriBoxRes.reward","reward",8 | 2,Reward);
      
      public static const LUCKVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ShenYuanGetMysteriBoxRes.luckValue","luckValue",16 | 0);
      
      public static const BOXOPENNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ShenYuanGetMysteriBoxRes.boxOpenNum","boxOpenNum",24 | 0);
       
      
      public var reward:Array;
      
      private var luckValue$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var boxOpenNum$field:uint;
      
      public function ShenYuanGetMysteriBoxRes()
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
      
      public function clearBoxOpenNum() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         boxOpenNum$field = new uint();
      }
      
      public function get hasBoxOpenNum() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set boxOpenNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         boxOpenNum$field = param1;
      }
      
      public function get boxOpenNum() : uint
      {
         return boxOpenNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc2_]);
            _loc2_++;
         }
         if(hasLuckValue)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,luckValue$field);
         }
         if(hasBoxOpenNum)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,boxOpenNum$field);
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
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Reward()));
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ShenYuanGetMysteriBoxRes.luckValue cannot be set twice.");
                  }
                  _loc5_++;
                  this.luckValue = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ShenYuanGetMysteriBoxRes.boxOpenNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.boxOpenNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
