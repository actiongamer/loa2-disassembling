package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ProtocolStatusRes extends Message
   {
      
      public static const CMD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ProtocolStatusRes.cmd","cmd",8 | 0);
      
      public static const ERRCODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ProtocolStatusRes.errCode","errCode",16 | 0);
      
      public static const RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ProtocolStatusRes.res","res",24 | 2,proto.ResStatus);
       
      
      private var cmd$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var errCode$field:uint;
      
      private var res$field:proto.ResStatus;
      
      public function ProtocolStatusRes()
      {
         super();
      }
      
      public function clearCmd() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         cmd$field = new uint();
      }
      
      public function get hasCmd() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set cmd(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         cmd$field = param1;
      }
      
      public function get cmd() : uint
      {
         return cmd$field;
      }
      
      public function clearErrCode() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         errCode$field = new uint();
      }
      
      public function get hasErrCode() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set errCode(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         errCode$field = param1;
      }
      
      public function get errCode() : uint
      {
         return errCode$field;
      }
      
      public function clearRes() : void
      {
         res$field = null;
      }
      
      public function get hasRes() : Boolean
      {
         return res$field != null;
      }
      
      public function set res(param1:proto.ResStatus) : void
      {
         res$field = param1;
      }
      
      public function get res() : proto.ResStatus
      {
         return res$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasCmd)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,cmd$field);
         }
         if(hasErrCode)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,errCode$field);
         }
         if(hasRes)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,res$field);
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
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ProtocolStatusRes.cmd cannot be set twice.");
                  }
                  _loc4_++;
                  this.cmd = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ProtocolStatusRes.errCode cannot be set twice.");
                  }
                  _loc5_++;
                  this.errCode = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: ProtocolStatusRes.res cannot be set twice.");
                  }
                  _loc6_++;
                  this.res = new proto.ResStatus();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.res);
                  continue;
            }
         }
      }
   }
}
