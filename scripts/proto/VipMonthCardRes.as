package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class VipMonthCardRes extends Message
   {
      
      public static const BIGCARD:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.VipMonthCardRes.bigCard","bigCard",8 | 0);
      
      public static const SMALLCARD:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.VipMonthCardRes.smallCard","smallCard",16 | 0);
       
      
      private var bigCard$field:int;
      
      private var hasField$0:uint = 0;
      
      private var smallCard$field:int;
      
      public function VipMonthCardRes()
      {
         super();
      }
      
      public function clearBigCard() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         bigCard$field = new int();
      }
      
      public function get hasBigCard() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set bigCard(param1:int) : void
      {
         hasField$0 = hasField$0 | 1;
         bigCard$field = param1;
      }
      
      public function get bigCard() : int
      {
         return bigCard$field;
      }
      
      public function clearSmallCard() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         smallCard$field = new int();
      }
      
      public function get hasSmallCard() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set smallCard(param1:int) : void
      {
         hasField$0 = hasField$0 | 2;
         smallCard$field = param1;
      }
      
      public function get smallCard() : int
      {
         return smallCard$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasBigCard)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_INT32(param1,bigCard$field);
         }
         if(hasSmallCard)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_INT32(param1,smallCard$field);
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
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: VipMonthCardRes.bigCard cannot be set twice.");
                  }
                  _loc5_++;
                  this.bigCard = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: VipMonthCardRes.smallCard cannot be set twice.");
                  }
                  _loc3_++;
                  this.smallCard = ReadUtils.read$TYPE_INT32(param1);
                  continue;
            }
         }
      }
   }
}
