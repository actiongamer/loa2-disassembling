package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyExpeFamilyPlayerRankInfo extends Message
   {
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFamilyPlayerRankInfo.rank","rank",8 | 0);
      
      public static const POST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFamilyPlayerRankInfo.post","post",16 | 0);
      
      public static const CON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFamilyPlayerRankInfo.con","con",24 | 0);
      
      public static const WINTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFamilyPlayerRankInfo.winTimes","winTimes",32 | 0);
      
      public static const CHALLENGENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFamilyPlayerRankInfo.challengeNum","challengeNum",40 | 0);
      
      public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeFamilyPlayerRankInfo.info","info",48 | 2,proto.PlayerBaseInfo);
      
      public static const HIGHPOST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFamilyPlayerRankInfo.highPost","highPost",56 | 0);
       
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var post$field:uint;
      
      private var con$field:uint;
      
      private var winTimes$field:uint;
      
      private var challengeNum$field:uint;
      
      private var info$field:proto.PlayerBaseInfo;
      
      private var highPost$field:uint;
      
      public function FamilyExpeFamilyPlayerRankInfo()
      {
         super();
      }
      
      public function clearRank() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return rank$field;
      }
      
      public function clearPost() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         post$field = new uint();
      }
      
      public function get hasPost() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set post(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         post$field = param1;
      }
      
      public function get post() : uint
      {
         return post$field;
      }
      
      public function clearCon() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         con$field = new uint();
      }
      
      public function get hasCon() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set con(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         con$field = param1;
      }
      
      public function get con() : uint
      {
         return con$field;
      }
      
      public function clearWinTimes() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         winTimes$field = new uint();
      }
      
      public function get hasWinTimes() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set winTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         winTimes$field = param1;
      }
      
      public function get winTimes() : uint
      {
         return winTimes$field;
      }
      
      public function clearChallengeNum() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         challengeNum$field = new uint();
      }
      
      public function get hasChallengeNum() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set challengeNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         challengeNum$field = param1;
      }
      
      public function get challengeNum() : uint
      {
         return challengeNum$field;
      }
      
      public function clearInfo() : void
      {
         info$field = null;
      }
      
      public function get hasInfo() : Boolean
      {
         return info$field != null;
      }
      
      public function set info(param1:proto.PlayerBaseInfo) : void
      {
         info$field = param1;
      }
      
      public function get info() : proto.PlayerBaseInfo
      {
         return info$field;
      }
      
      public function clearHighPost() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         highPost$field = new uint();
      }
      
      public function get hasHighPost() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set highPost(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         highPost$field = param1;
      }
      
      public function get highPost() : uint
      {
         return highPost$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasRank)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,rank$field);
         }
         if(hasPost)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,post$field);
         }
         if(hasCon)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,con$field);
         }
         if(hasWinTimes)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,winTimes$field);
         }
         if(hasChallengeNum)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,challengeNum$field);
         }
         if(hasInfo)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_MESSAGE(param1,info$field);
         }
         if(hasHighPost)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,highPost$field);
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
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         var _loc10_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFamilyPlayerRankInfo.rank cannot be set twice.");
                  }
                  _loc4_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFamilyPlayerRankInfo.post cannot be set twice.");
                  }
                  _loc3_++;
                  this.post = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFamilyPlayerRankInfo.con cannot be set twice.");
                  }
                  _loc7_++;
                  this.con = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFamilyPlayerRankInfo.winTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.winTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFamilyPlayerRankInfo.challengeNum cannot be set twice.");
                  }
                  _loc9_++;
                  this.challengeNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFamilyPlayerRankInfo.info cannot be set twice.");
                  }
                  _loc8_++;
                  this.info = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.info);
                  continue;
               case 6:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFamilyPlayerRankInfo.highPost cannot be set twice.");
                  }
                  _loc10_++;
                  this.highPost = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
