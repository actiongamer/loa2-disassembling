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
   
   public class PublicTalkNotify extends Message
   {
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.PublicTalkNotify.playerId","playerId",8 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.PublicTalkNotify.Name","name",16 | 2);
      
      public static const NPCID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PublicTalkNotify.npcId","npcId",24 | 0);
      
      public static const GMTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PublicTalkNotify.gmType","gmType",32 | 0);
      
      public static const PINDAO:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PublicTalkNotify.pindao","pindao",40 | 0);
      
      public static const CONTENT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.PublicTalkNotify.content","content",48 | 2,proto.TalkContent);
       
      
      public var parseResultVoMsg;
      
      public var parseResultVoContent;
      
      public var playerId:UInt64;
      
      public var name:String;
      
      public var npcId:uint;
      
      public var gmType:uint;
      
      public var pindao:uint;
      
      public var content:proto.TalkContent;
      
      public function PublicTalkNotify()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.playerId);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.npcId);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.gmType);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.pindao);
         WriteUtils.writeTag(param1,2,6);
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
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: PublicTalkNotify.playerId cannot be set twice.");
                  }
                  _loc9_++;
                  this.playerId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: PublicTalkNotify.name cannot be set twice.");
                  }
                  _loc8_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: PublicTalkNotify.npcId cannot be set twice.");
                  }
                  _loc6_++;
                  this.npcId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: PublicTalkNotify.gmType cannot be set twice.");
                  }
                  _loc7_++;
                  this.gmType = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: PublicTalkNotify.pindao cannot be set twice.");
                  }
                  _loc3_++;
                  this.pindao = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: PublicTalkNotify.content cannot be set twice.");
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
