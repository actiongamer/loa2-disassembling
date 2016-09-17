package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyStageRank extends Message
   {
      
      public static const TIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageRank.times","times",8 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyStageRank.name","name",16 | 2);
      
      public static const HURT:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FamilyStageRank.hurt","hurt",24 | 0);
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FamilyStageRank.playerid","playerid",32 | 0);
      
      public static const BASEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageRank.baseid","baseid",40 | 0);
      
      public static const PLAYERLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageRank.playerlevel","playerlevel",48 | 0);
      
      public static const MILITARYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageRank.militaryrank","militaryrank",56 | 0);
       
      
      public var times:uint;
      
      public var name:String;
      
      public var hurt:UInt64;
      
      public var playerid:UInt64;
      
      public var baseid:uint;
      
      private var playerlevel$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var militaryrank$field:uint;
      
      public function FamilyStageRank()
      {
         super();
      }
      
      public function clearPlayerlevel() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         playerlevel$field = new uint();
      }
      
      public function get hasPlayerlevel() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set playerlevel(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         playerlevel$field = param1;
      }
      
      public function get playerlevel() : uint
      {
         return playerlevel$field;
      }
      
      public function clearMilitaryrank() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         militaryrank$field = new uint();
      }
      
      public function get hasMilitaryrank() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set militaryrank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         militaryrank$field = param1;
      }
      
      public function get militaryrank() : uint
      {
         return militaryrank$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.times);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT64(param1,this.hurt);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT64(param1,this.playerid);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.baseid);
         if(hasPlayerlevel)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,playerlevel$field);
         }
         if(hasMilitaryrank)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,militaryrank$field);
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
         var _loc5_:* = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc8_:uint = 0;
         var _loc4_:uint = 0;
         var _loc10_:uint = 0;
         var _loc7_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageRank.times cannot be set twice.");
                  }
                  _loc6_++;
                  this.times = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageRank.name cannot be set twice.");
                  }
                  _loc3_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageRank.hurt cannot be set twice.");
                  }
                  _loc8_++;
                  this.hurt = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageRank.playerid cannot be set twice.");
                  }
                  _loc4_++;
                  this.playerid = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 4:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageRank.baseid cannot be set twice.");
                  }
                  _loc10_++;
                  this.baseid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageRank.playerlevel cannot be set twice.");
                  }
                  _loc7_++;
                  this.playerlevel = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageRank.militaryrank cannot be set twice.");
                  }
                  _loc9_++;
                  this.militaryrank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
