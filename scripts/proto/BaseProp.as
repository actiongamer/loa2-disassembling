package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_FLOAT;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BaseProp extends Message
   {
      
      public static const HP:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.BaseProp.hp","hp",8 | 5);
      
      public static const ATTACK:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.BaseProp.attack","attack",16 | 5);
      
      public static const PHYSICAL_DEFENCE:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.BaseProp.physical_defence","physicalDefence",24 | 5);
      
      public static const MAGIC_DEFENCE:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.BaseProp.magic_defence","magicDefence",32 | 5);
      
      public static const AGILITY:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.BaseProp.agility","agility",40 | 5);
       
      
      private var hp$field:Number;
      
      private var hasField$0:uint = 0;
      
      private var attack$field:Number;
      
      private var physical_defence$field:Number;
      
      private var magic_defence$field:Number;
      
      private var agility$field:Number;
      
      public function BaseProp()
      {
         super();
      }
      
      public function clearHp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         hp$field = new Number();
      }
      
      public function get hasHp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set hp(param1:Number) : void
      {
         hasField$0 = hasField$0 | 1;
         hp$field = param1;
      }
      
      public function get hp() : Number
      {
         return hp$field;
      }
      
      public function clearAttack() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         attack$field = new Number();
      }
      
      public function get hasAttack() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set attack(param1:Number) : void
      {
         hasField$0 = hasField$0 | 2;
         attack$field = param1;
      }
      
      public function get attack() : Number
      {
         return attack$field;
      }
      
      public function clearPhysicalDefence() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         physical_defence$field = new Number();
      }
      
      public function get hasPhysicalDefence() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set physicalDefence(param1:Number) : void
      {
         hasField$0 = hasField$0 | 4;
         physical_defence$field = param1;
      }
      
      public function get physicalDefence() : Number
      {
         return physical_defence$field;
      }
      
      public function clearMagicDefence() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         magic_defence$field = new Number();
      }
      
      public function get hasMagicDefence() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set magicDefence(param1:Number) : void
      {
         hasField$0 = hasField$0 | 8;
         magic_defence$field = param1;
      }
      
      public function get magicDefence() : Number
      {
         return magic_defence$field;
      }
      
      public function clearAgility() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         agility$field = new Number();
      }
      
      public function get hasAgility() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set agility(param1:Number) : void
      {
         hasField$0 = hasField$0 | 16;
         agility$field = param1;
      }
      
      public function get agility() : Number
      {
         return agility$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasHp)
         {
            WriteUtils.writeTag(param1,5,1);
            WriteUtils.write$TYPE_FLOAT(param1,hp$field);
         }
         if(hasAttack)
         {
            WriteUtils.writeTag(param1,5,2);
            WriteUtils.write$TYPE_FLOAT(param1,attack$field);
         }
         if(hasPhysicalDefence)
         {
            WriteUtils.writeTag(param1,5,3);
            WriteUtils.write$TYPE_FLOAT(param1,physical_defence$field);
         }
         if(hasMagicDefence)
         {
            WriteUtils.writeTag(param1,5,4);
            WriteUtils.write$TYPE_FLOAT(param1,magic_defence$field);
         }
         if(hasAgility)
         {
            WriteUtils.writeTag(param1,5,5);
            WriteUtils.write$TYPE_FLOAT(param1,agility$field);
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
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BaseProp.hp cannot be set twice.");
                  }
                  _loc6_++;
                  this.hp = ReadUtils.read$TYPE_FLOAT(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BaseProp.attack cannot be set twice.");
                  }
                  _loc7_++;
                  this.attack = ReadUtils.read$TYPE_FLOAT(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BaseProp.physicalDefence cannot be set twice.");
                  }
                  _loc4_++;
                  this.physicalDefence = ReadUtils.read$TYPE_FLOAT(param1);
                  continue;
               case 3:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: BaseProp.magicDefence cannot be set twice.");
                  }
                  _loc8_++;
                  this.magicDefence = ReadUtils.read$TYPE_FLOAT(param1);
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BaseProp.agility cannot be set twice.");
                  }
                  _loc5_++;
                  this.agility = ReadUtils.read$TYPE_FLOAT(param1);
                  continue;
            }
         }
      }
   }
}
