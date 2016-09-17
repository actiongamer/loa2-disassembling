package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BaoWuKeyinRes extends Message
   {
      
      public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BaoWuKeyinRes.info","info",8 | 2,proto.BaoWu);
      
      public static const COST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BaoWuKeyinRes.cost","cost",16 | 0);
       
      
      public var info:proto.BaoWu;
      
      private var cost$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function BaoWuKeyinRes()
      {
         super();
      }
      
      public function clearCost() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         cost$field = new uint();
      }
      
      public function get hasCost() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set cost(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         cost$field = param1;
      }
      
      public function get cost() : uint
      {
         return cost$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.info);
         if(hasCost)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,cost$field);
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
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWuKeyinRes.info cannot be set twice.");
                  }
                  _loc5_++;
                  this.info = new proto.BaoWu();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.info);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWuKeyinRes.cost cannot be set twice.");
                  }
                  _loc4_++;
                  this.cost = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
