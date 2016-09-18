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
   
   public class EquipStrengthRes extends Message
   {
      
      public static const HEROID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.EquipStrengthRes.heroId","heroId",8 | 0);
      
      public static const EQUIPID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.EquipStrengthRes.equipId","equipId",16 | 0);
      
      public static const STRNID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.EquipStrengthRes.strnId","strnId",24 | 0);
      
      public static const STRNCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.EquipStrengthRes.strnCount","strnCount",32 | 0);
      
      public static const CRITCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.EquipStrengthRes.critCount","critCount",40 | 0);
       
      
      private var heroId$field:UInt64;
      
      public var equipId:UInt64;
      
      public var strnId:uint;
      
      private var strnCount$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var critCount:uint;
      
      public function EquipStrengthRes()
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
      
      public function clearStrnCount() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         strnCount$field = new uint();
      }
      
      public function get hasStrnCount() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set strnCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         strnCount$field = param1;
      }
      
      public function get strnCount() : uint
      {
         return strnCount$field;
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
         WriteUtils.write$TYPE_UINT32(param1,this.strnId);
         if(hasStrnCount)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,strnCount$field);
         }
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.critCount);
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
         var _loc3_:uint = 0;
         var _loc8_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: EquipStrengthRes.heroId cannot be set twice.");
                  }
                  _loc5_++;
                  this.heroId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: EquipStrengthRes.equipId cannot be set twice.");
                  }
                  _loc7_++;
                  this.equipId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: EquipStrengthRes.strnId cannot be set twice.");
                  }
                  _loc3_++;
                  this.strnId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: EquipStrengthRes.strnCount cannot be set twice.");
                  }
                  _loc8_++;
                  this.strnCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: EquipStrengthRes.critCount cannot be set twice.");
                  }
                  _loc6_++;
                  this.critCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
