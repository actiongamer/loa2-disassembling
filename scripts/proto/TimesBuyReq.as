package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TimesBuyReq extends Message
   {
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TimesBuyReq.kind","kind",8 | 0);
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TimesBuyReq.time","time",16 | 0);
      
      public static const TYPENODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TimesBuyReq.typenodeid","typenodeid",24 | 0);
      
      public static const NANDUID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TimesBuyReq.nanduid","nanduid",32 | 0);
       
      
      public var kind:uint;
      
      public var time:uint;
      
      private var typenodeid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var nanduid$field:uint;
      
      public function TimesBuyReq()
      {
         super();
      }
      
      public function clearTypenodeid() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         typenodeid$field = new uint();
      }
      
      public function get hasTypenodeid() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set typenodeid(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         typenodeid$field = param1;
      }
      
      public function get typenodeid() : uint
      {
         return typenodeid$field;
      }
      
      public function clearNanduid() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         nanduid$field = new uint();
      }
      
      public function get hasNanduid() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set nanduid(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         nanduid$field = param1;
      }
      
      public function get nanduid() : uint
      {
         return nanduid$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.kind);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.time);
         if(hasTypenodeid)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,typenodeid$field);
         }
         if(hasNanduid)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,nanduid$field);
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
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: TimesBuyReq.kind cannot be set twice.");
                  }
                  _loc4_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: TimesBuyReq.time cannot be set twice.");
                  }
                  _loc3_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: TimesBuyReq.typenodeid cannot be set twice.");
                  }
                  _loc7_++;
                  this.typenodeid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: TimesBuyReq.nanduid cannot be set twice.");
                  }
                  _loc6_++;
                  this.nanduid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
