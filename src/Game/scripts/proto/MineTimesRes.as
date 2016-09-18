package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class MineTimesRes extends Message
   {
      
      public static const GRAB:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineTimesRes.grab","grab",8 | 0);
      
      public static const STEAL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineTimesRes.steal","steal",16 | 0);
       
      
      private var grab$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var steal$field:uint;
      
      public function MineTimesRes()
      {
         super();
      }
      
      public function clearGrab() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         grab$field = new uint();
      }
      
      public function get hasGrab() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set grab(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         grab$field = param1;
      }
      
      public function get grab() : uint
      {
         return grab$field;
      }
      
      public function clearSteal() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         steal$field = new uint();
      }
      
      public function get hasSteal() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set steal(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         steal$field = param1;
      }
      
      public function get steal() : uint
      {
         return steal$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasGrab)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,grab$field);
         }
         if(hasSteal)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,steal$field);
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
                     throw new IOError("Bad data format: MineTimesRes.grab cannot be set twice.");
                  }
                  _loc4_++;
                  this.grab = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: MineTimesRes.steal cannot be set twice.");
                  }
                  _loc5_++;
                  this.steal = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
