package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ArenaBuyTimesRes extends Message
   {
      
      public static const RESIDUALTIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.ArenaBuyTimesRes.residualTimes","residualTimes",8 | 0);
      
      public static const NEXTDIAMONDCOST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaBuyTimesRes.nextDiamondCost","nextDiamondCost",16 | 0);
      
      public static const BUYTIMESCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaBuyTimesRes.buyTimesCount","buyTimesCount",24 | 0);
       
      
      private var residualTimes$field:int;
      
      private var hasField$0:uint = 0;
      
      private var nextDiamondCost$field:uint;
      
      private var buyTimesCount$field:uint;
      
      public function ArenaBuyTimesRes()
      {
         super();
      }
      
      public function clearResidualTimes() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         residualTimes$field = new int();
      }
      
      public function get hasResidualTimes() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set residualTimes(param1:int) : void
      {
         hasField$0 = hasField$0 | 1;
         residualTimes$field = param1;
      }
      
      public function get residualTimes() : int
      {
         return residualTimes$field;
      }
      
      public function clearNextDiamondCost() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         nextDiamondCost$field = new uint();
      }
      
      public function get hasNextDiamondCost() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set nextDiamondCost(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         nextDiamondCost$field = param1;
      }
      
      public function get nextDiamondCost() : uint
      {
         return nextDiamondCost$field;
      }
      
      public function clearBuyTimesCount() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         buyTimesCount$field = new uint();
      }
      
      public function get hasBuyTimesCount() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set buyTimesCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         buyTimesCount$field = param1;
      }
      
      public function get buyTimesCount() : uint
      {
         return buyTimesCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasResidualTimes)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_INT32(param1,residualTimes$field);
         }
         if(hasNextDiamondCost)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,nextDiamondCost$field);
         }
         if(hasBuyTimesCount)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,buyTimesCount$field);
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
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaBuyTimesRes.residualTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.residualTimes = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaBuyTimesRes.nextDiamondCost cannot be set twice.");
                  }
                  _loc6_++;
                  this.nextDiamondCost = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaBuyTimesRes.buyTimesCount cannot be set twice.");
                  }
                  _loc3_++;
                  this.buyTimesCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
