package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GuajiInfoNotify extends Message
   {
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoNotify.rank","rank",8 | 0);
      
      public static const KILLED:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoNotify.killed","killed",16 | 0);
      
      public static const REPORT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GuajiInfoNotify.report","report",24 | 2,proto.GuajiReport);
      
      public static const GJSPEED:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoNotify.gjSpeed","gjSpeed",32 | 0);
       
      
      public var rank:uint;
      
      public var killed:uint;
      
      private var report$field:proto.GuajiReport;
      
      private var gjSpeed$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function GuajiInfoNotify()
      {
         super();
      }
      
      public function clearReport() : void
      {
         report$field = null;
      }
      
      public function get hasReport() : Boolean
      {
         return report$field != null;
      }
      
      public function set report(param1:proto.GuajiReport) : void
      {
         report$field = param1;
      }
      
      public function get report() : proto.GuajiReport
      {
         return report$field;
      }
      
      public function clearGjSpeed() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         gjSpeed$field = new uint();
      }
      
      public function get hasGjSpeed() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set gjSpeed(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         gjSpeed$field = param1;
      }
      
      public function get gjSpeed() : uint
      {
         return gjSpeed$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.rank);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.killed);
         if(hasReport)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,report$field);
         }
         if(hasGjSpeed)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,gjSpeed$field);
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
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiInfoNotify.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiInfoNotify.killed cannot be set twice.");
                  }
                  _loc7_++;
                  this.killed = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiInfoNotify.report cannot be set twice.");
                  }
                  _loc6_++;
                  this.report = new proto.GuajiReport();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.report);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiInfoNotify.gjSpeed cannot be set twice.");
                  }
                  _loc4_++;
                  this.gjSpeed = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
