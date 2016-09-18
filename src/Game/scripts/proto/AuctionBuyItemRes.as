package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class AuctionBuyItemRes extends Message
   {
      
      public static const ITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.AuctionBuyItemRes.item","item",8 | 2,proto.AuctionItem);
      
      public static const ISONCEPRICESUC:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.AuctionBuyItemRes.isOncePriceSuc","isOncePriceSuc",16 | 0);
       
      
      private var item$field:proto.AuctionItem;
      
      private var isOncePriceSuc$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function AuctionBuyItemRes()
      {
         super();
      }
      
      public function clearItem() : void
      {
         item$field = null;
      }
      
      public function get hasItem() : Boolean
      {
         return item$field != null;
      }
      
      public function set item(param1:proto.AuctionItem) : void
      {
         item$field = param1;
      }
      
      public function get item() : proto.AuctionItem
      {
         return item$field;
      }
      
      public function clearIsOncePriceSuc() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         isOncePriceSuc$field = new Boolean();
      }
      
      public function get hasIsOncePriceSuc() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set isOncePriceSuc(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         isOncePriceSuc$field = param1;
      }
      
      public function get isOncePriceSuc() : Boolean
      {
         return isOncePriceSuc$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasItem)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,item$field);
         }
         if(hasIsOncePriceSuc)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_BOOL(param1,isOncePriceSuc$field);
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
                     throw new IOError("Bad data format: AuctionBuyItemRes.item cannot be set twice.");
                  }
                  _loc5_++;
                  this.item = new proto.AuctionItem();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.item);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionBuyItemRes.isOncePriceSuc cannot be set twice.");
                  }
                  _loc3_++;
                  this.isOncePriceSuc = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
