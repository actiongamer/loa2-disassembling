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
   
   public class StaticMineSweepPriceModel extends Message
   {
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticMineSweepPriceModel.version","version",8 | 0);
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticMineSweepPriceModel.id","id",16 | 0);
      
      public static const COST:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticMineSweepPriceModel.cost","cost",24 | 2);
      
      public static const ONEKEY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticMineSweepPriceModel.oneKey","oneKey",32 | 0);
      
      public static const RESETPRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticMineSweepPriceModel.resetPrice","resetPrice",40 | 0);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticMineSweepPriceModel.score","score",48 | 0);
      
      public static const ONEKEYPRICE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticMineSweepPriceModel.oneKeyPrice","oneKeyPrice",56 | 2);
       
      
      private var version$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var id$field:uint;
      
      private var cost$field:String;
      
      private var oneKey$field:uint;
      
      private var resetPrice$field:uint;
      
      private var score$field:uint;
      
      private var oneKeyPrice$field:String;
      
      public function StaticMineSweepPriceModel()
      {
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
      
      public function clearCost() : void
      {
         cost$field = null;
      }
      
      public function get hasCost() : Boolean
      {
         return cost$field != null;
      }
      
      public function set cost(param1:String) : void
      {
         cost$field = param1;
      }
      
      public function get cost() : String
      {
         return cost$field;
      }
      
      public function clearOneKey() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         oneKey$field = new uint();
      }
      
      public function get hasOneKey() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set oneKey(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         oneKey$field = param1;
      }
      
      public function get oneKey() : uint
      {
         return oneKey$field;
      }
      
      public function clearResetPrice() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         resetPrice$field = new uint();
      }
      
      public function get hasResetPrice() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set resetPrice(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         resetPrice$field = param1;
      }
      
      public function get resetPrice() : uint
      {
         return resetPrice$field;
      }
      
      public function clearScore() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         score$field = param1;
      }
      
      public function get score() : uint
      {
         return score$field;
      }
      
      public function clearOneKeyPrice() : void
      {
         oneKeyPrice$field = null;
      }
      
      public function get hasOneKeyPrice() : Boolean
      {
         return oneKeyPrice$field != null;
      }
      
      public function set oneKeyPrice(param1:String) : void
      {
         oneKeyPrice$field = param1;
      }
      
      public function get oneKeyPrice() : String
      {
         return oneKeyPrice$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
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
         if(hasCost)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,cost$field);
         }
         if(hasOneKey)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,oneKey$field);
         }
         if(hasResetPrice)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,resetPrice$field);
         }
         if(hasScore)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,score$field);
         }
         if(hasOneKeyPrice)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_STRING(param1,oneKeyPrice$field);
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
         var _loc3_:* = 0;
         var _loc10_:uint = 0;
         var _loc9_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepPriceModel.version cannot be set twice.");
                  }
                  _loc10_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepPriceModel.id cannot be set twice.");
                  }
                  _loc9_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepPriceModel.cost cannot be set twice.");
                  }
                  _loc7_++;
                  this.cost = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepPriceModel.oneKey cannot be set twice.");
                  }
                  _loc8_++;
                  this.oneKey = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepPriceModel.resetPrice cannot be set twice.");
                  }
                  _loc5_++;
                  this.resetPrice = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepPriceModel.score cannot be set twice.");
                  }
                  _loc4_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepPriceModel.oneKeyPrice cannot be set twice.");
                  }
                  _loc6_++;
                  this.oneKeyPrice = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
