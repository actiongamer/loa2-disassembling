package proto.WeiDuanRewardInfo
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class EachReward extends Message
   {
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WeiDuanRewardInfo.EachReward.kind","kind",8 | 0);
      
      public static const HAVE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.WeiDuanRewardInfo.EachReward.have","have",16 | 0);
      
      public static const QQTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WeiDuanRewardInfo.EachReward.qqtype","qqtype",24 | 0);
       
      
      public var kind:uint;
      
      public var have:Boolean;
      
      private var qqtype$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function EachReward()
      {
         super();
      }
      
      public function clearQqtype() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         qqtype$field = new uint();
      }
      
      public function get hasQqtype() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set qqtype(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         qqtype$field = param1;
      }
      
      public function get qqtype() : uint
      {
         return qqtype$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.kind);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_BOOL(param1,this.have);
         if(hasQqtype)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,qqtype$field);
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
         var _loc6_:* = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: EachReward.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: EachReward.have cannot be set twice.");
                  }
                  _loc5_++;
                  this.have = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: EachReward.qqtype cannot be set twice.");
                  }
                  _loc4_++;
                  this.qqtype = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
