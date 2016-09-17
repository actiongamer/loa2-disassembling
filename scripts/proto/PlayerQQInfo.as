package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class PlayerQQInfo extends Message
   {
      
      public static const ISBLUEVIP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerQQInfo.isBlueVip","isBlueVip",8 | 0);
      
      public static const ISBLUEYEARVIP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerQQInfo.isBlueyearVip","isBlueyearVip",16 | 0);
      
      public static const BLUEVIPLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerQQInfo.blueVipLevel","blueVipLevel",24 | 0);
      
      public static const ISYELLOWVIP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerQQInfo.isYellowVip","isYellowVip",32 | 0);
      
      public static const ISYELLOWYEARVIP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerQQInfo.isYellowyearVip","isYellowyearVip",40 | 0);
      
      public static const YELLOWVIPLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerQQInfo.yellowVipLevel","yellowVipLevel",48 | 0);
      
      public static const ISYELLOWHIGHVIP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerQQInfo.isYellowHighvip","isYellowHighvip",56 | 0);
      
      public static const VIPTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerQQInfo.vipType","vipType",64 | 0);
      
      public static const ISBLUEHIGHVIP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerQQInfo.isBlueHighvip","isBlueHighvip",72 | 0);
      
      public static const BLUEVIPVALID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerQQInfo.blueVipValid","blueVipValid",80 | 0);
      
      public static const BLUEYEARVIPVALID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerQQInfo.blueYearVipValid","blueYearVipValid",88 | 0);
      
      public static const BLUEHIGHVIPVALID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerQQInfo.blueHighVipValid","blueHighVipValid",96 | 0);
       
      
      private var isBlueVip$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var isBlueyearVip$field:uint;
      
      private var blueVipLevel$field:uint;
      
      private var isYellowVip$field:uint;
      
      private var isYellowyearVip$field:uint;
      
      private var yellowVipLevel$field:uint;
      
      private var isYellowHighvip$field:uint;
      
      private var vipType$field:uint;
      
      private var isBlueHighvip$field:uint;
      
      private var blueVipValid$field:uint;
      
      private var blueYearVipValid$field:uint;
      
      private var blueHighVipValid$field:uint;
      
      public function PlayerQQInfo()
      {
         super();
      }
      
      public function clearIsBlueVip() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         isBlueVip$field = new uint();
      }
      
      public function get hasIsBlueVip() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set isBlueVip(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         isBlueVip$field = param1;
      }
      
      public function get isBlueVip() : uint
      {
         return isBlueVip$field;
      }
      
      public function clearIsBlueyearVip() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         isBlueyearVip$field = new uint();
      }
      
      public function get hasIsBlueyearVip() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set isBlueyearVip(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         isBlueyearVip$field = param1;
      }
      
      public function get isBlueyearVip() : uint
      {
         return isBlueyearVip$field;
      }
      
      public function clearBlueVipLevel() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         blueVipLevel$field = new uint();
      }
      
      public function get hasBlueVipLevel() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set blueVipLevel(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         blueVipLevel$field = param1;
      }
      
      public function get blueVipLevel() : uint
      {
         return blueVipLevel$field;
      }
      
      public function clearIsYellowVip() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         isYellowVip$field = new uint();
      }
      
      public function get hasIsYellowVip() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set isYellowVip(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         isYellowVip$field = param1;
      }
      
      public function get isYellowVip() : uint
      {
         return isYellowVip$field;
      }
      
      public function clearIsYellowyearVip() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         isYellowyearVip$field = new uint();
      }
      
      public function get hasIsYellowyearVip() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set isYellowyearVip(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         isYellowyearVip$field = param1;
      }
      
      public function get isYellowyearVip() : uint
      {
         return isYellowyearVip$field;
      }
      
      public function clearYellowVipLevel() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         yellowVipLevel$field = new uint();
      }
      
      public function get hasYellowVipLevel() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set yellowVipLevel(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         yellowVipLevel$field = param1;
      }
      
      public function get yellowVipLevel() : uint
      {
         return yellowVipLevel$field;
      }
      
      public function clearIsYellowHighvip() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         isYellowHighvip$field = new uint();
      }
      
      public function get hasIsYellowHighvip() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set isYellowHighvip(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         isYellowHighvip$field = param1;
      }
      
      public function get isYellowHighvip() : uint
      {
         return isYellowHighvip$field;
      }
      
      public function clearVipType() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         vipType$field = new uint();
      }
      
      public function get hasVipType() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set vipType(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         vipType$field = param1;
      }
      
      public function get vipType() : uint
      {
         return vipType$field;
      }
      
      public function clearIsBlueHighvip() : void
      {
         hasField$0 = hasField$0 & 4294967039;
         isBlueHighvip$field = new uint();
      }
      
      public function get hasIsBlueHighvip() : Boolean
      {
         return (hasField$0 & 256) != 0;
      }
      
      public function set isBlueHighvip(param1:uint) : void
      {
         hasField$0 = hasField$0 | 256;
         isBlueHighvip$field = param1;
      }
      
      public function get isBlueHighvip() : uint
      {
         return isBlueHighvip$field;
      }
      
      public function clearBlueVipValid() : void
      {
         hasField$0 = hasField$0 & 4294966783;
         blueVipValid$field = new uint();
      }
      
      public function get hasBlueVipValid() : Boolean
      {
         return (hasField$0 & 512) != 0;
      }
      
      public function set blueVipValid(param1:uint) : void
      {
         hasField$0 = hasField$0 | 512;
         blueVipValid$field = param1;
      }
      
      public function get blueVipValid() : uint
      {
         return blueVipValid$field;
      }
      
      public function clearBlueYearVipValid() : void
      {
         hasField$0 = hasField$0 & 4294966271;
         blueYearVipValid$field = new uint();
      }
      
      public function get hasBlueYearVipValid() : Boolean
      {
         return (hasField$0 & 1024) != 0;
      }
      
      public function set blueYearVipValid(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1024;
         blueYearVipValid$field = param1;
      }
      
      public function get blueYearVipValid() : uint
      {
         return blueYearVipValid$field;
      }
      
      public function clearBlueHighVipValid() : void
      {
         hasField$0 = hasField$0 & 4294965247;
         blueHighVipValid$field = new uint();
      }
      
      public function get hasBlueHighVipValid() : Boolean
      {
         return (hasField$0 & 2048) != 0;
      }
      
      public function set blueHighVipValid(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2048;
         blueHighVipValid$field = param1;
      }
      
      public function get blueHighVipValid() : uint
      {
         return blueHighVipValid$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasIsBlueVip)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,isBlueVip$field);
         }
         if(hasIsBlueyearVip)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,isBlueyearVip$field);
         }
         if(hasBlueVipLevel)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,blueVipLevel$field);
         }
         if(hasIsYellowVip)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,isYellowVip$field);
         }
         if(hasIsYellowyearVip)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,isYellowyearVip$field);
         }
         if(hasYellowVipLevel)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,yellowVipLevel$field);
         }
         if(hasIsYellowHighvip)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,isYellowHighvip$field);
         }
         if(hasVipType)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,vipType$field);
         }
         if(hasIsBlueHighvip)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,isBlueHighvip$field);
         }
         if(hasBlueVipValid)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,blueVipValid$field);
         }
         if(hasBlueYearVipValid)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,blueYearVipValid$field);
         }
         if(hasBlueHighVipValid)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,blueHighVipValid$field);
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
         var _loc7_:uint = 0;
         var _loc12_:uint = 0;
         var _loc14_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc15_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc13_:uint = 0;
         var _loc11_:uint = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerQQInfo.isBlueVip cannot be set twice.");
                  }
                  _loc7_++;
                  this.isBlueVip = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerQQInfo.isBlueyearVip cannot be set twice.");
                  }
                  _loc12_++;
                  this.isBlueyearVip = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerQQInfo.blueVipLevel cannot be set twice.");
                  }
                  _loc14_++;
                  this.blueVipLevel = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerQQInfo.isYellowVip cannot be set twice.");
                  }
                  _loc5_++;
                  this.isYellowVip = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerQQInfo.isYellowyearVip cannot be set twice.");
                  }
                  _loc4_++;
                  this.isYellowyearVip = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerQQInfo.yellowVipLevel cannot be set twice.");
                  }
                  _loc15_++;
                  this.yellowVipLevel = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerQQInfo.isYellowHighvip cannot be set twice.");
                  }
                  _loc9_++;
                  this.isYellowHighvip = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerQQInfo.vipType cannot be set twice.");
                  }
                  _loc10_++;
                  this.vipType = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerQQInfo.isBlueHighvip cannot be set twice.");
                  }
                  _loc13_++;
                  this.isBlueHighvip = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerQQInfo.blueVipValid cannot be set twice.");
                  }
                  _loc11_++;
                  this.blueVipValid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 10:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerQQInfo.blueYearVipValid cannot be set twice.");
                  }
                  _loc8_++;
                  this.blueYearVipValid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 11:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerQQInfo.blueHighVipValid cannot be set twice.");
                  }
                  _loc3_++;
                  this.blueHighVipValid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
