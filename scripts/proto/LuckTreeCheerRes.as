package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class LuckTreeCheerRes extends Message
   {
      
      public static const REWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.LuckTreeCheerRes.rewards","rewards",8 | 2,Reward);
      
      public static const ISSUPER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.LuckTreeCheerRes.issuper","issuper",16 | 0);
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeCheerRes.itemid","itemid",24 | 0);
      
      public static const ITEMIDS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.LuckTreeCheerRes.itemids","itemids",32 | 0);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeCheerRes.score","score",40 | 0);
      
      public static const NEWLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeCheerRes.newlevel","newlevel",48 | 0);
      
      public static const NEWEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeCheerRes.newexp","newexp",56 | 0);
       
      
      public var rewards:Array;
      
      public var issuper:Boolean;
      
      public var itemid:uint;
      
      public var itemids:Array;
      
      private var score$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var newlevel$field:uint;
      
      private var newexp$field:uint;
      
      public function LuckTreeCheerRes()
      {
         rewards = [];
         itemids = [];
         super();
      }
      
      public function clearScore() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         score$field = param1;
      }
      
      public function get score() : uint
      {
         return score$field;
      }
      
      public function clearNewlevel() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         newlevel$field = new uint();
      }
      
      public function get hasNewlevel() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set newlevel(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         newlevel$field = param1;
      }
      
      public function get newlevel() : uint
      {
         return newlevel$field;
      }
      
      public function clearNewexp() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         newexp$field = new uint();
      }
      
      public function get hasNewexp() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set newexp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         newexp$field = param1;
      }
      
      public function get newexp() : uint
      {
         return newexp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         _loc3_ = uint(0);
         while(_loc3_ < this.rewards.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewards[_loc3_]);
            _loc3_++;
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_BOOL(param1,this.issuper);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.itemid);
         _loc2_ = uint(0);
         while(_loc2_ < this.itemids.length)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,this.itemids[_loc2_]);
            _loc2_++;
         }
         if(hasScore)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,score$field);
         }
         if(hasNewlevel)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,newlevel$field);
         }
         if(hasNewexp)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,newexp$field);
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc8_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  this.rewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Reward()));
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeCheerRes.issuper cannot be set twice.");
                  }
                  _loc4_++;
                  this.issuper = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeCheerRes.itemid cannot be set twice.");
                  }
                  _loc3_++;
                  this.itemid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if((_loc5_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.itemids);
                  }
                  else
                  {
                     this.itemids.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeCheerRes.score cannot be set twice.");
                  }
                  _loc6_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeCheerRes.newlevel cannot be set twice.");
                  }
                  _loc8_++;
                  this.newlevel = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeCheerRes.newexp cannot be set twice.");
                  }
                  _loc7_++;
                  this.newexp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
