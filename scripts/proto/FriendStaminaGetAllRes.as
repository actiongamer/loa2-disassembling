package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FriendStaminaGetAllRes extends Message
   {
      
      public static const STAMINAS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FriendStaminaGetAllRes.staminas","staminas",8 | 0);
      
      public static const HASGETSTAMINAS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FriendStaminaGetAllRes.hasGetstaminas","hasGetstaminas",16 | 0);
      
      public static const THISTIMEIDS:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.FriendStaminaGetAllRes.thistimeids","thistimeids",24 | 0);
       
      
      public var staminas:uint;
      
      public var hasGetstaminas:uint;
      
      public var thistimeids:Array;
      
      public function FriendStaminaGetAllRes()
      {
         thistimeids = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.staminas);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.hasGetstaminas);
         _loc2_ = uint(0);
         while(_loc2_ < this.thistimeids.length)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT64(param1,this.thistimeids[_loc2_]);
            _loc2_++;
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: FriendStaminaGetAllRes.staminas cannot be set twice.");
                  }
                  _loc5_++;
                  this.staminas = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FriendStaminaGetAllRes.hasGetstaminas cannot be set twice.");
                  }
                  _loc4_++;
                  this.hasGetstaminas = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.thistimeids);
                  }
                  else
                  {
                     this.thistimeids.push(ReadUtils.read$TYPE_UINT64(param1));
                  }
                  continue;
            }
         }
      }
   }
}
