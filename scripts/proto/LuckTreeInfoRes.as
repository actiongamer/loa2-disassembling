package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import proto.LuckTreeInfoRes.getReward;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class LuckTreeInfoRes extends Message
   {
      
      public static const MEMBER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.LuckTreeInfoRes.member","member",8 | 2,proto.LuckTreeMemberInfo);
      
      public static const STARTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeInfoRes.starttime","starttime",16 | 0);
      
      public static const ENDTIME1:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeInfoRes.endtime1","endtime1",24 | 0);
      
      public static const ENDTIME2:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeInfoRes.endtime2","endtime2",32 | 0);
      
      public static const CURRENTLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeInfoRes.currentlevel","currentlevel",40 | 0);
      
      public static const CURRENTEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeInfoRes.currentexp","currentexp",48 | 0);
      
      public static const REWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.LuckTreeInfoRes.rewards","rewards",56 | 2,getReward);
       
      
      private var member$field:proto.LuckTreeMemberInfo;
      
      public var starttime:uint;
      
      public var endtime1:uint;
      
      public var endtime2:uint;
      
      public var currentlevel:uint;
      
      public var currentexp:uint;
      
      public var rewards:Array;
      
      public function LuckTreeInfoRes()
      {
         rewards = [];
         super();
      }
      
      public function clearMember() : void
      {
         member$field = null;
      }
      
      public function get hasMember() : Boolean
      {
         return member$field != null;
      }
      
      public function set member(param1:proto.LuckTreeMemberInfo) : void
      {
         member$field = param1;
      }
      
      public function get member() : proto.LuckTreeMemberInfo
      {
         return member$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasMember)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,member$field);
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.starttime);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.endtime1);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.endtime2);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.currentlevel);
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_UINT32(param1,this.currentexp);
         _loc2_ = uint(0);
         while(_loc2_ < this.rewards.length)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewards[_loc2_]);
            _loc2_++;
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
         var _loc6_:* = 0;
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeInfoRes.member cannot be set twice.");
                  }
                  _loc9_++;
                  this.member = new proto.LuckTreeMemberInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.member);
                  continue;
               case 1:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeInfoRes.starttime cannot be set twice.");
                  }
                  _loc8_++;
                  this.starttime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeInfoRes.endtime1 cannot be set twice.");
                  }
                  _loc3_++;
                  this.endtime1 = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeInfoRes.endtime2 cannot be set twice.");
                  }
                  _loc4_++;
                  this.endtime2 = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeInfoRes.currentlevel cannot be set twice.");
                  }
                  _loc7_++;
                  this.currentlevel = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeInfoRes.currentexp cannot be set twice.");
                  }
                  _loc5_++;
                  this.currentexp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  this.rewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new getReward()));
                  continue;
            }
         }
      }
   }
}
