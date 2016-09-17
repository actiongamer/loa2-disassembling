package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FundInfo extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FundInfo.id","id",8 | 0);
      
      public static const ISBUY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FundInfo.isBuy","isBuy",16 | 0);
      
      public static const ISGET:RepeatedFieldDescriptor$TYPE_BOOL = new RepeatedFieldDescriptor$TYPE_BOOL("proto.FundInfo.isGet","isGet",24 | 0);
      
      public static const CHARGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FundInfo.charge","charge",32 | 0);
      
      public static const BUYSTARTTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FundInfo.buyStartTm","buyStartTm",40 | 0);
      
      public static const BUYENDTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FundInfo.buyEndTm","buyEndTm",48 | 0);
      
      public static const REWARDSTARTTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FundInfo.rewardStartTm","rewardStartTm",56 | 0);
      
      public static const REWARDENDTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FundInfo.rewardEndTm","rewardEndTm",64 | 0);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var isBuy$field:Boolean;
      
      public var isGet:Array;
      
      private var charge$field:uint;
      
      private var buyStartTm$field:uint;
      
      private var buyEndTm$field:uint;
      
      private var rewardStartTm$field:uint;
      
      private var rewardEndTm$field:uint;
      
      public function FundInfo()
      {
         isGet = [];
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
      
      public function clearIsBuy() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         isBuy$field = new Boolean();
      }
      
      public function get hasIsBuy() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set isBuy(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 2;
         isBuy$field = param1;
      }
      
      public function get isBuy() : Boolean
      {
         return isBuy$field;
      }
      
      public function clearCharge() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         charge$field = new uint();
      }
      
      public function get hasCharge() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set charge(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         charge$field = param1;
      }
      
      public function get charge() : uint
      {
         return charge$field;
      }
      
      public function clearBuyStartTm() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         buyStartTm$field = new uint();
      }
      
      public function get hasBuyStartTm() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set buyStartTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         buyStartTm$field = param1;
      }
      
      public function get buyStartTm() : uint
      {
         return buyStartTm$field;
      }
      
      public function clearBuyEndTm() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         buyEndTm$field = new uint();
      }
      
      public function get hasBuyEndTm() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set buyEndTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         buyEndTm$field = param1;
      }
      
      public function get buyEndTm() : uint
      {
         return buyEndTm$field;
      }
      
      public function clearRewardStartTm() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         rewardStartTm$field = new uint();
      }
      
      public function get hasRewardStartTm() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set rewardStartTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         rewardStartTm$field = param1;
      }
      
      public function get rewardStartTm() : uint
      {
         return rewardStartTm$field;
      }
      
      public function clearRewardEndTm() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         rewardEndTm$field = new uint();
      }
      
      public function get hasRewardEndTm() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set rewardEndTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         rewardEndTm$field = param1;
      }
      
      public function get rewardEndTm() : uint
      {
         return rewardEndTm$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasIsBuy)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_BOOL(param1,isBuy$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.isGet.length)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_BOOL(param1,this.isGet[_loc2_]);
            _loc2_++;
         }
         if(hasCharge)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,charge$field);
         }
         if(hasBuyStartTm)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,buyStartTm$field);
         }
         if(hasBuyEndTm)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,buyEndTm$field);
         }
         if(hasRewardStartTm)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,rewardStartTm$field);
         }
         if(hasRewardEndTm)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,rewardEndTm$field);
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
         var _loc9_:uint = 0;
         var _loc5_:uint = 0;
         var _loc7_:uint = 0;
         var _loc10_:uint = 0;
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FundInfo.id cannot be set twice.");
                  }
                  _loc9_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FundInfo.isBuy cannot be set twice.");
                  }
                  _loc5_++;
                  this.isBuy = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 2:
                  if((_loc6_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_BOOL,this.isGet);
                  }
                  else
                  {
                     this.isGet.push(ReadUtils.read$TYPE_BOOL(param1));
                  }
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FundInfo.charge cannot be set twice.");
                  }
                  _loc7_++;
                  this.charge = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FundInfo.buyStartTm cannot be set twice.");
                  }
                  _loc10_++;
                  this.buyStartTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FundInfo.buyEndTm cannot be set twice.");
                  }
                  _loc4_++;
                  this.buyEndTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FundInfo.rewardStartTm cannot be set twice.");
                  }
                  _loc8_++;
                  this.rewardStartTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FundInfo.rewardEndTm cannot be set twice.");
                  }
                  _loc3_++;
                  this.rewardEndTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
