package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_FLOAT;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BaoWu extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BaoWu.id","id",8 | 0);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BaoWu.level","level",16 | 0);
      
      public static const EXP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BaoWu.exp","exp",24 | 0);
      
      public static const BASEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BaoWu.baseId","baseId",32 | 0);
      
      public static const BASE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BaoWu.base","base",40 | 2,proto.FightProp);
      
      public static const RANDOM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BaoWu.random","random",48 | 2,proto.FightProp);
      
      public static const FUMO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BaoWu.fumo","fumo",56 | 2,BaoWuFumo);
      
      public static const BUFF:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BaoWu.buff","buff",64 | 2,BaoWuBuff);
      
      public static const KEYIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BaoWu.keyin","keyin",72 | 0);
      
      public static const KEYINEXP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BaoWu.keyinExp","keyinExp",80 | 0);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BaoWu.ability","ability",88 | 0);
      
      public static const STATUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BaoWu.statue","statue",96 | 0);
      
      public static const REMOULD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BaoWu.remould","remould",104 | 0);
      
      public static const TMPREMOULDVAL:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.BaoWu.tmpRemouldVal","tmpRemouldVal",112 | 5);
      
      public static const TMPREMOULDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BaoWu.tmpRemouldId","tmpRemouldId",120 | 0);
      
      public static const TMP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BaoWu.tmp","tmp",128 | 2,MapKey32Valuef32);
      
      public static const FUWENKEYIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BaoWu.fuwenkeyin","fuwenkeyin",136 | 0);
      
      public static const FUWENKEYINEXP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BaoWu.fuwenkeyinExp","fuwenkeyinExp",144 | 0);
       
      
      public var id:UInt64;
      
      private var level$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var exp$field:UInt64;
      
      public var baseId:uint;
      
      private var base$field:proto.FightProp;
      
      private var random$field:proto.FightProp;
      
      public var fumo:Array;
      
      public var buff:Array;
      
      private var keyin$field:uint;
      
      private var keyinExp$field:UInt64;
      
      private var ability$field:UInt64;
      
      private var statue$field:uint;
      
      private var remould$field:uint;
      
      private var tmpRemouldVal$field:Number;
      
      private var tmpRemouldId$field:uint;
      
      public var tmp:Array;
      
      private var fuwenkeyin$field:uint;
      
      private var fuwenkeyinExp$field:UInt64;
      
      public function BaoWu()
      {
         fumo = [];
         buff = [];
         tmp = [];
         super();
      }
      
      public function clearLevel() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         level$field = param1;
      }
      
      public function get level() : uint
      {
         return level$field;
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
      
      public function clearBase() : void
      {
         base$field = null;
      }
      
      public function get hasBase() : Boolean
      {
         return base$field != null;
      }
      
      public function set base(param1:proto.FightProp) : void
      {
         base$field = param1;
      }
      
      public function get base() : proto.FightProp
      {
         return base$field;
      }
      
      public function clearRandom() : void
      {
         random$field = null;
      }
      
      public function get hasRandom() : Boolean
      {
         return random$field != null;
      }
      
      public function set random(param1:proto.FightProp) : void
      {
         random$field = param1;
      }
      
      public function get random() : proto.FightProp
      {
         return random$field;
      }
      
      public function clearKeyin() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         keyin$field = new uint();
      }
      
      public function get hasKeyin() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set keyin(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         keyin$field = param1;
      }
      
      public function get keyin() : uint
      {
         return keyin$field;
      }
      
      public function clearKeyinExp() : void
      {
         keyinExp$field = null;
      }
      
      public function get hasKeyinExp() : Boolean
      {
         return keyinExp$field != null;
      }
      
      public function set keyinExp(param1:UInt64) : void
      {
         keyinExp$field = param1;
      }
      
      public function get keyinExp() : UInt64
      {
         return keyinExp$field;
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
      
      public function clearStatue() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         statue$field = new uint();
      }
      
      public function get hasStatue() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set statue(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         statue$field = param1;
      }
      
      public function get statue() : uint
      {
         return statue$field;
      }
      
      public function clearRemould() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         remould$field = new uint();
      }
      
      public function get hasRemould() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set remould(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         remould$field = param1;
      }
      
      public function get remould() : uint
      {
         return remould$field;
      }
      
      public function clearTmpRemouldVal() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         tmpRemouldVal$field = new Number();
      }
      
      public function get hasTmpRemouldVal() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set tmpRemouldVal(param1:Number) : void
      {
         hasField$0 = hasField$0 | 16;
         tmpRemouldVal$field = param1;
      }
      
      public function get tmpRemouldVal() : Number
      {
         return tmpRemouldVal$field;
      }
      
      public function clearTmpRemouldId() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         tmpRemouldId$field = new uint();
      }
      
      public function get hasTmpRemouldId() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set tmpRemouldId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         tmpRemouldId$field = param1;
      }
      
      public function get tmpRemouldId() : uint
      {
         return tmpRemouldId$field;
      }
      
      public function clearFuwenkeyin() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         fuwenkeyin$field = new uint();
      }
      
      public function get hasFuwenkeyin() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set fuwenkeyin(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         fuwenkeyin$field = param1;
      }
      
      public function get fuwenkeyin() : uint
      {
         return fuwenkeyin$field;
      }
      
      public function clearFuwenkeyinExp() : void
      {
         fuwenkeyinExp$field = null;
      }
      
      public function get hasFuwenkeyinExp() : Boolean
      {
         return fuwenkeyinExp$field != null;
      }
      
      public function set fuwenkeyinExp(param1:UInt64) : void
      {
         fuwenkeyinExp$field = param1;
      }
      
      public function get fuwenkeyinExp() : UInt64
      {
         return fuwenkeyinExp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc4_:* = 0;
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         if(hasLevel)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,level$field);
         }
         if(hasExp)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT64(param1,exp$field);
         }
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.baseId);
         if(hasBase)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,base$field);
         }
         if(hasRandom)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_MESSAGE(param1,random$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.fumo.length)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.fumo[_loc2_]);
            _loc2_++;
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.buff.length)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.buff[_loc4_]);
            _loc4_++;
         }
         if(hasKeyin)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,keyin$field);
         }
         if(hasKeyinExp)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT64(param1,keyinExp$field);
         }
         if(hasAbility)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT64(param1,ability$field);
         }
         if(hasStatue)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,statue$field);
         }
         if(hasRemould)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_UINT32(param1,remould$field);
         }
         if(hasTmpRemouldVal)
         {
            WriteUtils.writeTag(param1,5,14);
            WriteUtils.write$TYPE_FLOAT(param1,tmpRemouldVal$field);
         }
         if(hasTmpRemouldId)
         {
            WriteUtils.writeTag(param1,0,15);
            WriteUtils.write$TYPE_UINT32(param1,tmpRemouldId$field);
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.tmp.length)
         {
            WriteUtils.writeTag(param1,2,16);
            WriteUtils.write$TYPE_MESSAGE(param1,this.tmp[_loc3_]);
            _loc3_++;
         }
         if(hasFuwenkeyin)
         {
            WriteUtils.writeTag(param1,0,17);
            WriteUtils.write$TYPE_UINT32(param1,fuwenkeyin$field);
         }
         if(hasFuwenkeyinExp)
         {
            WriteUtils.writeTag(param1,0,18);
            WriteUtils.write$TYPE_UINT64(param1,fuwenkeyinExp$field);
         }
         var _loc7_:int = 0;
         var _loc6_:* = this;
         for(var _loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc17_:uint = 0;
         var _loc10_:uint = 0;
         var _loc7_:uint = 0;
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc11_:uint = 0;
         var _loc15_:uint = 0;
         var _loc12_:uint = 0;
         var _loc8_:uint = 0;
         var _loc5_:uint = 0;
         var _loc13_:uint = 0;
         var _loc14_:uint = 0;
         var _loc16_:uint = 0;
         var _loc18_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWu.id cannot be set twice.");
                  }
                  _loc17_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWu.level cannot be set twice.");
                  }
                  _loc10_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWu.exp cannot be set twice.");
                  }
                  _loc7_++;
                  this.exp = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 3:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWu.baseId cannot be set twice.");
                  }
                  _loc9_++;
                  this.baseId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWu.base cannot be set twice.");
                  }
                  _loc3_++;
                  this.base = new proto.FightProp();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.base);
                  continue;
               case 5:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWu.random cannot be set twice.");
                  }
                  _loc11_++;
                  this.random = new proto.FightProp();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.random);
                  continue;
               case 6:
                  this.fumo.push(ReadUtils.read$TYPE_MESSAGE(param1,new BaoWuFumo()));
                  continue;
               case 7:
                  this.buff.push(ReadUtils.read$TYPE_MESSAGE(param1,new BaoWuBuff()));
                  continue;
               case 8:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWu.keyin cannot be set twice.");
                  }
                  _loc15_++;
                  this.keyin = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWu.keyinExp cannot be set twice.");
                  }
                  _loc12_++;
                  this.keyinExp = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 10:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWu.ability cannot be set twice.");
                  }
                  _loc8_++;
                  this.ability = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 11:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWu.statue cannot be set twice.");
                  }
                  _loc5_++;
                  this.statue = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 12:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWu.remould cannot be set twice.");
                  }
                  _loc13_++;
                  this.remould = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 13:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWu.tmpRemouldVal cannot be set twice.");
                  }
                  _loc14_++;
                  this.tmpRemouldVal = ReadUtils.read$TYPE_FLOAT(param1);
                  continue;
               case 14:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWu.tmpRemouldId cannot be set twice.");
                  }
                  _loc16_++;
                  this.tmpRemouldId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 15:
                  this.tmp.push(ReadUtils.read$TYPE_MESSAGE(param1,new MapKey32Valuef32()));
                  continue;
               case 16:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWu.fuwenkeyin cannot be set twice.");
                  }
                  _loc18_++;
                  this.fuwenkeyin = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 17:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWu.fuwenkeyinExp cannot be set twice.");
                  }
                  _loc6_++;
                  this.fuwenkeyinExp = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
