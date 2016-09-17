package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class MineSweepAllInfoRes extends Message
   {
      
      public static const PANEL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.MineSweepAllInfoRes.panel","panel",8 | 2,proto.MineSweepPanelRes);
      
      public static const SHOP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.MineSweepAllInfoRes.shop","shop",16 | 2,proto.MineSweepShopInfoRes);
      
      public static const SINGLEREWARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.MineSweepAllInfoRes.singleReward","singleReward",24 | 2,proto.MineSweepSingleRewardRes);
      
      public static const RESETINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.MineSweepAllInfoRes.resetInfo","resetInfo",32 | 2,proto.ResetInfo);
      
      public static const PRICE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.MineSweepAllInfoRes.price","price",40 | 2);
      
      public static const DIATYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineSweepAllInfoRes.diaType","diaType",48 | 0);
       
      
      private var panel$field:proto.MineSweepPanelRes;
      
      private var shop$field:proto.MineSweepShopInfoRes;
      
      private var singleReward$field:proto.MineSweepSingleRewardRes;
      
      private var resetInfo$field:proto.ResetInfo;
      
      private var price$field:String;
      
      private var diaType$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function MineSweepAllInfoRes()
      {
         super();
      }
      
      public function clearPanel() : void
      {
         panel$field = null;
      }
      
      public function get hasPanel() : Boolean
      {
         return panel$field != null;
      }
      
      public function set panel(param1:proto.MineSweepPanelRes) : void
      {
         panel$field = param1;
      }
      
      public function get panel() : proto.MineSweepPanelRes
      {
         return panel$field;
      }
      
      public function clearShop() : void
      {
         shop$field = null;
      }
      
      public function get hasShop() : Boolean
      {
         return shop$field != null;
      }
      
      public function set shop(param1:proto.MineSweepShopInfoRes) : void
      {
         shop$field = param1;
      }
      
      public function get shop() : proto.MineSweepShopInfoRes
      {
         return shop$field;
      }
      
      public function clearSingleReward() : void
      {
         singleReward$field = null;
      }
      
      public function get hasSingleReward() : Boolean
      {
         return singleReward$field != null;
      }
      
      public function set singleReward(param1:proto.MineSweepSingleRewardRes) : void
      {
         singleReward$field = param1;
      }
      
      public function get singleReward() : proto.MineSweepSingleRewardRes
      {
         return singleReward$field;
      }
      
      public function clearResetInfo() : void
      {
         resetInfo$field = null;
      }
      
      public function get hasResetInfo() : Boolean
      {
         return resetInfo$field != null;
      }
      
      public function set resetInfo(param1:proto.ResetInfo) : void
      {
         resetInfo$field = param1;
      }
      
      public function get resetInfo() : proto.ResetInfo
      {
         return resetInfo$field;
      }
      
      public function clearPrice() : void
      {
         price$field = null;
      }
      
      public function get hasPrice() : Boolean
      {
         return price$field != null;
      }
      
      public function set price(param1:String) : void
      {
         price$field = param1;
      }
      
      public function get price() : String
      {
         return price$field;
      }
      
      public function clearDiaType() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         diaType$field = new uint();
      }
      
      public function get hasDiaType() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set diaType(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         diaType$field = param1;
      }
      
      public function get diaType() : uint
      {
         return diaType$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasPanel)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,panel$field);
         }
         if(hasShop)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,shop$field);
         }
         if(hasSingleReward)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,singleReward$field);
         }
         if(hasResetInfo)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,resetInfo$field);
         }
         if(hasPrice)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,price$field);
         }
         if(hasDiaType)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,diaType$field);
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
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         var _loc6_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: MineSweepAllInfoRes.panel cannot be set twice.");
                  }
                  _loc7_++;
                  this.panel = new proto.MineSweepPanelRes();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.panel);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: MineSweepAllInfoRes.shop cannot be set twice.");
                  }
                  _loc3_++;
                  this.shop = new proto.MineSweepShopInfoRes();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.shop);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: MineSweepAllInfoRes.singleReward cannot be set twice.");
                  }
                  _loc4_++;
                  this.singleReward = new proto.MineSweepSingleRewardRes();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.singleReward);
                  continue;
               case 3:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: MineSweepAllInfoRes.resetInfo cannot be set twice.");
                  }
                  _loc8_++;
                  this.resetInfo = new proto.ResetInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.resetInfo);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: MineSweepAllInfoRes.price cannot be set twice.");
                  }
                  _loc6_++;
                  this.price = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: MineSweepAllInfoRes.diaType cannot be set twice.");
                  }
                  _loc9_++;
                  this.diaType = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
