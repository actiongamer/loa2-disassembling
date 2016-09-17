package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class WorldBossHurtInfoRes extends Message
   {
      
      public static const RANK:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.WorldBossHurtInfoRes.rank","rank",8 | 2,WorldBossRankData);
      
      public static const HURTTOTAL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossHurtInfoRes.hurttotal","hurttotal",16 | 0);
      
      public static const RANKNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossHurtInfoRes.ranknum","ranknum",24 | 0);
      
      public static const CANGETREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.WorldBossHurtInfoRes.cangetreward","cangetreward",32 | 0);
      
      public static const HASGETREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.WorldBossHurtInfoRes.hasgetreward","hasgetreward",40 | 0);
       
      
      public var rank:Array;
      
      private var hurttotal$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var ranknum$field:uint;
      
      private var cangetreward$field:Boolean;
      
      private var hasgetreward$field:Boolean;
      
      public function WorldBossHurtInfoRes()
      {
         rank = [];
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
      
      public function clearCangetreward() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         cangetreward$field = new Boolean();
      }
      
      public function get hasCangetreward() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set cangetreward(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 4;
         cangetreward$field = param1;
      }
      
      public function get cangetreward() : Boolean
      {
         return cangetreward$field;
      }
      
      public function clearHasgetreward() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         hasgetreward$field = new Boolean();
      }
      
      public function get hasHasgetreward() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set hasgetreward(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 8;
         hasgetreward$field = param1;
      }
      
      public function get hasgetreward() : Boolean
      {
         return hasgetreward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.rank.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rank[_loc2_]);
            _loc2_++;
         }
         if(hasHurttotal)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,hurttotal$field);
         }
         if(hasRanknum)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,ranknum$field);
         }
         if(hasCangetreward)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_BOOL(param1,cangetreward$field);
         }
         if(hasHasgetreward)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_BOOL(param1,hasgetreward$field);
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
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  this.rank.push(ReadUtils.read$TYPE_MESSAGE(param1,new WorldBossRankData()));
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossHurtInfoRes.hurttotal cannot be set twice.");
                  }
                  _loc5_++;
                  this.hurttotal = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossHurtInfoRes.ranknum cannot be set twice.");
                  }
                  _loc3_++;
                  this.ranknum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossHurtInfoRes.cangetreward cannot be set twice.");
                  }
                  _loc4_++;
                  this.cangetreward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossHurtInfoRes.hasgetreward cannot be set twice.");
                  }
                  _loc7_++;
                  this.hasgetreward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
