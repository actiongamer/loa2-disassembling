package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CrossArenaFightRes extends Message
   {
      
      public static const RESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaFightRes.result","result",8 | 0);
      
      public static const REWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.CrossArenaFightRes.rewards","rewards",16 | 2,Reward);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaFightRes.score","score",24 | 0);
      
      public static const REPORTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CrossArenaFightRes.reportId","reportId",32 | 2);
      
      public static const LEFTHP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaFightRes.leftHp","leftHp",40 | 0);
      
      public static const RESIDUALTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaFightRes.residualTimes","residualTimes",48 | 0);
      
      public static const FINISHEDLAYER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaFightRes.finishedLayer","finishedLayer",56 | 0);
      
      public static const COIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaFightRes.coin","coin",64 | 0);
      
      public static const SELF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.CrossArenaFightRes.self","self",72 | 2,proto.BgFightInfo);
      
      public static const TARGET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.CrossArenaFightRes.target","target",80 | 2,proto.BgFightInfo);
       
      
      private var result$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var rewards:Array;
      
      private var score$field:uint;
      
      public var reportId:String;
      
      private var leftHp$field:uint;
      
      private var residualTimes$field:uint;
      
      private var finishedLayer$field:uint;
      
      private var coin$field:uint;
      
      private var self$field:proto.BgFightInfo;
      
      private var target$field:proto.BgFightInfo;
      
      public function CrossArenaFightRes()
      {
         rewards = [];
         super();
      }
      
      public function clearResult() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         result$field = new uint();
      }
      
      public function get hasResult() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set result(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         result$field = param1;
      }
      
      public function get result() : uint
      {
         return result$field;
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
      
      public function clearLeftHp() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         leftHp$field = new uint();
      }
      
      public function get hasLeftHp() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set leftHp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         leftHp$field = param1;
      }
      
      public function get leftHp() : uint
      {
         return leftHp$field;
      }
      
      public function clearResidualTimes() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         residualTimes$field = new uint();
      }
      
      public function get hasResidualTimes() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set residualTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         residualTimes$field = param1;
      }
      
      public function get residualTimes() : uint
      {
         return residualTimes$field;
      }
      
      public function clearFinishedLayer() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         finishedLayer$field = new uint();
      }
      
      public function get hasFinishedLayer() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set finishedLayer(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         finishedLayer$field = param1;
      }
      
      public function get finishedLayer() : uint
      {
         return finishedLayer$field;
      }
      
      public function clearCoin() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         coin$field = new uint();
      }
      
      public function get hasCoin() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set coin(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         coin$field = param1;
      }
      
      public function get coin() : uint
      {
         return coin$field;
      }
      
      public function clearSelf() : void
      {
         self$field = null;
      }
      
      public function get hasSelf() : Boolean
      {
         return self$field != null;
      }
      
      public function set self(param1:proto.BgFightInfo) : void
      {
         self$field = param1;
      }
      
      public function get self() : proto.BgFightInfo
      {
         return self$field;
      }
      
      public function clearTarget() : void
      {
         target$field = null;
      }
      
      public function get hasTarget() : Boolean
      {
         return target$field != null;
      }
      
      public function set target(param1:proto.BgFightInfo) : void
      {
         target$field = param1;
      }
      
      public function get target() : proto.BgFightInfo
      {
         return target$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasResult)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,result$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.rewards.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewards[_loc2_]);
            _loc2_++;
         }
         if(hasScore)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,score$field);
         }
         WriteUtils.writeTag(param1,2,4);
         WriteUtils.write$TYPE_STRING(param1,this.reportId);
         if(hasLeftHp)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,leftHp$field);
         }
         if(hasResidualTimes)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,residualTimes$field);
         }
         if(hasFinishedLayer)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,finishedLayer$field);
         }
         if(hasCoin)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,coin$field);
         }
         if(hasSelf)
         {
            WriteUtils.writeTag(param1,2,9);
            WriteUtils.write$TYPE_MESSAGE(param1,self$field);
         }
         if(hasTarget)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_MESSAGE(param1,target$field);
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
         var _loc7_:* = 0;
         var _loc5_:uint = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc12_:uint = 0;
         var _loc10_:uint = 0;
         var _loc6_:uint = 0;
         var _loc9_:uint = 0;
         var _loc11_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaFightRes.result cannot be set twice.");
                  }
                  _loc5_++;
                  this.result = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.rewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Reward()));
                  continue;
               case 2:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaFightRes.score cannot be set twice.");
                  }
                  _loc8_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaFightRes.reportId cannot be set twice.");
                  }
                  _loc3_++;
                  this.reportId = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaFightRes.leftHp cannot be set twice.");
                  }
                  _loc4_++;
                  this.leftHp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaFightRes.residualTimes cannot be set twice.");
                  }
                  _loc12_++;
                  this.residualTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaFightRes.finishedLayer cannot be set twice.");
                  }
                  _loc10_++;
                  this.finishedLayer = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaFightRes.coin cannot be set twice.");
                  }
                  _loc6_++;
                  this.coin = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaFightRes.self cannot be set twice.");
                  }
                  _loc9_++;
                  this.self = new proto.BgFightInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.self);
                  continue;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaFightRes.target cannot be set twice.");
                  }
                  _loc11_++;
                  this.target = new proto.BgFightInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.target);
                  continue;
            }
         }
      }
   }
}
