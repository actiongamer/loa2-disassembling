package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ViewOtherPlayerReq extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.ViewOtherPlayerReq.id","id",8 | 0);
      
      public static const DIST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ViewOtherPlayerReq.dist","dist",16 | 0);
       
      
      public var id:UInt64;
      
      private var dist$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function ViewOtherPlayerReq()
      {
         super();
      }
      
      public function clearDist() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         dist$field = new uint();
      }
      
      public function get hasDist() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set dist(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         dist$field = param1;
      }
      
      public function get dist() : uint
      {
         return dist$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         if(hasDist)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,dist$field);
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
                     throw new IOError("Bad data format: ViewOtherPlayerReq.id cannot be set twice.");
                  }
                  _loc5_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ViewOtherPlayerReq.dist cannot be set twice.");
                  }
                  _loc4_++;
                  this.dist = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
