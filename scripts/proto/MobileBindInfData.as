package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class MobileBindInfData extends Message
   {
      
      public static const BINDED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.MobileBindInfData.binded","binded",8 | 0);
      
      public static const CANGETREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.MobileBindInfData.cangetreward","cangetreward",16 | 0);
      
      public static const EXPIRESIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MobileBindInfData.expiresin","expiresin",24 | 0);
       
      
      public var binded:Boolean;
      
      public var cangetreward:Boolean;
      
      public var expiresin:uint;
      
      public function MobileBindInfData()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.binded);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_BOOL(param1,this.cangetreward);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.expiresin);
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
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: MobileBindInfData.binded cannot be set twice.");
                  }
                  _loc6_++;
                  this.binded = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: MobileBindInfData.cangetreward cannot be set twice.");
                  }
                  _loc4_++;
                  this.cangetreward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: MobileBindInfData.expiresin cannot be set twice.");
                  }
                  _loc3_++;
                  this.expiresin = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
