package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class StaticActivityReward extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivityReward.id","id",8 | 0);
      
      public static const STARTTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivityReward.startTm","startTm",16 | 0);
      
      public static const ENDTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivityReward.endTm","endTm",24 | 0);
      
      public static const FUNCTION:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.StaticActivityReward.function","__function",32 | 2,proto.StaticActivityReward.Function);
      
      public static const RELATION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivityReward.relation","relation",40 | 0);
      
      public static const REWARD_CONDITION:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticActivityReward.reward_condition","rewardCondition",48 | 2);
      
      public static const REWARD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticActivityReward.reward","reward",56 | 2);
      
      public static const PAY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticActivityReward.pay","pay",64 | 2);
      
      public static const DISCOUNT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticActivityReward.discount","discount",72 | 2);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivityReward.kind","kind",80 | 0);
      
      public static const SWAPTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivityReward.swapTimes","swapTimes",88 | 0);
       
      
      public var id:uint;
      
      private var startTm$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var endTm$field:uint;
      
      public var __function:Array;
      
      private var relation$field:uint;
      
      private var reward_condition$field:String;
      
      private var reward$field:String;
      
      private var pay$field:String;
      
      private var discount$field:String;
      
      private var kind$field:uint;
      
      private var swapTimes$field:uint;
      
      public function StaticActivityReward()
      {
         __function = [];
         super();
      }
      
      public function clearStartTm() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         startTm$field = new uint();
      }
      
      public function get hasStartTm() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set startTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         startTm$field = param1;
      }
      
      public function get startTm() : uint
      {
         return startTm$field;
      }
      
      public function clearEndTm() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         endTm$field = new uint();
      }
      
      public function get hasEndTm() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set endTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         endTm$field = param1;
      }
      
      public function get endTm() : uint
      {
         return endTm$field;
      }
      
      public function clearRelation() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         relation$field = new uint();
      }
      
      public function get hasRelation() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set relation(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         relation$field = param1;
      }
      
      public function get relation() : uint
      {
         return relation$field;
      }
      
      public function clearRewardCondition() : void
      {
         reward_condition$field = null;
      }
      
      public function get hasRewardCondition() : Boolean
      {
         return reward_condition$field != null;
      }
      
      public function set rewardCondition(param1:String) : void
      {
         reward_condition$field = param1;
      }
      
      public function get rewardCondition() : String
      {
         return reward_condition$field;
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
      
      public function clearPay() : void
      {
         pay$field = null;
      }
      
      public function get hasPay() : Boolean
      {
         return pay$field != null;
      }
      
      public function set pay(param1:String) : void
      {
         pay$field = param1;
      }
      
      public function get pay() : String
      {
         return pay$field;
      }
      
      public function clearDiscount() : void
      {
         discount$field = null;
      }
      
      public function get hasDiscount() : Boolean
      {
         return discount$field != null;
      }
      
      public function set discount(param1:String) : void
      {
         discount$field = param1;
      }
      
      public function get discount() : String
      {
         return discount$field;
      }
      
      public function clearKind() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         kind$field = new uint();
      }
      
      public function get hasKind() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set kind(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         kind$field = param1;
      }
      
      public function get kind() : uint
      {
         return kind$field;
      }
      
      public function clearSwapTimes() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         swapTimes$field = new uint();
      }
      
      public function get hasSwapTimes() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set swapTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         swapTimes$field = param1;
      }
      
      public function get swapTimes() : uint
      {
         return swapTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         if(hasStartTm)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,startTm$field);
         }
         if(hasEndTm)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,endTm$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.__function.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.__function[_loc2_]);
            _loc2_++;
         }
         if(hasRelation)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,relation$field);
         }
         if(hasRewardCondition)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,reward_condition$field);
         }
         if(hasReward)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_STRING(param1,reward$field);
         }
         if(hasPay)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_STRING(param1,pay$field);
         }
         if(hasDiscount)
         {
            WriteUtils.writeTag(param1,2,9);
            WriteUtils.write$TYPE_STRING(param1,discount$field);
         }
         if(hasKind)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,kind$field);
         }
         if(hasSwapTimes)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,swapTimes$field);
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
         var _loc6_:* = 0;
         var _loc12_:uint = 0;
         var _loc10_:uint = 0;
         var _loc5_:uint = 0;
         var _loc8_:uint = 0;
         var _loc7_:uint = 0;
         var _loc9_:uint = 0;
         var _loc13_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc11_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivityReward.id cannot be set twice.");
                  }
                  _loc12_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivityReward.startTm cannot be set twice.");
                  }
                  _loc10_++;
                  this.startTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivityReward.endTm cannot be set twice.");
                  }
                  _loc5_++;
                  this.endTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  this.__function.push(ReadUtils.read$TYPE_MESSAGE(param1,new proto.StaticActivityReward.Function()));
                  continue;
               case 4:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivityReward.relation cannot be set twice.");
                  }
                  _loc8_++;
                  this.relation = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivityReward.rewardCondition cannot be set twice.");
                  }
                  _loc7_++;
                  this.rewardCondition = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivityReward.reward cannot be set twice.");
                  }
                  _loc9_++;
                  this.reward = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 7:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivityReward.pay cannot be set twice.");
                  }
                  _loc13_++;
                  this.pay = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 8:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivityReward.discount cannot be set twice.");
                  }
                  _loc3_++;
                  this.discount = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 9:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivityReward.kind cannot be set twice.");
                  }
                  _loc4_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 10:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: StaticActivityReward.swapTimes cannot be set twice.");
                  }
                  _loc11_++;
                  this.swapTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
