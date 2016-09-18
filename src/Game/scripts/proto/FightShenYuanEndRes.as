package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FightShenYuanEndRes extends Message
   {
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FightShenYuanEndRes.star","star",8 | 0);
      
      public static const RESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FightShenYuanEndRes.result","result",16 | 0);
      
      public static const NOWSTAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FightShenYuanEndRes.nowstar","nowstar",24 | 0);
      
      public static const CANREVIVE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FightShenYuanEndRes.canRevive","canRevive",32 | 0);
      
      public static const BTLREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FightShenYuanEndRes.btlReward","btlReward",40 | 2,Reward);
      
      public static const FRIENDHELPNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FightShenYuanEndRes.friendHelpNum","friendHelpNum",48 | 0);
      
      public static const TOTALSTAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FightShenYuanEndRes.totalstar","totalstar",56 | 0);
       
      
      public var star:uint;
      
      public var result:uint;
      
      public var nowstar:uint;
      
      public var canRevive:uint;
      
      public var btlReward:Array;
      
      private var friendHelpNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var totalstar$field:uint;
      
      public function FightShenYuanEndRes()
      {
         btlReward = [];
         super();
      }
      
      public function clearFriendHelpNum() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         friendHelpNum$field = new uint();
      }
      
      public function get hasFriendHelpNum() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set friendHelpNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         friendHelpNum$field = param1;
      }
      
      public function get friendHelpNum() : uint
      {
         return friendHelpNum$field;
      }
      
      public function clearTotalstar() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         totalstar$field = new uint();
      }
      
      public function get hasTotalstar() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set totalstar(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         totalstar$field = param1;
      }
      
      public function get totalstar() : uint
      {
         return totalstar$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.star);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.result);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.nowstar);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.canRevive);
         _loc2_ = uint(0);
         while(_loc2_ < this.btlReward.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.btlReward[_loc2_]);
            _loc2_++;
         }
         if(hasFriendHelpNum)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,friendHelpNum$field);
         }
         if(hasTotalstar)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,totalstar$field);
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
         var _loc9_:uint = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FightShenYuanEndRes.star cannot be set twice.");
                  }
                  _loc9_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FightShenYuanEndRes.result cannot be set twice.");
                  }
                  _loc4_++;
                  this.result = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FightShenYuanEndRes.nowstar cannot be set twice.");
                  }
                  _loc6_++;
                  this.nowstar = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FightShenYuanEndRes.canRevive cannot be set twice.");
                  }
                  _loc5_++;
                  this.canRevive = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  this.btlReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Reward()));
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FightShenYuanEndRes.friendHelpNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.friendHelpNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FightShenYuanEndRes.totalstar cannot be set twice.");
                  }
                  _loc8_++;
                  this.totalstar = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
