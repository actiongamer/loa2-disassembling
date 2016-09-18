package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class PlayerApplyAgreeNotify extends Message
   {
      
      public static const DATA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.PlayerApplyAgreeNotify.data","data",8 | 2,proto.GameFriendData);
      
      public static const CONTENT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.PlayerApplyAgreeNotify.content","content",16 | 2,proto.Para);
       
      
      public var data:proto.GameFriendData;
      
      private var content$field:proto.Para;
      
      public function PlayerApplyAgreeNotify()
      {
         super();
      }
      
      public function clearContent() : void
      {
         content$field = null;
      }
      
      public function get hasContent() : Boolean
      {
         return content$field != null;
      }
      
      public function set content(param1:proto.Para) : void
      {
         content$field = param1;
      }
      
      public function get content() : proto.Para
      {
         return content$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.data);
         if(hasContent)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,content$field);
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
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerApplyAgreeNotify.data cannot be set twice.");
                  }
                  _loc3_++;
                  this.data = new proto.GameFriendData();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.data);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerApplyAgreeNotify.content cannot be set twice.");
                  }
                  _loc5_++;
                  this.content = new proto.Para();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.content);
                  continue;
            }
         }
      }
   }
}
