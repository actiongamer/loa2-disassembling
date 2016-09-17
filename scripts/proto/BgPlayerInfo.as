package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgPlayerInfo extends Message
   {
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BgPlayerInfo.baseInfo","baseInfo",8 | 2,proto.PlayerBaseInfo);
      
      public static const BGBASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BgPlayerInfo.bgBaseInfo","bgBaseInfo",16 | 2,proto.BgBaseInfo);
       
      
      public var baseInfo:proto.PlayerBaseInfo;
      
      public var bgBaseInfo:proto.BgBaseInfo;
      
      public function BgPlayerInfo()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.baseInfo);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_MESSAGE(param1,this.bgBaseInfo);
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlayerInfo.baseInfo cannot be set twice.");
                  }
                  _loc4_++;
                  this.baseInfo = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseInfo);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BgPlayerInfo.bgBaseInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.bgBaseInfo = new proto.BgBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.bgBaseInfo);
                  continue;
            }
         }
      }
   }
}
