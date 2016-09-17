package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CrossArenaInfoRes extends Message
   {
      
      public static const RESIDUALTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaInfoRes.residualTimes","residualTimes",8 | 0);
      
      public static const LAYER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaInfoRes.layer","layer",16 | 0);
      
      public static const ENEMIES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.CrossArenaInfoRes.enemies","enemies",24 | 2,CrossArenaEnemyInfo);
      
      public static const BOXES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.CrossArenaInfoRes.boxes","boxes",32 | 2,CrossArenaBoxStatus);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaInfoRes.score","score",40 | 0);
      
      public static const STATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaInfoRes.status","status",48 | 0);
      
      public static const OPENSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaInfoRes.openStamp","openStamp",56 | 0);
      
      public static const ENDSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaInfoRes.endStamp","endStamp",64 | 0);
      
      public static const FINALENEMIES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.CrossArenaInfoRes.finalEnemies","finalEnemies",72 | 2,CrossArenaFinalEnemyInfo);
      
      public static const FINALRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaInfoRes.finalRank","finalRank",80 | 0);
      
      public static const NEXTLAYER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.CrossArenaInfoRes.nextLayer","nextLayer",88 | 0);
      
      public static const FINISHEDLAYER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaInfoRes.finishedLayer","finishedLayer",96 | 0);
      
      public static const ISOPEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.CrossArenaInfoRes.isOpen","isOpen",104 | 0);
      
      public static const RESIDUALCHEERTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaInfoRes.residualCheerTimes","residualCheerTimes",112 | 0);
      
      public static const REWARDSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaInfoRes.rewardStamp","rewardStamp",120 | 0);
       
      
      private var residualTimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var layer$field:uint;
      
      public var enemies:Array;
      
      public var boxes:Array;
      
      private var score$field:uint;
      
      private var status$field:uint;
      
      private var openStamp$field:uint;
      
      private var endStamp$field:uint;
      
      public var finalEnemies:Array;
      
      private var finalRank$field:uint;
      
      private var nextLayer$field:Boolean;
      
      private var finishedLayer$field:uint;
      
      private var isOpen$field:Boolean;
      
      private var residualCheerTimes$field:uint;
      
      private var rewardStamp$field:uint;
      
      public function CrossArenaInfoRes()
      {
         enemies = [];
         boxes = [];
         finalEnemies = [];
         super();
      }
      
      public function clearResidualTimes() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         residualTimes$field = new uint();
      }
      
      public function get hasResidualTimes() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set residualTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         residualTimes$field = param1;
      }
      
      public function get residualTimes() : uint
      {
         return residualTimes$field;
      }
      
      public function clearLayer() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         layer$field = new uint();
      }
      
      public function get hasLayer() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set layer(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         layer$field = param1;
      }
      
      public function get layer() : uint
      {
         return layer$field;
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
      
      public function clearStatus() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         status$field = new uint();
      }
      
      public function get hasStatus() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set status(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         status$field = param1;
      }
      
      public function get status() : uint
      {
         return status$field;
      }
      
      public function clearOpenStamp() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         openStamp$field = new uint();
      }
      
      public function get hasOpenStamp() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set openStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         openStamp$field = param1;
      }
      
      public function get openStamp() : uint
      {
         return openStamp$field;
      }
      
      public function clearEndStamp() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         endStamp$field = new uint();
      }
      
      public function get hasEndStamp() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set endStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         endStamp$field = param1;
      }
      
      public function get endStamp() : uint
      {
         return endStamp$field;
      }
      
      public function clearFinalRank() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         finalRank$field = new uint();
      }
      
      public function get hasFinalRank() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set finalRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         finalRank$field = param1;
      }
      
      public function get finalRank() : uint
      {
         return finalRank$field;
      }
      
      public function clearNextLayer() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         nextLayer$field = new Boolean();
      }
      
      public function get hasNextLayer() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set nextLayer(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 128;
         nextLayer$field = param1;
      }
      
      public function get nextLayer() : Boolean
      {
         return nextLayer$field;
      }
      
      public function clearFinishedLayer() : void
      {
         hasField$0 = hasField$0 & 4294967039;
         finishedLayer$field = new uint();
      }
      
      public function get hasFinishedLayer() : Boolean
      {
         return (hasField$0 & 256) != 0;
      }
      
      public function set finishedLayer(param1:uint) : void
      {
         hasField$0 = hasField$0 | 256;
         finishedLayer$field = param1;
      }
      
      public function get finishedLayer() : uint
      {
         return finishedLayer$field;
      }
      
      public function clearIsOpen() : void
      {
         hasField$0 = hasField$0 & 4294966783;
         isOpen$field = new Boolean();
      }
      
      public function get hasIsOpen() : Boolean
      {
         return (hasField$0 & 512) != 0;
      }
      
      public function set isOpen(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 512;
         isOpen$field = param1;
      }
      
      public function get isOpen() : Boolean
      {
         return isOpen$field;
      }
      
      public function clearResidualCheerTimes() : void
      {
         hasField$0 = hasField$0 & 4294966271;
         residualCheerTimes$field = new uint();
      }
      
      public function get hasResidualCheerTimes() : Boolean
      {
         return (hasField$0 & 1024) != 0;
      }
      
      public function set residualCheerTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1024;
         residualCheerTimes$field = param1;
      }
      
      public function get residualCheerTimes() : uint
      {
         return residualCheerTimes$field;
      }
      
      public function clearRewardStamp() : void
      {
         hasField$0 = hasField$0 & 4294965247;
         rewardStamp$field = new uint();
      }
      
      public function get hasRewardStamp() : Boolean
      {
         return (hasField$0 & 2048) != 0;
      }
      
      public function set rewardStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2048;
         rewardStamp$field = param1;
      }
      
      public function get rewardStamp() : uint
      {
         return rewardStamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = 0;
         var _loc2_:* = 0;
         var _loc4_:* = 0;
         if(hasResidualTimes)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,residualTimes$field);
         }
         if(hasLayer)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,layer$field);
         }
         _loc5_ = uint(0);
         while(_loc5_ < this.enemies.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.enemies[_loc5_]);
            _loc5_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.boxes.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.boxes[_loc2_]);
            _loc2_++;
         }
         if(hasScore)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,score$field);
         }
         if(hasStatus)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,status$field);
         }
         if(hasOpenStamp)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,openStamp$field);
         }
         if(hasEndStamp)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,endStamp$field);
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.finalEnemies.length)
         {
            WriteUtils.writeTag(param1,2,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.finalEnemies[_loc4_]);
            _loc4_++;
         }
         if(hasFinalRank)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,finalRank$field);
         }
         if(hasNextLayer)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_BOOL(param1,nextLayer$field);
         }
         if(hasFinishedLayer)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,finishedLayer$field);
         }
         if(hasIsOpen)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_BOOL(param1,isOpen$field);
         }
         if(hasResidualCheerTimes)
         {
            WriteUtils.writeTag(param1,0,14);
            WriteUtils.write$TYPE_UINT32(param1,residualCheerTimes$field);
         }
         if(hasRewardStamp)
         {
            WriteUtils.writeTag(param1,0,15);
            WriteUtils.write$TYPE_UINT32(param1,rewardStamp$field);
         }
         var _loc7_:int = 0;
         var _loc6_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc15_:uint = 0;
         var _loc9_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc11_:uint = 0;
         var _loc10_:uint = 0;
         var _loc13_:uint = 0;
         var _loc12_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc14_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaInfoRes.residualTimes cannot be set twice.");
                  }
                  _loc15_++;
                  this.residualTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaInfoRes.layer cannot be set twice.");
                  }
                  _loc9_++;
                  this.layer = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  this.enemies.push(ReadUtils.read$TYPE_MESSAGE(param1,new CrossArenaEnemyInfo()));
                  continue;
               case 3:
                  this.boxes.push(ReadUtils.read$TYPE_MESSAGE(param1,new CrossArenaBoxStatus()));
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaInfoRes.score cannot be set twice.");
                  }
                  _loc5_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaInfoRes.status cannot be set twice.");
                  }
                  _loc3_++;
                  this.status = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaInfoRes.openStamp cannot be set twice.");
                  }
                  _loc11_++;
                  this.openStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaInfoRes.endStamp cannot be set twice.");
                  }
                  _loc10_++;
                  this.endStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  this.finalEnemies.push(ReadUtils.read$TYPE_MESSAGE(param1,new CrossArenaFinalEnemyInfo()));
                  continue;
               case 9:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaInfoRes.finalRank cannot be set twice.");
                  }
                  _loc13_++;
                  this.finalRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaInfoRes.nextLayer cannot be set twice.");
                  }
                  _loc12_++;
                  this.nextLayer = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 11:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaInfoRes.finishedLayer cannot be set twice.");
                  }
                  _loc7_++;
                  this.finishedLayer = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 12:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaInfoRes.isOpen cannot be set twice.");
                  }
                  _loc8_++;
                  this.isOpen = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 13:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaInfoRes.residualCheerTimes cannot be set twice.");
                  }
                  _loc14_++;
                  this.residualCheerTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 14:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaInfoRes.rewardStamp cannot be set twice.");
                  }
                  _loc6_++;
                  this.rewardStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
