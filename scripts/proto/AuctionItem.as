package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class AuctionItem extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.AuctionItem.id","id",8 | 0);
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.AuctionItem.playerId","playerId",16 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.AuctionItem.name","name",24 | 2);
      
      public static const DIST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.AuctionItem.dist","dist",32 | 0);
      
      public static const OPNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.AuctionItem.opName","opName",40 | 2);
      
      public static const DISTNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.AuctionItem.distName","distName",48 | 2);
      
      public static const ENDTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.AuctionItem.endTm","endTm",56 | 0);
      
      public static const ORIGINPRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.AuctionItem.originPrice","originPrice",64 | 0);
      
      public static const CURPRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.AuctionItem.curPrice","curPrice",72 | 0);
      
      public static const BAOWU:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.AuctionItem.baowu","baowu",80 | 2,proto.BaoWu);
      
      public static const ITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.AuctionItem.item","item",88 | 2,proto.AuctionItem.Item);
      
      public static const MYPRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.AuctionItem.myPrice","myPrice",96 | 0);
      
      public static const MYISAUTOBUY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.AuctionItem.myIsAutoBuy","myIsAutoBuy",104 | 0);
      
      public static const MYCURPRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.AuctionItem.myCurPrice","myCurPrice",112 | 0);
      
      public static const ONCEPRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.AuctionItem.oncePrice","oncePrice",120 | 0);
       
      
      private var id$field:UInt64;
      
      private var playerId$field:UInt64;
      
      private var name$field:String;
      
      private var dist$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var opName$field:String;
      
      private var distName$field:String;
      
      private var endTm$field:uint;
      
      private var originPrice$field:uint;
      
      private var curPrice$field:uint;
      
      private var baowu$field:proto.BaoWu;
      
      private var item$field:proto.AuctionItem.Item;
      
      private var myPrice$field:uint;
      
      private var myIsAutoBuy$field:Boolean;
      
      private var myCurPrice$field:uint;
      
      private var oncePrice$field:uint;
      
      public function AuctionItem()
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
      
      public function clearPlayerId() : void
      {
         playerId$field = null;
      }
      
      public function get hasPlayerId() : Boolean
      {
         return playerId$field != null;
      }
      
      public function set playerId(param1:UInt64) : void
      {
         playerId$field = param1;
      }
      
      public function get playerId() : UInt64
      {
         return playerId$field;
      }
      
      public function clearName() : void
      {
         name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         name$field = param1;
      }
      
      public function get name() : String
      {
         return name$field;
      }
      
      public function clearDist() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         dist$field = new uint();
      }
      
      public function get hasDist() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set dist(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         dist$field = param1;
      }
      
      public function get dist() : uint
      {
         return dist$field;
      }
      
      public function clearOpName() : void
      {
         opName$field = null;
      }
      
      public function get hasOpName() : Boolean
      {
         return opName$field != null;
      }
      
      public function set opName(param1:String) : void
      {
         opName$field = param1;
      }
      
      public function get opName() : String
      {
         return opName$field;
      }
      
      public function clearDistName() : void
      {
         distName$field = null;
      }
      
      public function get hasDistName() : Boolean
      {
         return distName$field != null;
      }
      
      public function set distName(param1:String) : void
      {
         distName$field = param1;
      }
      
      public function get distName() : String
      {
         return distName$field;
      }
      
      public function clearEndTm() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         endTm$field = new uint();
      }
      
      public function get hasEndTm() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set endTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         endTm$field = param1;
      }
      
      public function get endTm() : uint
      {
         return endTm$field;
      }
      
      public function clearOriginPrice() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         originPrice$field = new uint();
      }
      
      public function get hasOriginPrice() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set originPrice(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         originPrice$field = param1;
      }
      
      public function get originPrice() : uint
      {
         return originPrice$field;
      }
      
      public function clearCurPrice() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         curPrice$field = new uint();
      }
      
      public function get hasCurPrice() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set curPrice(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         curPrice$field = param1;
      }
      
      public function get curPrice() : uint
      {
         return curPrice$field;
      }
      
      public function clearBaowu() : void
      {
         baowu$field = null;
      }
      
      public function get hasBaowu() : Boolean
      {
         return baowu$field != null;
      }
      
      public function set baowu(param1:proto.BaoWu) : void
      {
         baowu$field = param1;
      }
      
      public function get baowu() : proto.BaoWu
      {
         return baowu$field;
      }
      
      public function clearItem() : void
      {
         item$field = null;
      }
      
      public function get hasItem() : Boolean
      {
         return item$field != null;
      }
      
      public function set item(param1:proto.AuctionItem.Item) : void
      {
         item$field = param1;
      }
      
      public function get item() : proto.AuctionItem.Item
      {
         return item$field;
      }
      
      public function clearMyPrice() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         myPrice$field = new uint();
      }
      
      public function get hasMyPrice() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set myPrice(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         myPrice$field = param1;
      }
      
      public function get myPrice() : uint
      {
         return myPrice$field;
      }
      
      public function clearMyIsAutoBuy() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         myIsAutoBuy$field = new Boolean();
      }
      
      public function get hasMyIsAutoBuy() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set myIsAutoBuy(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 32;
         myIsAutoBuy$field = param1;
      }
      
      public function get myIsAutoBuy() : Boolean
      {
         return myIsAutoBuy$field;
      }
      
      public function clearMyCurPrice() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         myCurPrice$field = new uint();
      }
      
      public function get hasMyCurPrice() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set myCurPrice(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         myCurPrice$field = param1;
      }
      
      public function get myCurPrice() : uint
      {
         return myCurPrice$field;
      }
      
      public function clearOncePrice() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         oncePrice$field = new uint();
      }
      
      public function get hasOncePrice() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set oncePrice(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         oncePrice$field = param1;
      }
      
      public function get oncePrice() : uint
      {
         return oncePrice$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT64(param1,id$field);
         }
         if(hasPlayerId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT64(param1,playerId$field);
         }
         if(hasName)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,name$field);
         }
         if(hasDist)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,dist$field);
         }
         if(hasOpName)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,opName$field);
         }
         if(hasDistName)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,distName$field);
         }
         if(hasEndTm)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,endTm$field);
         }
         if(hasOriginPrice)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,originPrice$field);
         }
         if(hasCurPrice)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,curPrice$field);
         }
         if(hasBaowu)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_MESSAGE(param1,baowu$field);
         }
         if(hasItem)
         {
            WriteUtils.writeTag(param1,2,11);
            WriteUtils.write$TYPE_MESSAGE(param1,item$field);
         }
         if(hasMyPrice)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,myPrice$field);
         }
         if(hasMyIsAutoBuy)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_BOOL(param1,myIsAutoBuy$field);
         }
         if(hasMyCurPrice)
         {
            WriteUtils.writeTag(param1,0,14);
            WriteUtils.write$TYPE_UINT32(param1,myCurPrice$field);
         }
         if(hasOncePrice)
         {
            WriteUtils.writeTag(param1,0,15);
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
         var _loc4_:* = 0;
         var _loc14_:uint = 0;
         var _loc15_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         var _loc13_:uint = 0;
         var _loc16_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc9_:uint = 0;
         var _loc7_:uint = 0;
         var _loc10_:uint = 0;
         var _loc8_:uint = 0;
         var _loc18_:uint = 0;
         var _loc5_:uint = 0;
         var _loc17_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionItem.id cannot be set twice.");
                  }
                  _loc14_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionItem.playerId cannot be set twice.");
                  }
                  _loc15_++;
                  this.playerId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionItem.name cannot be set twice.");
                  }
                  _loc11_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionItem.dist cannot be set twice.");
                  }
                  _loc12_++;
                  this.dist = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionItem.opName cannot be set twice.");
                  }
                  _loc13_++;
                  this.opName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionItem.distName cannot be set twice.");
                  }
                  _loc16_++;
                  this.distName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionItem.endTm cannot be set twice.");
                  }
                  _loc3_++;
                  this.endTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionItem.originPrice cannot be set twice.");
                  }
                  _loc6_++;
                  this.originPrice = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionItem.curPrice cannot be set twice.");
                  }
                  _loc9_++;
                  this.curPrice = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionItem.baowu cannot be set twice.");
                  }
                  _loc7_++;
                  this.baowu = new proto.BaoWu();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baowu);
                  continue;
               case 10:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionItem.item cannot be set twice.");
                  }
                  _loc10_++;
                  this.item = new proto.AuctionItem.Item();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.item);
                  continue;
               case 11:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionItem.myPrice cannot be set twice.");
                  }
                  _loc8_++;
                  this.myPrice = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 12:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionItem.myIsAutoBuy cannot be set twice.");
                  }
                  _loc18_++;
                  this.myIsAutoBuy = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 13:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionItem.myCurPrice cannot be set twice.");
                  }
                  _loc5_++;
                  this.myCurPrice = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 14:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: AuctionItem.oncePrice cannot be set twice.");
                  }
                  _loc17_++;
                  this.oncePrice = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
