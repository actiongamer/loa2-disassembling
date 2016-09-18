package proto.DragonBoatDonatePanelRes
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import proto.PlayerBaseInfo;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class DonateLog extends Message
   {
      
      public static const STAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.DragonBoatDonatePanelRes.DonateLog.stamp","stamp",8 | 0);
      
      public static const DONATEID:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.DragonBoatDonatePanelRes.DonateLog.donateId","donateId",16 | 2,PlayerBaseInfo);
      
      public static const DONATEDID:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.DragonBoatDonatePanelRes.DonateLog.donatedId","donatedId",24 | 2,PlayerBaseInfo);
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.DragonBoatDonatePanelRes.DonateLog.itemId","itemId",32 | 0);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.DragonBoatDonatePanelRes.DonateLog.count","count",40 | 0);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.DragonBoatDonatePanelRes.DonateLog.score","score",48 | 0);
       
      
      private var stamp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var donateId$field:PlayerBaseInfo;
      
      private var donatedId$field:PlayerBaseInfo;
      
      private var itemId$field:uint;
      
      private var count$field:uint;
      
      private var score$field:uint;
      
      public function DonateLog()
      {
         super();
      }
      
      public function clearStamp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         stamp$field = new uint();
      }
      
      public function get hasStamp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set stamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         stamp$field = param1;
      }
      
      public function get stamp() : uint
      {
         return stamp$field;
      }
      
      public function clearDonateId() : void
      {
         donateId$field = null;
      }
      
      public function get hasDonateId() : Boolean
      {
         return donateId$field != null;
      }
      
      public function set donateId(param1:PlayerBaseInfo) : void
      {
         donateId$field = param1;
      }
      
      public function get donateId() : PlayerBaseInfo
      {
         return donateId$field;
      }
      
      public function clearDonatedId() : void
      {
         donatedId$field = null;
      }
      
      public function get hasDonatedId() : Boolean
      {
         return donatedId$field != null;
      }
      
      public function set donatedId(param1:PlayerBaseInfo) : void
      {
         donatedId$field = param1;
      }
      
      public function get donatedId() : PlayerBaseInfo
      {
         return donatedId$field;
      }
      
      public function clearItemId() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         itemId$field = new uint();
      }
      
      public function get hasItemId() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set itemId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         itemId$field = param1;
      }
      
      public function get itemId() : uint
      {
         return itemId$field;
      }
      
      public function clearCount() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         count$field = new uint();
      }
      
      public function get hasCount() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set count(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         count$field = param1;
      }
      
      public function get count() : uint
      {
         return count$field;
      }
      
      public function clearScore() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         score$field = param1;
      }
      
      public function get score() : uint
      {
         return score$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasStamp)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,stamp$field);
         }
         if(hasDonateId)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,donateId$field);
         }
         if(hasDonatedId)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,donatedId$field);
         }
         if(hasItemId)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,itemId$field);
         }
         if(hasCount)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,count$field);
         }
         if(hasScore)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,score$field);
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
         var _loc6_:* = 0;
         var _loc9_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: DonateLog.stamp cannot be set twice.");
                  }
                  _loc9_++;
                  this.stamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: DonateLog.donateId cannot be set twice.");
                  }
                  _loc5_++;
                  this.donateId = new PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.donateId);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: DonateLog.donatedId cannot be set twice.");
                  }
                  _loc4_++;
                  this.donatedId = new PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.donatedId);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: DonateLog.itemId cannot be set twice.");
                  }
                  _loc3_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: DonateLog.count cannot be set twice.");
                  }
                  _loc7_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: DonateLog.score cannot be set twice.");
                  }
                  _loc8_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
