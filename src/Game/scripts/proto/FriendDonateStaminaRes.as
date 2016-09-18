package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FriendDonateStaminaRes extends Message
   {
      
      public static const ISDONATEOK:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FriendDonateStaminaRes.isdonateok","isdonateok",8 | 0);
      
      public static const TARGETPLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FriendDonateStaminaRes.targetplayerid","targetplayerid",16 | 0);
       
      
      public var isdonateok:Boolean;
      
      public var targetplayerid:UInt64;
      
      public function FriendDonateStaminaRes()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.isdonateok);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT64(param1,this.targetplayerid);
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
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FriendDonateStaminaRes.isdonateok cannot be set twice.");
                  }
                  _loc3_++;
                  this.isdonateok = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FriendDonateStaminaRes.targetplayerid cannot be set twice.");
                  }
                  _loc5_++;
                  this.targetplayerid = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
