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
   
   public class BgStageReportInfo extends Message
   {
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BgStageReportInfo.baseInfo","baseInfo",8 | 2,proto.PlayerBaseInfo);
      
      public static const GATHERNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageReportInfo.gatherNum","gatherNum",16 | 0);
      
      public static const GATHERHONOR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageReportInfo.gatherHonor","gatherHonor",24 | 0);
      
      public static const KILLNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageReportInfo.killNum","killNum",32 | 0);
      
      public static const KILLHONOR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageReportInfo.killHonor","killHonor",40 | 0);
      
      public static const ASSISTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageReportInfo.assistNum","assistNum",48 | 0);
      
      public static const ASSISTHONOR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageReportInfo.assistHonor","assistHonor",56 | 0);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageReportInfo.score","score",64 | 0);
      
      public static const SIDE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageReportInfo.side","side",72 | 0);
      
      public static const RESULTHONOR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageReportInfo.resultHonor","resultHonor",80 | 0);
       
      
      public var baseInfo:proto.PlayerBaseInfo;
      
      private var gatherNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var gatherHonor$field:uint;
      
      private var killNum$field:uint;
      
      private var killHonor$field:uint;
      
      private var assistNum$field:uint;
      
      private var assistHonor$field:uint;
      
      private var score$field:uint;
      
      private var side$field:uint;
      
      private var resultHonor$field:uint;
      
      public function BgStageReportInfo()
      {
         super();
      }
      
      public function clearGatherNum() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         gatherNum$field = new uint();
      }
      
      public function get hasGatherNum() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set gatherNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         gatherNum$field = param1;
      }
      
      public function get gatherNum() : uint
      {
         return gatherNum$field;
      }
      
      public function clearGatherHonor() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         gatherHonor$field = new uint();
      }
      
      public function get hasGatherHonor() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set gatherHonor(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         gatherHonor$field = param1;
      }
      
      public function get gatherHonor() : uint
      {
         return gatherHonor$field;
      }
      
      public function clearKillNum() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         killNum$field = new uint();
      }
      
      public function get hasKillNum() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set killNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         killNum$field = param1;
      }
      
      public function get killNum() : uint
      {
         return killNum$field;
      }
      
      public function clearKillHonor() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         killHonor$field = new uint();
      }
      
      public function get hasKillHonor() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set killHonor(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         killHonor$field = param1;
      }
      
      public function get killHonor() : uint
      {
         return killHonor$field;
      }
      
      public function clearAssistNum() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         assistNum$field = new uint();
      }
      
      public function get hasAssistNum() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set assistNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         assistNum$field = param1;
      }
      
      public function get assistNum() : uint
      {
         return assistNum$field;
      }
      
      public function clearAssistHonor() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         assistHonor$field = new uint();
      }
      
      public function get hasAssistHonor() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set assistHonor(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         assistHonor$field = param1;
      }
      
      public function get assistHonor() : uint
      {
         return assistHonor$field;
      }
      
      public function clearScore() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         score$field = param1;
      }
      
      public function get score() : uint
      {
         return score$field;
      }
      
      public function clearSide() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         side$field = new uint();
      }
      
      public function get hasSide() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set side(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         side$field = param1;
      }
      
      public function get side() : uint
      {
         return side$field;
      }
      
      public function clearResultHonor() : void
      {
         hasField$0 = hasField$0 & 4294967039;
         resultHonor$field = new uint();
      }
      
      public function get hasResultHonor() : Boolean
      {
         return (hasField$0 & 256) != 0;
      }
      
      public function set resultHonor(param1:uint) : void
      {
         hasField$0 = hasField$0 | 256;
         resultHonor$field = param1;
      }
      
      public function get resultHonor() : uint
      {
         return resultHonor$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.baseInfo);
         if(hasGatherNum)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,gatherNum$field);
         }
         if(hasGatherHonor)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,gatherHonor$field);
         }
         if(hasKillNum)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,killNum$field);
         }
         if(hasKillHonor)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,killHonor$field);
         }
         if(hasAssistNum)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,assistNum$field);
         }
         if(hasAssistHonor)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,assistHonor$field);
         }
         if(hasScore)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,score$field);
         }
         if(hasSide)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,side$field);
         }
         if(hasResultHonor)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,resultHonor$field);
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
         var _loc13_:uint = 0;
         var _loc9_:uint = 0;
         var _loc6_:uint = 0;
         var _loc11_:uint = 0;
         var _loc8_:uint = 0;
         var _loc10_:uint = 0;
         var _loc5_:uint = 0;
         var _loc12_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageReportInfo.baseInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.baseInfo = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseInfo);
                  continue;
               case 1:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageReportInfo.gatherNum cannot be set twice.");
                  }
                  _loc13_++;
                  this.gatherNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageReportInfo.gatherHonor cannot be set twice.");
                  }
                  _loc9_++;
                  this.gatherHonor = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageReportInfo.killNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.killNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageReportInfo.killHonor cannot be set twice.");
                  }
                  _loc11_++;
                  this.killHonor = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageReportInfo.assistNum cannot be set twice.");
                  }
                  _loc8_++;
                  this.assistNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageReportInfo.assistHonor cannot be set twice.");
                  }
                  _loc10_++;
                  this.assistHonor = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageReportInfo.score cannot be set twice.");
                  }
                  _loc5_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageReportInfo.side cannot be set twice.");
                  }
                  _loc12_++;
                  this.side = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageReportInfo.resultHonor cannot be set twice.");
                  }
                  _loc7_++;
                  this.resultHonor = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
