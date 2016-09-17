package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GameChatContent extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.GameChatContent.id","id",8 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.GameChatContent.name","name",16 | 2);
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GameChatContent.time","time",24 | 0);
      
      public static const CONTENT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GameChatContent.content","content",32 | 2,proto.PublicTalkNotify);
       
      
      public var id:UInt64;
      
      public var name:String;
      
      public var time:uint;
      
      public var content:proto.PublicTalkNotify;
      
      public function GameChatContent()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.time);
         WriteUtils.writeTag(param1,2,4);
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
         var _loc5_:* = 0;
         var _loc7_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: GameChatContent.id cannot be set twice.");
                  }
                  _loc7_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GameChatContent.name cannot be set twice.");
                  }
                  _loc4_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: GameChatContent.time cannot be set twice.");
                  }
                  _loc3_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: GameChatContent.content cannot be set twice.");
                  }
                  _loc6_++;
                  this.content = new proto.PublicTalkNotify();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.content);
                  continue;
            }
         }
      }
   }
}
