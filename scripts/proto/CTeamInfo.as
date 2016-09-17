package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CTeamInfo extends Message
   {
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CTeamInfo.name","name",8 | 2);
      
      public static const MEMBER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.CTeamInfo.member","member",16 | 2,CTeamMemberInfo);
      
      public static const SORT:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.CTeamInfo.sort","sort",24 | 0);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CTeamInfo.score","score",32 | 0);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.CTeamInfo.ability","ability",40 | 0);
      
      public static const LEADER:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.CTeamInfo.leader","leader",48 | 0);
      
      public static const DIST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CTeamInfo.dist","dist",56 | 0);
      
      public static const OP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CTeamInfo.op","op",64 | 2);
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.CTeamInfo.id","id",72 | 0);
      
      public static const FID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CTeamInfo.fid","fid",80 | 0);
       
      
      public var name:String;
      
      public var member:Array;
      
      public var sort:Array;
      
      public var score:uint;
      
      private var ability$field:UInt64;
      
      public var leader:UInt64;
      
      private var dist$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var op$field:String;
      
      private var id$field:UInt64;
      
      private var fid$field:uint;
      
      public function CTeamInfo()
      {
         member = [];
         sort = [];
         super();
      }
      
      public function clearAbility() : void
      {
         ability$field = null;
      }
      
      public function get hasAbility() : Boolean
      {
         return ability$field != null;
      }
      
      public function set ability(param1:UInt64) : void
      {
         ability$field = param1;
      }
      
      public function get ability() : UInt64
      {
         return ability$field;
      }
      
      public function clearDist() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         dist$field = new uint();
      }
      
      public function get hasDist() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set dist(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         dist$field = param1;
      }
      
      public function get dist() : uint
      {
         return dist$field;
      }
      
      public function clearOp() : void
      {
         op$field = null;
      }
      
      public function get hasOp() : Boolean
      {
         return op$field != null;
      }
      
      public function set op(param1:String) : void
      {
         op$field = param1;
      }
      
      public function get op() : String
      {
         return op$field;
      }
      
      public function clearId() : void
      {
         id$field = null;
      }
      
      public function get hasId() : Boolean
      {
         return id$field != null;
      }
      
      public function set id(param1:UInt64) : void
      {
         id$field = param1;
      }
      
      public function get id() : UInt64
      {
         return id$field;
      }
      
      public function clearFid() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         fid$field = new uint();
      }
      
      public function get hasFid() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set fid(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         fid$field = param1;
      }
      
      public function get fid() : uint
      {
         return fid$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         _loc2_ = uint(0);
         while(_loc2_ < this.member.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.member[_loc2_]);
            _loc2_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.sort.length)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT64(param1,this.sort[_loc3_]);
            _loc3_++;
         }
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.score);
         if(hasAbility)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT64(param1,ability$field);
         }
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_UINT64(param1,this.leader);
         if(hasDist)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,dist$field);
         }
         if(hasOp)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_STRING(param1,op$field);
         }
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT64(param1,id$field);
         }
         if(hasFid)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,fid$field);
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
         var _loc6_:* = 0;
         var _loc5_:uint = 0;
         var _loc7_:uint = 0;
         var _loc9_:uint = 0;
         var _loc11_:uint = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc10_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamInfo.name cannot be set twice.");
                  }
                  _loc5_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  this.member.push(ReadUtils.read$TYPE_MESSAGE(param1,new CTeamMemberInfo()));
                  continue;
               case 2:
                  if((_loc6_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.sort);
                  }
                  else
                  {
                     this.sort.push(ReadUtils.read$TYPE_UINT64(param1));
                  }
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamInfo.score cannot be set twice.");
                  }
                  _loc7_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamInfo.ability cannot be set twice.");
                  }
                  _loc9_++;
                  this.ability = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 5:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamInfo.leader cannot be set twice.");
                  }
                  _loc11_++;
                  this.leader = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamInfo.dist cannot be set twice.");
                  }
                  _loc8_++;
                  this.dist = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamInfo.op cannot be set twice.");
                  }
                  _loc3_++;
                  this.op = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamInfo.id cannot be set twice.");
                  }
                  _loc10_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 9:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CTeamInfo.fid cannot be set twice.");
                  }
                  _loc4_++;
                  this.fid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
