package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import proto.CharmRankShopInfoRes.Shop;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CharmRankShopInfoRes extends Message
   {
      
      public static const SHOP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.CharmRankShopInfoRes.shop","shop",8 | 2,Shop);
      
      public static const PANELIMG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CharmRankShopInfoRes.panelImg","panelImg",16 | 2);
      
      public static const SHOPIMG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CharmRankShopInfoRes.shopImg","shopImg",24 | 2);
       
      
      public var shop:Array;
      
      private var panelImg$field:String;
      
      private var shopImg$field:String;
      
      public function CharmRankShopInfoRes()
      {
         shop = [];
         super();
      }
      
      public function clearPanelImg() : void
      {
         panelImg$field = null;
      }
      
      public function get hasPanelImg() : Boolean
      {
         return panelImg$field != null;
      }
      
      public function set panelImg(param1:String) : void
      {
         panelImg$field = param1;
      }
      
      public function get panelImg() : String
      {
         return panelImg$field;
      }
      
      public function clearShopImg() : void
      {
         shopImg$field = null;
      }
      
      public function get hasShopImg() : Boolean
      {
         return shopImg$field != null;
      }
      
      public function set shopImg(param1:String) : void
      {
         shopImg$field = param1;
      }
      
      public function get shopImg() : String
      {
         return shopImg$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         _loc3_ = uint(0);
         while(_loc3_ < this.shop.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.shop[_loc3_]);
            _loc3_++;
         }
         if(hasPanelImg)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,panelImg$field);
         }
         if(hasShopImg)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,shopImg$field);
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
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  this.shop.push(ReadUtils.read$TYPE_MESSAGE(param1,new Shop()));
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CharmRankShopInfoRes.panelImg cannot be set twice.");
                  }
                  _loc4_++;
                  this.panelImg = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CharmRankShopInfoRes.shopImg cannot be set twice.");
                  }
                  _loc5_++;
                  this.shopImg = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
