package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   
   public class MallListRes extends Message
   {
      
      public static const LIBAO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.MallListRes.libao","libao",8 | 2,mallItem);
      
      public static const TEJIA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.MallListRes.tejia","tejia",16 | 2,mallItem);
      
      public static const TUIJIAN:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.MallListRes.tuijian","tuijian",24 | 2,mallItem);
      
      public static const REXIAO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.MallListRes.rexiao","rexiao",32 | 2,mallItem);
      
      public static const GLOBAL:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.MallListRes.global","global",40 | 2,ShopBuyInfo);
      
      public static const PERSON:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.MallListRes.person","person",48 | 2,ShopBuyInfo);
       
      
      public var libao:Array;
      
      public var tejia:Array;
      
      public var tuijian:Array;
      
      public var rexiao:Array;
      
      public var global:Array;
      
      public var person:Array;
      
      public function MallListRes()
      {
         libao = [];
         tejia = [];
         tuijian = [];
         rexiao = [];
         global = [];
         person = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc8_:* = 0;
         var _loc5_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc6_:* = 0;
         var _loc2_:* = 0;
         _loc8_ = uint(0);
         while(_loc8_ < this.libao.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.libao[_loc8_]);
            _loc8_++;
         }
         _loc5_ = uint(0);
         while(_loc5_ < this.tejia.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.tejia[_loc5_]);
            _loc5_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.tuijian.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.tuijian[_loc3_]);
            _loc3_++;
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.rexiao.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rexiao[_loc4_]);
            _loc4_++;
         }
         _loc6_ = uint(0);
         while(_loc6_ < this.global.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.global[_loc6_]);
            _loc6_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.person.length)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.person[_loc2_]);
            _loc2_++;
         }
         var _loc10_:int = 0;
         var _loc9_:* = this;
         for(var _loc7_ in this)
         {
            super.writeUnknown(param1,_loc7_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  this.libao.push(ReadUtils.read$TYPE_MESSAGE(param1,new mallItem()));
                  continue;
               case 1:
                  this.tejia.push(ReadUtils.read$TYPE_MESSAGE(param1,new mallItem()));
                  continue;
               case 2:
                  this.tuijian.push(ReadUtils.read$TYPE_MESSAGE(param1,new mallItem()));
                  continue;
               case 3:
                  this.rexiao.push(ReadUtils.read$TYPE_MESSAGE(param1,new mallItem()));
                  continue;
               case 4:
                  this.global.push(ReadUtils.read$TYPE_MESSAGE(param1,new ShopBuyInfo()));
                  continue;
               case 5:
                  this.person.push(ReadUtils.read$TYPE_MESSAGE(param1,new ShopBuyInfo()));
                  continue;
            }
         }
      }
   }
}
