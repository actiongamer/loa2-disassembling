package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GJPvpInfo extends Message
   {
      
      public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GJPvpInfo.info","info",8 | 2,proto.PlayerBaseInfo);
      
      public static const PROBSTATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GJPvpInfo.probStatus","probStatus",16 | 0);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GJPvpInfo.count","count",24 | 0);
       
      
      public var isDead:Boolean;
      
      private var info$field:proto.PlayerBaseInfo;
      
      private var probStatus$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var count$field:uint;
      
      public function GJPvpInfo()
      {
         super();
      }
      
      public function clearInfo() : void
      {
         info$field = null;
      }
      
      public function get hasInfo() : Boolean
      {
         return info$field != null;
      }
      
      public function set info(param1:proto.PlayerBaseInfo) : void
      {
         info$field = param1;
      }
      
      public function get info() : proto.PlayerBaseInfo
      {
         return info$field;
      }
      
      public function clearProbStatus() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         probStatus$field = new uint();
      }
      
      public function get hasProbStatus() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set probStatus(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         probStatus$field = param1;
      }
      
      public function get probStatus() : uint
      {
         return probStatus$field;
      }
      
      public function clearCount() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         count$field = new uint();
      }
      
      public function get hasCount() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set count(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         count$field = param1;
      }
      
      public function get count() : uint
      {
         return count$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasInfo)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,info$field);
         }
         if(hasProbStatus)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,probStatus$field);
         }
         if(hasCount)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,count$field);
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
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: GJPvpInfo.info cannot be set twice.");
                  }
                  _loc6_++;
                  this.info = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.info);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: GJPvpInfo.probStatus cannot be set twice.");
                  }
                  _loc5_++;
                  this.probStatus = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GJPvpInfo.count cannot be set twice.");
                  }
                  _loc4_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
