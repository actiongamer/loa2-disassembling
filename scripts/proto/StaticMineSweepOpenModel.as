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
   
   public class StaticMineSweepOpenModel extends Message
   {
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticMineSweepOpenModel.version","version",8 | 0);
      
      public static const STARTSTAMP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticMineSweepOpenModel.startStamp","startStamp",16 | 2);
      
      public static const ENDSTAMP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticMineSweepOpenModel.endStamp","endStamp",24 | 2);
      
      public static const OPENDAY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticMineSweepOpenModel.openDay","openDay",32 | 0);
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticMineSweepOpenModel.id","id",40 | 0);
       
      
      private var version$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var startStamp$field:String;
      
      private var endStamp$field:String;
      
      private var openDay$field:uint;
      
      private var id$field:uint;
      
      public function StaticMineSweepOpenModel()
      {
         super();
      }
      
      public function clearVersion() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         version$field = new uint();
      }
      
      public function get hasVersion() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set version(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         version$field = param1;
      }
      
      public function get version() : uint
      {
         return version$field;
      }
      
      public function clearStartStamp() : void
      {
         startStamp$field = null;
      }
      
      public function get hasStartStamp() : Boolean
      {
         return startStamp$field != null;
      }
      
      public function set startStamp(param1:String) : void
      {
         startStamp$field = param1;
      }
      
      public function get startStamp() : String
      {
         return startStamp$field;
      }
      
      public function clearEndStamp() : void
      {
         endStamp$field = null;
      }
      
      public function get hasEndStamp() : Boolean
      {
         return endStamp$field != null;
      }
      
      public function set endStamp(param1:String) : void
      {
         endStamp$field = param1;
      }
      
      public function get endStamp() : String
      {
         return endStamp$field;
      }
      
      public function clearOpenDay() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         openDay$field = new uint();
      }
      
      public function get hasOpenDay() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set openDay(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         openDay$field = param1;
      }
      
      public function get openDay() : uint
      {
         return openDay$field;
      }
      
      public function clearId() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         id$field = param1;
      }
      
      public function get id() : uint
      {
         return id$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasVersion)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,version$field);
         }
         if(hasStartStamp)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,startStamp$field);
         }
         if(hasEndStamp)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,endStamp$field);
         }
         if(hasOpenDay)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,openDay$field);
         }
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
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
         var _loc8_:uint = 0;
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
                     throw new IOError("Bad data format: StaticMineSweepOpenModel.version cannot be set twice.");
                  }
                  _loc7_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepOpenModel.startStamp cannot be set twice.");
                  }
                  _loc3_++;
                  this.startStamp = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepOpenModel.endStamp cannot be set twice.");
                  }
                  _loc8_++;
                  this.endStamp = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepOpenModel.openDay cannot be set twice.");
                  }
                  _loc5_++;
                  this.openDay = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepOpenModel.id cannot be set twice.");
                  }
                  _loc6_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
