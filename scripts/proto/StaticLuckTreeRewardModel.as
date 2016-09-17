package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class StaticLuckTreeRewardModel extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticLuckTreeRewardModel.id","id",8 | 0);
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticLuckTreeRewardModel.version","version",16 | 0);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticLuckTreeRewardModel.level","level",24 | 0);
      
      public static const ITEM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticLuckTreeRewardModel.item","item",32 | 2);
      
      public static const ISNOTICE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticLuckTreeRewardModel.isnotice","isnotice",40 | 2);
      
      public static const WEIGHT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticLuckTreeRewardModel.weight","weight",48 | 0);
      
      public static const SUPWEIGHT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticLuckTreeRewardModel.supweight","supweight",56 | 2);
      
      public static const POSITION:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticLuckTreeRewardModel.position","position",64 | 2);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var version$field:uint;
      
      private var level$field:uint;
      
      private var item$field:String;
      
      private var isnotice$field:String;
      
      private var weight$field:uint;
      
      private var supweight$field:String;
      
      private var position$field:String;
      
      public function StaticLuckTreeRewardModel()
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
      
      public function clearLevel() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         level$field = param1;
      }
      
      public function get level() : uint
      {
         return level$field;
      }
      
      public function clearItem() : void
      {
         item$field = null;
      }
      
      public function get hasItem() : Boolean
      {
         return item$field != null;
      }
      
      public function set item(param1:String) : void
      {
         item$field = param1;
      }
      
      public function get item() : String
      {
         return item$field;
      }
      
      public function clearIsnotice() : void
      {
         isnotice$field = null;
      }
      
      public function get hasIsnotice() : Boolean
      {
         return isnotice$field != null;
      }
      
      public function set isnotice(param1:String) : void
      {
         isnotice$field = param1;
      }
      
      public function get isnotice() : String
      {
         return isnotice$field;
      }
      
      public function clearWeight() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         weight$field = new uint();
      }
      
      public function get hasWeight() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set weight(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         weight$field = param1;
      }
      
      public function get weight() : uint
      {
         return weight$field;
      }
      
      public function clearSupweight() : void
      {
         supweight$field = null;
      }
      
      public function get hasSupweight() : Boolean
      {
         return supweight$field != null;
      }
      
      public function set supweight(param1:String) : void
      {
         supweight$field = param1;
      }
      
      public function get supweight() : String
      {
         return supweight$field;
      }
      
      public function clearPosition() : void
      {
         position$field = null;
      }
      
      public function get hasPosition() : Boolean
      {
         return position$field != null;
      }
      
      public function set position(param1:String) : void
      {
         position$field = param1;
      }
      
      public function get position() : String
      {
         return position$field;
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
         if(hasLevel)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,level$field);
         }
         if(hasItem)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,item$field);
         }
         if(hasIsnotice)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,isnotice$field);
         }
         if(hasWeight)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,weight$field);
         }
         if(hasSupweight)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_STRING(param1,supweight$field);
         }
         if(hasPosition)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_STRING(param1,position$field);
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
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc11_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc10_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeRewardModel.id cannot be set twice.");
                  }
                  _loc9_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeRewardModel.version cannot be set twice.");
                  }
                  _loc8_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeRewardModel.level cannot be set twice.");
                  }
                  _loc3_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeRewardModel.item cannot be set twice.");
                  }
                  _loc11_++;
                  this.item = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeRewardModel.isnotice cannot be set twice.");
                  }
                  _loc5_++;
                  this.isnotice = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeRewardModel.weight cannot be set twice.");
                  }
                  _loc6_++;
                  this.weight = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeRewardModel.supweight cannot be set twice.");
                  }
                  _loc7_++;
                  this.supweight = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 7:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeRewardModel.position cannot be set twice.");
                  }
                  _loc10_++;
                  this.position = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
