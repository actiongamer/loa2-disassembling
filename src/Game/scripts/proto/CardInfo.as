package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CardInfo extends Message
   {
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CardInfo.itemId","itemId",8 | 0);
      
      public static const RESIDUALTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CardInfo.residualTimes","residualTimes",16 | 0);
      
      public static const ENDSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CardInfo.endStamp","endStamp",24 | 0);
       
      
      private var itemId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var residualTimes$field:uint;
      
      private var endStamp$field:uint;
      
      public function CardInfo()
      {
         super();
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
      
      public function clearResidualTimes() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         residualTimes$field = new uint();
      }
      
      public function get hasResidualTimes() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set residualTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         residualTimes$field = param1;
      }
      
      public function get residualTimes() : uint
      {
         return residualTimes$field;
      }
      
      public function clearEndStamp() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         endStamp$field = new uint();
      }
      
      public function get hasEndStamp() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set endStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         endStamp$field = param1;
      }
      
      public function get endStamp() : uint
      {
         return endStamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasItemId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,itemId$field);
         }
         if(hasResidualTimes)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,residualTimes$field);
         }
         if(hasEndStamp)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,endStamp$field);
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
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CardInfo.itemId cannot be set twice.");
                  }
                  _loc3_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CardInfo.residualTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.residualTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CardInfo.endStamp cannot be set twice.");
                  }
                  _loc6_++;
                  this.endStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}