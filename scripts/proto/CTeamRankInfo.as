package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CTeamRankInfo extends Message
   {
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CTeamRankInfo.rank","rank",8 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CTeamRankInfo.name","name",16 | 2);
      
      public static const LEADER:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CTeamRankInfo.leader","leader",24 | 2);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.CTeamRankInfo.ability","ability",32 | 0);
      
      public static const WIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CTeamRankInfo.win","win",40 | 0);
      
      public static const LOSE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CTeamRankInfo.lose","lose",48 | 0);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CTeamRankInfo.score","score",56 | 0);
      
      public static const DIST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CTeamRankInfo.dist","dist",64 | 0);
      
      public static const OP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CTeamRankInfo.op","op",72 | 2);
       
      
      public var rank:uint;
      
      public var name:String;
      
      public var leader:String;
      
      public var ability:UInt64;
      
      private var win$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var lose$field:uint;
      
      private var score$field:uint;
      
      private var dist$field:uint;
      
      private var op$field:String;
      
      public function CTeamRankInfo()
      {
         super();
      }
      
      public function clearWin() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         win$field = new uint();
      }
      
      public function get hasWin() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set win(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         win$field = param1;
      }
      
      public function get win() : uint
      {
         return win$field;
      }
      
      public function clearLose() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         lose$field = new uint();
      }
      
      public function get hasLose() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set lose(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         lose$field = param1;
      }
      
      public function get lose() : uint
      {
         return lose$field;
      }
      
      public function clearScore() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         score$field = param1;
      }
      
      public function get score() : uint
      {
         return score$field;
      }
      
      public function clearDist() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         dist$field = new uint();
      }
      
      public function get hasDist() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set dist(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         dist$field = param1;
      }
      
      public function get dist() : uint
      {
         return dist$field;
      }
      
      public function clearOp() : void
      {
         op$field = null;
      }
      
      public function get hasOp() : Boolean
      {
         return op$field != null;
      }
      
      public function set op(param1:String) : void
      {
         op$field = param1;
      }
      
      public function get op() : String
      {
         return op$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.rank);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         WriteUtils.writeTag(param1,2,3);
         WriteUtils.write$TYPE_STRING(param1,this.leader);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT64(param1,this.ability);
         if(hasWin)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,win$field);
         }
         if(hasLose)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,lose$field);
         }
         if(hasScore)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,score$field);
         }
         if(hasDist)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,dist$field);
         }
         if(hasOp)
         {
            WriteUtils.writeTag(param1,2,9);
            WriteUtils.write$TYPE_STRING(param1,op$field);
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
         var _loc7_:* = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc12_:uint = 0;
         var _loc10_:uint = 0;
         var _loc4_:uint = 0;
         var _loc11_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamRankInfo.rank cannot be set twice.");
                  }
                  _loc6_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamRankInfo.name cannot be set twice.");
                  }
                  _loc5_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamRankInfo.leader cannot be set twice.");
                  }
                  _loc12_++;
                  this.leader = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamRankInfo.ability cannot be set twice.");
                  }
                  _loc10_++;
                  this.ability = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamRankInfo.win cannot be set twice.");
                  }
                  _loc4_++;
                  this.win = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamRankInfo.lose cannot be set twice.");
                  }
                  _loc11_++;
                  this.lose = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamRankInfo.score cannot be set twice.");
                  }
                  _loc8_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamRankInfo.dist cannot be set twice.");
                  }
                  _loc9_++;
                  this.dist = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamRankInfo.op cannot be set twice.");
                  }
                  _loc3_++;
                  this.op = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
