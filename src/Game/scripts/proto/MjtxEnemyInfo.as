package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class MjtxEnemyInfo extends Message
   {
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.MjtxEnemyInfo.baseInfo","baseInfo",8 | 2,proto.PlayerBaseInfo);
      
      public static const ISDEAD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.MjtxEnemyInfo.isDead","isDead",16 | 0);
      
      public static const HPPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MjtxEnemyInfo.hpPercent","hpPercent",24 | 0);
      
      public static const BUFFLAYER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MjtxEnemyInfo.buffLayer","buffLayer",32 | 0);
      
      public static const BPMODELID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.MjtxEnemyInfo.bpModelId","bpModelId",40 | 0);
      
      public static const REWARD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MjtxEnemyInfo.reward","reward",48 | 0);
       
      
      public var baseInfo:proto.PlayerBaseInfo;
      
      private var isDead$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var hpPercent$field:uint;
      
      private var buffLayer$field:uint;
      
      public var bpModelId:Array;
      
      private var reward$field:uint;
      
      public function MjtxEnemyInfo()
      {
         bpModelId = [];
         super();
      }
      
      public function clearIsDead() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         isDead$field = new Boolean();
      }
      
      public function get hasIsDead() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set isDead(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         isDead$field = param1;
      }
      
      public function get isDead() : Boolean
      {
         return isDead$field;
      }
      
      public function clearHpPercent() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         hpPercent$field = new uint();
      }
      
      public function get hasHpPercent() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set hpPercent(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         hpPercent$field = param1;
      }
      
      public function get hpPercent() : uint
      {
         return hpPercent$field;
      }
      
      public function clearBuffLayer() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         buffLayer$field = new uint();
      }
      
      public function get hasBuffLayer() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set buffLayer(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         buffLayer$field = param1;
      }
      
      public function get buffLayer() : uint
      {
         return buffLayer$field;
      }
      
      public function clearReward() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         reward$field = new uint();
      }
      
      public function get hasReward() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set reward(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         reward$field = param1;
      }
      
      public function get reward() : uint
      {
         return reward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.baseInfo);
         if(hasIsDead)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_BOOL(param1,isDead$field);
         }
         if(hasHpPercent)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,hpPercent$field);
         }
         if(hasBuffLayer)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,buffLayer$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.bpModelId.length)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,this.bpModelId[_loc2_]);
            _loc2_++;
         }
         if(hasReward)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,reward$field);
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: MjtxEnemyInfo.baseInfo cannot be set twice.");
                  }
                  _loc4_++;
                  this.baseInfo = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseInfo);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: MjtxEnemyInfo.isDead cannot be set twice.");
                  }
                  _loc7_++;
                  this.isDead = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 2:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: MjtxEnemyInfo.hpPercent cannot be set twice.");
                  }
                  _loc8_++;
                  this.hpPercent = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: MjtxEnemyInfo.buffLayer cannot be set twice.");
                  }
                  _loc6_++;
                  this.buffLayer = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if((_loc5_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.bpModelId);
                  }
                  else
                  {
                     this.bpModelId.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: MjtxEnemyInfo.reward cannot be set twice.");
                  }
                  _loc3_++;
                  this.reward = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
