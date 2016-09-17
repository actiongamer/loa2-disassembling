package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TeamDismissNotify extends Message
   {
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamDismissNotify.kind","kind",8 | 0);
      
      public static const TEAMID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.TeamDismissNotify.teamId","teamId",16 | 0);
       
      
      public var kind:uint;
      
      public var teamId:UInt64;
      
      public function TeamDismissNotify()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.kind);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT64(param1,this.teamId);
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
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: TeamDismissNotify.kind cannot be set twice.");
                  }
                  _loc4_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: TeamDismissNotify.teamId cannot be set twice.");
                  }
                  _loc3_++;
                  this.teamId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
