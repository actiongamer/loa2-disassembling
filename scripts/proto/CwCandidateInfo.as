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
   
   public class CwCandidateInfo extends Message
   {
      
      public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.CwCandidateInfo.info","info",8 | 2,proto.PlayerBaseInfo);
      
      public static const VOTECOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CwCandidateInfo.voteCount","voteCount",16 | 0);
       
      
      private var info$field:proto.PlayerBaseInfo;
      
      private var voteCount$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function CwCandidateInfo()
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
      
      public function clearVoteCount() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         voteCount$field = new uint();
      }
      
      public function get hasVoteCount() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set voteCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         voteCount$field = param1;
      }
      
      public function get voteCount() : uint
      {
         return voteCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasInfo)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,info$field);
         }
         if(hasVoteCount)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,voteCount$field);
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
         var _loc4_:* = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CwCandidateInfo.info cannot be set twice.");
                  }
                  _loc5_++;
                  this.info = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.info);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CwCandidateInfo.voteCount cannot be set twice.");
                  }
                  _loc3_++;
                  this.voteCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
