package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyBossJoinFightStartRes extends Message
   {
      
      public static const RANDOM:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.FamilyBossJoinFightStartRes.random","random",8 | 0);
      
      public static const PLAYER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyBossJoinFightStartRes.player","player",16 | 2,BattlePlayer);
      
      public static const BOSSID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossJoinFightStartRes.bossid","bossid",24 | 0);
      
      public static const RESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossJoinFightStartRes.result","result",32 | 0);
      
      public static const REWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyBossJoinFightStartRes.rewards","rewards",40 | 2,Reward);
      
      public static const INVALIDEFIGHT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FamilyBossJoinFightStartRes.invalidefight","invalidefight",48 | 0);
      
      public static const REPORTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyBossJoinFightStartRes.reportid","reportid",56 | 2);
      
      public static const TOTALHURT:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FamilyBossJoinFightStartRes.totalhurt","totalhurt",64 | 0);
       
      
      public var random:Array;
      
      public var player:Array;
      
      public var bossid:uint;
      
      public var result:uint;
      
      public var rewards:Array;
      
      public var invalidefight:Boolean;
      
      public var reportid:String;
      
      public var totalhurt:UInt64;
      
      public function FamilyBossJoinFightStartRes()
      {
         random = [];
         player = [];
         rewards = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc4_:* = 0;
         var _loc3_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.random.length)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,this.random[_loc2_]);
            _loc2_++;
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.player.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.player[_loc4_]);
            _loc4_++;
         }
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.bossid);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.result);
         _loc3_ = uint(0);
         while(_loc3_ < this.rewards.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewards[_loc3_]);
            _loc3_++;
         }
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_BOOL(param1,this.invalidefight);
         WriteUtils.writeTag(param1,2,7);
         WriteUtils.write$TYPE_STRING(param1,this.reportid);
         WriteUtils.writeTag(param1,0,8);
         WriteUtils.write$TYPE_UINT64(param1,this.totalhurt);
         var _loc7_:int = 0;
         var _loc6_:* = this;
         for(var _loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if((_loc4_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.random);
                  }
                  else
                  {
                     this.random.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 1:
                  this.player.push(ReadUtils.read$TYPE_MESSAGE(param1,new BattlePlayer()));
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyBossJoinFightStartRes.bossid cannot be set twice.");
                  }
                  _loc6_++;
                  this.bossid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyBossJoinFightStartRes.result cannot be set twice.");
                  }
                  _loc3_++;
                  this.result = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  this.rewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Reward()));
                  continue;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyBossJoinFightStartRes.invalidefight cannot be set twice.");
                  }
                  _loc5_++;
                  this.invalidefight = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyBossJoinFightStartRes.reportid cannot be set twice.");
                  }
                  _loc7_++;
                  this.reportid = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyBossJoinFightStartRes.totalhurt cannot be set twice.");
                  }
                  _loc8_++;
                  this.totalhurt = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
