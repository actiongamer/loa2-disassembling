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
   
   public class StagePhaseCheckReq extends Message
   {
      
      public static const PLAY_MODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StagePhaseCheckReq.play_mode","playMode",8 | 0);
      
      public static const STP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.StagePhaseCheckReq.stp","stp",16 | 2,SkillTimePoint);
      
      public static const CLIENTRET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StagePhaseCheckReq.clientRet","clientRet",24 | 0);
      
      public static const DAMAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StagePhaseCheckReq.damage","damage",32 | 0);
       
      
      public var playMode:uint;
      
      public var stp:Array;
      
      private var clientRet$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var damage$field:uint;
      
      public function StagePhaseCheckReq()
      {
         stp = [];
         super();
      }
      
      public function clearClientRet() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         clientRet$field = new uint();
      }
      
      public function get hasClientRet() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set clientRet(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         clientRet$field = param1;
      }
      
      public function get clientRet() : uint
      {
         return clientRet$field;
      }
      
      public function clearDamage() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         damage$field = new uint();
      }
      
      public function get hasDamage() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set damage(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         damage$field = param1;
      }
      
      public function get damage() : uint
      {
         return damage$field;
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
         if(hasClientRet)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,clientRet$field);
         }
         if(hasDamage)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,damage$field);
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
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StagePhaseCheckReq.playMode cannot be set twice.");
                  }
                  _loc3_++;
                  this.playMode = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.stp.push(ReadUtils.read$TYPE_MESSAGE(param1,new SkillTimePoint()));
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StagePhaseCheckReq.clientRet cannot be set twice.");
                  }
                  _loc4_++;
                  this.clientRet = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StagePhaseCheckReq.damage cannot be set twice.");
                  }
                  _loc5_++;
                  this.damage = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
