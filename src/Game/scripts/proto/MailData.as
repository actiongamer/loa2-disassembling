package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class MailData extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.MailData.id","id",8 | 0);
      
      public static const ICONID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MailData.iconId","iconId",16 | 0);
      
      public static const FLAGBASE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MailData.flagBase","flagBase",24 | 0);
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MailData.time","time",32 | 0);
      
      public static const STATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MailData.status","status",40 | 0);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MailData.kind","kind",48 | 0);
      
      public static const SENDERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.MailData.senderId","senderId",56 | 0);
      
      public static const SENDERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.MailData.senderName","senderName",64 | 2);
      
      public static const RECEIVEID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.MailData.receiveId","receiveId",72 | 0);
      
      public static const RECEIVENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.MailData.receiveName","receiveName",80 | 2);
      
      public static const TITLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.MailData.title","title",88 | 2);
      
      public static const CONTENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.MailData.content","content",96 | 2);
      
      public static const FAMILYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.MailData.familyName","familyName",104 | 2);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.MailData.reward","reward",112 | 2,Reward);
      
      public static const READTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MailData.readTm","readTm",120 | 0);
       
      
      private var id$field:UInt64;
      
      private var iconId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var flagBase$field:uint;
      
      private var time$field:uint;
      
      private var status$field:uint;
      
      private var kind$field:uint;
      
      private var senderId$field:UInt64;
      
      private var senderName$field:String;
      
      private var receiveId$field:UInt64;
      
      private var receiveName$field:String;
      
      private var title$field:String;
      
      private var content$field:String;
      
      private var familyName$field:String;
      
      public var reward:Array;
      
      private var readTm$field:uint;
      
      public function MailData()
      {
         reward = [];
         super();
      }
      
      public function clearId() : void
      {
         id$field = null;
      }
      
      public function get hasId() : Boolean
      {
         return id$field != null;
      }
      
      public function set id(param1:UInt64) : void
      {
         id$field = param1;
      }
      
      public function get id() : UInt64
      {
         return id$field;
      }
      
      public function clearIconId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         iconId$field = new uint();
      }
      
      public function get hasIconId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set iconId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         iconId$field = param1;
      }
      
      public function get iconId() : uint
      {
         return iconId$field;
      }
      
      public function clearFlagBase() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         flagBase$field = new uint();
      }
      
      public function get hasFlagBase() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set flagBase(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         flagBase$field = param1;
      }
      
      public function get flagBase() : uint
      {
         return flagBase$field;
      }
      
      public function clearTime() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         time$field = new uint();
      }
      
      public function get hasTime() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set time(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         time$field = param1;
      }
      
      public function get time() : uint
      {
         return time$field;
      }
      
      public function clearStatus() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         status$field = new uint();
      }
      
      public function get hasStatus() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set status(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         status$field = param1;
      }
      
      public function get status() : uint
      {
         return status$field;
      }
      
      public function clearKind() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         kind$field = new uint();
      }
      
      public function get hasKind() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set kind(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         kind$field = param1;
      }
      
      public function get kind() : uint
      {
         return kind$field;
      }
      
      public function clearSenderId() : void
      {
         senderId$field = null;
      }
      
      public function get hasSenderId() : Boolean
      {
         return senderId$field != null;
      }
      
      public function set senderId(param1:UInt64) : void
      {
         senderId$field = param1;
      }
      
      public function get senderId() : UInt64
      {
         return senderId$field;
      }
      
      public function clearSenderName() : void
      {
         senderName$field = null;
      }
      
      public function get hasSenderName() : Boolean
      {
         return senderName$field != null;
      }
      
      public function set senderName(param1:String) : void
      {
         senderName$field = param1;
      }
      
      public function get senderName() : String
      {
         return senderName$field;
      }
      
      public function clearReceiveId() : void
      {
         receiveId$field = null;
      }
      
      public function get hasReceiveId() : Boolean
      {
         return receiveId$field != null;
      }
      
      public function set receiveId(param1:UInt64) : void
      {
         receiveId$field = param1;
      }
      
      public function get receiveId() : UInt64
      {
         return receiveId$field;
      }
      
      public function clearReceiveName() : void
      {
         receiveName$field = null;
      }
      
      public function get hasReceiveName() : Boolean
      {
         return receiveName$field != null;
      }
      
      public function set receiveName(param1:String) : void
      {
         receiveName$field = param1;
      }
      
      public function get receiveName() : String
      {
         return receiveName$field;
      }
      
      public function clearTitle() : void
      {
         title$field = null;
      }
      
      public function get hasTitle() : Boolean
      {
         return title$field != null;
      }
      
      public function set title(param1:String) : void
      {
         title$field = param1;
      }
      
      public function get title() : String
      {
         return title$field;
      }
      
      public function clearContent() : void
      {
         content$field = null;
      }
      
      public function get hasContent() : Boolean
      {
         return content$field != null;
      }
      
      public function set content(param1:String) : void
      {
         content$field = param1;
      }
      
      public function get content() : String
      {
         return content$field;
      }
      
      public function clearFamilyName() : void
      {
         familyName$field = null;
      }
      
      public function get hasFamilyName() : Boolean
      {
         return familyName$field != null;
      }
      
      public function set familyName(param1:String) : void
      {
         familyName$field = param1;
      }
      
      public function get familyName() : String
      {
         return familyName$field;
      }
      
      public function clearReadTm() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         readTm$field = new uint();
      }
      
      public function get hasReadTm() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set readTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         readTm$field = param1;
      }
      
      public function get readTm() : uint
      {
         return readTm$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT64(param1,id$field);
         }
         if(hasIconId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,iconId$field);
         }
         if(hasFlagBase)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,flagBase$field);
         }
         if(hasTime)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,time$field);
         }
         if(hasStatus)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,status$field);
         }
         if(hasKind)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,kind$field);
         }
         if(hasSenderId)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT64(param1,senderId$field);
         }
         if(hasSenderName)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_STRING(param1,senderName$field);
         }
         if(hasReceiveId)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT64(param1,receiveId$field);
         }
         if(hasReceiveName)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_STRING(param1,receiveName$field);
         }
         if(hasTitle)
         {
            WriteUtils.writeTag(param1,2,11);
            WriteUtils.write$TYPE_STRING(param1,title$field);
         }
         if(hasContent)
         {
            WriteUtils.writeTag(param1,2,12);
            WriteUtils.write$TYPE_STRING(param1,content$field);
         }
         if(hasFamilyName)
         {
            WriteUtils.writeTag(param1,2,13);
            WriteUtils.write$TYPE_STRING(param1,familyName$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,2,14);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc2_]);
            _loc2_++;
         }
         if(hasReadTm)
         {
            WriteUtils.writeTag(param1,0,15);
            WriteUtils.write$TYPE_UINT32(param1,readTm$field);
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
         var _loc10_:* = 0;
         var _loc16_:uint = 0;
         var _loc12_:uint = 0;
         var _loc17_:uint = 0;
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         var _loc6_:uint = 0;
         var _loc9_:uint = 0;
         var _loc5_:uint = 0;
         var _loc14_:uint = 0;
         var _loc7_:uint = 0;
         var _loc13_:uint = 0;
         var _loc11_:uint = 0;
         var _loc3_:uint = 0;
         var _loc15_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc10_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc10_ >> 3) - 1)
            {
               case 0:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: MailData.id cannot be set twice.");
                  }
                  _loc16_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: MailData.iconId cannot be set twice.");
                  }
                  _loc12_++;
                  this.iconId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: MailData.flagBase cannot be set twice.");
                  }
                  _loc17_++;
                  this.flagBase = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: MailData.time cannot be set twice.");
                  }
                  _loc4_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: MailData.status cannot be set twice.");
                  }
                  _loc8_++;
                  this.status = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: MailData.kind cannot be set twice.");
                  }
                  _loc6_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: MailData.senderId cannot be set twice.");
                  }
                  _loc9_++;
                  this.senderId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 7:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: MailData.senderName cannot be set twice.");
                  }
                  _loc5_++;
                  this.senderName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 8:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: MailData.receiveId cannot be set twice.");
                  }
                  _loc14_++;
                  this.receiveId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 9:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: MailData.receiveName cannot be set twice.");
                  }
                  _loc7_++;
                  this.receiveName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 10:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: MailData.title cannot be set twice.");
                  }
                  _loc13_++;
                  this.title = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 11:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: MailData.content cannot be set twice.");
                  }
                  _loc11_++;
                  this.content = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 12:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: MailData.familyName cannot be set twice.");
                  }
                  _loc3_++;
                  this.familyName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 13:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Reward()));
                  continue;
               case 14:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: MailData.readTm cannot be set twice.");
                  }
                  _loc15_++;
                  this.readTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
