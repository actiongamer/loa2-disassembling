package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GuajiSwitchReq extends Message
   {
      
      public static const ISFIGHT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GuajiSwitchReq.isFight","isFight",8 | 0);
      
      public static const ISAUTOTEAM:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GuajiSwitchReq.isAutoTeam","isAutoTeam",16 | 0);
       
      
      public var isFight:Boolean;
      
      public var isAutoTeam:Boolean;
      
      public function GuajiSwitchReq()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.isFight);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_BOOL(param1,this.isAutoTeam);
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
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiSwitchReq.isFight cannot be set twice.");
                  }
                  _loc3_++;
                  this.isFight = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiSwitchReq.isAutoTeam cannot be set twice.");
                  }
                  _loc5_++;
                  this.isAutoTeam = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}