package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class StaticFundModel extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticFundModel.id","id",8 | 0);
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticFundModel.version","version",16 | 0);
      
      public static const BUYSTARTTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticFundModel.buyStartTm","buyStartTm",24 | 2);
      
      public static const BUYENDTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticFundModel.buyEndTm","buyEndTm",32 | 2);
      
      public static const REWARDSTARTTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticFundModel.rewardStartTm","rewardStartTm",40 | 2);
      
      public static const REWARDENDTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticFundModel.rewardEndTm","rewardEndTm",48 | 2);
      
      public static const FUNDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticFundModel.fundName","fundName",56 | 2);
      
      public static const FUNDDESC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticFundModel.fundDesc","fundDesc",64 | 2);
      
      public static const CHARGECONDI:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticFundModel.chargeCondi","chargeCondi",72 | 0);
      
      public static const BUYCOST:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticFundModel.buyCost","buyCost",80 | 2);
      
      public static const REWARDDESC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticFundModel.rewardDesc","rewardDesc",88 | 2);
      
      public static const REWARD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticFundModel.reward","reward",96 | 2);
      
      public static const OPENTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticFundModel.openTm","openTm",104 | 0);
      
      public static const BUYSTARTTMFORCLIENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticFundModel.buyStartTmForClient","buyStartTmForClient",112 | 0);
      
      public static const BUYENDTMFORCLIENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticFundModel.buyEndTmForClient","buyEndTmForClient",120 | 0);
      
      public static const REWARDSTARTTMFORCLIENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticFundModel.rewardStartTmForClient","rewardStartTmForClient",128 | 0);
      
      public static const REWARDENDTMFORCLIENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticFundModel.rewardEndTmForClient","rewardEndTmForClient",136 | 0);
      
      public static const PRICEDESC:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticFundModel.priceDesc","priceDesc",144 | 0);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var version$field:uint;
      
      private var buyStartTm$field:String;
      
      private var buyEndTm$field:String;
      
      private var rewardStartTm$field:String;
      
      private var rewardEndTm$field:String;
      
      private var fundName$field:String;
      
      private var fundDesc$field:String;
      
      private var chargeCondi$field:uint;
      
      private var buyCost$field:String;
      
      private var rewardDesc$field:String;
      
      private var reward$field:String;
      
      private var openTm$field:uint;
      
      private var buyStartTmForClient$field:uint;
      
      private var buyEndTmForClient$field:uint;
      
      private var rewardStartTmForClient$field:uint;
      
      private var rewardEndTmForClient$field:uint;
      
      private var priceDesc$field:uint;
      
      public function StaticFundModel()
      {
         super();
      }
      
      public function clearId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         id$field = param1;
      }
      
      public function get id() : uint
      {
         return id$field;
      }
      
      public function clearVersion() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         version$field = new uint();
      }
      
      public function get hasVersion() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set version(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         version$field = param1;
      }
      
      public function get version() : uint
      {
         return version$field;
      }
      
      public function clearBuyStartTm() : void
      {
         buyStartTm$field = null;
      }
      
      public function get hasBuyStartTm() : Boolean
      {
         return buyStartTm$field != null;
      }
      
      public function set buyStartTm(param1:String) : void
      {
         buyStartTm$field = param1;
      }
      
      public function get buyStartTm() : String
      {
         return buyStartTm$field;
      }
      
      public function clearBuyEndTm() : void
      {
         buyEndTm$field = null;
      }
      
      public function get hasBuyEndTm() : Boolean
      {
         return buyEndTm$field != null;
      }
      
      public function set buyEndTm(param1:String) : void
      {
         buyEndTm$field = param1;
      }
      
      public function get buyEndTm() : String
      {
         return buyEndTm$field;
      }
      
      public function clearRewardStartTm() : void
      {
         rewardStartTm$field = null;
      }
      
      public function get hasRewardStartTm() : Boolean
      {
         return rewardStartTm$field != null;
      }
      
      public function set rewardStartTm(param1:String) : void
      {
         rewardStartTm$field = param1;
      }
      
      public function get rewardStartTm() : String
      {
         return rewardStartTm$field;
      }
      
      public function clearRewardEndTm() : void
      {
         rewardEndTm$field = null;
      }
      
      public function get hasRewardEndTm() : Boolean
      {
         return rewardEndTm$field != null;
      }
      
      public function set rewardEndTm(param1:String) : void
      {
         rewardEndTm$field = param1;
      }
      
      public function get rewardEndTm() : String
      {
         return rewardEndTm$field;
      }
      
      public function clearFundName() : void
      {
         fundName$field = null;
      }
      
      public function get hasFundName() : Boolean
      {
         return fundName$field != null;
      }
      
      public function set fundName(param1:String) : void
      {
         fundName$field = param1;
      }
      
      public function get fundName() : String
      {
         return fundName$field;
      }
      
      public function clearFundDesc() : void
      {
         fundDesc$field = null;
      }
      
      public function get hasFundDesc() : Boolean
      {
         return fundDesc$field != null;
      }
      
      public function set fundDesc(param1:String) : void
      {
         fundDesc$field = param1;
      }
      
      public function get fundDesc() : String
      {
         return fundDesc$field;
      }
      
      public function clearChargeCondi() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         chargeCondi$field = new uint();
      }
      
      public function get hasChargeCondi() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set chargeCondi(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         chargeCondi$field = param1;
      }
      
      public function get chargeCondi() : uint
      {
         return chargeCondi$field;
      }
      
      public function clearBuyCost() : void
      {
         buyCost$field = null;
      }
      
      public function get hasBuyCost() : Boolean
      {
         return buyCost$field != null;
      }
      
      public function set buyCost(param1:String) : void
      {
         buyCost$field = param1;
      }
      
      public function get buyCost() : String
      {
         return buyCost$field;
      }
      
      public function clearRewardDesc() : void
      {
         rewardDesc$field = null;
      }
      
      public function get hasRewardDesc() : Boolean
      {
         return rewardDesc$field != null;
      }
      
      public function set rewardDesc(param1:String) : void
      {
         rewardDesc$field = param1;
      }
      
      public function get rewardDesc() : String
      {
         return rewardDesc$field;
      }
      
      public function clearReward() : void
      {
         reward$field = null;
      }
      
      public function get hasReward() : Boolean
      {
         return reward$field != null;
      }
      
      public function set reward(param1:String) : void
      {
         reward$field = param1;
      }
      
      public function get reward() : String
      {
         return reward$field;
      }
      
      public function clearOpenTm() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         openTm$field = new uint();
      }
      
      public function get hasOpenTm() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set openTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         openTm$field = param1;
      }
      
      public function get openTm() : uint
      {
         return openTm$field;
      }
      
      public function clearBuyStartTmForClient() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         buyStartTmForClient$field = new uint();
      }
      
      public function get hasBuyStartTmForClient() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set buyStartTmForClient(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         buyStartTmForClient$field = param1;
      }
      
      public function get buyStartTmForClient() : uint
      {
         return buyStartTmForClient$field;
      }
      
      public function clearBuyEndTmForClient() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         buyEndTmForClient$field = new uint();
      }
      
      public function get hasBuyEndTmForClient() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set buyEndTmForClient(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         buyEndTmForClient$field = param1;
      }
      
      public function get buyEndTmForClient() : uint
      {
         return buyEndTmForClient$field;
      }
      
      public function clearRewardStartTmForClient() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         rewardStartTmForClient$field = new uint();
      }
      
      public function get hasRewardStartTmForClient() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set rewardStartTmForClient(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         rewardStartTmForClient$field = param1;
      }
      
      public function get rewardStartTmForClient() : uint
      {
         return rewardStartTmForClient$field;
      }
      
      public function clearRewardEndTmForClient() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         rewardEndTmForClient$field = new uint();
      }
      
      public function get hasRewardEndTmForClient() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set rewardEndTmForClient(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         rewardEndTmForClient$field = param1;
      }
      
      public function get rewardEndTmForClient() : uint
      {
         return rewardEndTmForClient$field;
      }
      
      public function clearPriceDesc() : void
      {
         hasField$0 = hasField$0 & 4294967039;
         priceDesc$field = new uint();
      }
      
      public function get hasPriceDesc() : Boolean
      {
         return (hasField$0 & 256) != 0;
      }
      
      public function set priceDesc(param1:uint) : void
      {
         hasField$0 = hasField$0 | 256;
         priceDesc$field = param1;
      }
      
      public function get priceDesc() : uint
      {
         return priceDesc$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasVersion)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,version$field);
         }
         if(hasBuyStartTm)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,buyStartTm$field);
         }
         if(hasBuyEndTm)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,buyEndTm$field);
         }
         if(hasRewardStartTm)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,rewardStartTm$field);
         }
         if(hasRewardEndTm)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,rewardEndTm$field);
         }
         if(hasFundName)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_STRING(param1,fundName$field);
         }
         if(hasFundDesc)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_STRING(param1,fundDesc$field);
         }
         if(hasChargeCondi)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,chargeCondi$field);
         }
         if(hasBuyCost)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_STRING(param1,buyCost$field);
         }
         if(hasRewardDesc)
         {
            WriteUtils.writeTag(param1,2,11);
            WriteUtils.write$TYPE_STRING(param1,rewardDesc$field);
         }
         if(hasReward)
         {
            WriteUtils.writeTag(param1,2,12);
            WriteUtils.write$TYPE_STRING(param1,reward$field);
         }
         if(hasOpenTm)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_UINT32(param1,openTm$field);
         }
         if(hasBuyStartTmForClient)
         {
            WriteUtils.writeTag(param1,0,14);
            WriteUtils.write$TYPE_UINT32(param1,buyStartTmForClient$field);
         }
         if(hasBuyEndTmForClient)
         {
            WriteUtils.writeTag(param1,0,15);
            WriteUtils.write$TYPE_UINT32(param1,buyEndTmForClient$field);
         }
         if(hasRewardStartTmForClient)
         {
            WriteUtils.writeTag(param1,0,16);
            WriteUtils.write$TYPE_UINT32(param1,rewardStartTmForClient$field);
         }
         if(hasRewardEndTmForClient)
         {
            WriteUtils.writeTag(param1,0,17);
            WriteUtils.write$TYPE_UINT32(param1,rewardEndTmForClient$field);
         }
         if(hasPriceDesc)
         {
            WriteUtils.writeTag(param1,0,18);
            WriteUtils.write$TYPE_UINT32(param1,priceDesc$field);
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
         var _loc20_:uint = 0;
         var _loc11_:uint = 0;
         var _loc21_:uint = 0;
         var _loc4_:uint = 0;
         var _loc12_:uint = 0;
         var _loc3_:uint = 0;
         var _loc14_:uint = 0;
         var _loc6_:uint = 0;
         var _loc18_:uint = 0;
         var _loc16_:uint = 0;
         var _loc13_:uint = 0;
         var _loc15_:uint = 0;
         var _loc10_:uint = 0;
         var _loc17_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc19_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc20_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.id cannot be set twice.");
                  }
                  _loc20_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.version cannot be set twice.");
                  }
                  _loc11_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc21_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.buyStartTm cannot be set twice.");
                  }
                  _loc21_++;
                  this.buyStartTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.buyEndTm cannot be set twice.");
                  }
                  _loc4_++;
                  this.buyEndTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.rewardStartTm cannot be set twice.");
                  }
                  _loc12_++;
                  this.rewardStartTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.rewardEndTm cannot be set twice.");
                  }
                  _loc3_++;
                  this.rewardEndTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.fundName cannot be set twice.");
                  }
                  _loc14_++;
                  this.fundName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 7:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.fundDesc cannot be set twice.");
                  }
                  _loc6_++;
                  this.fundDesc = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 8:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.chargeCondi cannot be set twice.");
                  }
                  _loc18_++;
                  this.chargeCondi = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.buyCost cannot be set twice.");
                  }
                  _loc16_++;
                  this.buyCost = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 10:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.rewardDesc cannot be set twice.");
                  }
                  _loc13_++;
                  this.rewardDesc = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 11:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.reward cannot be set twice.");
                  }
                  _loc15_++;
                  this.reward = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 12:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.openTm cannot be set twice.");
                  }
                  _loc10_++;
                  this.openTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 13:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.buyStartTmForClient cannot be set twice.");
                  }
                  _loc17_++;
                  this.buyStartTmForClient = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 14:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.buyEndTmForClient cannot be set twice.");
                  }
                  _loc8_++;
                  this.buyEndTmForClient = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 15:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.rewardStartTmForClient cannot be set twice.");
                  }
                  _loc9_++;
                  this.rewardStartTmForClient = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 16:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.rewardEndTmForClient cannot be set twice.");
                  }
                  _loc19_++;
                  this.rewardEndTmForClient = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 17:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticFundModel.priceDesc cannot be set twice.");
                  }
                  _loc7_++;
                  this.priceDesc = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
