package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyExpeTaskNotify extends Message
   {
      
      public static const TASKID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeTaskNotify.taskId","taskId",8 | 0);
      
      public static const TASKSTATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeTaskNotify.taskState","taskState",16 | 0);
      
      public static const TASKFINISHNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeTaskNotify.taskFinishNum","taskFinishNum",24 | 0);
      
      public static const TASKTOALNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeTaskNotify.taskToalNum","taskToalNum",32 | 0);
      
      public static const ENDSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeTaskNotify.endStamp","endStamp",40 | 0);
       
      
      private var taskId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var taskState$field:uint;
      
      private var taskFinishNum$field:uint;
      
      private var taskToalNum$field:uint;
      
      private var endStamp$field:uint;
      
      public function FamilyExpeTaskNotify()
      {
         super();
      }
      
      public function clearTaskId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         taskId$field = new uint();
      }
      
      public function get hasTaskId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set taskId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         taskId$field = param1;
      }
      
      public function get taskId() : uint
      {
         return taskId$field;
      }
      
      public function clearTaskState() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         taskState$field = new uint();
      }
      
      public function get hasTaskState() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set taskState(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         taskState$field = param1;
      }
      
      public function get taskState() : uint
      {
         return taskState$field;
      }
      
      public function clearTaskFinishNum() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         taskFinishNum$field = new uint();
      }
      
      public function get hasTaskFinishNum() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set taskFinishNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         taskFinishNum$field = param1;
      }
      
      public function get taskFinishNum() : uint
      {
         return taskFinishNum$field;
      }
      
      public function clearTaskToalNum() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         taskToalNum$field = new uint();
      }
      
      public function get hasTaskToalNum() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set taskToalNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         taskToalNum$field = param1;
      }
      
      public function get taskToalNum() : uint
      {
         return taskToalNum$field;
      }
      
      public function clearEndStamp() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         endStamp$field = new uint();
      }
      
      public function get hasEndStamp() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set endStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         endStamp$field = param1;
      }
      
      public function get endStamp() : uint
      {
         return endStamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasTaskId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,taskId$field);
         }
         if(hasTaskState)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,taskState$field);
         }
         if(hasTaskFinishNum)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,taskFinishNum$field);
         }
         if(hasTaskToalNum)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,taskToalNum$field);
         }
         if(hasEndStamp)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,endStamp$field);
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
         var _loc5_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeTaskNotify.taskId cannot be set twice.");
                  }
                  _loc6_++;
                  this.taskId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeTaskNotify.taskState cannot be set twice.");
                  }
                  _loc5_++;
                  this.taskState = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeTaskNotify.taskFinishNum cannot be set twice.");
                  }
                  _loc7_++;
                  this.taskFinishNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeTaskNotify.taskToalNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.taskToalNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeTaskNotify.endStamp cannot be set twice.");
                  }
                  _loc8_++;
                  this.endStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
