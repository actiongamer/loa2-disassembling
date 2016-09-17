package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import proto.ValentineShopInfoRes.Shop;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   
   public class ValentineShopInfoRes extends Message
   {
      
      public static const SHOP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ValentineShopInfoRes.shop","shop",8 | 2,Shop);
       
      
      public var shop:Array;
      
      public function ValentineShopInfoRes()
      {
         shop = [];
         super();
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
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            if(!((_loc3_ >> 3) - 1))
            {
               this.shop.push(ReadUtils.read$TYPE_MESSAGE(param1,new Shop()));
            }
            else
            {
               super.readUnknown(param1,_loc3_);
            }
         }
      }
   }
}
