package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ZhuanPanMemberInfo extends Message
   {
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ZhuanPanMemberInfo.score","score",8 | 0);
      
      public static const LUCKLYBI:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ZhuanPanMemberInfo.lucklybi","lucklybi",16 | 0);
      
      public static const BUYINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ZhuanPanMemberInfo.buyinfo","buyinfo",24 | 2,ZhuanPanBuyItemInfo);
       
      
      public var score:uint;
      
      public var lucklybi:uint;
      
      public var buyinfo:Array;
      
      public function ZhuanPanMemberInfo()
      {
         buyinfo = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.score);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.lucklybi);
         _loc2_ = uint(0);
         while(_loc2_ < this.buyinfo.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.buyinfo[_loc2_]);
            _loc2_++;
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
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ZhuanPanMemberInfo.score cannot be set twice.");
                  }
                  _loc5_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ZhuanPanMemberInfo.lucklybi cannot be set twice.");
                  }
                  _loc3_++;
                  this.lucklybi = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  this.buyinfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new ZhuanPanBuyItemInfo()));
                  continue;
            }
         }
      }
   }
}
