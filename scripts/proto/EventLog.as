package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class EventLog extends Message
   {
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.EventLog.kind","kind",8 | 0);
      
      public static const PARA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.EventLog.para","para",16 | 2,Para);
      
      public static const STAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.EventLog.stamp","stamp",24 | 0);
      
      public static const REPORTID:RepeatedFieldDescriptor$TYPE_STRING = new RepeatedFieldDescriptor$TYPE_STRING("proto.EventLog.reportId","reportId",32 | 2);
       
      
      private var kind$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var para:Array;
      
      private var stamp$field:uint;
      
      public var reportId:Array;
      
      public function EventLog()
      {
         para = [];
         reportId = [];
         super();
      }
      
      public function clearKind() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         kind$field = new uint();
      }
      
      public function get hasKind() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set kind(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         kind$field = param1;
      }
      
      public function get kind() : uint
      {
         return kind$field;
      }
      
      public function clearStamp() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         stamp$field = new uint();
      }
      
      public function get hasStamp() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set stamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         stamp$field = param1;
      }
      
      public function get stamp() : uint
      {
         return stamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         if(hasKind)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,kind$field);
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.para.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.para[_loc3_]);
            _loc3_++;
         }
         if(hasStamp)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,stamp$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.reportId.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,this.reportId[_loc2_]);
            _loc2_++;
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: EventLog.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.para.push(ReadUtils.read$TYPE_MESSAGE(param1,new Para()));
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: EventLog.stamp cannot be set twice.");
                  }
                  _loc5_++;
                  this.stamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  this.reportId.push(ReadUtils.read$TYPE_STRING(param1));
                  continue;
            }
         }
      }
   }
}
