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
   
   public class StaticDragonBoatPriceModel extends Message
   {
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticDragonBoatPriceModel.version","version",8 | 0);
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticDragonBoatPriceModel.id","id",16 | 0);
      
      public static const COST:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticDragonBoatPriceModel.cost","cost",24 | 2);
      
      public static const DONATEDLIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticDragonBoatPriceModel.donatedLimit","donatedLimit",32 | 0);
      
      public static const DONATESCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticDragonBoatPriceModel.donateScore","donateScore",40 | 0);
      
      public static const DONATELIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticDragonBoatPriceModel.donateLimit","donateLimit",48 | 0);
       
      
      private var version$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var id$field:uint;
      
      private var cost$field:String;
      
      private var donatedLimit$field:uint;
      
      private var donateScore$field:uint;
      
      private var donateLimit$field:uint;
      
      public function StaticDragonBoatPriceModel()
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
      
      public function clearDonatedLimit() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         donatedLimit$field = new uint();
      }
      
      public function get hasDonatedLimit() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set donatedLimit(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         donatedLimit$field = param1;
      }
      
      public function get donatedLimit() : uint
      {
         return donatedLimit$field;
      }
      
      public function clearDonateScore() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         donateScore$field = new uint();
      }
      
      public function get hasDonateScore() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set donateScore(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         donateScore$field = param1;
      }
      
      public function get donateScore() : uint
      {
         return donateScore$field;
      }
      
      public function clearDonateLimit() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         donateLimit$field = new uint();
      }
      
      public function get hasDonateLimit() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set donateLimit(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         donateLimit$field = param1;
      }
      
      public function get donateLimit() : uint
      {
         return donateLimit$field;
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
         if(hasDonatedLimit)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,donatedLimit$field);
         }
         if(hasDonateScore)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,donateScore$field);
         }
         if(hasDonateLimit)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,donateLimit$field);
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
         var _loc8_:uint = 0;
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticDragonBoatPriceModel.version cannot be set twice.");
                  }
                  _loc8_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticDragonBoatPriceModel.id cannot be set twice.");
                  }
                  _loc7_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticDragonBoatPriceModel.cost cannot be set twice.");
                  }
                  _loc5_++;
                  this.cost = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticDragonBoatPriceModel.donatedLimit cannot be set twice.");
                  }
                  _loc9_++;
                  this.donatedLimit = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticDragonBoatPriceModel.donateScore cannot be set twice.");
                  }
                  _loc3_++;
                  this.donateScore = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticDragonBoatPriceModel.donateLimit cannot be set twice.");
                  }
                  _loc6_++;
                  this.donateLimit = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
