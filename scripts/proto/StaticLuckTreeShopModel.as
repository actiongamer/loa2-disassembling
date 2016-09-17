package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class StaticLuckTreeShopModel extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticLuckTreeShopModel.id","id",8 | 0);
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticLuckTreeShopModel.version","version",16 | 0);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticLuckTreeShopModel.kind","kind",24 | 0);
      
      public static const ITEM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticLuckTreeShopModel.item","item",32 | 2);
      
      public static const LIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticLuckTreeShopModel.limit","limit",40 | 0);
      
      public static const RESETS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticLuckTreeShopModel.resets","resets",48 | 2);
      
      public static const COST:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticLuckTreeShopModel.cost","cost",56 | 2);
      
      public static const VIPLIMIT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.StaticLuckTreeShopModel.vipLimit","vipLimit",64 | 2,MapKey32Value32);
      
      public static const KINDNAME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticLuckTreeShopModel.kindName","kindName",80 | 0);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var version$field:uint;
      
      private var kind$field:uint;
      
      private var item$field:String;
      
      private var limit$field:uint;
      
      private var resets$field:String;
      
      private var cost$field:String;
      
      public var vipLimit:Array;
      
      private var kindName$field:uint;
      
      public function StaticLuckTreeShopModel()
      {
         vipLimit = [];
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
      
      public function clearKind() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         kind$field = new uint();
      }
      
      public function get hasKind() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set kind(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         kind$field = param1;
      }
      
      public function get kind() : uint
      {
         return kind$field;
      }
      
      public function clearItem() : void
      {
         item$field = null;
      }
      
      public function get hasItem() : Boolean
      {
         return item$field != null;
      }
      
      public function set item(param1:String) : void
      {
         item$field = param1;
      }
      
      public function get item() : String
      {
         return item$field;
      }
      
      public function clearLimit() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         limit$field = new uint();
      }
      
      public function get hasLimit() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set limit(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         limit$field = param1;
      }
      
      public function get limit() : uint
      {
         return limit$field;
      }
      
      public function clearResets() : void
      {
         resets$field = null;
      }
      
      public function get hasResets() : Boolean
      {
         return resets$field != null;
      }
      
      public function set resets(param1:String) : void
      {
         resets$field = param1;
      }
      
      public function get resets() : String
      {
         return resets$field;
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
      
      public function clearKindName() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         kindName$field = new uint();
      }
      
      public function get hasKindName() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set kindName(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         kindName$field = param1;
      }
      
      public function get kindName() : uint
      {
         return kindName$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
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
         if(hasKind)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,kind$field);
         }
         if(hasItem)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,item$field);
         }
         if(hasLimit)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,limit$field);
         }
         if(hasResets)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,resets$field);
         }
         if(hasCost)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_STRING(param1,cost$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.vipLimit.length)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.vipLimit[_loc2_]);
            _loc2_++;
         }
         if(hasKindName)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,kindName$field);
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
         var _loc6_:* = 0;
         var _loc10_:uint = 0;
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc11_:uint = 0;
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeShopModel.id cannot be set twice.");
                  }
                  _loc10_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeShopModel.version cannot be set twice.");
                  }
                  _loc9_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeShopModel.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeShopModel.item cannot be set twice.");
                  }
                  _loc11_++;
                  this.item = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeShopModel.limit cannot be set twice.");
                  }
                  _loc4_++;
                  this.limit = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeShopModel.resets cannot be set twice.");
                  }
                  _loc8_++;
                  this.resets = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeShopModel.cost cannot be set twice.");
                  }
                  _loc7_++;
                  this.cost = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 7:
                  this.vipLimit.push(ReadUtils.read$TYPE_MESSAGE(param1,new MapKey32Value32()));
                  continue;
               default:
                  super.readUnknown(param1,_loc6_);
                  continue;
               case 9:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeShopModel.kindName cannot be set twice.");
                  }
                  _loc5_++;
                  this.kindName = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
