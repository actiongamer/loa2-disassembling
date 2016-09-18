package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GetSerialNumberRes extends Message
   {
      
      public static const CODE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.GetSerialNumberRes.code","code",8 | 2);
      
      public static const RESULTINFO:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.GetSerialNumberRes.resultInfo","resultInfo",16 | 2);
       
      
      private var code$field:String;
      
      private var resultInfo$field:String;
      
      public function GetSerialNumberRes()
      {
         super();
      }
      
      public function clearCode() : void
      {
         code$field = null;
      }
      
      public function get hasCode() : Boolean
      {
         return code$field != null;
      }
      
      public function set code(param1:String) : void
      {
         code$field = param1;
      }
      
      public function get code() : String
      {
         return code$field;
      }
      
      public function clearResultInfo() : void
      {
         resultInfo$field = null;
      }
      
      public function get hasResultInfo() : Boolean
      {
         return resultInfo$field != null;
      }
      
      public function set resultInfo(param1:String) : void
      {
         resultInfo$field = param1;
      }
      
      public function get resultInfo() : String
      {
         return resultInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasCode)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_STRING(param1,code$field);
         }
         if(hasResultInfo)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,resultInfo$field);
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
                     throw new IOError("Bad data format: GetSerialNumberRes.code cannot be set twice.");
                  }
                  _loc5_++;
                  this.code = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GetSerialNumberRes.resultInfo cannot be set twice.");
                  }
                  _loc4_++;
                  this.resultInfo = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
