package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GetYunBiaoFlyInfoRes extends Message
   {
      
      public static const LOCKED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GetYunBiaoFlyInfoRes.locked","locked",8 | 0);
      
      public static const TIME:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.GetYunBiaoFlyInfoRes.time","time",16 | 0);
      
      public static const FLYSHIPS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.GetYunBiaoFlyInfoRes.flyships","flyships",24 | 2,FlyShips);
      
      public static const ENEMYSHIPS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.GetYunBiaoFlyInfoRes.enemyships","enemyships",32 | 2,FlyShips);
      
      public static const SHIPID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.GetYunBiaoFlyInfoRes.shipid","shipid",40 | 0);
      
      public static const FEIXINGJIESHU:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GetYunBiaoFlyInfoRes.feixingjieshu","feixingjieshu",48 | 0);
       
      
      public var locked:Boolean;
      
      public var time:UInt64;
      
      public var flyships:Array;
      
      public var enemyships:Array;
      
      public var shipid:UInt64;
      
      public var feixingjieshu:Boolean;
      
      public function GetYunBiaoFlyInfoRes()
      {
         flyships = [];
         enemyships = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = 0;
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.locked);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT64(param1,this.time);
         _loc4_ = uint(0);
         while(_loc4_ < this.flyships.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.flyships[_loc4_]);
            _loc4_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.enemyships.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.enemyships[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT64(param1,this.shipid);
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_BOOL(param1,this.feixingjieshu);
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GetYunBiaoFlyInfoRes.locked cannot be set twice.");
                  }
                  _loc4_++;
                  this.locked = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: GetYunBiaoFlyInfoRes.time cannot be set twice.");
                  }
                  _loc3_++;
                  this.time = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  this.flyships.push(ReadUtils.read$TYPE_MESSAGE(param1,new FlyShips()));
                  continue;
               case 3:
                  this.enemyships.push(ReadUtils.read$TYPE_MESSAGE(param1,new FlyShips()));
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: GetYunBiaoFlyInfoRes.shipid cannot be set twice.");
                  }
                  _loc6_++;
                  this.shipid = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: GetYunBiaoFlyInfoRes.feixingjieshu cannot be set twice.");
                  }
                  _loc7_++;
                  this.feixingjieshu = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
