package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CreatePlayerReq extends Message
   {
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CreatePlayerReq.name","name",8 | 2);
      
      public static const JOB:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CreatePlayerReq.job","job",16 | 0);
      
      public static const SEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CreatePlayerReq.sex","sex",24 | 0);
      
      public static const FASHION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CreatePlayerReq.fashion","fashion",32 | 0);
      
      public static const ADULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CreatePlayerReq.adult","adult",40 | 0);
      
      public static const BROWSER:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CreatePlayerReq.browser","browser",56 | 2);
      
      public static const FLASHVERSION:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CreatePlayerReq.flashVersion","flashVersion",64 | 2);
      
      public static const RESOLUTION:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CreatePlayerReq.resolution","resolution",72 | 2);
      
      public static const WEIDUAN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CreatePlayerReq.weiduan","weiduan",80 | 0);
      
      public static const CREATEKIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CreatePlayerReq.createkind","createkind",88 | 0);
      
      public static const OSINFO:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CreatePlayerReq.osInfo","osInfo",96 | 2);
      
      public static const LANG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CreatePlayerReq.lang","lang",104 | 2);
      
      public static const FBINVITETYPE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CreatePlayerReq.fbInviteType","fbInviteType",112 | 2);
      
      public static const VERIFY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CreatePlayerReq.verify","verify",120 | 2);
      
      public static const OPID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CreatePlayerReq.opId","opId",128 | 0);
       
      
      public var name:String;
      
      public var job:uint;
      
      private var sex$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var fashion:uint;
      
      private var adult$field:uint;
      
      private var browser$field:String;
      
      private var flashVersion$field:String;
      
      private var resolution$field:String;
      
      private var weiduan$field:uint;
      
      private var createkind$field:uint;
      
      public var osInfo:String;
      
      private var lang$field:String;
      
      private var fbInviteType$field:String;
      
      private var verify$field:String;
      
      private var opId$field:uint;
      
      public function CreatePlayerReq()
      {
         super();
      }
      
      public function clearSex() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         sex$field = new uint();
      }
      
      public function get hasSex() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set sex(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         sex$field = param1;
      }
      
      public function get sex() : uint
      {
         return sex$field;
      }
      
      public function clearAdult() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         adult$field = new uint();
      }
      
      public function get hasAdult() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set adult(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         adult$field = param1;
      }
      
      public function get adult() : uint
      {
         return adult$field;
      }
      
      public function clearBrowser() : void
      {
         browser$field = null;
      }
      
      public function get hasBrowser() : Boolean
      {
         return browser$field != null;
      }
      
      public function set browser(param1:String) : void
      {
         browser$field = param1;
      }
      
      public function get browser() : String
      {
         return browser$field;
      }
      
      public function clearFlashVersion() : void
      {
         flashVersion$field = null;
      }
      
      public function get hasFlashVersion() : Boolean
      {
         return flashVersion$field != null;
      }
      
      public function set flashVersion(param1:String) : void
      {
         flashVersion$field = param1;
      }
      
      public function get flashVersion() : String
      {
         return flashVersion$field;
      }
      
      public function clearResolution() : void
      {
         resolution$field = null;
      }
      
      public function get hasResolution() : Boolean
      {
         return resolution$field != null;
      }
      
      public function set resolution(param1:String) : void
      {
         resolution$field = param1;
      }
      
      public function get resolution() : String
      {
         return resolution$field;
      }
      
      public function clearWeiduan() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         weiduan$field = new uint();
      }
      
      public function get hasWeiduan() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set weiduan(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         weiduan$field = param1;
      }
      
      public function get weiduan() : uint
      {
         return weiduan$field;
      }
      
      public function clearCreatekind() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         createkind$field = new uint();
      }
      
      public function get hasCreatekind() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set createkind(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         createkind$field = param1;
      }
      
      public function get createkind() : uint
      {
         return createkind$field;
      }
      
      public function clearLang() : void
      {
         lang$field = null;
      }
      
      public function get hasLang() : Boolean
      {
         return lang$field != null;
      }
      
      public function set lang(param1:String) : void
      {
         lang$field = param1;
      }
      
      public function get lang() : String
      {
         return lang$field;
      }
      
      public function clearFbInviteType() : void
      {
         fbInviteType$field = null;
      }
      
      public function get hasFbInviteType() : Boolean
      {
         return fbInviteType$field != null;
      }
      
      public function set fbInviteType(param1:String) : void
      {
         fbInviteType$field = param1;
      }
      
      public function get fbInviteType() : String
      {
         return fbInviteType$field;
      }
      
      public function clearVerify() : void
      {
         verify$field = null;
      }
      
      public function get hasVerify() : Boolean
      {
         return verify$field != null;
      }
      
      public function set verify(param1:String) : void
      {
         verify$field = param1;
      }
      
      public function get verify() : String
      {
         return verify$field;
      }
      
      public function clearOpId() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         opId$field = new uint();
      }
      
      public function get hasOpId() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set opId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         opId$field = param1;
      }
      
      public function get opId() : uint
      {
         return opId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.job);
         if(hasSex)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,sex$field);
         }
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.fashion);
         if(hasAdult)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,adult$field);
         }
         if(hasBrowser)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_STRING(param1,browser$field);
         }
         if(hasFlashVersion)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_STRING(param1,flashVersion$field);
         }
         if(hasResolution)
         {
            WriteUtils.writeTag(param1,2,9);
            WriteUtils.write$TYPE_STRING(param1,resolution$field);
         }
         if(hasWeiduan)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,weiduan$field);
         }
         if(hasCreatekind)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,createkind$field);
         }
         WriteUtils.writeTag(param1,2,12);
         WriteUtils.write$TYPE_STRING(param1,this.osInfo);
         if(hasLang)
         {
            WriteUtils.writeTag(param1,2,13);
            WriteUtils.write$TYPE_STRING(param1,lang$field);
         }
         if(hasFbInviteType)
         {
            WriteUtils.writeTag(param1,2,14);
            WriteUtils.write$TYPE_STRING(param1,fbInviteType$field);
         }
         if(hasVerify)
         {
            WriteUtils.writeTag(param1,2,15);
            WriteUtils.write$TYPE_STRING(param1,verify$field);
         }
         if(hasOpId)
         {
            WriteUtils.writeTag(param1,0,16);
            WriteUtils.write$TYPE_UINT32(param1,opId$field);
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
         var _loc6_:* = 0;
         var _loc12_:uint = 0;
         var _loc7_:uint = 0;
         var _loc16_:uint = 0;
         var _loc3_:uint = 0;
         var _loc18_:uint = 0;
         var _loc13_:uint = 0;
         var _loc4_:uint = 0;
         var _loc11_:uint = 0;
         var _loc14_:uint = 0;
         var _loc8_:uint = 0;
         var _loc5_:uint = 0;
         var _loc17_:uint = 0;
         var _loc10_:uint = 0;
         var _loc9_:uint = 0;
         var _loc15_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: CreatePlayerReq.name cannot be set twice.");
                  }
                  _loc12_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: CreatePlayerReq.job cannot be set twice.");
                  }
                  _loc7_++;
                  this.job = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: CreatePlayerReq.sex cannot be set twice.");
                  }
                  _loc16_++;
                  this.sex = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CreatePlayerReq.fashion cannot be set twice.");
                  }
                  _loc3_++;
                  this.fashion = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: CreatePlayerReq.adult cannot be set twice.");
                  }
                  _loc18_++;
                  this.adult = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               default:
                  super.readUnknown(param1,_loc6_);
                  continue;
               case 6:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: CreatePlayerReq.browser cannot be set twice.");
                  }
                  _loc13_++;
                  this.browser = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 7:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CreatePlayerReq.flashVersion cannot be set twice.");
                  }
                  _loc4_++;
                  this.flashVersion = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 8:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: CreatePlayerReq.resolution cannot be set twice.");
                  }
                  _loc11_++;
                  this.resolution = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 9:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: CreatePlayerReq.weiduan cannot be set twice.");
                  }
                  _loc14_++;
                  this.weiduan = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 10:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: CreatePlayerReq.createkind cannot be set twice.");
                  }
                  _loc8_++;
                  this.createkind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 11:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CreatePlayerReq.osInfo cannot be set twice.");
                  }
                  _loc5_++;
                  this.osInfo = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 12:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: CreatePlayerReq.lang cannot be set twice.");
                  }
                  _loc17_++;
                  this.lang = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 13:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: CreatePlayerReq.fbInviteType cannot be set twice.");
                  }
                  _loc10_++;
                  this.fbInviteType = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 14:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: CreatePlayerReq.verify cannot be set twice.");
                  }
                  _loc9_++;
                  this.verify = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 15:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: CreatePlayerReq.opId cannot be set twice.");
                  }
                  _loc15_++;
                  this.opId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
