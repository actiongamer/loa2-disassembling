package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TuanGouInfo extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TuanGouInfo.id","id",8 | 0);
      
      public static const BUYCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TuanGouInfo.buyCount","buyCount",16 | 0);
      
      public static const TOTALBUYCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TuanGouInfo.totalBuyCount","totalBuyCount",24 | 0);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var buyCount$field:uint;
      
      private var totalBuyCount$field:uint;
      
      public function TuanGouInfo()
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
      
      public function clearBuyCount() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         buyCount$field = new uint();
      }
      
      public function get hasBuyCount() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set buyCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         buyCount$field = param1;
      }
      
      public function get buyCount() : uint
      {
         return buyCount$field;
      }
      
      public function clearTotalBuyCount() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         totalBuyCount$field = new uint();
      }
      
      public function get hasTotalBuyCount() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set totalBuyCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         totalBuyCount$field = param1;
      }
      
      public function get totalBuyCount() : uint
      {
         return totalBuyCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasBuyCount)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,buyCount$field);
         }
         if(hasTotalBuyCount)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,totalBuyCount$field);
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
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: TuanGouInfo.id cannot be set twice.");
                  }
                  _loc6_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: TuanGouInfo.buyCount cannot be set twice.");
                  }
                  _loc3_++;
                  this.buyCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: TuanGouInfo.totalBuyCount cannot be set twice.");
                  }
                  _loc5_++;
                  this.totalBuyCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
