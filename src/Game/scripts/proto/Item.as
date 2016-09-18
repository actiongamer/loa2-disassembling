package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class Item extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.Item.id","id",8 | 0);
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.Item.itemId","itemId",16 | 0);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.Item.count","count",24 | 0);
      
      public static const ISEQUIPED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.Item.isEquiped","isEquiped",32 | 0);
      
      public static const PLACE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.Item.place","place",40 | 0);
      
      public static const STRENGTHID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.Item.strengthId","strengthId",48 | 0);
      
      public static const JINGLIANID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.Item.jinglianId","jinglianId",56 | 0);
      
      public static const JINGLIANEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.Item.jinglianExp","jinglianExp",64 | 0);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.Item.ability","ability",72 | 0);
      
      public static const SUIT:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.Item.suit","suit",80 | 0);
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.Item.star","star",88 | 0);
      
      public static const STAREXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.Item.starExp","starExp",96 | 0);
       
      
      private var id$field:UInt64;
      
      private var itemId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var count$field:uint;
      
      private var isEquiped$field:Boolean;
      
      private var place$field:uint;
      
      private var strengthId$field:uint;
      
      private var jinglianId$field:uint;
      
      private var jinglianExp$field:uint;
      
      private var ability$field:UInt64;
      
      public var suit:Array;
      
      private var star$field:uint;
      
      private var starExp$field:uint;
      
      public function Item()
      {
         suit = [];
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
      
      public function clearItemId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         itemId$field = new uint();
      }
      
      public function get hasItemId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set itemId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         itemId$field = param1;
      }
      
      public function get itemId() : uint
      {
         return itemId$field;
      }
      
      public function clearCount() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         count$field = new uint();
      }
      
      public function get hasCount() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set count(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         count$field = param1;
      }
      
      public function get count() : uint
      {
         return count$field;
      }
      
      public function clearIsEquiped() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         isEquiped$field = new Boolean();
      }
      
      public function get hasIsEquiped() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set isEquiped(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 4;
         isEquiped$field = param1;
      }
      
      public function get isEquiped() : Boolean
      {
         return isEquiped$field;
      }
      
      public function clearPlace() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         place$field = new uint();
      }
      
      public function get hasPlace() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set place(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         place$field = param1;
      }
      
      public function get place() : uint
      {
         return place$field;
      }
      
      public function clearStrengthId() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         strengthId$field = new uint();
      }
      
      public function get hasStrengthId() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set strengthId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         strengthId$field = param1;
      }
      
      public function get strengthId() : uint
      {
         return strengthId$field;
      }
      
      public function clearJinglianId() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         jinglianId$field = new uint();
      }
      
      public function get hasJinglianId() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set jinglianId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         jinglianId$field = param1;
      }
      
      public function get jinglianId() : uint
      {
         return jinglianId$field;
      }
      
      public function clearJinglianExp() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         jinglianExp$field = new uint();
      }
      
      public function get hasJinglianExp() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set jinglianExp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         jinglianExp$field = param1;
      }
      
      public function get jinglianExp() : uint
      {
         return jinglianExp$field;
      }
      
      public function clearAbility() : void
      {
         ability$field = null;
      }
      
      public function get hasAbility() : Boolean
      {
         return ability$field != null;
      }
      
      public function set ability(param1:UInt64) : void
      {
         ability$field = param1;
      }
      
      public function get ability() : UInt64
      {
         return ability$field;
      }
      
      public function clearStar() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         star$field = new uint();
      }
      
      public function get hasStar() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set star(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         star$field = param1;
      }
      
      public function get star() : uint
      {
         return star$field;
      }
      
      public function clearStarExp() : void
      {
         hasField$0 = hasField$0 & 4294967039;
         starExp$field = new uint();
      }
      
      public function get hasStarExp() : Boolean
      {
         return (hasField$0 & 256) != 0;
      }
      
      public function set starExp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 256;
         starExp$field = param1;
      }
      
      public function get starExp() : uint
      {
         return starExp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT64(param1,id$field);
         }
         if(hasItemId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,itemId$field);
         }
         if(hasCount)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,count$field);
         }
         if(hasIsEquiped)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_BOOL(param1,isEquiped$field);
         }
         if(hasPlace)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,place$field);
         }
         if(hasStrengthId)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,strengthId$field);
         }
         if(hasJinglianId)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,jinglianId$field);
         }
         if(hasJinglianExp)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,jinglianExp$field);
         }
         if(hasAbility)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT64(param1,ability$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.suit.length)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,this.suit[_loc2_]);
            _loc2_++;
         }
         if(hasStar)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,star$field);
         }
         if(hasStarExp)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,starExp$field);
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
         var _loc5_:* = 0;
         var _loc12_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc14_:uint = 0;
         var _loc9_:uint = 0;
         var _loc4_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc8_:uint = 0;
         var _loc13_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Item.id cannot be set twice.");
                  }
                  _loc12_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Item.itemId cannot be set twice.");
                  }
                  _loc3_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Item.count cannot be set twice.");
                  }
                  _loc6_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Item.isEquiped cannot be set twice.");
                  }
                  _loc14_++;
                  this.isEquiped = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 4:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Item.place cannot be set twice.");
                  }
                  _loc9_++;
                  this.place = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Item.strengthId cannot be set twice.");
                  }
                  _loc4_++;
                  this.strengthId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Item.jinglianId cannot be set twice.");
                  }
                  _loc10_++;
                  this.jinglianId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Item.jinglianExp cannot be set twice.");
                  }
                  _loc11_++;
                  this.jinglianExp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Item.ability cannot be set twice.");
                  }
                  _loc8_++;
                  this.ability = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 9:
                  if((_loc5_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.suit);
                  }
                  else
                  {
                     this.suit.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 10:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Item.star cannot be set twice.");
                  }
                  _loc13_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 11:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Item.starExp cannot be set twice.");
                  }
                  _loc7_++;
                  this.starExp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
