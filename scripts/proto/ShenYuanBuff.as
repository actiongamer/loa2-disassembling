package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_FLOAT;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ShenYuanBuff extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ShenYuanBuff.id","id",8 | 0);
      
      public static const JIAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ShenYuanBuff.jiage","jiage",16 | 0);
      
      public static const BUY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.ShenYuanBuff.buy","buy",24 | 0);
      
      public static const PARAM:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.ShenYuanBuff.param","param",32 | 5);
       
      
      public var id:uint;
      
      public var jiage:uint;
      
      public var buy:Boolean;
      
      public var param:Number;
      
      public function ShenYuanBuff()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.jiage);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_BOOL(param1,this.buy);
         WriteUtils.writeTag(param1,5,4);
         WriteUtils.write$TYPE_FLOAT(param1,this.param);
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
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: ShenYuanBuff.id cannot be set twice.");
                  }
                  _loc7_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ShenYuanBuff.jiage cannot be set twice.");
                  }
                  _loc3_++;
                  this.jiage = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ShenYuanBuff.buy cannot be set twice.");
                  }
                  _loc5_++;
                  this.buy = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: ShenYuanBuff.param cannot be set twice.");
                  }
                  _loc6_++;
                  this.param = ReadUtils.read$TYPE_FLOAT(param1);
                  continue;
            }
         }
      }
   }
}
