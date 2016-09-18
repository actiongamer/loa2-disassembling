package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class StaticGoddesDropModel extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticGoddesDropModel.id","id",8 | 0);
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticGoddesDropModel.version","version",16 | 0);
      
      public static const BASE_DROP_ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticGoddesDropModel.base_drop_id","baseDropId",24 | 0);
      
      public static const DROP_TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticGoddesDropModel.drop_type","dropType",32 | 0);
      
      public static const DROP_ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticGoddesDropModel.drop_id","dropId",40 | 0);
      
      public static const NUMBER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticGoddesDropModel.number","number",48 | 0);
      
      public static const WEIGHT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticGoddesDropModel.weight","weight",56 | 0);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var version$field:uint;
      
      private var base_drop_id$field:uint;
      
      private var drop_type$field:uint;
      
      private var drop_id$field:uint;
      
      private var number$field:uint;
      
      private var weight$field:uint;
      
      public function StaticGoddesDropModel()
      {
         super();
      }
      
      public function clearId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         id$field = param1;
      }
      
      public function get id() : uint
      {
         return id$field;
      }
      
      public function clearVersion() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         version$field = new uint();
      }
      
      public function get hasVersion() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set version(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         version$field = param1;
      }
      
      public function get version() : uint
      {
         return version$field;
      }
      
      public function clearBaseDropId() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         base_drop_id$field = new uint();
      }
      
      public function get hasBaseDropId() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set baseDropId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         base_drop_id$field = param1;
      }
      
      public function get baseDropId() : uint
      {
         return base_drop_id$field;
      }
      
      public function clearDropType() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         drop_type$field = new uint();
      }
      
      public function get hasDropType() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set dropType(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         drop_type$field = param1;
      }
      
      public function get dropType() : uint
      {
         return drop_type$field;
      }
      
      public function clearDropId() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         drop_id$field = new uint();
      }
      
      public function get hasDropId() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set dropId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         drop_id$field = param1;
      }
      
      public function get dropId() : uint
      {
         return drop_id$field;
      }
      
      public function clearNumber() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         number$field = new uint();
      }
      
      public function get hasNumber() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set number(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         number$field = param1;
      }
      
      public function get number() : uint
      {
         return number$field;
      }
      
      public function clearWeight() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         weight$field = new uint();
      }
      
      public function get hasWeight() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set weight(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         weight$field = param1;
      }
      
      public function get weight() : uint
      {
         return weight$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasVersion)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,version$field);
         }
         if(hasBaseDropId)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,base_drop_id$field);
         }
         if(hasDropType)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,drop_type$field);
         }
         if(hasDropId)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,drop_id$field);
         }
         if(hasNumber)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,number$field);
         }
         if(hasWeight)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,weight$field);
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
         var _loc6_:* = 0;
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         var _loc10_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesDropModel.id cannot be set twice.");
                  }
                  _loc9_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesDropModel.version cannot be set twice.");
                  }
                  _loc8_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesDropModel.baseDropId cannot be set twice.");
                  }
                  _loc10_++;
                  this.baseDropId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesDropModel.dropType cannot be set twice.");
                  }
                  _loc5_++;
                  this.dropType = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesDropModel.dropId cannot be set twice.");
                  }
                  _loc3_++;
                  this.dropId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesDropModel.number cannot be set twice.");
                  }
                  _loc4_++;
                  this.number = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesDropModel.weight cannot be set twice.");
                  }
                  _loc7_++;
                  this.weight = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
