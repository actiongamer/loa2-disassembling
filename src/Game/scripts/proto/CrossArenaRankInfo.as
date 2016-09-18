package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CrossArenaRankInfo extends Message
   {
      
      public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.CrossArenaRankInfo.info","info",8 | 2,proto.PlayerBaseInfo);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaRankInfo.score","score",16 | 0);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaRankInfo.rank","rank",24 | 0);
      
      public static const WINTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaRankInfo.winTimes","winTimes",32 | 0);
      
      public static const FAILTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaRankInfo.failTimes","failTimes",40 | 0);
      
      public static const MASSFIGHTTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaRankInfo.massFightTimes","massFightTimes",48 | 0);
      
      public static const COUNTRY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaRankInfo.country","country",56 | 0);
       
      
      public var info:proto.PlayerBaseInfo;
      
      private var score$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var rank:uint;
      
      private var winTimes$field:uint;
      
      private var failTimes$field:uint;
      
      private var massFightTimes$field:uint;
      
      private var country$field:uint;
      
      public function CrossArenaRankInfo()
      {
         super();
      }
      
      public function clearScore() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         score$field = param1;
      }
      
      public function get score() : uint
      {
         return score$field;
      }
      
      public function clearWinTimes() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         winTimes$field = new uint();
      }
      
      public function get hasWinTimes() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set winTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         winTimes$field = param1;
      }
      
      public function get winTimes() : uint
      {
         return winTimes$field;
      }
      
      public function clearFailTimes() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         failTimes$field = new uint();
      }
      
      public function get hasFailTimes() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set failTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         failTimes$field = param1;
      }
      
      public function get failTimes() : uint
      {
         return failTimes$field;
      }
      
      public function clearMassFightTimes() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         massFightTimes$field = new uint();
      }
      
      public function get hasMassFightTimes() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set massFightTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         massFightTimes$field = param1;
      }
      
      public function get massFightTimes() : uint
      {
         return massFightTimes$field;
      }
      
      public function clearCountry() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         country$field = new uint();
      }
      
      public function get hasCountry() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set country(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         country$field = param1;
      }
      
      public function get country() : uint
      {
         return country$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.info);
         if(hasScore)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,score$field);
         }
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.rank);
         if(hasWinTimes)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,winTimes$field);
         }
         if(hasFailTimes)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,failTimes$field);
         }
         if(hasMassFightTimes)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,massFightTimes$field);
         }
         if(hasCountry)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,country$field);
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
         var _loc5_:* = 0;
         var _loc9_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc10_:uint = 0;
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaRankInfo.info cannot be set twice.");
                  }
                  _loc9_++;
                  this.info = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.info);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaRankInfo.score cannot be set twice.");
                  }
                  _loc7_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaRankInfo.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaRankInfo.winTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.winTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaRankInfo.failTimes cannot be set twice.");
                  }
                  _loc10_++;
                  this.failTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaRankInfo.massFightTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.massFightTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaRankInfo.country cannot be set twice.");
                  }
                  _loc8_++;
                  this.country = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
