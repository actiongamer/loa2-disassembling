package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_FLOAT;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class StaticTuanGouModel extends Message
   {
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticTuanGouModel.version","version",8 | 0);
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticTuanGouModel.id","id",16 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticTuanGouModel.name","name",24 | 2);
      
      public static const SELL_RES:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticTuanGouModel.sell_res","sellRes",32 | 2);
      
      public static const COST_RES:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticTuanGouModel.cost_res","costRes",40 | 2);
      
      public static const DISCOUNT_RULE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticTuanGouModel.discount_rule","discountRule",48 | 2);
      
      public static const RESET_KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticTuanGouModel.reset_kind","resetKind",56 | 0);
      
      public static const POS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticTuanGouModel.pos","pos",64 | 0);
      
      public static const TICKET_LIMIT:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.StaticTuanGouModel.ticket_limit","ticketLimit",72 | 5);
      
      public static const BUY_START_TM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticTuanGouModel.buy_start_tm","buyStartTm",80 | 0);
      
      public static const BUY_END_TM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticTuanGouModel.buy_end_tm","buyEndTm",88 | 0);
      
      public static const LANGID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticTuanGouModel.langid","langid",96 | 0);
      
      public static const VIP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.StaticTuanGouModel.vip","vip",104 | 2,MapKey32Value32);
      
      public static const BUY_START_DATE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticTuanGouModel.buy_start_date","buyStartDate",112 | 2);
      
      public static const BUY_END_DATE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticTuanGouModel.buy_end_date","buyEndDate",120 | 2);
       
      
      private var version$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var id$field:uint;
      
      private var name$field:String;
      
      private var sell_res$field:String;
      
      private var cost_res$field:String;
      
      private var discount_rule$field:String;
      
      private var reset_kind$field:uint;
      
      private var pos$field:uint;
      
      private var ticket_limit$field:Number;
      
      private var buy_start_tm$field:uint;
      
      private var buy_end_tm$field:uint;
      
      private var langid$field:uint;
      
      public var vip:Array;
      
      private var buy_start_date$field:String;
      
      private var buy_end_date$field:String;
      
      public function StaticTuanGouModel()
      {
         vip = [];
         super();
      }
      
      public function clearVersion() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         version$field = new uint();
      }
      
      public function get hasVersion() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set version(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         version$field = param1;
      }
      
      public function get version() : uint
      {
         return version$field;
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
      
      public function clearSellRes() : void
      {
         sell_res$field = null;
      }
      
      public function get hasSellRes() : Boolean
      {
         return sell_res$field != null;
      }
      
      public function set sellRes(param1:String) : void
      {
         sell_res$field = param1;
      }
      
      public function get sellRes() : String
      {
         return sell_res$field;
      }
      
      public function clearCostRes() : void
      {
         cost_res$field = null;
      }
      
      public function get hasCostRes() : Boolean
      {
         return cost_res$field != null;
      }
      
      public function set costRes(param1:String) : void
      {
         cost_res$field = param1;
      }
      
      public function get costRes() : String
      {
         return cost_res$field;
      }
      
      public function clearDiscountRule() : void
      {
         discount_rule$field = null;
      }
      
      public function get hasDiscountRule() : Boolean
      {
         return discount_rule$field != null;
      }
      
      public function set discountRule(param1:String) : void
      {
         discount_rule$field = param1;
      }
      
      public function get discountRule() : String
      {
         return discount_rule$field;
      }
      
      public function clearResetKind() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         reset_kind$field = new uint();
      }
      
      public function get hasResetKind() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set resetKind(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         reset_kind$field = param1;
      }
      
      public function get resetKind() : uint
      {
         return reset_kind$field;
      }
      
      public function clearPos() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         pos$field = new uint();
      }
      
      public function get hasPos() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set pos(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         pos$field = param1;
      }
      
      public function get pos() : uint
      {
         return pos$field;
      }
      
      public function clearTicketLimit() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         ticket_limit$field = new Number();
      }
      
      public function get hasTicketLimit() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set ticketLimit(param1:Number) : void
      {
         hasField$0 = hasField$0 | 16;
         ticket_limit$field = param1;
      }
      
      public function get ticketLimit() : Number
      {
         return ticket_limit$field;
      }
      
      public function clearBuyStartTm() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         buy_start_tm$field = new uint();
      }
      
      public function get hasBuyStartTm() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set buyStartTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         buy_start_tm$field = param1;
      }
      
      public function get buyStartTm() : uint
      {
         return buy_start_tm$field;
      }
      
      public function clearBuyEndTm() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         buy_end_tm$field = new uint();
      }
      
      public function get hasBuyEndTm() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set buyEndTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         buy_end_tm$field = param1;
      }
      
      public function get buyEndTm() : uint
      {
         return buy_end_tm$field;
      }
      
      public function clearLangid() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         langid$field = new uint();
      }
      
      public function get hasLangid() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set langid(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         langid$field = param1;
      }
      
      public function get langid() : uint
      {
         return langid$field;
      }
      
      public function clearBuyStartDate() : void
      {
         buy_start_date$field = null;
      }
      
      public function get hasBuyStartDate() : Boolean
      {
         return buy_start_date$field != null;
      }
      
      public function set buyStartDate(param1:String) : void
      {
         buy_start_date$field = param1;
      }
      
      public function get buyStartDate() : String
      {
         return buy_start_date$field;
      }
      
      public function clearBuyEndDate() : void
      {
         buy_end_date$field = null;
      }
      
      public function get hasBuyEndDate() : Boolean
      {
         return buy_end_date$field != null;
      }
      
      public function set buyEndDate(param1:String) : void
      {
         buy_end_date$field = param1;
      }
      
      public function get buyEndDate() : String
      {
         return buy_end_date$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasVersion)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,version$field);
         }
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasName)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,name$field);
         }
         if(hasSellRes)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,sell_res$field);
         }
         if(hasCostRes)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,cost_res$field);
         }
         if(hasDiscountRule)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,discount_rule$field);
         }
         if(hasResetKind)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,reset_kind$field);
         }
         if(hasPos)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,pos$field);
         }
         if(hasTicketLimit)
         {
            WriteUtils.writeTag(param1,5,9);
            WriteUtils.write$TYPE_FLOAT(param1,ticket_limit$field);
         }
         if(hasBuyStartTm)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,buy_start_tm$field);
         }
         if(hasBuyEndTm)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,buy_end_tm$field);
         }
         if(hasLangid)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,langid$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.vip.length)
         {
            WriteUtils.writeTag(param1,2,13);
            WriteUtils.write$TYPE_MESSAGE(param1,this.vip[_loc2_]);
            _loc2_++;
         }
         if(hasBuyStartDate)
         {
            WriteUtils.writeTag(param1,2,14);
            WriteUtils.write$TYPE_STRING(param1,buy_start_date$field);
         }
         if(hasBuyEndDate)
         {
            WriteUtils.writeTag(param1,2,15);
            WriteUtils.write$TYPE_STRING(param1,buy_end_date$field);
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
         var _loc7_:* = 0;
         var _loc10_:uint = 0;
         var _loc16_:uint = 0;
         var _loc11_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         var _loc8_:uint = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         var _loc12_:uint = 0;
         var _loc13_:uint = 0;
         var _loc15_:uint = 0;
         var _loc17_:uint = 0;
         var _loc9_:uint = 0;
         var _loc14_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouModel.version cannot be set twice.");
                  }
                  _loc10_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouModel.id cannot be set twice.");
                  }
                  _loc16_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouModel.name cannot be set twice.");
                  }
                  _loc11_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouModel.sellRes cannot be set twice.");
                  }
                  _loc3_++;
                  this.sellRes = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouModel.costRes cannot be set twice.");
                  }
                  _loc5_++;
                  this.costRes = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouModel.discountRule cannot be set twice.");
                  }
                  _loc8_++;
                  this.discountRule = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouModel.resetKind cannot be set twice.");
                  }
                  _loc6_++;
                  this.resetKind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouModel.pos cannot be set twice.");
                  }
                  _loc4_++;
                  this.pos = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouModel.ticketLimit cannot be set twice.");
                  }
                  _loc12_++;
                  this.ticketLimit = ReadUtils.read$TYPE_FLOAT(param1);
                  continue;
               case 9:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouModel.buyStartTm cannot be set twice.");
                  }
                  _loc13_++;
                  this.buyStartTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 10:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouModel.buyEndTm cannot be set twice.");
                  }
                  _loc15_++;
                  this.buyEndTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 11:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouModel.langid cannot be set twice.");
                  }
                  _loc17_++;
                  this.langid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 12:
                  this.vip.push(ReadUtils.read$TYPE_MESSAGE(param1,new MapKey32Value32()));
                  continue;
               case 13:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouModel.buyStartDate cannot be set twice.");
                  }
                  _loc9_++;
                  this.buyStartDate = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 14:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouModel.buyEndDate cannot be set twice.");
                  }
                  _loc14_++;
                  this.buyEndDate = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
