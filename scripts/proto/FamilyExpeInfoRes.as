package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyExpeInfoRes extends Message
   {
      
      public static const STATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeInfoRes.status","status",8 | 0);
      
      public static const OPENSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeInfoRes.openStamp","openStamp",16 | 0);
      
      public static const RESIDUALTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeInfoRes.residualTimes","residualTimes",24 | 0);
      
      public static const SELF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeInfoRes.self","self",32 | 2,proto.FamilyExpeFamilyInfo);
      
      public static const TARGET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeInfoRes.target","target",40 | 2,proto.FamilyExpeFamilyInfo);
      
      public static const ENEMYINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeInfoRes.enemyInfos","enemyInfos",48 | 2,FamilyExpeEnemyInfo);
      
      public static const ISOPEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FamilyExpeInfoRes.isOpen","isOpen",56 | 0);
      
      public static const RESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeInfoRes.result","result",64 | 0);
      
      public static const NEXTFIGHTSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeInfoRes.NextFightStamp","nextFightStamp",72 | 0);
      
      public static const TASK:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeInfoRes.task","task",80 | 2,proto.FamilyExpeTaskNotify);
      
      public static const REWARDSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeInfoRes.rewardStamp","rewardStamp",88 | 0);
       
      
      public var status:uint;
      
      private var openStamp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var residualTimes$field:uint;
      
      private var self$field:proto.FamilyExpeFamilyInfo;
      
      private var target$field:proto.FamilyExpeFamilyInfo;
      
      public var enemyInfos:Array;
      
      private var isOpen$field:Boolean;
      
      private var result$field:uint;
      
      private var NextFightStamp$field:uint;
      
      private var task$field:proto.FamilyExpeTaskNotify;
      
      private var rewardStamp$field:uint;
      
      public function FamilyExpeInfoRes()
      {
         enemyInfos = [];
         super();
      }
      
      public function clearOpenStamp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         openStamp$field = new uint();
      }
      
      public function get hasOpenStamp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set openStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         openStamp$field = param1;
      }
      
      public function get openStamp() : uint
      {
         return openStamp$field;
      }
      
      public function clearResidualTimes() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         residualTimes$field = new uint();
      }
      
      public function get hasResidualTimes() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set residualTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         residualTimes$field = param1;
      }
      
      public function get residualTimes() : uint
      {
         return residualTimes$field;
      }
      
      public function clearSelf() : void
      {
         self$field = null;
      }
      
      public function get hasSelf() : Boolean
      {
         return self$field != null;
      }
      
      public function set self(param1:proto.FamilyExpeFamilyInfo) : void
      {
         self$field = param1;
      }
      
      public function get self() : proto.FamilyExpeFamilyInfo
      {
         return self$field;
      }
      
      public function clearTarget() : void
      {
         target$field = null;
      }
      
      public function get hasTarget() : Boolean
      {
         return target$field != null;
      }
      
      public function set target(param1:proto.FamilyExpeFamilyInfo) : void
      {
         target$field = param1;
      }
      
      public function get target() : proto.FamilyExpeFamilyInfo
      {
         return target$field;
      }
      
      public function clearIsOpen() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         isOpen$field = new Boolean();
      }
      
      public function get hasIsOpen() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set isOpen(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 4;
         isOpen$field = param1;
      }
      
      public function get isOpen() : Boolean
      {
         return isOpen$field;
      }
      
      public function clearResult() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         result$field = new uint();
      }
      
      public function get hasResult() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set result(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         result$field = param1;
      }
      
      public function get result() : uint
      {
         return result$field;
      }
      
      public function clearNextFightStamp() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         NextFightStamp$field = new uint();
      }
      
      public function get hasNextFightStamp() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set nextFightStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         NextFightStamp$field = param1;
      }
      
      public function get nextFightStamp() : uint
      {
         return NextFightStamp$field;
      }
      
      public function clearTask() : void
      {
         task$field = null;
      }
      
      public function get hasTask() : Boolean
      {
         return task$field != null;
      }
      
      public function set task(param1:proto.FamilyExpeTaskNotify) : void
      {
         task$field = param1;
      }
      
      public function get task() : proto.FamilyExpeTaskNotify
      {
         return task$field;
      }
      
      public function clearRewardStamp() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         rewardStamp$field = new uint();
      }
      
      public function get hasRewardStamp() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set rewardStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         rewardStamp$field = param1;
      }
      
      public function get rewardStamp() : uint
      {
         return rewardStamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.status);
         if(hasOpenStamp)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,openStamp$field);
         }
         if(hasResidualTimes)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,residualTimes$field);
         }
         if(hasSelf)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,self$field);
         }
         if(hasTarget)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,target$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.enemyInfos.length)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.enemyInfos[_loc2_]);
            _loc2_++;
         }
         if(hasIsOpen)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_BOOL(param1,isOpen$field);
         }
         if(hasResult)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,result$field);
         }
         if(hasNextFightStamp)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,NextFightStamp$field);
         }
         if(hasTask)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_MESSAGE(param1,task$field);
         }
         if(hasRewardStamp)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,rewardStamp$field);
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
         var _loc4_:* = 0;
         var _loc3_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc5_:uint = 0;
         var _loc12_:uint = 0;
         var _loc7_:uint = 0;
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         var _loc13_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeInfoRes.status cannot be set twice.");
                  }
                  _loc3_++;
                  this.status = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeInfoRes.openStamp cannot be set twice.");
                  }
                  _loc10_++;
                  this.openStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeInfoRes.residualTimes cannot be set twice.");
                  }
                  _loc11_++;
                  this.residualTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeInfoRes.self cannot be set twice.");
                  }
                  _loc5_++;
                  this.self = new proto.FamilyExpeFamilyInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.self);
                  continue;
               case 4:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeInfoRes.target cannot be set twice.");
                  }
                  _loc12_++;
                  this.target = new proto.FamilyExpeFamilyInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.target);
                  continue;
               case 5:
                  this.enemyInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new FamilyExpeEnemyInfo()));
                  continue;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeInfoRes.isOpen cannot be set twice.");
                  }
                  _loc7_++;
                  this.isOpen = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeInfoRes.result cannot be set twice.");
                  }
                  _loc9_++;
                  this.result = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeInfoRes.nextFightStamp cannot be set twice.");
                  }
                  _loc8_++;
                  this.nextFightStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeInfoRes.task cannot be set twice.");
                  }
                  _loc13_++;
                  this.task = new proto.FamilyExpeTaskNotify();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.task);
                  continue;
               case 10:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeInfoRes.rewardStamp cannot be set twice.");
                  }
                  _loc6_++;
                  this.rewardStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
