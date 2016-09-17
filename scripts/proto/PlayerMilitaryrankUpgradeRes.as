package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class PlayerMilitaryrankUpgradeRes extends Message
   {
      
      public static const OK:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.PlayerMilitaryrankUpgradeRes.ok","ok",8 | 0);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerMilitaryrankUpgradeRes.level","level",16 | 0);
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerMilitaryrankUpgradeRes.id","id",24 | 0);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PlayerMilitaryrankUpgradeRes.ability","ability",32 | 0);
       
      
      public var ok:Boolean;
      
      public var level:uint;
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var ability$field:UInt64;
      
      public function PlayerMilitaryrankUpgradeRes()
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.ok);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.level);
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasAbility)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT64(param1,ability$field);
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
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerMilitaryrankUpgradeRes.ok cannot be set twice.");
                  }
                  _loc4_++;
                  this.ok = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerMilitaryrankUpgradeRes.level cannot be set twice.");
                  }
                  _loc3_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerMilitaryrankUpgradeRes.id cannot be set twice.");
                  }
                  _loc7_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerMilitaryrankUpgradeRes.ability cannot be set twice.");
                  }
                  _loc6_++;
                  this.ability = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
