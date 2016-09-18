package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GuajiPvpAutoFightRes extends Message
   {
      
      public static const REPORTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.GuajiPvpAutoFightRes.reportId","reportId",8 | 2);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.GuajiPvpAutoFightRes.reward","reward",16 | 2,Reward);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiPvpAutoFightRes.rank","rank",24 | 0);
      
      public static const STEALCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiPvpAutoFightRes.stealCount","stealCount",32 | 0);
      
      public static const RESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiPvpAutoFightRes.result","result",40 | 0);
      
      public static const ATTACKER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GuajiPvpAutoFightRes.attacker","attacker",48 | 2,proto.BgFightInfo);
      
      public static const TARGET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GuajiPvpAutoFightRes.target","target",56 | 2,proto.BgFightInfo);
       
      
      private var reportId$field:String;
      
      public var reward:Array;
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var stealCount$field:uint;
      
      private var result$field:uint;
      
      private var attacker$field:proto.BgFightInfo;
      
      private var target$field:proto.BgFightInfo;
      
      public function GuajiPvpAutoFightRes()
      {
         reward = [];
         super();
      }
      
      public function clearReportId() : void
      {
         reportId$field = null;
      }
      
      public function get hasReportId() : Boolean
      {
         return reportId$field != null;
      }
      
      public function set reportId(param1:String) : void
      {
         reportId$field = param1;
      }
      
      public function get reportId() : String
      {
         return reportId$field;
      }
      
      public function clearRank() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return rank$field;
      }
      
      public function clearStealCount() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         stealCount$field = new uint();
      }
      
      public function get hasStealCount() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set stealCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         stealCount$field = param1;
      }
      
      public function get stealCount() : uint
      {
         return stealCount$field;
      }
      
      public function clearResult() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         result$field = new uint();
      }
      
      public function get hasResult() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set result(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         result$field = param1;
      }
      
      public function get result() : uint
      {
         return result$field;
      }
      
      public function clearAttacker() : void
      {
         attacker$field = null;
      }
      
      public function get hasAttacker() : Boolean
      {
         return attacker$field != null;
      }
      
      public function set attacker(param1:proto.BgFightInfo) : void
      {
         attacker$field = param1;
      }
      
      public function get attacker() : proto.BgFightInfo
      {
         return attacker$field;
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
         if(hasReportId)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_STRING(param1,reportId$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc2_]);
            _loc2_++;
         }
         if(hasRank)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,rank$field);
         }
         if(hasStealCount)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,stealCount$field);
         }
         if(hasResult)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,result$field);
         }
         if(hasAttacker)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_MESSAGE(param1,attacker$field);
         }
         if(hasTarget)
         {
            WriteUtils.writeTag(param1,2,7);
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
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiPvpAutoFightRes.reportId cannot be set twice.");
                  }
                  _loc4_++;
                  this.reportId = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Reward()));
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiPvpAutoFightRes.rank cannot be set twice.");
                  }
                  _loc5_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiPvpAutoFightRes.stealCount cannot be set twice.");
                  }
                  _loc3_++;
                  this.stealCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiPvpAutoFightRes.result cannot be set twice.");
                  }
                  _loc6_++;
                  this.result = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiPvpAutoFightRes.attacker cannot be set twice.");
                  }
                  _loc8_++;
                  this.attacker = new proto.BgFightInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.attacker);
                  continue;
               case 6:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiPvpAutoFightRes.target cannot be set twice.");
                  }
                  _loc9_++;
                  this.target = new proto.BgFightInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.target);
                  continue;
            }
         }
      }
   }
}
