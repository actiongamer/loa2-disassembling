package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class OpenChallengeInfoRes extends Message
   {
      
      public static const MEMBERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpenChallengeInfoRes.members","members",8 | 2,proto.OpenChallengeData);
      
      public static const SELF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.OpenChallengeInfoRes.self","self",16 | 2,proto.OpenChallengeData);
      
      public static const CANGETREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.OpenChallengeInfoRes.cangetreward","cangetreward",24 | 0);
      
      public static const HASGETREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.OpenChallengeInfoRes.hasgetreward","hasgetreward",32 | 0);
       
      
      public var members:Array;
      
      public var self:proto.OpenChallengeData;
      
      public var cangetreward:Boolean;
      
      public var hasgetreward:Boolean;
      
      public function OpenChallengeInfoRes()
      {
         members = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.members.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.members[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_MESSAGE(param1,this.self);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_BOOL(param1,this.cangetreward);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_BOOL(param1,this.hasgetreward);
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  this.members.push(ReadUtils.read$TYPE_MESSAGE(param1,new proto.OpenChallengeData()));
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: OpenChallengeInfoRes.self cannot be set twice.");
                  }
                  _loc5_++;
                  this.self = new proto.OpenChallengeData();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.self);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: OpenChallengeInfoRes.cangetreward cannot be set twice.");
                  }
                  _loc3_++;
                  this.cangetreward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: OpenChallengeInfoRes.hasgetreward cannot be set twice.");
                  }
                  _loc6_++;
                  this.hasgetreward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
