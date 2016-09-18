package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class OpenChallengeNotify extends Message
   {
      
      public static const CANGETREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.OpenChallengeNotify.cangetreward","cangetreward",8 | 0);
      
      public static const ALLFINISH:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.OpenChallengeNotify.allfinish","allfinish",16 | 0);
       
      
      public var cangetreward:Boolean;
      
      private var allfinish$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function OpenChallengeNotify()
      {
         super();
      }
      
      public function clearAllfinish() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         allfinish$field = new Boolean();
      }
      
      public function get hasAllfinish() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set allfinish(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         allfinish$field = param1;
      }
      
      public function get allfinish() : Boolean
      {
         return allfinish$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.cangetreward);
         if(hasAllfinish)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_BOOL(param1,allfinish$field);
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
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: OpenChallengeNotify.cangetreward cannot be set twice.");
                  }
                  _loc4_++;
                  this.cangetreward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: OpenChallengeNotify.allfinish cannot be set twice.");
                  }
                  _loc3_++;
                  this.allfinish = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
