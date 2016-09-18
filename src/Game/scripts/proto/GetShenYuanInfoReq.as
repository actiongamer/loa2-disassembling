package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GetShenYuanInfoReq extends Message
   {
      
      public static const CONTICHANLLGE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GetShenYuanInfoReq.contiChanllge","contiChanllge",8 | 0);
       
      
      private var contiChanllge$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function GetShenYuanInfoReq()
      {
         super();
      }
      
      public function clearContiChanllge() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         contiChanllge$field = new Boolean();
      }
      
      public function get hasContiChanllge() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set contiChanllge(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         contiChanllge$field = param1;
      }
      
      public function get contiChanllge() : Boolean
      {
         return contiChanllge$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasContiChanllge)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_BOOL(param1,contiChanllge$field);
         }
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
                  throw new IOError("Bad data format: GetShenYuanInfoReq.contiChanllge cannot be set twice.");
               }
               _loc4_++;
               this.contiChanllge = ReadUtils.read$TYPE_BOOL(param1);
            }
            else
            {
               super.readUnknown(param1,_loc3_);
            }
         }
      }
   }
}
