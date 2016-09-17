package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class EquipAddStarReq extends Message
   {
      
      public static const HEROID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.EquipAddStarReq.heroId","heroId",8 | 0);
      
      public static const EQUIPID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.EquipAddStarReq.equipId","equipId",16 | 0);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.EquipAddStarReq.count","count",24 | 0);
      
      public static const RED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.EquipAddStarReq.red","red",32 | 0);
      
      public static const MATERIALNO:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.EquipAddStarReq.materialNo","materialNo",40 | 0);
       
      
      private var heroId$field:UInt64;
      
      public var equipId:UInt64;
      
      public var count:uint;
      
      public var red:Boolean;
      
      private var materialNo$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function EquipAddStarReq()
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
      
      public function clearMaterialNo() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         materialNo$field = new uint();
      }
      
      public function get hasMaterialNo() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set materialNo(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         materialNo$field = param1;
      }
      
      public function get materialNo() : uint
      {
         return materialNo$field;
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
         WriteUtils.write$TYPE_UINT32(param1,this.count);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_BOOL(param1,this.red);
         if(hasMaterialNo)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,materialNo$field);
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
         var _loc6_:uint = 0;
         var _loc8_:uint = 0;
         var _loc5_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: EquipAddStarReq.heroId cannot be set twice.");
                  }
                  _loc6_++;
                  this.heroId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: EquipAddStarReq.equipId cannot be set twice.");
                  }
                  _loc8_++;
                  this.equipId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: EquipAddStarReq.count cannot be set twice.");
                  }
                  _loc5_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: EquipAddStarReq.red cannot be set twice.");
                  }
                  _loc7_++;
                  this.red = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: EquipAddStarReq.materialNo cannot be set twice.");
                  }
                  _loc3_++;
                  this.materialNo = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
