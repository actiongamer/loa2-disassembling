package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class StaticTuanGouRewardModel extends Message
   {
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticTuanGouRewardModel.version","version",8 | 0);
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticTuanGouRewardModel.id","id",16 | 0);
      
      public static const NEED_SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticTuanGouRewardModel.need_score","needScore",24 | 0);
      
      public static const REWARD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticTuanGouRewardModel.reward","reward",32 | 2);
       
      
      public var status:int;
      
      private var version$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var id$field:uint;
      
      private var need_score$field:uint;
      
      private var reward$field:String;
      
      public function StaticTuanGouRewardModel()
      {
         super();
      }
      
      public function clearVersion() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         version$field = new uint();
      }
      
      public function get hasVersion() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set version(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         version$field = param1;
      }
      
      public function get version() : uint
      {
         return version$field;
      }
      
      public function clearId() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         id$field = param1;
      }
      
      public function get id() : uint
      {
         return id$field;
      }
      
      public function clearNeedScore() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         need_score$field = new uint();
      }
      
      public function get hasNeedScore() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set needScore(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         need_score$field = param1;
      }
      
      public function get needScore() : uint
      {
         return need_score$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasVersion)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,version$field);
         }
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasNeedScore)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,need_score$field);
         }
         if(hasReward)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,reward$field);
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
         var _loc4_:* = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouRewardModel.version cannot be set twice.");
                  }
                  _loc7_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouRewardModel.id cannot be set twice.");
                  }
                  _loc6_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouRewardModel.needScore cannot be set twice.");
                  }
                  _loc5_++;
                  this.needScore = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTuanGouRewardModel.reward cannot be set twice.");
                  }
                  _loc3_++;
                  this.reward = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
