package proto.DragonBoatDonatePanelRes
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import proto.PlayerBaseInfo;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class DonateInfo extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.DragonBoatDonatePanelRes.DonateInfo.id","id",8 | 2,PlayerBaseInfo);
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.DragonBoatDonatePanelRes.DonateInfo.itemId","itemId",16 | 0);
      
      public static const TOTALREQNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.DragonBoatDonatePanelRes.DonateInfo.totalReqNum","totalReqNum",24 | 0);
      
      public static const DONATEDNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.DragonBoatDonatePanelRes.DonateInfo.donatedNum","donatedNum",32 | 0);
      
      public static const STAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.DragonBoatDonatePanelRes.DonateInfo.stamp","stamp",40 | 0);
       
      
      private var id$field:PlayerBaseInfo;
      
      private var itemId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var totalReqNum$field:uint;
      
      private var donatedNum$field:uint;
      
      private var stamp$field:uint;
      
      public function DonateInfo()
      {
         super();
      }
      
      public function clearId() : void
      {
         id$field = null;
      }
      
      public function get hasId() : Boolean
      {
         return id$field != null;
      }
      
      public function set id(param1:PlayerBaseInfo) : void
      {
         id$field = param1;
      }
      
      public function get id() : PlayerBaseInfo
      {
         return id$field;
      }
      
      public function clearItemId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         itemId$field = new uint();
      }
      
      public function get hasItemId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set itemId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         itemId$field = param1;
      }
      
      public function get itemId() : uint
      {
         return itemId$field;
      }
      
      public function clearTotalReqNum() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         totalReqNum$field = new uint();
      }
      
      public function get hasTotalReqNum() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set totalReqNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         totalReqNum$field = param1;
      }
      
      public function get totalReqNum() : uint
      {
         return totalReqNum$field;
      }
      
      public function clearDonatedNum() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         donatedNum$field = new uint();
      }
      
      public function get hasDonatedNum() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set donatedNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         donatedNum$field = param1;
      }
      
      public function get donatedNum() : uint
      {
         return donatedNum$field;
      }
      
      public function clearStamp() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         stamp$field = new uint();
      }
      
      public function get hasStamp() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set stamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         stamp$field = param1;
      }
      
      public function get stamp() : uint
      {
         return stamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasId)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,id$field);
         }
         if(hasItemId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,itemId$field);
         }
         if(hasTotalReqNum)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,totalReqNum$field);
         }
         if(hasDonatedNum)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,donatedNum$field);
         }
         if(hasStamp)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,stamp$field);
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
         var _loc5_:* = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: DonateInfo.id cannot be set twice.");
                  }
                  _loc8_++;
                  this.id = new PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.id);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: DonateInfo.itemId cannot be set twice.");
                  }
                  _loc3_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: DonateInfo.totalReqNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.totalReqNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: DonateInfo.donatedNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.donatedNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: DonateInfo.stamp cannot be set twice.");
                  }
                  _loc7_++;
                  this.stamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
