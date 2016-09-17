package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ShopListRes extends Message
   {
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ShopListRes.kind","kind",8 | 0);
      
      public static const ID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.ShopListRes.id","id",16 | 0);
      
      public static const INFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ShopListRes.info","info",24 | 2,ShopBuyInfo);
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ShopListRes.time","time",32 | 0);
      
      public static const FRESH:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ShopListRes.fresh","fresh",40 | 0);
      
      public static const FRESHBUY:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.ShopListRes.freshBuy","freshBuy",48 | 0);
      
      public static const CONSUMENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ShopListRes.consumeNum","consumeNum",56 | 0);
      
      public static const FREE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ShopListRes.free","free",64 | 0);
      
      public static const LOCKITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ShopListRes.lockItem","lockItem",72 | 2,proto.BoolMap);
      
      public static const LOCKFRESHBUY:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.ShopListRes.lockFreshBuy","lockFreshBuy",80 | 0);
      
      public static const FRESHLOCKITEM:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.ShopListRes.freshLockItem","freshLockItem",88 | 0);
       
      
      public var kind:uint;
      
      public var id:Array;
      
      public var info:Array;
      
      private var time$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var fresh$field:uint;
      
      public var freshBuy:Array;
      
      private var consumeNum$field:uint;
      
      private var free$field:uint;
      
      private var lockItem$field:proto.BoolMap;
      
      public var lockFreshBuy:Array;
      
      private var freshLockItem$field:Boolean;
      
      public function ShopListRes()
      {
         id = [];
         info = [];
         freshBuy = [];
         lockFreshBuy = [];
         super();
      }
      
      public function clearTime() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         time$field = new uint();
      }
      
      public function get hasTime() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set time(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         time$field = param1;
      }
      
      public function get time() : uint
      {
         return time$field;
      }
      
      public function clearFresh() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         fresh$field = new uint();
      }
      
      public function get hasFresh() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set fresh(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         fresh$field = param1;
      }
      
      public function get fresh() : uint
      {
         return fresh$field;
      }
      
      public function clearConsumeNum() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         consumeNum$field = new uint();
      }
      
      public function get hasConsumeNum() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set consumeNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         consumeNum$field = param1;
      }
      
      public function get consumeNum() : uint
      {
         return consumeNum$field;
      }
      
      public function clearFree() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         free$field = new uint();
      }
      
      public function get hasFree() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set free(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         free$field = param1;
      }
      
      public function get free() : uint
      {
         return free$field;
      }
      
      public function clearLockItem() : void
      {
         lockItem$field = null;
      }
      
      public function get hasLockItem() : Boolean
      {
         return lockItem$field != null;
      }
      
      public function set lockItem(param1:proto.BoolMap) : void
      {
         lockItem$field = param1;
      }
      
      public function get lockItem() : proto.BoolMap
      {
         return lockItem$field;
      }
      
      public function clearFreshLockItem() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         freshLockItem$field = new Boolean();
      }
      
      public function get hasFreshLockItem() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set freshLockItem(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 16;
         freshLockItem$field = param1;
      }
      
      public function get freshLockItem() : Boolean
      {
         return freshLockItem$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc4_:* = 0;
         var _loc6_:* = 0;
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.kind);
         _loc2_ = uint(0);
         while(_loc2_ < this.id.length)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,this.id[_loc2_]);
            _loc2_++;
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.info.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.info[_loc4_]);
            _loc4_++;
         }
         if(hasTime)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,time$field);
         }
         if(hasFresh)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,fresh$field);
         }
         _loc6_ = uint(0);
         while(_loc6_ < this.freshBuy.length)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,this.freshBuy[_loc6_]);
            _loc6_++;
         }
         if(hasConsumeNum)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,consumeNum$field);
         }
         if(hasFree)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,free$field);
         }
         if(hasLockItem)
         {
            WriteUtils.writeTag(param1,2,9);
            WriteUtils.write$TYPE_MESSAGE(param1,lockItem$field);
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.lockFreshBuy.length)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,this.lockFreshBuy[_loc3_]);
            _loc3_++;
         }
         if(hasFreshLockItem)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_BOOL(param1,freshLockItem$field);
         }
         var _loc8_:int = 0;
         var _loc7_:* = this;
         for(var _loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:* = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc8_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ShopListRes.kind cannot be set twice.");
                  }
                  _loc4_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if((_loc8_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.id);
                  }
                  else
                  {
                     this.id.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 2:
                  this.info.push(ReadUtils.read$TYPE_MESSAGE(param1,new ShopBuyInfo()));
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ShopListRes.time cannot be set twice.");
                  }
                  _loc3_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: ShopListRes.fresh cannot be set twice.");
                  }
                  _loc7_++;
                  this.fresh = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if((_loc8_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.freshBuy);
                  }
                  else
                  {
                     this.freshBuy.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 6:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ShopListRes.consumeNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.consumeNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: ShopListRes.free cannot be set twice.");
                  }
                  _loc9_++;
                  this.free = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: ShopListRes.lockItem cannot be set twice.");
                  }
                  _loc10_++;
                  this.lockItem = new proto.BoolMap();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.lockItem);
                  continue;
               case 9:
                  if((_loc8_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.lockFreshBuy);
                  }
                  else
                  {
                     this.lockFreshBuy.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 10:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: ShopListRes.freshLockItem cannot be set twice.");
                  }
                  _loc6_++;
                  this.freshLockItem = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
