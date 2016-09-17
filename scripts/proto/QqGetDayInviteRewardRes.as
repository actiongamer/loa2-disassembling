package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class QqGetDayInviteRewardRes extends Message
   {
      
      public static const QQUSER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.QqGetDayInviteRewardRes.qquser","qquser",8 | 0);
      
      public static const QQGROUP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.QqGetDayInviteRewardRes.qqgroup","qqgroup",16 | 0);
      
      public static const ENTER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.QqGetDayInviteRewardRes.enter","enter",24 | 0);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.QqGetDayInviteRewardRes.level","level",32 | 0);
       
      
      public var qquser:uint;
      
      public var qqgroup:uint;
      
      public var enter:uint;
      
      public var level:uint;
      
      public function QqGetDayInviteRewardRes()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.qquser);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.qqgroup);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.enter);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.level);
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:* = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: QqGetDayInviteRewardRes.qquser cannot be set twice.");
                  }
                  _loc7_++;
                  this.qquser = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: QqGetDayInviteRewardRes.qqgroup cannot be set twice.");
                  }
                  _loc3_++;
                  this.qqgroup = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: QqGetDayInviteRewardRes.enter cannot be set twice.");
                  }
                  _loc5_++;
                  this.enter = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: QqGetDayInviteRewardRes.level cannot be set twice.");
                  }
                  _loc4_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
