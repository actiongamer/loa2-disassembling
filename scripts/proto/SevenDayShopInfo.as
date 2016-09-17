package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class SevenDayShopInfo extends Message
   {
      
      public static const STATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.SevenDayShopInfo.status","status",8 | 0,SD_STATUS);
      
      public static const BUYCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.SevenDayShopInfo.buyCount","buyCount",16 | 0);
      
      public static const LIMITNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.SevenDayShopInfo.limitNum","limitNum",24 | 0);
      
      public static const MYBUYCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.SevenDayShopInfo.myBuyCount","myBuyCount",32 | 0);
       
      
      public var status:int;
      
      public var buyCount:uint;
      
      public var limitNum:uint;
      
      private var myBuyCount$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function SevenDayShopInfo()
      {
         super();
      }
      
      public function clearMyBuyCount() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         myBuyCount$field = new uint();
      }
      
      public function get hasMyBuyCount() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set myBuyCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         myBuyCount$field = param1;
      }
      
      public function get myBuyCount() : uint
      {
         return myBuyCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_ENUM(param1,this.status);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.buyCount);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.limitNum);
         if(hasMyBuyCount)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,myBuyCount$field);
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
         var _loc6_:* = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: SevenDayShopInfo.status cannot be set twice.");
                  }
                  _loc5_++;
                  this.status = ReadUtils.read$TYPE_ENUM(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: SevenDayShopInfo.buyCount cannot be set twice.");
                  }
                  _loc4_++;
                  this.buyCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: SevenDayShopInfo.limitNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.limitNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: SevenDayShopInfo.myBuyCount cannot be set twice.");
                  }
                  _loc7_++;
                  this.myBuyCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
