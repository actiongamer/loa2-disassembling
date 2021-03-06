package proto.BagItemUseReq
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class UseInfo extends Message
   {
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BagItemUseReq.UseInfo.itemId","itemId",8 | 0);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BagItemUseReq.UseInfo.count","count",16 | 0);
      
      public static const CHOICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BagItemUseReq.UseInfo.choice","choice",24 | 0);
       
      
      public var itemId:UInt64;
      
      public var count:uint;
      
      private var choice$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function UseInfo()
      {
         super();
      }
      
      public function clearChoice() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         choice$field = new uint();
      }
      
      public function get hasChoice() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set choice(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         choice$field = param1;
      }
      
      public function get choice() : uint
      {
         return choice$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.itemId);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.count);
         if(hasChoice)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,choice$field);
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
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: UseInfo.itemId cannot be set twice.");
                  }
                  _loc3_++;
                  this.itemId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: UseInfo.count cannot be set twice.");
                  }
                  _loc5_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: UseInfo.choice cannot be set twice.");
                  }
                  _loc6_++;
                  this.choice = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
