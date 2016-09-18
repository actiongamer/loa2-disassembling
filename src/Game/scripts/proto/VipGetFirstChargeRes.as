package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class VipGetFirstChargeRes extends Message
   {
      
      public static const FIRSTCHARGE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.VipGetFirstChargeRes.firstCharge","firstCharge",8 | 0);
      
      public static const REWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.VipGetFirstChargeRes.reward","reward",16 | 0);
      
      public static const CANGETCLIENTREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.VipGetFirstChargeRes.canGetClientReward","canGetClientReward",24 | 0);
      
      public static const CANGETWEBSAVEREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.VipGetFirstChargeRes.canGetWebSaveReward","canGetWebSaveReward",32 | 0);
      
      public static const CANGETGAMELIKEREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.VipGetFirstChargeRes.canGetGameLikeReward","canGetGameLikeReward",40 | 0);
       
      
      public var firstCharge:Boolean;
      
      private var reward$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var canGetClientReward$field:Boolean;
      
      private var canGetWebSaveReward$field:Boolean;
      
      private var canGetGameLikeReward$field:Boolean;
      
      public function VipGetFirstChargeRes()
      {
         super();
      }
      
      public function clearReward() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         reward$field = new Boolean();
      }
      
      public function get hasReward() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set reward(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         reward$field = param1;
      }
      
      public function get reward() : Boolean
      {
         return reward$field;
      }
      
      public function clearCanGetClientReward() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         canGetClientReward$field = new Boolean();
      }
      
      public function get hasCanGetClientReward() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set canGetClientReward(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 2;
         canGetClientReward$field = param1;
      }
      
      public function get canGetClientReward() : Boolean
      {
         return canGetClientReward$field;
      }
      
      public function clearCanGetWebSaveReward() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         canGetWebSaveReward$field = new Boolean();
      }
      
      public function get hasCanGetWebSaveReward() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set canGetWebSaveReward(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 4;
         canGetWebSaveReward$field = param1;
      }
      
      public function get canGetWebSaveReward() : Boolean
      {
         return canGetWebSaveReward$field;
      }
      
      public function clearCanGetGameLikeReward() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         canGetGameLikeReward$field = new Boolean();
      }
      
      public function get hasCanGetGameLikeReward() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set canGetGameLikeReward(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 8;
         canGetGameLikeReward$field = param1;
      }
      
      public function get canGetGameLikeReward() : Boolean
      {
         return canGetGameLikeReward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.firstCharge);
         if(hasReward)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_BOOL(param1,reward$field);
         }
         if(hasCanGetClientReward)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_BOOL(param1,canGetClientReward$field);
         }
         if(hasCanGetWebSaveReward)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_BOOL(param1,canGetWebSaveReward$field);
         }
         if(hasCanGetGameLikeReward)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_BOOL(param1,canGetGameLikeReward$field);
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
         var _loc4_:* = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: VipGetFirstChargeRes.firstCharge cannot be set twice.");
                  }
                  _loc7_++;
                  this.firstCharge = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: VipGetFirstChargeRes.reward cannot be set twice.");
                  }
                  _loc3_++;
                  this.reward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: VipGetFirstChargeRes.canGetClientReward cannot be set twice.");
                  }
                  _loc5_++;
                  this.canGetClientReward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: VipGetFirstChargeRes.canGetWebSaveReward cannot be set twice.");
                  }
                  _loc6_++;
                  this.canGetWebSaveReward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 4:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: VipGetFirstChargeRes.canGetGameLikeReward cannot be set twice.");
                  }
                  _loc8_++;
                  this.canGetGameLikeReward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
