package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class SevenDayInfoRes extends Message
   {
      
      public static const LOGININFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.SevenDayInfoRes.loginInfos","loginInfos",8 | 2,SevenDayLoginInfo);
      
      public static const SHOPINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.SevenDayInfoRes.shopInfo","shopInfo",16 | 2,proto.SevenDayShopInfo);
      
      public static const TASKINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.SevenDayInfoRes.taskInfos","taskInfos",24 | 2,SevenDayTaskInfo);
      
      public static const DAY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.SevenDayInfoRes.day","day",32 | 0);
      
      public static const AVAIINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.SevenDayInfoRes.avaiInfos","avaiInfos",40 | 2,SevenDayAvaiInfo);
       
      
      public var loginInfos:Array;
      
      public var shopInfo:proto.SevenDayShopInfo;
      
      public var taskInfos:Array;
      
      public var day:uint;
      
      public var avaiInfos:Array;
      
      public function SevenDayInfoRes()
      {
         loginInfos = [];
         taskInfos = [];
         avaiInfos = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = 0;
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         _loc5_ = uint(0);
         while(_loc5_ < this.loginInfos.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.loginInfos[_loc5_]);
            _loc5_++;
         }
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_MESSAGE(param1,this.shopInfo);
         _loc3_ = uint(0);
         while(_loc3_ < this.taskInfos.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.taskInfos[_loc3_]);
            _loc3_++;
         }
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.day);
         _loc2_ = uint(0);
         while(_loc2_ < this.avaiInfos.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.avaiInfos[_loc2_]);
            _loc2_++;
         }
         var _loc7_:int = 0;
         var _loc6_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  this.loginInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new SevenDayLoginInfo()));
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: SevenDayInfoRes.shopInfo cannot be set twice.");
                  }
                  _loc5_++;
                  this.shopInfo = new proto.SevenDayShopInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.shopInfo);
                  continue;
               case 2:
                  this.taskInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new SevenDayTaskInfo()));
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: SevenDayInfoRes.day cannot be set twice.");
                  }
                  _loc4_++;
                  this.day = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  this.avaiInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new SevenDayAvaiInfo()));
                  continue;
            }
         }
      }
   }
}
