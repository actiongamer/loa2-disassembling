package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GuajiSomeDataNotify extends Message
   {
      
      public static const PVPCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiSomeDataNotify.pvpCount","pvpCount",8 | 0);
      
      public static const IMMUTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiSomeDataNotify.immuTm","immuTm",16 | 0);
       
      
      private var pvpCount$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var immuTm$field:uint;
      
      public function GuajiSomeDataNotify()
      {
         super();
      }
      
      public function clearPvpCount() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         pvpCount$field = new uint();
      }
      
      public function get hasPvpCount() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set pvpCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         pvpCount$field = param1;
      }
      
      public function get pvpCount() : uint
      {
         return pvpCount$field;
      }
      
      public function clearImmuTm() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         immuTm$field = new uint();
      }
      
      public function get hasImmuTm() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set immuTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         immuTm$field = param1;
      }
      
      public function get immuTm() : uint
      {
         return immuTm$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasPvpCount)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,pvpCount$field);
         }
         if(hasImmuTm)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,immuTm$field);
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
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiSomeDataNotify.pvpCount cannot be set twice.");
                  }
                  _loc3_++;
                  this.pvpCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiSomeDataNotify.immuTm cannot be set twice.");
                  }
                  _loc4_++;
                  this.immuTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
