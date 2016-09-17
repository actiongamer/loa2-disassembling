package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgStageNewEnterNotify extends Message
   {
      
      public static const PLAYERINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BgStageNewEnterNotify.playerInfo","playerInfo",8 | 2,proto.BgStagePlayerInfo);
       
      
      public var playerInfo:proto.BgStagePlayerInfo;
      
      public function BgStageNewEnterNotify()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.playerInfo);
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
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            if(!((_loc3_ >> 3) - 1))
            {
               if(_loc4_ != 0)
               {
                  throw new IOError("Bad data format: BgStageNewEnterNotify.playerInfo cannot be set twice.");
               }
               _loc4_++;
               this.playerInfo = new proto.BgStagePlayerInfo();
               ReadUtils.read$TYPE_MESSAGE(param1,this.playerInfo);
            }
            else
            {
               super.readUnknown(param1,_loc3_);
            }
         }
      }
   }
}
