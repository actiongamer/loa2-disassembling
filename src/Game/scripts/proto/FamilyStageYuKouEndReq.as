package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyStageYuKouEndReq extends Message
   {
      
      public static const PLAY_MODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageYuKouEndReq.play_mode","playMode",8 | 0);
      
      public static const STP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyStageYuKouEndReq.stp","stp",16 | 2,SkillTimePoint);
      
      public static const NODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageYuKouEndReq.nodeid","nodeid",24 | 0);
      
      public static const FIGHTDROP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FamilyStageYuKouEndReq.Fightdrop","fightdrop",32 | 0);
       
      
      public var playMode:uint;
      
      public var stp:Array;
      
      private var nodeid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var Fightdrop$field:Boolean;
      
      public function FamilyStageYuKouEndReq()
      {
         stp = [];
         super();
      }
      
      public function clearNodeid() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         nodeid$field = new uint();
      }
      
      public function get hasNodeid() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set nodeid(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         nodeid$field = param1;
      }
      
      public function get nodeid() : uint
      {
         return nodeid$field;
      }
      
      public function clearFightdrop() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         Fightdrop$field = new Boolean();
      }
      
      public function get hasFightdrop() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set fightdrop(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 2;
         Fightdrop$field = param1;
      }
      
      public function get fightdrop() : Boolean
      {
         return Fightdrop$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.playMode);
         _loc2_ = uint(0);
         while(_loc2_ < this.stp.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.stp[_loc2_]);
            _loc2_++;
         }
         if(hasNodeid)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,nodeid$field);
         }
         if(hasFightdrop)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_BOOL(param1,Fightdrop$field);
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageYuKouEndReq.playMode cannot be set twice.");
                  }
                  _loc3_++;
                  this.playMode = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.stp.push(ReadUtils.read$TYPE_MESSAGE(param1,new SkillTimePoint()));
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageYuKouEndReq.nodeid cannot be set twice.");
                  }
                  _loc6_++;
                  this.nodeid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageYuKouEndReq.fightdrop cannot be set twice.");
                  }
                  _loc4_++;
                  this.fightdrop = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
