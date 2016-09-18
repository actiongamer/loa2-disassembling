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
   
   public class OpenChallengeInfo extends Message
   {
      
      public static const HASGET:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.OpenChallengeInfo.hasget","hasget",8 | 0);
      
      public static const CANGET:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.OpenChallengeInfo.canget","canget",16 | 0);
      
      public static const OPENSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.OpenChallengeInfo.openstamp","openstamp",24 | 0);
       
      
      public var hasget:Boolean;
      
      public var canget:Boolean;
      
      private var openstamp$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function OpenChallengeInfo()
      {
         super();
      }
      
      public function clearOpenstamp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         openstamp$field = new uint();
      }
      
      public function get hasOpenstamp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set openstamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         openstamp$field = param1;
      }
      
      public function get openstamp() : uint
      {
         return openstamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.hasget);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_BOOL(param1,this.canget);
         if(hasOpenstamp)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,openstamp$field);
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
         var _loc5_:* = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: OpenChallengeInfo.hasget cannot be set twice.");
                  }
                  _loc4_++;
                  this.hasget = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: OpenChallengeInfo.canget cannot be set twice.");
                  }
                  _loc3_++;
                  this.canget = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: OpenChallengeInfo.openstamp cannot be set twice.");
                  }
                  _loc6_++;
                  this.openstamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
