package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FourteenDayShopBuyTimesRes extends Message
   {
      
      public static const BUYTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FourteenDayShopBuyTimesRes.buyTime","buyTime",8 | 0);
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FourteenDayShopBuyTimesRes.id","id",16 | 0);
       
      
      private var buyTime$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var id$field:uint;
      
      public function FourteenDayShopBuyTimesRes()
      {
         super();
      }
      
      public function clearBuyTime() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         buyTime$field = new uint();
      }
      
      public function get hasBuyTime() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set buyTime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         buyTime$field = param1;
      }
      
      public function get buyTime() : uint
      {
         return buyTime$field;
      }
      
      public function clearId() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         id$field = param1;
      }
      
      public function get id() : uint
      {
         return id$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasBuyTime)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,buyTime$field);
         }
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
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
                     throw new IOError("Bad data format: FourteenDayShopBuyTimesRes.buyTime cannot be set twice.");
                  }
                  _loc3_++;
                  this.buyTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FourteenDayShopBuyTimesRes.id cannot be set twice.");
                  }
                  _loc5_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
