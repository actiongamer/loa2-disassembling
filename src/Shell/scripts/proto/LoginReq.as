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
   
   public class LoginReq extends Message
   {
      
      public static const TOKEN:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.LoginReq.token","token",8 | 2);
      
      public static const ACCOUNT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.LoginReq.account","account",16 | 2);
      
      public static const DISTRICT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LoginReq.district","district",24 | 0);
      
      public static const ADULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LoginReq.adult","adult",32 | 0);
      
      public static const GAMETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LoginReq.gameTime","gameTime",40 | 0);
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LoginReq.time","time",48 | 0);
      
      public static const BROWSER:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.LoginReq.browser","browser",56 | 2);
      
      public static const FLASHVERSION:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.LoginReq.flashVersion","flashVersion",64 | 2);
      
      public static const RESOLUTION:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.LoginReq.resolution","resolution",72 | 2);
      
      public static const IP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.LoginReq.ip","ip",80 | 2);
      
      public static const QQPARAM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.LoginReq.qqParam","qqParam",88 | 2);
      
      public static const WEIDUAN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LoginReq.weiduan","weiduan",96 | 0);
      
      public static const ADINFO:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.LoginReq.adInfo","adInfo",104 | 2);
      
      public static const REGTIME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.LoginReq.regTime","regTime",112 | 2);
      
      public static const OSINFO:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.LoginReq.osInfo","osInfo",120 | 2);
      
      public static const OPID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LoginReq.opId","opId",128 | 0);
       
      
      public var token:String;
      
      public var account:String;
      
      public var district:uint;
      
      private var adult$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var gameTime$field:uint;
      
      private var time$field:uint;
      
      private var browser$field:String;
      
      private var flashVersion$field:String;
      
      private var resolution$field:String;
      
      private var ip$field:String;
      
      private var qqParam$field:String;
      
      private var weiduan$field:uint;
      
      private var adInfo$field:String;
      
      private var regTime$field:String;
      
      public var osInfo:String;
      
      private var opId$field:uint;
      
      public function LoginReq()
      {
         super();
      }
      
      public function clearAdult() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         adult$field = new uint();
      }
      
      public function get hasAdult() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set adult(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         adult$field = param1;
      }
      
      public function get adult() : uint
      {
         return adult$field;
      }
      
      public function clearGameTime() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         gameTime$field = new uint();
      }
      
      public function get hasGameTime() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set gameTime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         gameTime$field = param1;
      }
      
      public function get gameTime() : uint
      {
         return gameTime$field;
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
      
      public function clearIp() : void
      {
         ip$field = null;
      }
      
      public function get hasIp() : Boolean
      {
         return ip$field != null;
      }
      
      public function set ip(param1:String) : void
      {
         ip$field = param1;
      }
      
      public function get ip() : String
      {
         return ip$field;
      }
      
      public function clearQqParam() : void
      {
         qqParam$field = null;
      }
      
      public function get hasQqParam() : Boolean
      {
         return qqParam$field != null;
      }
      
      public function set qqParam(param1:String) : void
      {
         qqParam$field = param1;
      }
      
      public function get qqParam() : String
      {
         return qqParam$field;
      }
      
      public function clearWeiduan() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         weiduan$field = new uint();
      }
      
      public function get hasWeiduan() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set weiduan(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         weiduan$field = param1;
      }
      
      public function get weiduan() : uint
      {
         return weiduan$field;
      }
      
      public function clearAdInfo() : void
      {
         adInfo$field = null;
      }
      
      public function get hasAdInfo() : Boolean
      {
         return adInfo$field != null;
      }
      
      public function set adInfo(param1:String) : void
      {
         adInfo$field = param1;
      }
      
      public function get adInfo() : String
      {
         return adInfo$field;
      }
      
      public function clearRegTime() : void
      {
         regTime$field = null;
      }
      
      public function get hasRegTime() : Boolean
      {
         return regTime$field != null;
      }
      
      public function set regTime(param1:String) : void
      {
         regTime$field = param1;
      }
      
      public function get regTime() : String
      {
         return regTime$field;
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
         WriteUtils.write$TYPE_STRING(param1,this.token);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.account);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.district);
         if(hasAdult)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,adult$field);
         }
         if(hasGameTime)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,gameTime$field);
         }
         if(hasTime)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,time$field);
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
         if(hasIp)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_STRING(param1,ip$field);
         }
         if(hasQqParam)
         {
            WriteUtils.writeTag(param1,2,11);
            WriteUtils.write$TYPE_STRING(param1,qqParam$field);
         }
         if(hasWeiduan)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,weiduan$field);
         }
         if(hasAdInfo)
         {
            WriteUtils.writeTag(param1,2,13);
            WriteUtils.write$TYPE_STRING(param1,adInfo$field);
         }
         if(hasRegTime)
         {
            WriteUtils.writeTag(param1,2,14);
            WriteUtils.write$TYPE_STRING(param1,regTime$field);
         }
         WriteUtils.writeTag(param1,2,15);
         WriteUtils.write$TYPE_STRING(param1,this.osInfo);
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
         var _loc8_:* = 0;
         var _loc9_:uint = 0;
         var _loc7_:uint = 0;
         var _loc12_:uint = 0;
         var _loc18_:uint = 0;
         var _loc14_:uint = 0;
         var _loc3_:uint = 0;
         var _loc13_:uint = 0;
         var _loc5_:uint = 0;
         var _loc10_:uint = 0;
         var _loc19_:uint = 0;
         var _loc17_:uint = 0;
         var _loc11_:uint = 0;
         var _loc16_:uint = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc15_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc8_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: LoginReq.token cannot be set twice.");
                  }
                  _loc9_++;
                  this.token = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: LoginReq.account cannot be set twice.");
                  }
                  _loc7_++;
                  this.account = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: LoginReq.district cannot be set twice.");
                  }
                  _loc12_++;
                  this.district = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: LoginReq.adult cannot be set twice.");
                  }
                  _loc18_++;
                  this.adult = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: LoginReq.gameTime cannot be set twice.");
                  }
                  _loc14_++;
                  this.gameTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: LoginReq.time cannot be set twice.");
                  }
                  _loc3_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: LoginReq.browser cannot be set twice.");
                  }
                  _loc13_++;
                  this.browser = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 7:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: LoginReq.flashVersion cannot be set twice.");
                  }
                  _loc5_++;
                  this.flashVersion = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: LoginReq.resolution cannot be set twice.");
                  }
                  _loc10_++;
                  this.resolution = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 9:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: LoginReq.ip cannot be set twice.");
                  }
                  _loc19_++;
                  this.ip = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 10:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: LoginReq.qqParam cannot be set twice.");
                  }
                  _loc17_++;
                  this.qqParam = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 11:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: LoginReq.weiduan cannot be set twice.");
                  }
                  _loc11_++;
                  this.weiduan = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 12:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: LoginReq.adInfo cannot be set twice.");
                  }
                  _loc16_++;
                  this.adInfo = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 13:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: LoginReq.regTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.regTime = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 14:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: LoginReq.osInfo cannot be set twice.");
                  }
                  _loc6_++;
                  this.osInfo = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 15:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: LoginReq.opId cannot be set twice.");
                  }
                  _loc15_++;
                  this.opId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
