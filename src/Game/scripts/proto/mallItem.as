package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class mallItem extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.mallItem.id","id",8 | 0);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.mallItem.kind","kind",16 | 0);
      
      public static const POSITION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.mallItem.position","position",24 | 0);
      
      public static const ITEMS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.mallItem.items","items",32 | 2);
      
      public static const OLD_PRICE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.mallItem.old_price","oldPrice",40 | 2);
      
      public static const NOW_PRICE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.mallItem.now_price","nowPrice",48 | 2);
      
      public static const NUM_CON:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.mallItem.num_con","numCon",64 | 2);
      
      public static const BUY_CON:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.mallItem.buy_con","buyCon",72 | 2);
      
      public static const DISCOUNT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.mallItem.discount","discount",80 | 2);
      
      public static const VIP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.mallItem.vip","vip",88 | 0);
      
      public static const BANNER:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.mallItem.banner","banner",96 | 2);
      
      public static const ENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.mallItem.endTime","endTime",104 | 0);
       
      
      public var id:uint;
      
      public var kind:uint;
      
      private var position$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var items:String;
      
      public var oldPrice:String;
      
      public var nowPrice:String;
      
      private var num_con$field:String;
      
      private var buy_con$field:String;
      
      private var discount$field:String;
      
      private var vip$field:uint;
      
      private var banner$field:String;
      
      private var endTime$field:uint;
      
      public function mallItem()
      {
         super();
      }
      
      public function clearPosition() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         position$field = new uint();
      }
      
      public function get hasPosition() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set position(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         position$field = param1;
      }
      
      public function get position() : uint
      {
         return position$field;
      }
      
      public function clearNumCon() : void
      {
         num_con$field = null;
      }
      
      public function get hasNumCon() : Boolean
      {
         return num_con$field != null;
      }
      
      public function set numCon(param1:String) : void
      {
         num_con$field = param1;
      }
      
      public function get numCon() : String
      {
         return num_con$field;
      }
      
      public function clearBuyCon() : void
      {
         buy_con$field = null;
      }
      
      public function get hasBuyCon() : Boolean
      {
         return buy_con$field != null;
      }
      
      public function set buyCon(param1:String) : void
      {
         buy_con$field = param1;
      }
      
      public function get buyCon() : String
      {
         return buy_con$field;
      }
      
      public function clearDiscount() : void
      {
         discount$field = null;
      }
      
      public function get hasDiscount() : Boolean
      {
         return discount$field != null;
      }
      
      public function set discount(param1:String) : void
      {
         discount$field = param1;
      }
      
      public function get discount() : String
      {
         return discount$field;
      }
      
      public function clearVip() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         vip$field = new uint();
      }
      
      public function get hasVip() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set vip(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         vip$field = param1;
      }
      
      public function get vip() : uint
      {
         return vip$field;
      }
      
      public function clearBanner() : void
      {
         banner$field = null;
      }
      
      public function get hasBanner() : Boolean
      {
         return banner$field != null;
      }
      
      public function set banner(param1:String) : void
      {
         banner$field = param1;
      }
      
      public function get banner() : String
      {
         return banner$field;
      }
      
      public function clearEndTime() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         endTime$field = new uint();
      }
      
      public function get hasEndTime() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set endTime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         endTime$field = param1;
      }
      
      public function get endTime() : uint
      {
         return endTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.kind);
         if(hasPosition)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,position$field);
         }
         WriteUtils.writeTag(param1,2,4);
         WriteUtils.write$TYPE_STRING(param1,this.items);
         WriteUtils.writeTag(param1,2,5);
         WriteUtils.write$TYPE_STRING(param1,this.oldPrice);
         WriteUtils.writeTag(param1,2,6);
         WriteUtils.write$TYPE_STRING(param1,this.nowPrice);
         if(hasNumCon)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_STRING(param1,num_con$field);
         }
         if(hasBuyCon)
         {
            WriteUtils.writeTag(param1,2,9);
            WriteUtils.write$TYPE_STRING(param1,buy_con$field);
         }
         if(hasDiscount)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_STRING(param1,discount$field);
         }
         if(hasVip)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,vip$field);
         }
         if(hasBanner)
         {
            WriteUtils.writeTag(param1,2,12);
            WriteUtils.write$TYPE_STRING(param1,banner$field);
         }
         if(hasEndTime)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_UINT32(param1,endTime$field);
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
         var _loc8_:* = 0;
         var _loc12_:uint = 0;
         var _loc4_:uint = 0;
         var _loc15_:uint = 0;
         var _loc11_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc10_:uint = 0;
         var _loc14_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         var _loc9_:uint = 0;
         var _loc13_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc8_ >> 3) - 1)
            {
               case 0:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: mallItem.id cannot be set twice.");
                  }
                  _loc12_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: mallItem.kind cannot be set twice.");
                  }
                  _loc4_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: mallItem.position cannot be set twice.");
                  }
                  _loc15_++;
                  this.position = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: mallItem.items cannot be set twice.");
                  }
                  _loc11_++;
                  this.items = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: mallItem.oldPrice cannot be set twice.");
                  }
                  _loc6_++;
                  this.oldPrice = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: mallItem.nowPrice cannot be set twice.");
                  }
                  _loc7_++;
                  this.nowPrice = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               default:
                  super.readUnknown(param1,_loc8_);
                  continue;
               case 7:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: mallItem.numCon cannot be set twice.");
                  }
                  _loc10_++;
                  this.numCon = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 8:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: mallItem.buyCon cannot be set twice.");
                  }
                  _loc14_++;
                  this.buyCon = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 9:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: mallItem.discount cannot be set twice.");
                  }
                  _loc3_++;
                  this.discount = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 10:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: mallItem.vip cannot be set twice.");
                  }
                  _loc5_++;
                  this.vip = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 11:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: mallItem.banner cannot be set twice.");
                  }
                  _loc9_++;
                  this.banner = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 12:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: mallItem.endTime cannot be set twice.");
                  }
                  _loc13_++;
                  this.endTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
