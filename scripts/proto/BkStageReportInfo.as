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
   
   public class BkStageReportInfo extends Message
   {
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BkStageReportInfo.baseInfo","baseInfo",8 | 2,proto.PlayerBaseInfo);
      
      public static const KILLNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkStageReportInfo.killNum","killNum",32 | 0);
      
      public static const KILLHONOR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkStageReportInfo.killHonor","killHonor",40 | 0);
      
      public static const ASSISTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkStageReportInfo.assistNum","assistNum",48 | 0);
      
      public static const ASSISTHONOR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkStageReportInfo.assistHonor","assistHonor",56 | 0);
      
      public static const SIDE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkStageReportInfo.side","side",72 | 0);
       
      
      public var baseInfo:proto.PlayerBaseInfo;
      
      private var killNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var killHonor$field:uint;
      
      private var assistNum$field:uint;
      
      private var assistHonor$field:uint;
      
      private var side$field:uint;
      
      public function BkStageReportInfo()
      {
         super();
      }
      
      public function clearKillNum() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         killNum$field = new uint();
      }
      
      public function get hasKillNum() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set killNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         killNum$field = param1;
      }
      
      public function get killNum() : uint
      {
         return killNum$field;
      }
      
      public function clearKillHonor() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         killHonor$field = new uint();
      }
      
      public function get hasKillHonor() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set killHonor(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         killHonor$field = param1;
      }
      
      public function get killHonor() : uint
      {
         return killHonor$field;
      }
      
      public function clearAssistNum() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         assistNum$field = new uint();
      }
      
      public function get hasAssistNum() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set assistNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         assistNum$field = param1;
      }
      
      public function get assistNum() : uint
      {
         return assistNum$field;
      }
      
      public function clearAssistHonor() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         assistHonor$field = new uint();
      }
      
      public function get hasAssistHonor() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set assistHonor(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         assistHonor$field = param1;
      }
      
      public function get assistHonor() : uint
      {
         return assistHonor$field;
      }
      
      public function clearSide() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         side$field = new uint();
      }
      
      public function get hasSide() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set side(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         side$field = param1;
      }
      
      public function get side() : uint
      {
         return side$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.baseInfo);
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
         if(hasSide)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,side$field);
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
         var _loc6_:uint = 0;
         var _loc9_:uint = 0;
         var _loc5_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BkStageReportInfo.baseInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.baseInfo = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseInfo);
                  continue;
               default:
               default:
                  super.readUnknown(param1,_loc4_);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BkStageReportInfo.killNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.killNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: BkStageReportInfo.killHonor cannot be set twice.");
                  }
                  _loc9_++;
                  this.killHonor = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BkStageReportInfo.assistNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.assistNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
               default:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BkStageReportInfo.assistHonor cannot be set twice.");
                  }
                  _loc7_++;
                  this.assistHonor = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: BkStageReportInfo.side cannot be set twice.");
                  }
                  _loc8_++;
                  this.side = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
