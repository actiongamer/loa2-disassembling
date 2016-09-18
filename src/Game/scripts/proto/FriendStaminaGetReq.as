package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FriendStaminaGetReq extends Message
   {
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FriendStaminaGetReq.playerid","playerid",8 | 0);
       
      
      private var playerid$field:UInt64;
      
      public function FriendStaminaGetReq()
      {
         super();
      }
      
      public function clearPlayerid() : void
      {
         playerid$field = null;
      }
      
      public function get hasPlayerid() : Boolean
      {
         return playerid$field != null;
      }
      
      public function set playerid(param1:UInt64) : void
      {
         playerid$field = param1;
      }
      
      public function get playerid() : UInt64
      {
         return playerid$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasPlayerid)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT64(param1,playerid$field);
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
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            if(!((_loc4_ >> 3) - 1))
            {
               if(_loc3_ != 0)
               {
                  throw new IOError("Bad data format: FriendStaminaGetReq.playerid cannot be set twice.");
               }
               _loc3_++;
               this.playerid = ReadUtils.read$TYPE_UINT64(param1);
            }
            else
            {
               super.readUnknown(param1,_loc4_);
            }
         }
      }
   }
}
