package proto.PlayerDataNotify
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BaseInfo extends Message
   {
      
      public static const LV:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerDataNotify.BaseInfo.lv","lv",8 | 0);
      
      public static const EXP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PlayerDataNotify.BaseInfo.exp","exp",16 | 0);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PlayerDataNotify.BaseInfo.ability","ability",24 | 0);
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PlayerDataNotify.BaseInfo.id","id",32 | 0);
      
      public static const MILITARYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerDataNotify.BaseInfo.militaryrank","militaryrank",40 | 0);
      
      public static const VIP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerDataNotify.BaseInfo.vip","vip",48 | 0);
       
      
      private var lv$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var exp$field:UInt64;
      
      private var ability$field:UInt64;
      
      private var id$field:UInt64;
      
      private var militaryrank$field:uint;
      
      private var vip$field:uint;
      
      public function BaseInfo()
      {
         super();
      }
      
      public function clearLv() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         lv$field = new uint();
      }
      
      public function get hasLv() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set lv(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         lv$field = param1;
      }
      
      public function get lv() : uint
      {
         return lv$field;
      }
      
      public function clearExp() : void
      {
         exp$field = null;
      }
      
      public function get hasExp() : Boolean
      {
         return exp$field != null;
      }
      
      public function set exp(param1:UInt64) : void
      {
         exp$field = param1;
      }
      
      public function get exp() : UInt64
      {
         return exp$field;
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
      
      public function clearMilitaryrank() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         militaryrank$field = new uint();
      }
      
      public function get hasMilitaryrank() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set militaryrank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         militaryrank$field = param1;
      }
      
      public function get militaryrank() : uint
      {
         return militaryrank$field;
      }
      
      public function clearVip() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         vip$field = new uint();
      }
      
      public function get hasVip() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set vip(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         vip$field = param1;
      }
      
      public function get vip() : uint
      {
         return vip$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasLv)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,lv$field);
         }
         if(hasExp)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT64(param1,exp$field);
         }
         if(hasAbility)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT64(param1,ability$field);
         }
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT64(param1,id$field);
         }
         if(hasMilitaryrank)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,militaryrank$field);
         }
         if(hasVip)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,vip$field);
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
         var _loc9_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc8_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: BaseInfo.lv cannot be set twice.");
                  }
                  _loc9_++;
                  this.lv = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BaseInfo.exp cannot be set twice.");
                  }
                  _loc6_++;
                  this.exp = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BaseInfo.ability cannot be set twice.");
                  }
                  _loc5_++;
                  this.ability = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 3:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: BaseInfo.id cannot be set twice.");
                  }
                  _loc8_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BaseInfo.militaryrank cannot be set twice.");
                  }
                  _loc7_++;
                  this.militaryrank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BaseInfo.vip cannot be set twice.");
                  }
                  _loc3_++;
                  this.vip = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
