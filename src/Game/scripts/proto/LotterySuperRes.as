package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class LotterySuperRes extends Message
   {
      
      public static const SUPERTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LotterySuperRes.superTimes","superTimes",8 | 0);
      
      public static const SUPERDIAMOND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LotterySuperRes.superDiamond","superDiamond",16 | 0);
      
      public static const REWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.LotterySuperRes.rewards","rewards",24 | 2,Reward);
       
      
      private var superTimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var superDiamond$field:uint;
      
      public var rewards:Array;
      
      public function LotterySuperRes()
      {
         rewards = [];
         super();
      }
      
      public function clearSuperTimes() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         superTimes$field = new uint();
      }
      
      public function get hasSuperTimes() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set superTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         superTimes$field = param1;
      }
      
      public function get superTimes() : uint
      {
         return superTimes$field;
      }
      
      public function clearSuperDiamond() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         superDiamond$field = new uint();
      }
      
      public function get hasSuperDiamond() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set superDiamond(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         superDiamond$field = param1;
      }
      
      public function get superDiamond() : uint
      {
         return superDiamond$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasSuperTimes)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,superTimes$field);
         }
         if(hasSuperDiamond)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,superDiamond$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.rewards.length)
         {
            WriteUtils.writeTag(param1,2,3);
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
                     throw new IOError("Bad data format: LotterySuperRes.superTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.superTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: LotterySuperRes.superDiamond cannot be set twice.");
                  }
                  _loc3_++;
                  this.superDiamond = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  this.rewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Reward()));
                  continue;
            }
         }
      }
   }
}
