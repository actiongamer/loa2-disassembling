package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class PetInfo extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PetInfo.id","id",8 | 0);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PetInfo.level","level",16 | 0);
      
      public static const EXP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PetInfo.exp","exp",24 | 0);
      
      public static const GRADE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PetInfo.grade","grade",32 | 0);
      
      public static const GRADEEXP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PetInfo.gradeExp","gradeExp",40 | 0);
      
      public static const GRADECOST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PetInfo.gradeCost","gradeCost",48 | 0);
      
      public static const POSITION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PetInfo.position","position",56 | 0);
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PetInfo.star","star",64 | 0);
      
      public static const PROP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.PetInfo.prop","prop",72 | 2,proto.FightProp);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PetInfo.ability","ability",80 | 0);
      
      public static const STATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PetInfo.status","status",88 | 0);
      
      public static const ALLSTATUS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.PetInfo.allStatus","allStatus",96 | 0);
      
      public static const SCENE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.PetInfo.scene","scene",104 | 0);
      
      public static const GLORYPROP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.PetInfo.gloryProp","gloryProp",112 | 2,proto.FightProp);
      
      public static const TOTALGLOTYPROP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.PetInfo.totalGlotyProp","totalGlotyProp",120 | 2,proto.FightProp);
       
      
      public var id:uint;
      
      public var level:uint;
      
      public var exp:UInt64;
      
      public var grade:uint;
      
      public var gradeExp:UInt64;
      
      private var gradeCost$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var position:uint;
      
      public var star:uint;
      
      public var prop:proto.FightProp;
      
      private var ability$field:UInt64;
      
      private var status$field:uint;
      
      public var allStatus:Array;
      
      private var scene$field:Boolean;
      
      private var gloryProp$field:proto.FightProp;
      
      private var totalGlotyProp$field:proto.FightProp;
      
      public function PetInfo()
      {
         allStatus = [];
         super();
      }
      
      public function clearGradeCost() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         gradeCost$field = new uint();
      }
      
      public function get hasGradeCost() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set gradeCost(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         gradeCost$field = param1;
      }
      
      public function get gradeCost() : uint
      {
         return gradeCost$field;
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
      
      public function clearStatus() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         status$field = new uint();
      }
      
      public function get hasStatus() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set status(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         status$field = param1;
      }
      
      public function get status() : uint
      {
         return status$field;
      }
      
      public function clearScene() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         scene$field = new Boolean();
      }
      
      public function get hasScene() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set scene(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 4;
         scene$field = param1;
      }
      
      public function get scene() : Boolean
      {
         return scene$field;
      }
      
      public function clearGloryProp() : void
      {
         gloryProp$field = null;
      }
      
      public function get hasGloryProp() : Boolean
      {
         return gloryProp$field != null;
      }
      
      public function set gloryProp(param1:proto.FightProp) : void
      {
         gloryProp$field = param1;
      }
      
      public function get gloryProp() : proto.FightProp
      {
         return gloryProp$field;
      }
      
      public function clearTotalGlotyProp() : void
      {
         totalGlotyProp$field = null;
      }
      
      public function get hasTotalGlotyProp() : Boolean
      {
         return totalGlotyProp$field != null;
      }
      
      public function set totalGlotyProp(param1:proto.FightProp) : void
      {
         totalGlotyProp$field = param1;
      }
      
      public function get totalGlotyProp() : proto.FightProp
      {
         return totalGlotyProp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.level);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT64(param1,this.exp);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.grade);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT64(param1,this.gradeExp);
         if(hasGradeCost)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,gradeCost$field);
         }
         WriteUtils.writeTag(param1,0,7);
         WriteUtils.write$TYPE_UINT32(param1,this.position);
         WriteUtils.writeTag(param1,0,8);
         WriteUtils.write$TYPE_UINT32(param1,this.star);
         WriteUtils.writeTag(param1,2,9);
         WriteUtils.write$TYPE_MESSAGE(param1,this.prop);
         if(hasAbility)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT64(param1,ability$field);
         }
         if(hasStatus)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,status$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.allStatus.length)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,this.allStatus[_loc2_]);
            _loc2_++;
         }
         if(hasScene)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_BOOL(param1,scene$field);
         }
         if(hasGloryProp)
         {
            WriteUtils.writeTag(param1,2,14);
            WriteUtils.write$TYPE_MESSAGE(param1,gloryProp$field);
         }
         if(hasTotalGlotyProp)
         {
            WriteUtils.writeTag(param1,2,15);
            WriteUtils.write$TYPE_MESSAGE(param1,totalGlotyProp$field);
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
         var _loc14_:uint = 0;
         var _loc12_:uint = 0;
         var _loc7_:uint = 0;
         var _loc17_:uint = 0;
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc16_:uint = 0;
         var _loc15_:uint = 0;
         var _loc11_:uint = 0;
         var _loc8_:uint = 0;
         var _loc4_:uint = 0;
         var _loc13_:uint = 0;
         var _loc6_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: PetInfo.id cannot be set twice.");
                  }
                  _loc14_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: PetInfo.level cannot be set twice.");
                  }
                  _loc12_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: PetInfo.exp cannot be set twice.");
                  }
                  _loc7_++;
                  this.exp = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 3:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: PetInfo.grade cannot be set twice.");
                  }
                  _loc17_++;
                  this.grade = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: PetInfo.gradeExp cannot be set twice.");
                  }
                  _loc10_++;
                  this.gradeExp = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: PetInfo.gradeCost cannot be set twice.");
                  }
                  _loc3_++;
                  this.gradeCost = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: PetInfo.position cannot be set twice.");
                  }
                  _loc16_++;
                  this.position = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: PetInfo.star cannot be set twice.");
                  }
                  _loc15_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: PetInfo.prop cannot be set twice.");
                  }
                  _loc11_++;
                  this.prop = new proto.FightProp();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.prop);
                  continue;
               case 9:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: PetInfo.ability cannot be set twice.");
                  }
                  _loc8_++;
                  this.ability = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 10:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: PetInfo.status cannot be set twice.");
                  }
                  _loc4_++;
                  this.status = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 11:
                  if((_loc5_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.allStatus);
                  }
                  else
                  {
                     this.allStatus.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 12:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: PetInfo.scene cannot be set twice.");
                  }
                  _loc13_++;
                  this.scene = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 13:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: PetInfo.gloryProp cannot be set twice.");
                  }
                  _loc6_++;
                  this.gloryProp = new proto.FightProp();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.gloryProp);
                  continue;
               case 14:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: PetInfo.totalGlotyProp cannot be set twice.");
                  }
                  _loc9_++;
                  this.totalGlotyProp = new proto.FightProp();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.totalGlotyProp);
                  continue;
            }
         }
      }
   }
}
