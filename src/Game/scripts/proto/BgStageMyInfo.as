package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgStageMyInfo extends Message
   {
      
      public static const KILLNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageMyInfo.killNum","killNum",8 | 0);
      
      public static const ASSISTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageMyInfo.assistNum","assistNum",16 | 0);
      
      public static const GATHERNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageMyInfo.gatherNum","gatherNum",24 | 0);
      
      public static const HONOR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageMyInfo.honor","honor",32 | 0);
      
      public static const GATHERHONOR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageMyInfo.gatherHonor","gatherHonor",40 | 0);
      
      public static const KILLNPCNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageMyInfo.killNpcNum","killNpcNum",48 | 0);
       
      
      private var killNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var assistNum$field:uint;
      
      private var gatherNum$field:uint;
      
      private var honor$field:uint;
      
      private var gatherHonor$field:uint;
      
      private var killNpcNum$field:uint;
      
      public function BgStageMyInfo()
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
      
      public function clearAssistNum() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         assistNum$field = new uint();
      }
      
      public function get hasAssistNum() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set assistNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         assistNum$field = param1;
      }
      
      public function get assistNum() : uint
      {
         return assistNum$field;
      }
      
      public function clearGatherNum() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         gatherNum$field = new uint();
      }
      
      public function get hasGatherNum() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set gatherNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         gatherNum$field = param1;
      }
      
      public function get gatherNum() : uint
      {
         return gatherNum$field;
      }
      
      public function clearHonor() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         honor$field = new uint();
      }
      
      public function get hasHonor() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set honor(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         honor$field = param1;
      }
      
      public function get honor() : uint
      {
         return honor$field;
      }
      
      public function clearGatherHonor() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         gatherHonor$field = new uint();
      }
      
      public function get hasGatherHonor() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set gatherHonor(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         gatherHonor$field = param1;
      }
      
      public function get gatherHonor() : uint
      {
         return gatherHonor$field;
      }
      
      public function clearKillNpcNum() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         killNpcNum$field = new uint();
      }
      
      public function get hasKillNpcNum() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set killNpcNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         killNpcNum$field = param1;
      }
      
      public function get killNpcNum() : uint
      {
         return killNpcNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasKillNum)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,killNum$field);
         }
         if(hasAssistNum)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,assistNum$field);
         }
         if(hasGatherNum)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,gatherNum$field);
         }
         if(hasHonor)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,honor$field);
         }
         if(hasGatherHonor)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,gatherHonor$field);
         }
         if(hasKillNpcNum)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,killNpcNum$field);
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
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageMyInfo.killNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.killNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageMyInfo.assistNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.assistNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageMyInfo.gatherNum cannot be set twice.");
                  }
                  _loc9_++;
                  this.gatherNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageMyInfo.honor cannot be set twice.");
                  }
                  _loc8_++;
                  this.honor = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageMyInfo.gatherHonor cannot be set twice.");
                  }
                  _loc7_++;
                  this.gatherHonor = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageMyInfo.killNpcNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.killNpcNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
