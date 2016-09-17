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
   
   public class StaticBuyDoubleShopModel extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticBuyDoubleShopModel.id","id",8 | 0);
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticBuyDoubleShopModel.version","version",16 | 0);
      
      public static const SELL_RES:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticBuyDoubleShopModel.sell_res","sellRes",24 | 2);
      
      public static const LIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticBuyDoubleShopModel.limit","limit",32 | 0);
      
      public static const ORI_RES:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticBuyDoubleShopModel.ori_res","oriRes",40 | 2);
      
      public static const CURR_RES:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticBuyDoubleShopModel.curr_res","currRes",48 | 2);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var version$field:uint;
      
      private var sell_res$field:String;
      
      private var limit$field:uint;
      
      private var ori_res$field:String;
      
      private var curr_res$field:String;
      
      public function StaticBuyDoubleShopModel()
      {
         super();
      }
      
      public function clearId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         id$field = param1;
      }
      
      public function get id() : uint
      {
         return id$field;
      }
      
      public function clearVersion() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         version$field = new uint();
      }
      
      public function get hasVersion() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set version(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         version$field = param1;
      }
      
      public function get version() : uint
      {
         return version$field;
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
      
      public function clearLimit() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         limit$field = new uint();
      }
      
      public function get hasLimit() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set limit(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         limit$field = param1;
      }
      
      public function get limit() : uint
      {
         return limit$field;
      }
      
      public function clearOriRes() : void
      {
         ori_res$field = null;
      }
      
      public function get hasOriRes() : Boolean
      {
         return ori_res$field != null;
      }
      
      public function set oriRes(param1:String) : void
      {
         ori_res$field = param1;
      }
      
      public function get oriRes() : String
      {
         return ori_res$field;
      }
      
      public function clearCurrRes() : void
      {
         curr_res$field = null;
      }
      
      public function get hasCurrRes() : Boolean
      {
         return curr_res$field != null;
      }
      
      public function set currRes(param1:String) : void
      {
         curr_res$field = param1;
      }
      
      public function get currRes() : String
      {
         return curr_res$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasVersion)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,version$field);
         }
         if(hasSellRes)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,sell_res$field);
         }
         if(hasLimit)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,limit$field);
         }
         if(hasOriRes)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,ori_res$field);
         }
         if(hasCurrRes)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,curr_res$field);
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
         var _loc8_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticBuyDoubleShopModel.id cannot be set twice.");
                  }
                  _loc8_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticBuyDoubleShopModel.version cannot be set twice.");
                  }
                  _loc7_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticBuyDoubleShopModel.sellRes cannot be set twice.");
                  }
                  _loc3_++;
                  this.sellRes = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticBuyDoubleShopModel.limit cannot be set twice.");
                  }
                  _loc4_++;
                  this.limit = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticBuyDoubleShopModel.oriRes cannot be set twice.");
                  }
                  _loc6_++;
                  this.oriRes = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticBuyDoubleShopModel.currRes cannot be set twice.");
                  }
                  _loc9_++;
                  this.currRes = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
