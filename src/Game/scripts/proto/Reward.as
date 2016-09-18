package proto
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
   
   public class Reward extends Message
   {
      
      public static const DROPTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.Reward.dropType","dropType",8 | 0);
      
      public static const DROPID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.Reward.dropId","dropId",16 | 0);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.Reward.count","count",24 | 0);
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.Reward.id","id",32 | 0);
       
      
      private var dropType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var dropId$field:uint;
      
      private var count$field:UInt64;
      
      private var id$field:UInt64;
      
      public function Reward()
      {
         super();
      }
      
      public function clearDropType() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         dropType$field = new uint();
      }
      
      public function get hasDropType() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set dropType(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         dropType$field = param1;
      }
      
      public function get dropType() : uint
      {
         return dropType$field;
      }
      
      public function clearDropId() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         dropId$field = new uint();
      }
      
      public function get hasDropId() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set dropId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         dropId$field = param1;
      }
      
      public function get dropId() : uint
      {
         return dropId$field;
      }
      
      public function clearCount() : void
      {
         count$field = null;
      }
      
      public function get hasCount() : Boolean
      {
         return count$field != null;
      }
      
      public function set count(param1:UInt64) : void
      {
         count$field = param1;
      }
      
      public function get count() : UInt64
      {
         return count$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasDropType)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,dropType$field);
         }
         if(hasDropId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,dropId$field);
         }
         if(hasCount)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT64(param1,count$field);
         }
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT64(param1,id$field);
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
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Reward.dropType cannot be set twice.");
                  }
                  _loc7_++;
                  this.dropType = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Reward.dropId cannot be set twice.");
                  }
                  _loc3_++;
                  this.dropId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Reward.count cannot be set twice.");
                  }
                  _loc5_++;
                  this.count = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Reward.id cannot be set twice.");
                  }
                  _loc6_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
