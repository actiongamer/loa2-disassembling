package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class QqGetTokenRes extends Message
   {
      
      public static const TOKEN:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.QqGetTokenRes.token","token",8 | 2);
      
      public static const MID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.QqGetTokenRes.mid","mid",16 | 2);
       
      
      public var token:String;
      
      public var mid:String;
      
      public function QqGetTokenRes()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_STRING(param1,this.token);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.mid);
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
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: QqGetTokenRes.token cannot be set twice.");
                  }
                  _loc5_++;
                  this.token = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: QqGetTokenRes.mid cannot be set twice.");
                  }
                  _loc4_++;
                  this.mid = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
