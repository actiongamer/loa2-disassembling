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
   
   public class FamilyExpeChampionThroneRes extends Message
   {
      
      public static const CANUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeChampionThroneRes.caNum","caNum",8 | 0);
      
      public static const INFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeChampionThroneRes.infos","infos",16 | 2,proto.PlayerBaseInfo);
      
      public static const LEADER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeChampionThroneRes.leader","leader",24 | 2,proto.PlayerBaseInfo);
      
      public static const STARTSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeChampionThroneRes.startStamp","startStamp",32 | 0);
      
      public static const LATESTCANUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeChampionThroneRes.latestCaNum","latestCaNum",40 | 0);
       
      
      public var caNum:uint;
      
      public var infos:Array;
      
      private var leader$field:proto.PlayerBaseInfo;
      
      private var startStamp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var latestCaNum$field:uint;
      
      public function FamilyExpeChampionThroneRes()
      {
         infos = [];
         super();
      }
      
      public function clearLeader() : void
      {
         leader$field = null;
      }
      
      public function get hasLeader() : Boolean
      {
         return leader$field != null;
      }
      
      public function set leader(param1:proto.PlayerBaseInfo) : void
      {
         leader$field = param1;
      }
      
      public function get leader() : proto.PlayerBaseInfo
      {
         return leader$field;
      }
      
      public function clearStartStamp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         startStamp$field = new uint();
      }
      
      public function get hasStartStamp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set startStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         startStamp$field = param1;
      }
      
      public function get startStamp() : uint
      {
         return startStamp$field;
      }
      
      public function clearLatestCaNum() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         latestCaNum$field = new uint();
      }
      
      public function get hasLatestCaNum() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set latestCaNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         latestCaNum$field = param1;
      }
      
      public function get latestCaNum() : uint
      {
         return latestCaNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.caNum);
         _loc2_ = uint(0);
         while(_loc2_ < this.infos.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.infos[_loc2_]);
            _loc2_++;
         }
         if(hasLeader)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,leader$field);
         }
         if(hasStartStamp)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,startStamp$field);
         }
         if(hasLatestCaNum)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,latestCaNum$field);
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
         var _loc5_:* = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeChampionThroneRes.caNum cannot be set twice.");
                  }
                  _loc7_++;
                  this.caNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.infos.push(ReadUtils.read$TYPE_MESSAGE(param1,new proto.PlayerBaseInfo()));
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeChampionThroneRes.leader cannot be set twice.");
                  }
                  _loc6_++;
                  this.leader = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.leader);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeChampionThroneRes.startStamp cannot be set twice.");
                  }
                  _loc3_++;
                  this.startStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeChampionThroneRes.latestCaNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.latestCaNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
