package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ResetInfo extends Message
   {
      
      public static const ITEM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ResetInfo.item","item",8 | 0);
      
      public static const DIAMOND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ResetInfo.diamond","diamond",16 | 0);
      
      public static const MAXTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ResetInfo.maxTimes","maxTimes",24 | 0);
       
      
      private var item$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var diamond$field:uint;
      
      private var maxTimes$field:uint;
      
      public function ResetInfo()
      {
         super();
      }
      
      public function clearItem() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         item$field = new uint();
      }
      
      public function get hasItem() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set item(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         item$field = param1;
      }
      
      public function get item() : uint
      {
         return item$field;
      }
      
      public function clearDiamond() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         diamond$field = new uint();
      }
      
      public function get hasDiamond() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set diamond(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         diamond$field = param1;
      }
      
      public function get diamond() : uint
      {
         return diamond$field;
      }
      
      public function clearMaxTimes() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         maxTimes$field = new uint();
      }
      
      public function get hasMaxTimes() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set maxTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         maxTimes$field = param1;
      }
      
      public function get maxTimes() : uint
      {
         return maxTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasItem)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,item$field);
         }
         if(hasDiamond)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,diamond$field);
         }
         if(hasMaxTimes)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,maxTimes$field);
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
         var _loc3_:* = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: ResetInfo.item cannot be set twice.");
                  }
                  _loc6_++;
                  this.item = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ResetInfo.diamond cannot be set twice.");
                  }
                  _loc4_++;
                  this.diamond = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ResetInfo.maxTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.maxTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
