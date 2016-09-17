package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ShopBuyRes extends Message
   {
      
      public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ShopBuyRes.info","info",8 | 2,proto.ShopBuyInfo);
      
      public static const LOCKFRESHBUY:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.ShopBuyRes.lockFreshBuy","lockFreshBuy",16 | 0);
      
      public static const BUYLOCKITEM:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.ShopBuyRes.buyLockItem","buyLockItem",24 | 0);
       
      
      public var info:proto.ShopBuyInfo;
      
      public var lockFreshBuy:Array;
      
      private var buyLockItem$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function ShopBuyRes()
      {
         lockFreshBuy = [];
         super();
      }
      
      public function clearBuyLockItem() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         buyLockItem$field = new Boolean();
      }
      
      public function get hasBuyLockItem() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set buyLockItem(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         buyLockItem$field = param1;
      }
      
      public function get buyLockItem() : Boolean
      {
         return buyLockItem$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.info);
         _loc2_ = uint(0);
         while(_loc2_ < this.lockFreshBuy.length)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,this.lockFreshBuy[_loc2_]);
            _loc2_++;
         }
         if(hasBuyLockItem)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_BOOL(param1,buyLockItem$field);
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
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ShopBuyRes.info cannot be set twice.");
                  }
                  _loc4_++;
                  this.info = new proto.ShopBuyInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.info);
                  continue;
               case 1:
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.lockFreshBuy);
                  }
                  else
                  {
                     this.lockFreshBuy.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ShopBuyRes.buyLockItem cannot be set twice.");
                  }
                  _loc5_++;
                  this.buyLockItem = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
