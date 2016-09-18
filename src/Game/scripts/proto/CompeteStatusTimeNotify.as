package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CompeteStatusTimeNotify extends Message
   {
      
      public static const TIMEKIND:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.CompeteStatusTimeNotify.timeKind","timeKind",8 | 0,COMP_TIME_KIND);
      
      public static const NEXTSTARTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CompeteStatusTimeNotify.nextStartTime","nextStartTime",16 | 0);
      
      public static const CURSTATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.CompeteStatusTimeNotify.curStatus","curStatus",24 | 0,COMP_STATUS);
      
      public static const NEXTAVAISTATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.CompeteStatusTimeNotify.nextAvaiStatus","nextAvaiStatus",32 | 0,COMP_STATUS);
       
      
      private var timeKind$field:int;
      
      private var hasField$0:uint = 0;
      
      private var nextStartTime$field:uint;
      
      private var curStatus$field:int;
      
      private var nextAvaiStatus$field:int;
      
      public function CompeteStatusTimeNotify()
      {
         super();
      }
      
      public function clearTimeKind() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         timeKind$field = new int();
      }
      
      public function get hasTimeKind() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set timeKind(param1:int) : void
      {
         hasField$0 = hasField$0 | 1;
         timeKind$field = param1;
      }
      
      public function get timeKind() : int
      {
         return timeKind$field;
      }
      
      public function clearNextStartTime() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         nextStartTime$field = new uint();
      }
      
      public function get hasNextStartTime() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set nextStartTime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         nextStartTime$field = param1;
      }
      
      public function get nextStartTime() : uint
      {
         return nextStartTime$field;
      }
      
      public function clearCurStatus() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         curStatus$field = new int();
      }
      
      public function get hasCurStatus() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set curStatus(param1:int) : void
      {
         hasField$0 = hasField$0 | 4;
         curStatus$field = param1;
      }
      
      public function get curStatus() : int
      {
         return curStatus$field;
      }
      
      public function clearNextAvaiStatus() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         nextAvaiStatus$field = new int();
      }
      
      public function get hasNextAvaiStatus() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set nextAvaiStatus(param1:int) : void
      {
         hasField$0 = hasField$0 | 8;
         nextAvaiStatus$field = param1;
      }
      
      public function get nextAvaiStatus() : int
      {
         return nextAvaiStatus$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasTimeKind)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_ENUM(param1,timeKind$field);
         }
         if(hasNextStartTime)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,nextStartTime$field);
         }
         if(hasCurStatus)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_ENUM(param1,curStatus$field);
         }
         if(hasNextAvaiStatus)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_ENUM(param1,nextAvaiStatus$field);
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
         var _loc7_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteStatusTimeNotify.timeKind cannot be set twice.");
                  }
                  _loc7_++;
                  this.timeKind = ReadUtils.read$TYPE_ENUM(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteStatusTimeNotify.nextStartTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.nextStartTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteStatusTimeNotify.curStatus cannot be set twice.");
                  }
                  _loc3_++;
                  this.curStatus = ReadUtils.read$TYPE_ENUM(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteStatusTimeNotify.nextAvaiStatus cannot be set twice.");
                  }
                  _loc6_++;
                  this.nextAvaiStatus = ReadUtils.read$TYPE_ENUM(param1);
                  continue;
            }
         }
      }
   }
}
