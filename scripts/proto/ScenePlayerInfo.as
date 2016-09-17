package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ScenePlayerInfo extends Message
   {
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ScenePlayerInfo.baseInfo","baseInfo",8 | 2,proto.PlayerBaseInfo);
      
      public static const X:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.ScenePlayerInfo.x","x",16 | 0);
      
      public static const Y:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.ScenePlayerInfo.y","y",24 | 0);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ScenePlayerInfo.kind","kind",32 | 0);
      
      public static const HP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ScenePlayerInfo.hp","hp",40 | 0);
      
      public static const BUFFID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.ScenePlayerInfo.buffId","buffId",48 | 0);
      
      public static const MAXHP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ScenePlayerInfo.maxhp","maxhp",56 | 0);
      
      public static const ORIENTATION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ScenePlayerInfo.orientation","orientation",64 | 0);
      
      public static const SHOWTITLEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ScenePlayerInfo.showTitleId","showTitleId",72 | 0);
      
      public static const PET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ScenePlayerInfo.pet","pet",80 | 2,proto.PetSceneInfo);
       
      
      public var baseInfo:proto.PlayerBaseInfo;
      
      private var x$field:int;
      
      private var hasField$0:uint = 0;
      
      private var y$field:int;
      
      private var kind$field:uint;
      
      private var hp$field:uint;
      
      public var buffId:Array;
      
      private var maxhp$field:uint;
      
      private var orientation$field:uint;
      
      private var showTitleId$field:uint;
      
      private var pet$field:proto.PetSceneInfo;
      
      public function ScenePlayerInfo()
      {
         buffId = [];
         super();
      }
      
      public function clearX() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         x$field = new int();
      }
      
      public function get hasX() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set x(param1:int) : void
      {
         hasField$0 = hasField$0 | 1;
         x$field = param1;
      }
      
      public function get x() : int
      {
         return x$field;
      }
      
      public function clearY() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         y$field = new int();
      }
      
      public function get hasY() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set y(param1:int) : void
      {
         hasField$0 = hasField$0 | 2;
         y$field = param1;
      }
      
      public function get y() : int
      {
         return y$field;
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
      
      public function clearHp() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         hp$field = new uint();
      }
      
      public function get hasHp() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set hp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         hp$field = param1;
      }
      
      public function get hp() : uint
      {
         return hp$field;
      }
      
      public function clearMaxhp() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         maxhp$field = new uint();
      }
      
      public function get hasMaxhp() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set maxhp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         maxhp$field = param1;
      }
      
      public function get maxhp() : uint
      {
         return maxhp$field;
      }
      
      public function clearOrientation() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         orientation$field = new uint();
      }
      
      public function get hasOrientation() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set orientation(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         orientation$field = param1;
      }
      
      public function get orientation() : uint
      {
         return orientation$field;
      }
      
      public function clearShowTitleId() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         showTitleId$field = new uint();
      }
      
      public function get hasShowTitleId() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set showTitleId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         showTitleId$field = param1;
      }
      
      public function get showTitleId() : uint
      {
         return showTitleId$field;
      }
      
      public function clearPet() : void
      {
         pet$field = null;
      }
      
      public function get hasPet() : Boolean
      {
         return pet$field != null;
      }
      
      public function set pet(param1:proto.PetSceneInfo) : void
      {
         pet$field = param1;
      }
      
      public function get pet() : proto.PetSceneInfo
      {
         return pet$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.baseInfo);
         if(hasX)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_INT32(param1,x$field);
         }
         if(hasY)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_INT32(param1,y$field);
         }
         if(hasKind)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,kind$field);
         }
         if(hasHp)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,hp$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.buffId.length)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,this.buffId[_loc2_]);
            _loc2_++;
         }
         if(hasMaxhp)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,maxhp$field);
         }
         if(hasOrientation)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,orientation$field);
         }
         if(hasShowTitleId)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,showTitleId$field);
         }
         if(hasPet)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_MESSAGE(param1,pet$field);
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
         var _loc8_:* = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc12_:uint = 0;
         var _loc6_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc8_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ScenePlayerInfo.baseInfo cannot be set twice.");
                  }
                  _loc5_++;
                  this.baseInfo = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseInfo);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ScenePlayerInfo.x cannot be set twice.");
                  }
                  _loc4_++;
                  this.x = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 2:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: ScenePlayerInfo.y cannot be set twice.");
                  }
                  _loc9_++;
                  this.y = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ScenePlayerInfo.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: ScenePlayerInfo.hp cannot be set twice.");
                  }
                  _loc12_++;
                  this.hp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if((_loc8_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.buffId);
                  }
                  else
                  {
                     this.buffId.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: ScenePlayerInfo.maxhp cannot be set twice.");
                  }
                  _loc6_++;
                  this.maxhp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: ScenePlayerInfo.orientation cannot be set twice.");
                  }
                  _loc10_++;
                  this.orientation = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: ScenePlayerInfo.showTitleId cannot be set twice.");
                  }
                  _loc11_++;
                  this.showTitleId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: ScenePlayerInfo.pet cannot be set twice.");
                  }
                  _loc7_++;
                  this.pet = new proto.PetSceneInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.pet);
                  continue;
            }
         }
      }
   }
}
