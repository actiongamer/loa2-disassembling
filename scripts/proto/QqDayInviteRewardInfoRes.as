package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   
   public class QqDayInviteRewardInfoRes extends Message
   {
      
      public static const ST:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.QqDayInviteRewardInfoRes.st","st",8 | 0);
       
      
      public var st:Array;
      
      public function QqDayInviteRewardInfoRes()
      {
         st = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.st.length)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,this.st[_loc2_]);
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
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            if(!((_loc3_ >> 3) - 1))
            {
               if((_loc3_ & 7) == 2)
               {
                  ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.st);
               }
               else
               {
                  this.st.push(ReadUtils.read$TYPE_UINT32(param1));
               }
            }
            else
            {
               super.readUnknown(param1,_loc3_);
            }
         }
      }
   }
}
