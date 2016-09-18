package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyExpeFightRes extends Message
   {
      
      public static const BTLRESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFightRes.btlResult","btlResult",8 | 0);
      
      public static const CON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFightRes.con","con",16 | 0);
      
      public static const COIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFightRes.coin","coin",24 | 0);
      
      public static const REPORTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeFightRes.reportId","reportId",32 | 2);
      
      public static const HPPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFightRes.hpPercent","hpPercent",40 | 0);
      
      public static const ATTACKER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeFightRes.attacker","attacker",48 | 2,proto.BgFightInfo);
      
      public static const TARGET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeFightRes.target","target",56 | 2,proto.BgFightInfo);
       
      
      public var btlResult:uint;
      
      private var con$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var coin$field:uint;
      
      public var reportId:String;
      
      private var hpPercent$field:uint;
      
      private var attacker$field:proto.BgFightInfo;
      
      private var target$field:proto.BgFightInfo;
      
      public function FamilyExpeFightRes()
      {
         super();
      }
      
      public function clearCon() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         con$field = new uint();
      }
      
      public function get hasCon() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set con(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         con$field = param1;
      }
      
      public function get con() : uint
      {
         return con$field;
      }
      
      public function clearCoin() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         coin$field = new uint();
      }
      
      public function get hasCoin() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set coin(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         coin$field = param1;
      }
      
      public function get coin() : uint
      {
         return coin$field;
      }
      
      public function clearHpPercent() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         hpPercent$field = new uint();
      }
      
      public function get hasHpPercent() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set hpPercent(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         hpPercent$field = param1;
      }
      
      public function get hpPercent() : uint
      {
         return hpPercent$field;
      }
      
      public function clearAttacker() : void
      {
         attacker$field = null;
      }
      
      public function get hasAttacker() : Boolean
      {
         return attacker$field != null;
      }
      
      public function set attacker(param1:proto.BgFightInfo) : void
      {
         attacker$field = param1;
      }
      
      public function get attacker() : proto.BgFightInfo
      {
         return attacker$field;
      }
      
      public function clearTarget() : void
      {
         target$field = null;
      }
      
      public function get hasTarget() : Boolean
      {
         return target$field != null;
      }
      
      public function set target(param1:proto.BgFightInfo) : void
      {
         target$field = param1;
      }
      
      public function get target() : proto.BgFightInfo
      {
         return target$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.btlResult);
         if(hasCon)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,con$field);
         }
         if(hasCoin)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,coin$field);
         }
         WriteUtils.writeTag(param1,2,4);
         WriteUtils.write$TYPE_STRING(param1,this.reportId);
         if(hasHpPercent)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,hpPercent$field);
         }
         if(hasAttacker)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_MESSAGE(param1,attacker$field);
         }
         if(hasTarget)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,target$field);
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
         var _loc10_:uint = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc9_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFightRes.btlResult cannot be set twice.");
                  }
                  _loc10_++;
                  this.btlResult = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFightRes.con cannot be set twice.");
                  }
                  _loc6_++;
                  this.con = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFightRes.coin cannot be set twice.");
                  }
                  _loc4_++;
                  this.coin = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFightRes.reportId cannot be set twice.");
                  }
                  _loc3_++;
                  this.reportId = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFightRes.hpPercent cannot be set twice.");
                  }
                  _loc9_++;
                  this.hpPercent = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFightRes.attacker cannot be set twice.");
                  }
                  _loc7_++;
                  this.attacker = new proto.BgFightInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.attacker);
                  continue;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFightRes.target cannot be set twice.");
                  }
                  _loc8_++;
                  this.target = new proto.BgFightInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.target);
                  continue;
            }
         }
      }
   }
}
