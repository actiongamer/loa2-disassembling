package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class AbilityRankData extends Message
   {
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.AbilityRankData.rank","rank",8 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.AbilityRankData.name","name",16 | 2);
      
      public static const FAMILYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.AbilityRankData.familyName","familyName",24 | 2);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.AbilityRankData.ability","ability",32 | 0);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.AbilityRankData.level","level",40 | 0);
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.AbilityRankData.id","id",48 | 0);
      
      public static const FAMILID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.AbilityRankData.familId","familId",56 | 0);
      
      public static const QQINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.AbilityRankData.qqInfo","qqInfo",64 | 2,proto.PlayerQQInfo);
       
      
      public var rank:uint;
      
      public var name:String;
      
      private var familyName$field:String;
      
      public var ability:UInt64;
      
      public var level:uint;
      
      public var id:UInt64;
      
      private var familId$field:UInt64;
      
      private var qqInfo$field:proto.PlayerQQInfo;
      
      public function AbilityRankData()
      {
         super();
      }
      
      public function clearFamilyName() : void
      {
         familyName$field = null;
      }
      
      public function get hasFamilyName() : Boolean
      {
         return familyName$field != null;
      }
      
      public function set familyName(param1:String) : void
      {
         familyName$field = param1;
      }
      
      public function get familyName() : String
      {
         return familyName$field;
      }
      
      public function clearFamilId() : void
      {
         familId$field = null;
      }
      
      public function get hasFamilId() : Boolean
      {
         return familId$field != null;
      }
      
      public function set familId(param1:UInt64) : void
      {
         familId$field = param1;
      }
      
      public function get familId() : UInt64
      {
         return familId$field;
      }
      
      public function clearQqInfo() : void
      {
         qqInfo$field = null;
      }
      
      public function get hasQqInfo() : Boolean
      {
         return qqInfo$field != null;
      }
      
      public function set qqInfo(param1:proto.PlayerQQInfo) : void
      {
         qqInfo$field = param1;
      }
      
      public function get qqInfo() : proto.PlayerQQInfo
      {
         return qqInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.rank);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         if(hasFamilyName)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,familyName$field);
         }
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT64(param1,this.ability);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.level);
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         if(hasFamilId)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT64(param1,familId$field);
         }
         if(hasQqInfo)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_MESSAGE(param1,qqInfo$field);
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
         var _loc7_:* = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc10_:uint = 0;
         var _loc6_:uint = 0;
         var _loc11_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: AbilityRankData.rank cannot be set twice.");
                  }
                  _loc5_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: AbilityRankData.name cannot be set twice.");
                  }
                  _loc4_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: AbilityRankData.familyName cannot be set twice.");
                  }
                  _loc3_++;
                  this.familyName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: AbilityRankData.ability cannot be set twice.");
                  }
                  _loc10_++;
                  this.ability = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: AbilityRankData.level cannot be set twice.");
                  }
                  _loc6_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: AbilityRankData.id cannot be set twice.");
                  }
                  _loc11_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: AbilityRankData.familId cannot be set twice.");
                  }
                  _loc8_++;
                  this.familId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: AbilityRankData.qqInfo cannot be set twice.");
                  }
                  _loc9_++;
                  this.qqInfo = new proto.PlayerQQInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.qqInfo);
                  continue;
            }
         }
      }
   }
}
