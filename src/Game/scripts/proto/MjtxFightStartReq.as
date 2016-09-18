package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class MjtxFightStartReq extends Message
   {
      
      public static const POSID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MjtxFightStartReq.posId","posId",8 | 0);
      
      public static const FRIENDID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.MjtxFightStartReq.friendId","friendId",16 | 0);
       
      
      private var posId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var friendId$field:UInt64;
      
      public function MjtxFightStartReq()
      {
         super();
      }
      
      public function clearPosId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         posId$field = new uint();
      }
      
      public function get hasPosId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set posId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         posId$field = param1;
      }
      
      public function get posId() : uint
      {
         return posId$field;
      }
      
      public function clearFriendId() : void
      {
         friendId$field = null;
      }
      
      public function get hasFriendId() : Boolean
      {
         return friendId$field != null;
      }
      
      public function set friendId(param1:UInt64) : void
      {
         friendId$field = param1;
      }
      
      public function get friendId() : UInt64
      {
         return friendId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasPosId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,posId$field);
         }
         if(hasFriendId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT64(param1,friendId$field);
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
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: MjtxFightStartReq.posId cannot be set twice.");
                  }
                  _loc4_++;
                  this.posId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: MjtxFightStartReq.friendId cannot be set twice.");
                  }
                  _loc5_++;
                  this.friendId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
