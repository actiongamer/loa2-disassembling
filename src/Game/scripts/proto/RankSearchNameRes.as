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
   
   public class RankSearchNameRes extends Message
   {
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.RankSearchNameRes.rank","rank",8 | 0);
      
      public static const PAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.RankSearchNameRes.page","page",16 | 0);
      
      public static const ABILITY:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.RankSearchNameRes.ability","ability",24 | 2,AbilityRankData);
      
      public static const FAMILY:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.RankSearchNameRes.family","family",32 | 2,FamilyRankData);
      
      public static const LEVEL:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.RankSearchNameRes.level","level",40 | 2,LevelRankData);
      
      public static const AREA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.RankSearchNameRes.area","area",48 | 2,AreaRankData);
      
      public static const EXTRA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.RankSearchNameRes.extra","extra",56 | 2,proto.RankExtraData);
      
      public static const STAGE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.RankSearchNameRes.stage","stage",64 | 2,StageStarRankData);
       
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var page$field:uint;
      
      public var ability:Array;
      
      public var family:Array;
      
      public var level:Array;
      
      public var area:Array;
      
      public var extra:proto.RankExtraData;
      
      public var stage:Array;
      
      public function RankSearchNameRes()
      {
         ability = [];
         family = [];
         level = [];
         area = [];
         stage = [];
         super();
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
      
      public function clearPage() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         page$field = new uint();
      }
      
      public function get hasPage() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set page(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         page$field = param1;
      }
      
      public function get page() : uint
      {
         return page$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc7_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         if(hasRank)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,rank$field);
         }
         if(hasPage)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,page$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.ability.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.ability[_loc2_]);
            _loc2_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.family.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.family[_loc3_]);
            _loc3_++;
         }
         _loc7_ = uint(0);
         while(_loc7_ < this.level.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.level[_loc7_]);
            _loc7_++;
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.area.length)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.area[_loc4_]);
            _loc4_++;
         }
         WriteUtils.writeTag(param1,2,7);
         WriteUtils.write$TYPE_MESSAGE(param1,this.extra);
         _loc5_ = uint(0);
         while(_loc5_ < this.stage.length)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.stage[_loc5_]);
            _loc5_++;
         }
         var _loc9_:int = 0;
         var _loc8_:* = this;
         for(var _loc6_ in this)
         {
            super.writeUnknown(param1,_loc6_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: RankSearchNameRes.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: RankSearchNameRes.page cannot be set twice.");
                  }
                  _loc4_++;
                  this.page = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  this.ability.push(ReadUtils.read$TYPE_MESSAGE(param1,new AbilityRankData()));
                  continue;
               case 3:
                  this.family.push(ReadUtils.read$TYPE_MESSAGE(param1,new FamilyRankData()));
                  continue;
               case 4:
                  this.level.push(ReadUtils.read$TYPE_MESSAGE(param1,new LevelRankData()));
                  continue;
               case 5:
                  this.area.push(ReadUtils.read$TYPE_MESSAGE(param1,new AreaRankData()));
                  continue;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: RankSearchNameRes.extra cannot be set twice.");
                  }
                  _loc6_++;
                  this.extra = new proto.RankExtraData();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.extra);
                  continue;
               case 7:
                  this.stage.push(ReadUtils.read$TYPE_MESSAGE(param1,new StageStarRankData()));
                  continue;
            }
         }
      }
   }
}
