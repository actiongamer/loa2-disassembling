package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyExpeFightEndRes extends Message
   {
      
      public static const BTLRESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFightEndRes.btlResult","btlResult",8 | 0);
      
      public static const CON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFightEndRes.con","con",16 | 0);
      
      public static const COIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFightEndRes.coin","coin",24 | 0);
       
      
      public var btlResult:uint;
      
      private var con$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var coin$field:uint;
      
      public function FamilyExpeFightEndRes()
      {
         super();
      }
      
      public function clearCon() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         con$field = new uint();
      }
      
      public function get hasCon() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set con(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         con$field = param1;
      }
      
      public function get con() : uint
      {
         return con$field;
      }
      
      public function clearCoin() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         coin$field = new uint();
      }
      
      public function get hasCoin() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set coin(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         coin$field = param1;
      }
      
      public function get coin() : uint
      {
         return coin$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.btlResult);
         if(hasCon)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,con$field);
         }
         if(hasCoin)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,coin$field);
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
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFightEndRes.btlResult cannot be set twice.");
                  }
                  _loc6_++;
                  this.btlResult = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFightEndRes.con cannot be set twice.");
                  }
                  _loc5_++;
                  this.con = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFightEndRes.coin cannot be set twice.");
                  }
                  _loc3_++;
                  this.coin = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
