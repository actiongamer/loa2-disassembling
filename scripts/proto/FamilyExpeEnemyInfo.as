package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyExpeEnemyInfo extends Message
   {
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeEnemyInfo.baseInfo","baseInfo",8 | 2,proto.PlayerBaseInfo);
      
      public static const HPPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeEnemyInfo.hpPercent","hpPercent",16 | 0);
      
      public static const CON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeEnemyInfo.con","con",24 | 0);
      
      public static const COIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeEnemyInfo.coin","coin",32 | 0);
      
      public static const FIGHTCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeEnemyInfo.fightCount","fightCount",40 | 0);
      
      public static const FIRSTKILLERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeEnemyInfo.firstKillerName","firstKillerName",48 | 2);
       
      
      public var baseInfo:proto.PlayerBaseInfo;
      
      private var hpPercent$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var con$field:uint;
      
      private var coin$field:uint;
      
      private var fightCount$field:uint;
      
      private var firstKillerName$field:String;
      
      public function FamilyExpeEnemyInfo()
      {
         super();
      }
      
      public function clearHpPercent() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         hpPercent$field = new uint();
      }
      
      public function get hasHpPercent() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set hpPercent(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         hpPercent$field = param1;
      }
      
      public function get hpPercent() : uint
      {
         return hpPercent$field;
      }
      
      public function clearCon() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         con$field = new uint();
      }
      
      public function get hasCon() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set con(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         con$field = param1;
      }
      
      public function get con() : uint
      {
         return con$field;
      }
      
      public function clearCoin() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         coin$field = new uint();
      }
      
      public function get hasCoin() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set coin(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         coin$field = param1;
      }
      
      public function get coin() : uint
      {
         return coin$field;
      }
      
      public function clearFightCount() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         fightCount$field = new uint();
      }
      
      public function get hasFightCount() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set fightCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         fightCount$field = param1;
      }
      
      public function get fightCount() : uint
      {
         return fightCount$field;
      }
      
      public function clearFirstKillerName() : void
      {
         firstKillerName$field = null;
      }
      
      public function get hasFirstKillerName() : Boolean
      {
         return firstKillerName$field != null;
      }
      
      public function set firstKillerName(param1:String) : void
      {
         firstKillerName$field = param1;
      }
      
      public function get firstKillerName() : String
      {
         return firstKillerName$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.baseInfo);
         if(hasHpPercent)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,hpPercent$field);
         }
         if(hasCon)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,con$field);
         }
         if(hasCoin)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,coin$field);
         }
         if(hasFightCount)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,fightCount$field);
         }
         if(hasFirstKillerName)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,firstKillerName$field);
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
         var _loc3_:uint = 0;
         var _loc9_:uint = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeEnemyInfo.baseInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.baseInfo = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseInfo);
                  continue;
               case 1:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeEnemyInfo.hpPercent cannot be set twice.");
                  }
                  _loc9_++;
                  this.hpPercent = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeEnemyInfo.con cannot be set twice.");
                  }
                  _loc6_++;
                  this.con = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeEnemyInfo.coin cannot be set twice.");
                  }
                  _loc4_++;
                  this.coin = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeEnemyInfo.fightCount cannot be set twice.");
                  }
                  _loc7_++;
                  this.fightCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeEnemyInfo.firstKillerName cannot be set twice.");
                  }
                  _loc8_++;
                  this.firstKillerName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
