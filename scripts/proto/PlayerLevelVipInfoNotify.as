package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class PlayerLevelVipInfoNotify extends Message
   {
      
      public static const PLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerLevelVipInfoNotify.plevel","plevel",8 | 0);
      
      public static const VLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerLevelVipInfoNotify.vlevel","vlevel",16 | 0);
       
      
      public var plevel:uint;
      
      public var vlevel:uint;
      
      public function PlayerLevelVipInfoNotify()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.plevel);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.vlevel);
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
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerLevelVipInfoNotify.plevel cannot be set twice.");
                  }
                  _loc3_++;
                  this.plevel = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerLevelVipInfoNotify.vlevel cannot be set twice.");
                  }
                  _loc4_++;
                  this.vlevel = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
