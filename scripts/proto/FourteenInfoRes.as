package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FourteenInfoRes extends Message
   {
      
      public static const LOGININFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FourteenInfoRes.loginInfos","loginInfos",8 | 2,FourteenDayLoginInfo);
      
      public static const TASKINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FourteenInfoRes.taskInfos","taskInfos",16 | 2,FourteenDayTaskInfo);
      
      public static const DAY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FourteenInfoRes.day","day",24 | 0);
      
      public static const SHOPINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FourteenInfoRes.shopInfo","shopInfo",32 | 2,FourteenDayShopBuyTimesRes);
      
      public static const AVAILINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FourteenInfoRes.availInfos","availInfos",40 | 2,FourteenDayAvailInfo);
       
      
      public var loginInfos:Array;
      
      public var taskInfos:Array;
      
      public var day:uint;
      
      public var shopInfo:Array;
      
      public var availInfos:Array;
      
      public function FourteenInfoRes()
      {
         loginInfos = [];
         taskInfos = [];
         shopInfo = [];
         availInfos = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc6_:* = 0;
         var _loc4_:* = 0;
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         _loc6_ = uint(0);
         while(_loc6_ < this.loginInfos.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.loginInfos[_loc6_]);
            _loc6_++;
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.taskInfos.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.taskInfos[_loc4_]);
            _loc4_++;
         }
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.day);
         _loc3_ = uint(0);
         while(_loc3_ < this.shopInfo.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.shopInfo[_loc3_]);
            _loc3_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.availInfos.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.availInfos[_loc2_]);
            _loc2_++;
         }
         var _loc8_:int = 0;
         var _loc7_:* = this;
         for(var _loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  this.loginInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new FourteenDayLoginInfo()));
                  continue;
               case 1:
                  this.taskInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new FourteenDayTaskInfo()));
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FourteenInfoRes.day cannot be set twice.");
                  }
                  _loc4_++;
                  this.day = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  this.shopInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new FourteenDayShopBuyTimesRes()));
                  continue;
               case 4:
                  this.availInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new FourteenDayAvailInfo()));
                  continue;
            }
         }
      }
   }
}
