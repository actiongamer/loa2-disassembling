package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class DragonBoatAllInfoRes extends Message
   {
      
      public static const PANEL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.DragonBoatAllInfoRes.panel","panel",8 | 2,proto.DragonBoatMakePanelRes);
      
      public static const SHOP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.DragonBoatAllInfoRes.shop","shop",16 | 2,proto.DragonBoatShopInfoRes);
      
      public static const SINGLEREWARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.DragonBoatAllInfoRes.singleReward","singleReward",24 | 2,proto.DragonBoatSingleRewardRes);
      
      public static const DROPS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.DragonBoatAllInfoRes.drops","drops",32 | 2,MapKey32ValueString);
       
      
      private var panel$field:proto.DragonBoatMakePanelRes;
      
      private var shop$field:proto.DragonBoatShopInfoRes;
      
      private var singleReward$field:proto.DragonBoatSingleRewardRes;
      
      public var drops:Array;
      
      public function DragonBoatAllInfoRes()
      {
         drops = [];
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
      
      public function set panel(param1:proto.DragonBoatMakePanelRes) : void
      {
         panel$field = param1;
      }
      
      public function get panel() : proto.DragonBoatMakePanelRes
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
      
      public function set shop(param1:proto.DragonBoatShopInfoRes) : void
      {
         shop$field = param1;
      }
      
      public function get shop() : proto.DragonBoatShopInfoRes
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
      
      public function set singleReward(param1:proto.DragonBoatSingleRewardRes) : void
      {
         singleReward$field = param1;
      }
      
      public function get singleReward() : proto.DragonBoatSingleRewardRes
      {
         return singleReward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
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
         _loc3_ = uint(0);
         while(_loc3_ < this.drops.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.drops[_loc3_]);
            _loc3_++;
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
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
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: DragonBoatAllInfoRes.panel cannot be set twice.");
                  }
                  _loc6_++;
                  this.panel = new proto.DragonBoatMakePanelRes();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.panel);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: DragonBoatAllInfoRes.shop cannot be set twice.");
                  }
                  _loc3_++;
                  this.shop = new proto.DragonBoatShopInfoRes();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.shop);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: DragonBoatAllInfoRes.singleReward cannot be set twice.");
                  }
                  _loc4_++;
                  this.singleReward = new proto.DragonBoatSingleRewardRes();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.singleReward);
                  continue;
               case 3:
                  this.drops.push(ReadUtils.read$TYPE_MESSAGE(param1,new MapKey32ValueString()));
                  continue;
            }
         }
      }
   }
}
