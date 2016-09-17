package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import proto.GoddessVotePanelRes.GoddessTicket;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GoddessVotePanelRes extends Message
   {
      
      public static const TICKETS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.GoddessVotePanelRes.tickets","tickets",8 | 2,GoddessTicket);
      
      public static const MYTICKETS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GoddessVotePanelRes.myTickets","myTickets",16 | 0);
      
      public static const MYSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GoddessVotePanelRes.myScore","myScore",24 | 0);
      
      public static const VOTESTARTSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GoddessVotePanelRes.voteStartStamp","voteStartStamp",32 | 0);
      
      public static const VOTEENDSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GoddessVotePanelRes.voteEndStamp","voteEndStamp",40 | 0);
      
      public static const DROPINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.GoddessVotePanelRes.dropInfo","dropInfo",48 | 2,StaticGoddesDropModel);
       
      
      public var tickets:Array;
      
      public var myTickets:uint;
      
      public var myScore:uint;
      
      private var voteStartStamp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var voteEndStamp$field:uint;
      
      public var dropInfo:Array;
      
      public function GoddessVotePanelRes()
      {
         tickets = [];
         dropInfo = [];
         super();
      }
      
      public function clearVoteStartStamp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         voteStartStamp$field = new uint();
      }
      
      public function get hasVoteStartStamp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set voteStartStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         voteStartStamp$field = param1;
      }
      
      public function get voteStartStamp() : uint
      {
         return voteStartStamp$field;
      }
      
      public function clearVoteEndStamp() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         voteEndStamp$field = new uint();
      }
      
      public function get hasVoteEndStamp() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set voteEndStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         voteEndStamp$field = param1;
      }
      
      public function get voteEndStamp() : uint
      {
         return voteEndStamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.tickets.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.tickets[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.myTickets);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.myScore);
         if(hasVoteStartStamp)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,voteStartStamp$field);
         }
         if(hasVoteEndStamp)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,voteEndStamp$field);
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.dropInfo.length)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.dropInfo[_loc3_]);
            _loc3_++;
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  this.tickets.push(ReadUtils.read$TYPE_MESSAGE(param1,new GoddessTicket()));
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: GoddessVotePanelRes.myTickets cannot be set twice.");
                  }
                  _loc7_++;
                  this.myTickets = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: GoddessVotePanelRes.myScore cannot be set twice.");
                  }
                  _loc3_++;
                  this.myScore = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: GoddessVotePanelRes.voteStartStamp cannot be set twice.");
                  }
                  _loc6_++;
                  this.voteStartStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GoddessVotePanelRes.voteEndStamp cannot be set twice.");
                  }
                  _loc4_++;
                  this.voteEndStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  this.dropInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticGoddesDropModel()));
                  continue;
            }
         }
      }
   }
}
