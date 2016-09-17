package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class StaticActivity extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivity.id","id",8 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticActivity.name","name",16 | 2);
      
      public static const MINLV:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivity.minlv","minlv",24 | 0);
      
      public static const MAXLV:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivity.maxlv","maxlv",32 | 0);
      
      public static const MINVIP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivity.minvip","minvip",40 | 0);
      
      public static const MAXVIP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivity.maxvip","maxvip",48 | 0);
      
      public static const STARTTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivity.starttm","starttm",56 | 0);
      
      public static const ENDTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivity.endtm","endtm",64 | 0);
      
      public static const AWARD_STARTTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivity.award_starttm","awardStarttm",72 | 0);
      
      public static const AWARD_ENDTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivity.award_endtm","awardEndtm",80 | 0);
      
      public static const PICTURES:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticActivity.pictures","pictures",88 | 2);
      
      public static const NOTICE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticActivity.notice","notice",96 | 2);
      
      public static const AR:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.StaticActivity.ar","ar",104 | 2,StaticActivityReward);
      
      public static const ACT_LINK:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticActivity.act_link","actLink",112 | 2);
      
      public static const NOTICE_POSITION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivity.notice_position","noticePosition",120 | 0);
      
      public static const ORDER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivity.order","order",128 | 0);
      
      public static const NOTICE_STARTTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivity.notice_starttm","noticeStarttm",136 | 0);
      
      public static const NOTICE_ENDTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivity.notice_endtm","noticeEndtm",144 | 0);
       
      
      public var id:uint;
      
      private var name$field:String;
      
      private var minlv$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var maxlv$field:uint;
      
      private var minvip$field:uint;
      
      private var maxvip$field:uint;
      
      private var starttm$field:uint;
      
      private var endtm$field:uint;
      
      private var award_starttm$field:uint;
      
      private var award_endtm$field:uint;
      
      private var pictures$field:String;
      
      private var notice$field:String;
      
      public var ar:Array;
      
      private var act_link$field:String;
      
      private var notice_position$field:uint;
      
      private var order$field:uint;
      
      private var notice_starttm$field:uint;
      
      private var notice_endtm$field:uint;
      
      public function StaticActivity()
      {
         ar = [];
         super();
      }
      
      public function clearName() : void
      {
         name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         name$field = param1;
      }
      
      public function get name() : String
      {
         return name$field;
      }
      
      public function clearMinlv() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         minlv$field = new uint();
      }
      
      public function get hasMinlv() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set minlv(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         minlv$field = param1;
      }
      
      public function get minlv() : uint
      {
         return minlv$field;
      }
      
      public function clearMaxlv() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         maxlv$field = new uint();
      }
      
      public function get hasMaxlv() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set maxlv(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         maxlv$field = param1;
      }
      
      public function get maxlv() : uint
      {
         return maxlv$field;
      }
      
      public function clearMinvip() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         minvip$field = new uint();
      }
      
      public function get hasMinvip() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set minvip(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         minvip$field = param1;
      }
      
      public function get minvip() : uint
      {
         return minvip$field;
      }
      
      public function clearMaxvip() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         maxvip$field = new uint();
      }
      
      public function get hasMaxvip() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set maxvip(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         maxvip$field = param1;
      }
      
      public function get maxvip() : uint
      {
         return maxvip$field;
      }
      
      public function clearStarttm() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         starttm$field = new uint();
      }
      
      public function get hasStarttm() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set starttm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         starttm$field = param1;
      }
      
      public function get starttm() : uint
      {
         return starttm$field;
      }
      
      public function clearEndtm() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         endtm$field = new uint();
      }
      
      public function get hasEndtm() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set endtm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         endtm$field = param1;
      }
      
      public function get endtm() : uint
      {
         return endtm$field;
      }
      
      public function clearAwardStarttm() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         award_starttm$field = new uint();
      }
      
      public function get hasAwardStarttm() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set awardStarttm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         award_starttm$field = param1;
      }
      
      public function get awardStarttm() : uint
      {
         return award_starttm$field;
      }
      
      public function clearAwardEndtm() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         award_endtm$field = new uint();
      }
      
      public function get hasAwardEndtm() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set awardEndtm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         award_endtm$field = param1;
      }
      
      public function get awardEndtm() : uint
      {
         return award_endtm$field;
      }
      
      public function clearPictures() : void
      {
         pictures$field = null;
      }
      
      public function get hasPictures() : Boolean
      {
         return pictures$field != null;
      }
      
      public function set pictures(param1:String) : void
      {
         pictures$field = param1;
      }
      
      public function get pictures() : String
      {
         return pictures$field;
      }
      
      public function clearNotice() : void
      {
         notice$field = null;
      }
      
      public function get hasNotice() : Boolean
      {
         return notice$field != null;
      }
      
      public function set notice(param1:String) : void
      {
         notice$field = param1;
      }
      
      public function get notice() : String
      {
         return notice$field;
      }
      
      public function clearActLink() : void
      {
         act_link$field = null;
      }
      
      public function get hasActLink() : Boolean
      {
         return act_link$field != null;
      }
      
      public function set actLink(param1:String) : void
      {
         act_link$field = param1;
      }
      
      public function get actLink() : String
      {
         return act_link$field;
      }
      
      public function clearNoticePosition() : void
      {
         hasField$0 = hasField$0 & 4294967039;
         notice_position$field = new uint();
      }
      
      public function get hasNoticePosition() : Boolean
      {
         return (hasField$0 & 256) != 0;
      }
      
      public function set noticePosition(param1:uint) : void
      {
         hasField$0 = hasField$0 | 256;
         notice_position$field = param1;
      }
      
      public function get noticePosition() : uint
      {
         return notice_position$field;
      }
      
      public function clearOrder() : void
      {
         hasField$0 = hasField$0 & 4294966783;
         order$field = new uint();
      }
      
      public function get hasOrder() : Boolean
      {
         return (hasField$0 & 512) != 0;
      }
      
      public function set order(param1:uint) : void
      {
         hasField$0 = hasField$0 | 512;
         order$field = param1;
      }
      
      public function get order() : uint
      {
         return order$field;
      }
      
      public function clearNoticeStarttm() : void
      {
         hasField$0 = hasField$0 & 4294966271;
         notice_starttm$field = new uint();
      }
      
      public function get hasNoticeStarttm() : Boolean
      {
         return (hasField$0 & 1024) != 0;
      }
      
      public function set noticeStarttm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1024;
         notice_starttm$field = param1;
      }
      
      public function get noticeStarttm() : uint
      {
         return notice_starttm$field;
      }
      
      public function clearNoticeEndtm() : void
      {
         hasField$0 = hasField$0 & 4294965247;
         notice_endtm$field = new uint();
      }
      
      public function get hasNoticeEndtm() : Boolean
      {
         return (hasField$0 & 2048) != 0;
      }
      
      public function set noticeEndtm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2048;
         notice_endtm$field = param1;
      }
      
      public function get noticeEndtm() : uint
      {
         return notice_endtm$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         if(hasName)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,name$field);
         }
         if(hasMinlv)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,minlv$field);
         }
         if(hasMaxlv)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,maxlv$field);
         }
         if(hasMinvip)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,minvip$field);
         }
         if(hasMaxvip)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,maxvip$field);
         }
         if(hasStarttm)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,starttm$field);
         }
         if(hasEndtm)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,endtm$field);
         }
         if(hasAwardStarttm)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,award_starttm$field);
         }
         if(hasAwardEndtm)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,award_endtm$field);
         }
         if(hasPictures)
         {
            WriteUtils.writeTag(param1,2,11);
            WriteUtils.write$TYPE_STRING(param1,pictures$field);
         }
         if(hasNotice)
         {
            WriteUtils.writeTag(param1,2,12);
            WriteUtils.write$TYPE_STRING(param1,notice$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.ar.length)
         {
            WriteUtils.writeTag(param1,2,13);
            WriteUtils.write$TYPE_MESSAGE(param1,this.ar[_loc2_]);
            _loc2_++;
         }
         if(hasActLink)
         {
            WriteUtils.writeTag(param1,2,14);
            WriteUtils.write$TYPE_STRING(param1,act_link$field);
         }
         if(hasNoticePosition)
         {
            WriteUtils.writeTag(param1,0,15);
            WriteUtils.write$TYPE_UINT32(param1,notice_position$field);
         }
         if(hasOrder)
         {
            WriteUtils.writeTag(param1,0,16);
            WriteUtils.write$TYPE_UINT32(param1,order$field);
         }
         if(hasNoticeStarttm)
         {
            WriteUtils.writeTag(param1,0,17);
            WriteUtils.write$TYPE_UINT32(param1,notice_starttm$field);
         }
         if(hasNoticeEndtm)
         {
            WriteUtils.writeTag(param1,0,18);
            WriteUtils.write$TYPE_UINT32(param1,notice_endtm$field);
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
         var _loc5_:* = 0;
         var _loc20_:uint = 0;
         var _loc12_:uint = 0;
         var _loc11_:uint = 0;
         var _loc10_:uint = 0;
         var _loc14_:uint = 0;
         var _loc16_:uint = 0;
         var _loc6_:uint = 0;
         var _loc17_:uint = 0;
         var _loc18_:uint = 0;
         var _loc15_:uint = 0;
         var _loc8_:uint = 0;
         var _loc7_:uint = 0;
         var _loc13_:uint = 0;
         var _loc4_:uint = 0;
         var _loc19_:uint = 0;
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc20_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.id cannot be set twice.");
                  }
                  _loc20_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.name cannot be set twice.");
                  }
                  _loc12_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.minlv cannot be set twice.");
                  }
                  _loc11_++;
                  this.minlv = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.maxlv cannot be set twice.");
                  }
                  _loc10_++;
                  this.maxlv = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.minvip cannot be set twice.");
                  }
                  _loc14_++;
                  this.minvip = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.maxvip cannot be set twice.");
                  }
                  _loc16_++;
                  this.maxvip = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.starttm cannot be set twice.");
                  }
                  _loc6_++;
                  this.starttm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.endtm cannot be set twice.");
                  }
                  _loc17_++;
                  this.endtm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.awardStarttm cannot be set twice.");
                  }
                  _loc18_++;
                  this.awardStarttm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.awardEndtm cannot be set twice.");
                  }
                  _loc15_++;
                  this.awardEndtm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 10:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.pictures cannot be set twice.");
                  }
                  _loc8_++;
                  this.pictures = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 11:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.notice cannot be set twice.");
                  }
                  _loc7_++;
                  this.notice = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 12:
                  this.ar.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticActivityReward()));
                  continue;
               case 13:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.actLink cannot be set twice.");
                  }
                  _loc13_++;
                  this.actLink = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 14:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.noticePosition cannot be set twice.");
                  }
                  _loc4_++;
                  this.noticePosition = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 15:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.order cannot be set twice.");
                  }
                  _loc19_++;
                  this.order = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 16:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.noticeStarttm cannot be set twice.");
                  }
                  _loc9_++;
                  this.noticeStarttm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 17:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivity.noticeEndtm cannot be set twice.");
                  }
                  _loc3_++;
                  this.noticeEndtm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
