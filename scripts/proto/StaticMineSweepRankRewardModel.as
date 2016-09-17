package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class StaticMineSweepRankRewardModel extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticMineSweepRankRewardModel.id","id",8 | 0);
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticMineSweepRankRewardModel.version","version",16 | 0);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticMineSweepRankRewardModel.kind","kind",24 | 0);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticMineSweepRankRewardModel.rank","rank",32 | 0);
      
      public static const REWARD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticMineSweepRankRewardModel.reward","reward",40 | 2);
      
      public static const SUPERREWARD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticMineSweepRankRewardModel.superReward","superReward",48 | 2);
      
      public static const RANK2:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticMineSweepRankRewardModel.rank2","rank2",56 | 0);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var version$field:uint;
      
      private var kind$field:uint;
      
      private var rank$field:uint;
      
      private var reward$field:String;
      
      private var superReward$field:String;
      
      private var rank2$field:uint;
      
      public function StaticMineSweepRankRewardModel()
      {
         super();
      }
      
      public function clearId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         id$field = param1;
      }
      
      public function get id() : uint
      {
         return id$field;
      }
      
      public function clearVersion() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         version$field = new uint();
      }
      
      public function get hasVersion() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set version(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         version$field = param1;
      }
      
      public function get version() : uint
      {
         return version$field;
      }
      
      public function clearKind() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         kind$field = new uint();
      }
      
      public function get hasKind() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set kind(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         kind$field = param1;
      }
      
      public function get kind() : uint
      {
         return kind$field;
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
      
      public function clearReward() : void
      {
         reward$field = null;
      }
      
      public function get hasReward() : Boolean
      {
         return reward$field != null;
      }
      
      public function set reward(param1:String) : void
      {
         reward$field = param1;
      }
      
      public function get reward() : String
      {
         return reward$field;
      }
      
      public function clearSuperReward() : void
      {
         superReward$field = null;
      }
      
      public function get hasSuperReward() : Boolean
      {
         return superReward$field != null;
      }
      
      public function set superReward(param1:String) : void
      {
         superReward$field = param1;
      }
      
      public function get superReward() : String
      {
         return superReward$field;
      }
      
      public function clearRank2() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         rank2$field = new uint();
      }
      
      public function get hasRank2() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set rank2(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         rank2$field = param1;
      }
      
      public function get rank2() : uint
      {
         return rank2$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasVersion)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,version$field);
         }
         if(hasKind)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,kind$field);
         }
         if(hasRank)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,rank$field);
         }
         if(hasReward)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,reward$field);
         }
         if(hasSuperReward)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,superReward$field);
         }
         if(hasRank2)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,rank2$field);
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
         var _loc10_:uint = 0;
         var _loc9_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc8_ >> 3) - 1)
            {
               case 0:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepRankRewardModel.id cannot be set twice.");
                  }
                  _loc10_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepRankRewardModel.version cannot be set twice.");
                  }
                  _loc9_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepRankRewardModel.kind cannot be set twice.");
                  }
                  _loc6_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepRankRewardModel.rank cannot be set twice.");
                  }
                  _loc5_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepRankRewardModel.reward cannot be set twice.");
                  }
                  _loc4_++;
                  this.reward = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepRankRewardModel.superReward cannot be set twice.");
                  }
                  _loc3_++;
                  this.superReward = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticMineSweepRankRewardModel.rank2 cannot be set twice.");
                  }
                  _loc7_++;
                  this.rank2 = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
