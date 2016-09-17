package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class DragonBoatBuyRes extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.DragonBoatBuyRes.id","id",8 | 0);
      
      public static const BUYNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.DragonBoatBuyRes.buyNum","buyNum",16 | 0);
       
      
      public var id:uint;
      
      private var buyNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function DragonBoatBuyRes()
      {
         super();
      }
      
      public function clearBuyNum() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         buyNum$field = new uint();
      }
      
      public function get hasBuyNum() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set buyNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         buyNum$field = param1;
      }
      
      public function get buyNum() : uint
      {
         return buyNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         if(hasBuyNum)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,buyNum$field);
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
                     throw new IOError("Bad data format: DragonBoatBuyRes.id cannot be set twice.");
                  }
                  _loc5_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: DragonBoatBuyRes.buyNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.buyNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
