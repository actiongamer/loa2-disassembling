package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyExpeConRankInfo extends Message
   {
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeConRankInfo.baseInfo","baseInfo",8 | 2,proto.PlayerBaseInfo);
      
      public static const CON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeConRankInfo.con","con",16 | 0);
      
      public static const FIGHTTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeConRankInfo.fightTimes","fightTimes",24 | 0);
      
      public static const WINTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeConRankInfo.winTimes","winTimes",32 | 0);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeConRankInfo.rank","rank",40 | 0);
      
      public static const POST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeConRankInfo.post","post",48 | 0);
      
      public static const HIGHPOST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeConRankInfo.highPost","highPost",56 | 0);
      
      public static const FAMILYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeConRankInfo.familyName","familyName",64 | 2);
      
      public static const FAMILYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeConRankInfo.familyRank","familyRank",72 | 0);
       
      
      public var baseInfo:proto.PlayerBaseInfo;
      
      private var con$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var fightTimes$field:uint;
      
      private var winTimes$field:uint;
      
      private var rank$field:uint;
      
      private var post$field:uint;
      
      private var highPost$field:uint;
      
      private var familyName$field:String;
      
      private var familyRank$field:uint;
      
      public function FamilyExpeConRankInfo()
      {
         super();
      }
      
      public function clearCon() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         con$field = new uint();
      }
      
      public function get hasCon() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set con(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         con$field = param1;
      }
      
      public function get con() : uint
      {
         return con$field;
      }
      
      public function clearFightTimes() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         fightTimes$field = new uint();
      }
      
      public function get hasFightTimes() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set fightTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         fightTimes$field = param1;
      }
      
      public function get fightTimes() : uint
      {
         return fightTimes$field;
      }
      
      public function clearWinTimes() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         winTimes$field = new uint();
      }
      
      public function get hasWinTimes() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set winTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         winTimes$field = param1;
      }
      
      public function get winTimes() : uint
      {
         return winTimes$field;
      }
      
      public function clearRank() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return rank$field;
      }
      
      public function clearPost() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         post$field = new uint();
      }
      
      public function get hasPost() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set post(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         post$field = param1;
      }
      
      public function get post() : uint
      {
         return post$field;
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
      
      public function clearFamilyRank() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         familyRank$field = new uint();
      }
      
      public function get hasFamilyRank() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set familyRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         familyRank$field = param1;
      }
      
      public function get familyRank() : uint
      {
         return familyRank$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.baseInfo);
         if(hasCon)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,con$field);
         }
         if(hasFightTimes)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,fightTimes$field);
         }
         if(hasWinTimes)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,winTimes$field);
         }
         if(hasRank)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,rank$field);
         }
         if(hasPost)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,post$field);
         }
         if(hasHighPost)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,highPost$field);
         }
         if(hasFamilyName)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_STRING(param1,familyName$field);
         }
         if(hasFamilyRank)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,familyRank$field);
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
         var _loc7_:uint = 0;
         var _loc10_:uint = 0;
         var _loc12_:uint = 0;
         var _loc9_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc11_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc8_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeConRankInfo.baseInfo cannot be set twice.");
                  }
                  _loc7_++;
                  this.baseInfo = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseInfo);
                  continue;
               case 1:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeConRankInfo.con cannot be set twice.");
                  }
                  _loc10_++;
                  this.con = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeConRankInfo.fightTimes cannot be set twice.");
                  }
                  _loc12_++;
                  this.fightTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeConRankInfo.winTimes cannot be set twice.");
                  }
                  _loc9_++;
                  this.winTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeConRankInfo.rank cannot be set twice.");
                  }
                  _loc6_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeConRankInfo.post cannot be set twice.");
                  }
                  _loc5_++;
                  this.post = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeConRankInfo.highPost cannot be set twice.");
                  }
                  _loc11_++;
                  this.highPost = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeConRankInfo.familyName cannot be set twice.");
                  }
                  _loc4_++;
                  this.familyName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 8:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeConRankInfo.familyRank cannot be set twice.");
                  }
                  _loc3_++;
                  this.familyRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
