package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class OpenChallengeData extends Message
   {
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.OpenChallengeData.baseinfo","baseinfo",8 | 2,proto.PlayerBaseInfo);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.OpenChallengeData.ability","ability",16 | 0);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.OpenChallengeData.rank","rank",24 | 0);
      
      public static const ISCHAOJI:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.OpenChallengeData.ischaoji","ischaoji",32 | 0);
       
      
      public var baseinfo:proto.PlayerBaseInfo;
      
      public var ability:UInt64;
      
      public var rank:uint;
      
      public var ischaoji:Boolean;
      
      public function OpenChallengeData()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.baseinfo);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT64(param1,this.ability);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.rank);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_BOOL(param1,this.ischaoji);
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
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: OpenChallengeData.baseinfo cannot be set twice.");
                  }
                  _loc7_++;
                  this.baseinfo = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseinfo);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: OpenChallengeData.ability cannot be set twice.");
                  }
                  _loc6_++;
                  this.ability = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: OpenChallengeData.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: OpenChallengeData.ischaoji cannot be set twice.");
                  }
                  _loc5_++;
                  this.ischaoji = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
