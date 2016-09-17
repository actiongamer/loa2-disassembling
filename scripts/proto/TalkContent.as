package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BYTES;
   import flash.utils.ByteArray;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TalkContent extends Message
   {
      
      public static const CONTENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.TalkContent.content","content",8 | 2);
      
      public static const EXTRACONTENT:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("proto.TalkContent.extraContent","extraContent",16 | 2);
       
      
      public var sendPlayer:proto.PlayerBaseInfo;
      
      public var extraItem:proto.Item;
      
      public var extraBaow:proto.BaoWu;
      
      public var sendTimerSecond:uint;
      
      public var isNormal:Boolean = true;
      
      public var content:String;
      
      private var extraContent$field:ByteArray;
      
      public function TalkContent()
      {
         super();
      }
      
      public function clearExtraContent() : void
      {
         extraContent$field = null;
      }
      
      public function get hasExtraContent() : Boolean
      {
         return extraContent$field != null;
      }
      
      public function set extraContent(param1:ByteArray) : void
      {
         extraContent$field = param1;
      }
      
      public function get extraContent() : ByteArray
      {
         return extraContent$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_STRING(param1,this.content);
         if(hasExtraContent)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_BYTES(param1,extraContent$field);
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
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: TalkContent.content cannot be set twice.");
                  }
                  _loc5_++;
                  this.content = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: TalkContent.extraContent cannot be set twice.");
                  }
                  _loc3_++;
                  this.extraContent = ReadUtils.read$TYPE_BYTES(param1);
                  continue;
            }
         }
      }
   }
}
