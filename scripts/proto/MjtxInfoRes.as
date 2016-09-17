package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class MjtxInfoRes extends Message
   {
      
      public static const FIGHTCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MjtxInfoRes.fightCount","fightCount",8 | 0);
      
      public static const PHASE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MjtxInfoRes.phase","phase",16 | 0);
      
      public static const BOXRWDCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MjtxInfoRes.boxRwdCount","boxRwdCount",24 | 0);
      
      public static const ENEMY:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.MjtxInfoRes.enemy","enemy",32 | 2,MjtxEnemyInfo);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MjtxInfoRes.rank","rank",40 | 0);
      
      public static const ASSISTCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MjtxInfoRes.assistCount","assistCount",48 | 0);
      
      public static const HELPCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MjtxInfoRes.helpCount","helpCount",56 | 0);
      
      public static const USEDFRIENDIDS:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.MjtxInfoRes.usedFriendIds","usedFriendIds",64 | 0);
       
      
      private var fightCount$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var phase$field:uint;
      
      private var boxRwdCount$field:uint;
      
      public var enemy:Array;
      
      private var rank$field:uint;
      
      private var assistCount$field:uint;
      
      private var helpCount$field:uint;
      
      public var usedFriendIds:Array;
      
      public function MjtxInfoRes()
      {
         enemy = [];
         usedFriendIds = [];
         super();
      }
      
      public function clearFightCount() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         fightCount$field = new uint();
      }
      
      public function get hasFightCount() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set fightCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         fightCount$field = param1;
      }
      
      public function get fightCount() : uint
      {
         return fightCount$field;
      }
      
      public function clearPhase() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         phase$field = new uint();
      }
      
      public function get hasPhase() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set phase(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         phase$field = param1;
      }
      
      public function get phase() : uint
      {
         return phase$field;
      }
      
      public function clearBoxRwdCount() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         boxRwdCount$field = new uint();
      }
      
      public function get hasBoxRwdCount() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set boxRwdCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         boxRwdCount$field = param1;
      }
      
      public function get boxRwdCount() : uint
      {
         return boxRwdCount$field;
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
      
      public function clearAssistCount() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         assistCount$field = new uint();
      }
      
      public function get hasAssistCount() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set assistCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         assistCount$field = param1;
      }
      
      public function get assistCount() : uint
      {
         return assistCount$field;
      }
      
      public function clearHelpCount() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         helpCount$field = new uint();
      }
      
      public function get hasHelpCount() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set helpCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         helpCount$field = param1;
      }
      
      public function get helpCount() : uint
      {
         return helpCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         if(hasFightCount)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,fightCount$field);
         }
         if(hasPhase)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,phase$field);
         }
         if(hasBoxRwdCount)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,boxRwdCount$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.enemy.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.enemy[_loc2_]);
            _loc2_++;
         }
         if(hasRank)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,rank$field);
         }
         if(hasAssistCount)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,assistCount$field);
         }
         if(hasHelpCount)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,helpCount$field);
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.usedFriendIds.length)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT64(param1,this.usedFriendIds[_loc3_]);
            _loc3_++;
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: MjtxInfoRes.fightCount cannot be set twice.");
                  }
                  _loc6_++;
                  this.fightCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: MjtxInfoRes.phase cannot be set twice.");
                  }
                  _loc4_++;
                  this.phase = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: MjtxInfoRes.boxRwdCount cannot be set twice.");
                  }
                  _loc8_++;
                  this.boxRwdCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  this.enemy.push(ReadUtils.read$TYPE_MESSAGE(param1,new MjtxEnemyInfo()));
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: MjtxInfoRes.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: MjtxInfoRes.assistCount cannot be set twice.");
                  }
                  _loc7_++;
                  this.assistCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: MjtxInfoRes.helpCount cannot be set twice.");
                  }
                  _loc9_++;
                  this.helpCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if((_loc5_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.usedFriendIds);
                  }
                  else
                  {
                     this.usedFriendIds.push(ReadUtils.read$TYPE_UINT64(param1));
                  }
                  continue;
            }
         }
      }
   }
}
