package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ZhuanPanDajiangRecord extends Message
   {
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.ZhuanPanDajiangRecord.playerid","playerid",8 | 0);
      
      public static const TIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ZhuanPanDajiangRecord.timestamp","timestamp",16 | 0);
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ZhuanPanDajiangRecord.itemid","itemid",24 | 0);
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ZhuanPanDajiangRecord.baseinfo","baseinfo",32 | 2,proto.PlayerBaseInfo);
       
      
      public var playerid:UInt64;
      
      public var timestamp:uint;
      
      public var itemid:uint;
      
      public var baseinfo:proto.PlayerBaseInfo;
      
      public function ZhuanPanDajiangRecord()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.playerid);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.timestamp);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.itemid);
         WriteUtils.writeTag(param1,2,4);
         WriteUtils.write$TYPE_MESSAGE(param1,this.baseinfo);
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
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ZhuanPanDajiangRecord.playerid cannot be set twice.");
                  }
                  _loc3_++;
                  this.playerid = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: ZhuanPanDajiangRecord.timestamp cannot be set twice.");
                  }
                  _loc6_++;
                  this.timestamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ZhuanPanDajiangRecord.itemid cannot be set twice.");
                  }
                  _loc4_++;
                  this.itemid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: ZhuanPanDajiangRecord.baseinfo cannot be set twice.");
                  }
                  _loc7_++;
                  this.baseinfo = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseinfo);
                  continue;
            }
         }
      }
   }
}
