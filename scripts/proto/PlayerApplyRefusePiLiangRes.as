package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.WritingBuffer;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   
   public class PlayerApplyRefusePiLiangRes extends Message
   {
       
      
      public function PlayerApplyRefusePiLiangRes()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
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
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            var _loc4_:* = _loc3_ >> 3;
            super.readUnknown(param1,_loc3_);
         }
      }
   }
}
