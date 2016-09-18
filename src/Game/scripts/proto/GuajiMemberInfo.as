package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GuajiMemberInfo extends Message
   {
      
      public static const ISSTARTFIGHT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GuajiMemberInfo.isStartFight","isStartFight",8 | 0);
      
      public static const EXTRA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GuajiMemberInfo.extra","extra",16 | 2,proto.Reward);
      
      public static const TARGETEXTRA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GuajiMemberInfo.targetExtra","targetExtra",24 | 2,proto.GuajiExtraReward);
       
      
      private var isStartFight$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var extra$field:proto.Reward;
      
      private var targetExtra$field:proto.GuajiExtraReward;
      
      public function GuajiMemberInfo()
      {
         super();
      }
      
      public function clearIsStartFight() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         isStartFight$field = new Boolean();
      }
      
      public function get hasIsStartFight() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set isStartFight(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         isStartFight$field = param1;
      }
      
      public function get isStartFight() : Boolean
      {
         return isStartFight$field;
      }
      
      public function clearExtra() : void
      {
         extra$field = null;
      }
      
      public function get hasExtra() : Boolean
      {
         return extra$field != null;
      }
      
      public function set extra(param1:proto.Reward) : void
      {
         extra$field = param1;
      }
      
      public function get extra() : proto.Reward
      {
         return extra$field;
      }
      
      public function clearTargetExtra() : void
      {
         targetExtra$field = null;
      }
      
      public function get hasTargetExtra() : Boolean
      {
         return targetExtra$field != null;
      }
      
      public function set targetExtra(param1:proto.GuajiExtraReward) : void
      {
         targetExtra$field = param1;
      }
      
      public function get targetExtra() : proto.GuajiExtraReward
      {
         return targetExtra$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasIsStartFight)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_BOOL(param1,isStartFight$field);
         }
         if(hasExtra)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,extra$field);
         }
         if(hasTargetExtra)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,targetExtra$field);
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
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiMemberInfo.isStartFight cannot be set twice.");
                  }
                  _loc4_++;
                  this.isStartFight = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiMemberInfo.extra cannot be set twice.");
                  }
                  _loc6_++;
                  this.extra = new proto.Reward();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.extra);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiMemberInfo.targetExtra cannot be set twice.");
                  }
                  _loc5_++;
                  this.targetExtra = new proto.GuajiExtraReward();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.targetExtra);
                  continue;
            }
         }
      }
   }
}
