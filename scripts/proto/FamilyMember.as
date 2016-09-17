package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyMember extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FamilyMember.id","id",8 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyMember.name","name",16 | 2);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyMember.level","level",24 | 0);
      
      public static const POST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyMember.post","post",32 | 0);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FamilyMember.ability","ability",40 | 0);
      
      public static const CON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyMember.con","con",48 | 0);
      
      public static const STATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyMember.status","status",56 | 0);
      
      public static const HIGHPOST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyMember.highPost","highPost",64 | 0);
      
      public static const ONLINE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyMember.online","online",72 | 0);
      
      public static const ACTIVITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyMember.activity","activity",80 | 0);
      
      public static const ADDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyMember.addTime","addTime",88 | 0);
      
      public static const VIP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyMember.vip","vip",96 | 0);
       
      
      public var id:UInt64;
      
      public var name:String;
      
      public var level:uint;
      
      private var post$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var ability$field:UInt64;
      
      private var con$field:uint;
      
      private var status$field:uint;
      
      private var highPost$field:uint;
      
      private var online$field:uint;
      
      private var activity$field:uint;
      
      private var addTime$field:uint;
      
      private var vip$field:uint;
      
      public function FamilyMember()
      {
         super();
      }
      
      public function clearPost() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         post$field = new uint();
      }
      
      public function get hasPost() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set post(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         post$field = param1;
      }
      
      public function get post() : uint
      {
         return post$field;
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
      
      public function clearCon() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         con$field = new uint();
      }
      
      public function get hasCon() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set con(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         con$field = param1;
      }
      
      public function get con() : uint
      {
         return con$field;
      }
      
      public function clearStatus() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         status$field = new uint();
      }
      
      public function get hasStatus() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set status(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         status$field = param1;
      }
      
      public function get status() : uint
      {
         return status$field;
      }
      
      public function clearHighPost() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         highPost$field = new uint();
      }
      
      public function get hasHighPost() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set highPost(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         highPost$field = param1;
      }
      
      public function get highPost() : uint
      {
         return highPost$field;
      }
      
      public function clearOnline() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         online$field = new uint();
      }
      
      public function get hasOnline() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set online(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         online$field = param1;
      }
      
      public function get online() : uint
      {
         return online$field;
      }
      
      public function clearActivity() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         activity$field = new uint();
      }
      
      public function get hasActivity() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set activity(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         activity$field = param1;
      }
      
      public function get activity() : uint
      {
         return activity$field;
      }
      
      public function clearAddTime() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         addTime$field = new uint();
      }
      
      public function get hasAddTime() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set addTime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         addTime$field = param1;
      }
      
      public function get addTime() : uint
      {
         return addTime$field;
      }
      
      public function clearVip() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         vip$field = new uint();
      }
      
      public function get hasVip() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set vip(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         vip$field = param1;
      }
      
      public function get vip() : uint
      {
         return vip$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.level);
         if(hasPost)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,post$field);
         }
         if(hasAbility)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT64(param1,ability$field);
         }
         if(hasCon)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,con$field);
         }
         if(hasStatus)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,status$field);
         }
         if(hasHighPost)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,highPost$field);
         }
         if(hasOnline)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,online$field);
         }
         if(hasActivity)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,activity$field);
         }
         if(hasAddTime)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,addTime$field);
         }
         if(hasVip)
         {
            WriteUtils.writeTag(param1,0,12);
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
         var _loc7_:* = 0;
         var _loc14_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc3_:uint = 0;
         var _loc9_:uint = 0;
         var _loc13_:uint = 0;
         var _loc6_:uint = 0;
         var _loc15_:uint = 0;
         var _loc12_:uint = 0;
         var _loc8_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMember.id cannot be set twice.");
                  }
                  _loc14_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMember.name cannot be set twice.");
                  }
                  _loc10_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMember.level cannot be set twice.");
                  }
                  _loc11_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMember.post cannot be set twice.");
                  }
                  _loc3_++;
                  this.post = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMember.ability cannot be set twice.");
                  }
                  _loc9_++;
                  this.ability = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 5:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMember.con cannot be set twice.");
                  }
                  _loc13_++;
                  this.con = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMember.status cannot be set twice.");
                  }
                  _loc6_++;
                  this.status = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMember.highPost cannot be set twice.");
                  }
                  _loc15_++;
                  this.highPost = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMember.online cannot be set twice.");
                  }
                  _loc12_++;
                  this.online = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMember.activity cannot be set twice.");
                  }
                  _loc8_++;
                  this.activity = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 10:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMember.addTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.addTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 11:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMember.vip cannot be set twice.");
                  }
                  _loc4_++;
                  this.vip = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
