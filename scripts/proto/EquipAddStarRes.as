package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class EquipAddStarRes extends Message
   {
      
      public static const HEROID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.EquipAddStarRes.heroId","heroId",8 | 0);
      
      public static const EQUIPID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.EquipAddStarRes.equipId","equipId",16 | 0);
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.EquipAddStarRes.star","star",24 | 0);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.EquipAddStarRes.exp","exp",32 | 0);
      
      public static const DOUBLEKILL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.EquipAddStarRes.doubleKill","doubleKill",40 | 0);
      
      public static const QUADRAKILL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.EquipAddStarRes.quadraKill","quadraKill",48 | 0);
       
      
      private var heroId$field:UInt64;
      
      public var equipId:UInt64;
      
      public var star:uint;
      
      public var exp:uint;
      
      private var doubleKill$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var quadraKill$field:uint;
      
      public function EquipAddStarRes()
      {
         super();
      }
      
      public function clearHeroId() : void
      {
         heroId$field = null;
      }
      
      public function get hasHeroId() : Boolean
      {
         return heroId$field != null;
      }
      
      public function set heroId(param1:UInt64) : void
      {
         heroId$field = param1;
      }
      
      public function get heroId() : UInt64
      {
         return heroId$field;
      }
      
      public function clearDoubleKill() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         doubleKill$field = new uint();
      }
      
      public function get hasDoubleKill() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set doubleKill(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         doubleKill$field = param1;
      }
      
      public function get doubleKill() : uint
      {
         return doubleKill$field;
      }
      
      public function clearQuadraKill() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         quadraKill$field = new uint();
      }
      
      public function get hasQuadraKill() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set quadraKill(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         quadraKill$field = param1;
      }
      
      public function get quadraKill() : uint
      {
         return quadraKill$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasHeroId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT64(param1,heroId$field);
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT64(param1,this.equipId);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.star);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.exp);
         if(hasDoubleKill)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,doubleKill$field);
         }
         if(hasQuadraKill)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,quadraKill$field);
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
         var _loc5_:uint = 0;
         var _loc7_:uint = 0;
         var _loc9_:uint = 0;
         var _loc6_:uint = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: EquipAddStarRes.heroId cannot be set twice.");
                  }
                  _loc5_++;
                  this.heroId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: EquipAddStarRes.equipId cannot be set twice.");
                  }
                  _loc7_++;
                  this.equipId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: EquipAddStarRes.star cannot be set twice.");
                  }
                  _loc9_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: EquipAddStarRes.exp cannot be set twice.");
                  }
                  _loc6_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: EquipAddStarRes.doubleKill cannot be set twice.");
                  }
                  _loc8_++;
                  this.doubleKill = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: EquipAddStarRes.quadraKill cannot be set twice.");
                  }
                  _loc3_++;
                  this.quadraKill = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
