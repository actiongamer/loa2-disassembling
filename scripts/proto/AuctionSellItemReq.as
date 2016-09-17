package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class AuctionSellItemReq extends Message
   {
      
      public static const TMKIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.AuctionSellItemReq.tmKind","tmKind",8 | 0);
      
      public static const SELLKIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.AuctionSellItemReq.sellKind","sellKind",16 | 0);
      
      public static const PRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.AuctionSellItemReq.price","price",24 | 0);
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.AuctionSellItemReq.id","id",32 | 0);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.AuctionSellItemReq.count","count",40 | 0);
      
      public static const ONCEPRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.AuctionSellItemReq.oncePrice","oncePrice",48 | 0);
       
      
      public var tmKind:uint;
      
      public var sellKind:uint;
      
      public var price:uint;
      
      private var id$field:UInt64;
      
      private var count$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var oncePrice$field:uint;
      
      public function AuctionSellItemReq()
      {
         super();
      }
      
      public function clearId() : void
      {
         id$field = null;
      }
      
      public function get hasId() : Boolean
      {
         return id$field != null;
      }
      
      public function set id(param1:UInt64) : void
      {
         id$field = param1;
      }
      
      public function get id() : UInt64
      {
         return id$field;
      }
      
      public function clearCount() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         count$field = new uint();
      }
      
      public function get hasCount() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set count(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         count$field = param1;
      }
      
      public function get count() : uint
      {
         return count$field;
      }
      
      public function clearOncePrice() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         oncePrice$field = new uint();
      }
      
      public function get hasOncePrice() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set oncePrice(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         oncePrice$field = param1;
      }
      
      public function get oncePrice() : uint
      {
         return oncePrice$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.tmKind);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.sellKind);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.price);
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT64(param1,id$field);
         }
         if(hasCount)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,count$field);
         }
         if(hasOncePrice)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,oncePrice$field);
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
         var _loc5_:* = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc6_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionSellItemReq.tmKind cannot be set twice.");
                  }
                  _loc4_++;
                  this.tmKind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionSellItemReq.sellKind cannot be set twice.");
                  }
                  _loc3_++;
                  this.sellKind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionSellItemReq.price cannot be set twice.");
                  }
                  _loc7_++;
                  this.price = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionSellItemReq.id cannot be set twice.");
                  }
                  _loc8_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionSellItemReq.count cannot be set twice.");
                  }
                  _loc6_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionSellItemReq.oncePrice cannot be set twice.");
                  }
                  _loc9_++;
                  this.oncePrice = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
