package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BattleManualReq extends Message
   {
      
      public static const OBJID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattleManualReq.objid","objid",8 | 0);
       
      
      public var objid:int;
      
      public function BattleManualReq()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_INT32(param1,this.objid);
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
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            if(!((_loc3_ >> 3) - 1))
            {
               if(_loc4_ != 0)
               {
                  throw new IOError("Bad data format: BattleManualReq.objid cannot be set twice.");
               }
               _loc4_++;
               this.objid = ReadUtils.read$TYPE_INT32(param1);
            }
            else
            {
               super.readUnknown(param1,_loc3_);
            }
         }
      }
   }
}
