package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TeamMemberState extends Message
   {
      
      public static const MEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.TeamMemberState.mem","mem",8 | 2,proto.TeamMember);
      
      public static const READY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.TeamMemberState.ready","ready",16 | 0);
       
      
      public var mem:proto.TeamMember;
      
      public var ready:Boolean;
      
      public function TeamMemberState()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.mem);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_BOOL(param1,this.ready);
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
                     throw new IOError("Bad data format: TeamMemberState.mem cannot be set twice.");
                  }
                  _loc5_++;
                  this.mem = new proto.TeamMember();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.mem);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: TeamMemberState.ready cannot be set twice.");
                  }
                  _loc4_++;
                  this.ready = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
