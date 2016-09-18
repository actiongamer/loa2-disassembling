package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class WorldBossQuickFightStartRes extends Message
   {
      
      public static const RESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossQuickFightStartRes.result","result",8 | 0);
      
      public static const REWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.WorldBossQuickFightStartRes.rewards","rewards",16 | 2,Reward);
      
      public static const TOTALHURT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossQuickFightStartRes.totalhurt","totalhurt",24 | 0);
      
      public static const CURHURT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossQuickFightStartRes.curhurt","curhurt",32 | 0);
      
      public static const ATTACKER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.WorldBossQuickFightStartRes.attacker","attacker",40 | 2,proto.BgFightInfo);
      
      public static const TARGET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.WorldBossQuickFightStartRes.target","target",48 | 2,proto.BgFightInfo);
      
      public static const HURTTOTAL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossQuickFightStartRes.hurttotal","hurttotal",56 | 0);
      
      public static const RANKNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossQuickFightStartRes.ranknum","ranknum",64 | 0);
       
      
      public var result:uint;
      
      public var rewards:Array;
      
      public var totalhurt:uint;
      
      public var curhurt:uint;
      
      public var attacker:proto.BgFightInfo;
      
      public var target:proto.BgFightInfo;
      
      private var hurttotal$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var ranknum$field:uint;
      
      public function WorldBossQuickFightStartRes()
      {
         rewards = [];
         super();
      }
      
      public function clearHurttotal() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         hurttotal$field = new uint();
      }
      
      public function get hasHurttotal() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set hurttotal(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         hurttotal$field = param1;
      }
      
      public function get hurttotal() : uint
      {
         return hurttotal$field;
      }
      
      public function clearRanknum() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         ranknum$field = new uint();
      }
      
      public function get hasRanknum() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set ranknum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         ranknum$field = param1;
      }
      
      public function get ranknum() : uint
      {
         return ranknum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.result);
         _loc2_ = uint(0);
         while(_loc2_ < this.rewards.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewards[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.totalhurt);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.curhurt);
         WriteUtils.writeTag(param1,2,5);
         WriteUtils.write$TYPE_MESSAGE(param1,this.attacker);
         WriteUtils.writeTag(param1,2,6);
         WriteUtils.write$TYPE_MESSAGE(param1,this.target);
         if(hasHurttotal)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,hurttotal$field);
         }
         if(hasRanknum)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,ranknum$field);
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
         var _loc9_:uint = 0;
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         var _loc10_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossQuickFightStartRes.result cannot be set twice.");
                  }
                  _loc5_++;
                  this.result = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.rewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Reward()));
                  continue;
               case 2:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossQuickFightStartRes.totalhurt cannot be set twice.");
                  }
                  _loc9_++;
                  this.totalhurt = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossQuickFightStartRes.curhurt cannot be set twice.");
                  }
                  _loc4_++;
                  this.curhurt = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossQuickFightStartRes.attacker cannot be set twice.");
                  }
                  _loc8_++;
                  this.attacker = new proto.BgFightInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.attacker);
                  continue;
               case 5:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossQuickFightStartRes.target cannot be set twice.");
                  }
                  _loc10_++;
                  this.target = new proto.BgFightInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.target);
                  continue;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossQuickFightStartRes.hurttotal cannot be set twice.");
                  }
                  _loc6_++;
                  this.hurttotal = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossQuickFightStartRes.ranknum cannot be set twice.");
                  }
                  _loc3_++;
                  this.ranknum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
