package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BkSpecialCommandRes extends Message
   {
      
      public static const COMMAND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkSpecialCommandRes.command","command",8 | 0);
      
      public static const PARAM1:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkSpecialCommandRes.param1","param1",16 | 0);
      
      public static const PARAM2:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkSpecialCommandRes.param2","param2",24 | 0);
       
      
      public var command:uint;
      
      public var param1:uint;
      
      public var param2:uint;
      
      public function BkSpecialCommandRes()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.command);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.param1);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.param2);
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BkSpecialCommandRes.command cannot be set twice.");
                  }
                  _loc5_++;
                  this.command = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BkSpecialCommandRes.param1 cannot be set twice.");
                  }
                  _loc4_++;
                  this.param1 = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BkSpecialCommandRes.param2 cannot be set twice.");
                  }
                  _loc6_++;
                  this.param2 = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
