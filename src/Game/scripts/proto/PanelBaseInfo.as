package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class PanelBaseInfo extends Message
   {
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PanelBaseInfo.level","level",8 | 0);
      
      public static const BASEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PanelBaseInfo.baseId","baseId",16 | 0);
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PanelBaseInfo.id","id",24 | 0);
      
      public static const PLACE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PanelBaseInfo.place","place",32 | 0);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PanelBaseInfo.ability","ability",40 | 0);
      
      public static const MENGYUE:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.PanelBaseInfo.mengyue","mengyue",48 | 0);
      
      public static const POSITION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PanelBaseInfo.position","position",56 | 0);
      
      public static const SHENGJIE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PanelBaseInfo.shengjie","shengjie",64 | 0);
      
      public static const TUPOITEM:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.PanelBaseInfo.tupoItem","tupoItem",72 | 0);
      
      public static const SHENGRIDINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.PanelBaseInfo.shengridinfo","shengridinfo",80 | 2,proto.ShenGridPageInfo);
       
      
      public var level:uint;
      
      private var baseId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var id:UInt64;
      
      private var place$field:uint;
      
      private var ability$field:UInt64;
      
      public var mengyue:Array;
      
      private var position$field:uint;
      
      private var shengjie$field:uint;
      
      public var tupoItem:Array;
      
      private var shengridinfo$field:proto.ShenGridPageInfo;
      
      public function PanelBaseInfo()
      {
         mengyue = [];
         tupoItem = [];
         super();
      }
      
      public function clearBaseId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         baseId$field = new uint();
      }
      
      public function get hasBaseId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set baseId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         baseId$field = param1;
      }
      
      public function get baseId() : uint
      {
         return baseId$field;
      }
      
      public function clearPlace() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         place$field = new uint();
      }
      
      public function get hasPlace() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set place(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         place$field = param1;
      }
      
      public function get place() : uint
      {
         return place$field;
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
      
      public function clearPosition() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         position$field = new uint();
      }
      
      public function get hasPosition() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set position(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         position$field = param1;
      }
      
      public function get position() : uint
      {
         return position$field;
      }
      
      public function clearShengjie() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         shengjie$field = new uint();
      }
      
      public function get hasShengjie() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set shengjie(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         shengjie$field = param1;
      }
      
      public function get shengjie() : uint
      {
         return shengjie$field;
      }
      
      public function clearShengridinfo() : void
      {
         shengridinfo$field = null;
      }
      
      public function get hasShengridinfo() : Boolean
      {
         return shengridinfo$field != null;
      }
      
      public function set shengridinfo(param1:proto.ShenGridPageInfo) : void
      {
         shengridinfo$field = param1;
      }
      
      public function get shengridinfo() : proto.ShenGridPageInfo
      {
         return shengridinfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.level);
         if(hasBaseId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,baseId$field);
         }
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         if(hasPlace)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,place$field);
         }
         if(hasAbility)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT64(param1,ability$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.mengyue.length)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,this.mengyue[_loc2_]);
            _loc2_++;
         }
         if(hasPosition)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,position$field);
         }
         if(hasShengjie)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,shengjie$field);
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.tupoItem.length)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,this.tupoItem[_loc3_]);
            _loc3_++;
         }
         if(hasShengridinfo)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_MESSAGE(param1,shengridinfo$field);
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:* = 0;
         var _loc3_:uint = 0;
         var _loc11_:uint = 0;
         var _loc9_:uint = 0;
         var _loc6_:uint = 0;
         var _loc8_:uint = 0;
         var _loc10_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: PanelBaseInfo.level cannot be set twice.");
                  }
                  _loc3_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: PanelBaseInfo.baseId cannot be set twice.");
                  }
                  _loc11_++;
                  this.baseId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: PanelBaseInfo.id cannot be set twice.");
                  }
                  _loc9_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: PanelBaseInfo.place cannot be set twice.");
                  }
                  _loc6_++;
                  this.place = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: PanelBaseInfo.ability cannot be set twice.");
                  }
                  _loc8_++;
                  this.ability = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 5:
                  if((_loc7_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.mengyue);
                  }
                  else
                  {
                     this.mengyue.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 6:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: PanelBaseInfo.position cannot be set twice.");
                  }
                  _loc10_++;
                  this.position = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: PanelBaseInfo.shengjie cannot be set twice.");
                  }
                  _loc5_++;
                  this.shengjie = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if((_loc7_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.tupoItem);
                  }
                  else
                  {
                     this.tupoItem.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 9:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: PanelBaseInfo.shengridinfo cannot be set twice.");
                  }
                  _loc4_++;
                  this.shengridinfo = new proto.ShenGridPageInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.shengridinfo);
                  continue;
            }
         }
      }
   }
}
