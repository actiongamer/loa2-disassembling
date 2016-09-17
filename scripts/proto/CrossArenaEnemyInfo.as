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
   
   public class CrossArenaEnemyInfo extends Message
   {
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.CrossArenaEnemyInfo.baseInfo","baseInfo",8 | 2,proto.PlayerBaseInfo);
      
      public static const LEFTHP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaEnemyInfo.leftHp","leftHp",16 | 0);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaEnemyInfo.score","score",24 | 0);
      
      public static const STATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaEnemyInfo.status","status",32 | 0);
      
      public static const COIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaEnemyInfo.coin","coin",40 | 0);
       
      
      public var baseInfo:proto.PlayerBaseInfo;
      
      private var leftHp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var score$field:uint;
      
      private var status$field:uint;
      
      private var coin$field:uint;
      
      public function CrossArenaEnemyInfo()
      {
         super();
      }
      
      public function clearLeftHp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         leftHp$field = new uint();
      }
      
      public function get hasLeftHp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set leftHp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         leftHp$field = param1;
      }
      
      public function get leftHp() : uint
      {
         return leftHp$field;
      }
      
      public function clearScore() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         score$field = param1;
      }
      
      public function get score() : uint
      {
         return score$field;
      }
      
      public function clearStatus() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         status$field = new uint();
      }
      
      public function get hasStatus() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set status(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         status$field = param1;
      }
      
      public function get status() : uint
      {
         return status$field;
      }
      
      public function clearCoin() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         coin$field = new uint();
      }
      
      public function get hasCoin() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set coin(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         coin$field = param1;
      }
      
      public function get coin() : uint
      {
         return coin$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.baseInfo);
         if(hasLeftHp)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,leftHp$field);
         }
         if(hasScore)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,score$field);
         }
         if(hasStatus)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,status$field);
         }
         if(hasCoin)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,coin$field);
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
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc8_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaEnemyInfo.baseInfo cannot be set twice.");
                  }
                  _loc4_++;
                  this.baseInfo = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseInfo);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaEnemyInfo.leftHp cannot be set twice.");
                  }
                  _loc3_++;
                  this.leftHp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaEnemyInfo.score cannot be set twice.");
                  }
                  _loc8_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaEnemyInfo.status cannot be set twice.");
                  }
                  _loc6_++;
                  this.status = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaEnemyInfo.coin cannot be set twice.");
                  }
                  _loc5_++;
                  this.coin = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
