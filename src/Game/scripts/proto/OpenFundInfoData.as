package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class OpenFundInfoData extends Message
   {
      
      public static const HASFUND:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.OpenFundInfoData.hasfund","hasfund",8 | 0);
      
      public static const CANFUND:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.OpenFundInfoData.canfund","canfund",16 | 0);
      
      public static const CANDRAWREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.OpenFundInfoData.candrawreward","candrawreward",24 | 0);
      
      public static const CANGETWELFARE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.OpenFundInfoData.cangetwelfare","cangetwelfare",32 | 0);
       
      
      public var hasfund:Boolean;
      
      public var canfund:Boolean;
      
      public var candrawreward:Boolean;
      
      public var cangetwelfare:Boolean;
      
      public function OpenFundInfoData()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.hasfund);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_BOOL(param1,this.canfund);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_BOOL(param1,this.candrawreward);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_BOOL(param1,this.cangetwelfare);
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
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: OpenFundInfoData.hasfund cannot be set twice.");
                  }
                  _loc7_++;
                  this.hasfund = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: OpenFundInfoData.canfund cannot be set twice.");
                  }
                  _loc3_++;
                  this.canfund = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: OpenFundInfoData.candrawreward cannot be set twice.");
                  }
                  _loc6_++;
                  this.candrawreward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: OpenFundInfoData.cangetwelfare cannot be set twice.");
                  }
                  _loc5_++;
                  this.cangetwelfare = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
