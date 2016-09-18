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
   
   public class StaticOpActivityTmModel extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticOpActivityTmModel.id","id",8 | 0);
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticOpActivityTmModel.version","version",16 | 0);
      
      public static const START_TM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticOpActivityTmModel.start_tm","startTm",24 | 0);
      
      public static const END_TM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticOpActivityTmModel.end_tm","endTm",32 | 0);
      
      public static const OPEN_TM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticOpActivityTmModel.open_tm","openTm",40 | 0);
      
      public static const START_DATE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticOpActivityTmModel.start_date","startDate",48 | 2);
      
      public static const END_DATE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticOpActivityTmModel.end_date","endDate",56 | 2);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var version$field:uint;
      
      private var start_tm$field:uint;
      
      private var end_tm$field:uint;
      
      private var open_tm$field:uint;
      
      private var start_date$field:String;
      
      private var end_date$field:String;
      
      public function StaticOpActivityTmModel()
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
      
      public function clearStartTm() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         start_tm$field = new uint();
      }
      
      public function get hasStartTm() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set startTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         start_tm$field = param1;
      }
      
      public function get startTm() : uint
      {
         return start_tm$field;
      }
      
      public function clearEndTm() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         end_tm$field = new uint();
      }
      
      public function get hasEndTm() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set endTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         end_tm$field = param1;
      }
      
      public function get endTm() : uint
      {
         return end_tm$field;
      }
      
      public function clearOpenTm() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         open_tm$field = new uint();
      }
      
      public function get hasOpenTm() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set openTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         open_tm$field = param1;
      }
      
      public function get openTm() : uint
      {
         return open_tm$field;
      }
      
      public function clearStartDate() : void
      {
         start_date$field = null;
      }
      
      public function get hasStartDate() : Boolean
      {
         return start_date$field != null;
      }
      
      public function set startDate(param1:String) : void
      {
         start_date$field = param1;
      }
      
      public function get startDate() : String
      {
         return start_date$field;
      }
      
      public function clearEndDate() : void
      {
         end_date$field = null;
      }
      
      public function get hasEndDate() : Boolean
      {
         return end_date$field != null;
      }
      
      public function set endDate(param1:String) : void
      {
         end_date$field = param1;
      }
      
      public function get endDate() : String
      {
         return end_date$field;
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
         if(hasStartTm)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,start_tm$field);
         }
         if(hasEndTm)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,end_tm$field);
         }
         if(hasOpenTm)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,open_tm$field);
         }
         if(hasStartDate)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,start_date$field);
         }
         if(hasEndDate)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_STRING(param1,end_date$field);
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
         var _loc5_:* = 0;
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc10_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticOpActivityTmModel.id cannot be set twice.");
                  }
                  _loc9_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticOpActivityTmModel.version cannot be set twice.");
                  }
                  _loc8_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticOpActivityTmModel.startTm cannot be set twice.");
                  }
                  _loc6_++;
                  this.startTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticOpActivityTmModel.endTm cannot be set twice.");
                  }
                  _loc7_++;
                  this.endTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticOpActivityTmModel.openTm cannot be set twice.");
                  }
                  _loc4_++;
                  this.openTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticOpActivityTmModel.startDate cannot be set twice.");
                  }
                  _loc3_++;
                  this.startDate = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: StaticOpActivityTmModel.endDate cannot be set twice.");
                  }
                  _loc10_++;
                  this.endDate = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
