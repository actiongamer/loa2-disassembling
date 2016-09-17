package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class PublicTalkReq extends Message
   {
      
      public static const PINDAO:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PublicTalkReq.pindao","pindao",8 | 0);
      
      public static const CONTENT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.PublicTalkReq.content","content",16 | 2,proto.TalkContent);
       
      
      public var pindao:uint;
      
      public var content:proto.TalkContent;
      
      public function PublicTalkReq()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.pindao);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_MESSAGE(param1,this.content);
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
                     throw new IOError("Bad data format: PublicTalkReq.pindao cannot be set twice.");
                  }
                  _loc3_++;
                  this.pindao = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: PublicTalkReq.content cannot be set twice.");
                  }
                  _loc5_++;
                  this.content = new proto.TalkContent();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.content);
                  continue;
            }
         }
      }
   }
}
