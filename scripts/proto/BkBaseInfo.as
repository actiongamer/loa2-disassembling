package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BkBaseInfo extends Message
   {
      
      public static const WINTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkBaseInfo.winTimes","winTimes",8 | 0);
      
      public static const FAILTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkBaseInfo.failTimes","failTimes",16 | 0);
      
      public static const STATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.BkBaseInfo.status","status",24 | 0,BK_STATUS);
       
      
      public var winTimes:uint;
      
      public var failTimes:uint;
      
      public var status:int;
      
      public function BkBaseInfo()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.winTimes);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.failTimes);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_ENUM(param1,this.status);
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BkBaseInfo.winTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.winTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BkBaseInfo.failTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.failTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BkBaseInfo.status cannot be set twice.");
                  }
                  _loc3_++;
                  this.status = ReadUtils.read$TYPE_ENUM(param1);
                  continue;
            }
         }
      }
   }
}
