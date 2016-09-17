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
   
   public class StaticLuckTreeScoreRewardModel extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticLuckTreeScoreRewardModel.id","id",8 | 0);
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticLuckTreeScoreRewardModel.version","version",16 | 0);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticLuckTreeScoreRewardModel.level","level",24 | 0);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticLuckTreeScoreRewardModel.score","score",32 | 0);
      
      public static const ITEM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticLuckTreeScoreRewardModel.item","item",40 | 2);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var version$field:uint;
      
      private var level$field:uint;
      
      private var score$field:uint;
      
      private var item$field:String;
      
      public function StaticLuckTreeScoreRewardModel()
      {
         super();
      }
      
      public function clearId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         id$field = param1;
      }
      
      public function get id() : uint
      {
         return id$field;
      }
      
      public function clearVersion() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         version$field = new uint();
      }
      
      public function get hasVersion() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set version(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         version$field = param1;
      }
      
      public function get version() : uint
      {
         return version$field;
      }
      
      public function clearLevel() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         level$field = param1;
      }
      
      public function get level() : uint
      {
         return level$field;
      }
      
      public function clearScore() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         score$field = param1;
      }
      
      public function get score() : uint
      {
         return score$field;
      }
      
      public function clearItem() : void
      {
         item$field = null;
      }
      
      public function get hasItem() : Boolean
      {
         return item$field != null;
      }
      
      public function set item(param1:String) : void
      {
         item$field = param1;
      }
      
      public function get item() : String
      {
         return item$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasVersion)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,version$field);
         }
         if(hasLevel)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,level$field);
         }
         if(hasScore)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,score$field);
         }
         if(hasItem)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,item$field);
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
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeScoreRewardModel.id cannot be set twice.");
                  }
                  _loc7_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeScoreRewardModel.version cannot be set twice.");
                  }
                  _loc6_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeScoreRewardModel.level cannot be set twice.");
                  }
                  _loc3_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeScoreRewardModel.score cannot be set twice.");
                  }
                  _loc5_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticLuckTreeScoreRewardModel.item cannot be set twice.");
                  }
                  _loc8_++;
                  this.item = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
