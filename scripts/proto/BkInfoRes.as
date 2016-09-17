package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BkInfoRes extends Message
   {
      
      public static const OPEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.BkInfoRes.open","open",8 | 0);
      
      public static const STATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.BkInfoRes.status","status",16 | 0,BK_STATUS);
      
      public static const WINTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkInfoRes.winTimes","winTimes",24 | 0);
      
      public static const FAILTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkInfoRes.failTimes","failTimes",32 | 0);
      
      public static const PENALTYSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkInfoRes.penaltyStamp","penaltyStamp",40 | 0);
      
      public static const TODAYWINTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkInfoRes.todayWinTimes","todayWinTimes",48 | 0);
       
      
      public var open:Boolean;
      
      public var status:int;
      
      private var winTimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var failTimes$field:uint;
      
      private var penaltyStamp$field:uint;
      
      private var todayWinTimes$field:uint;
      
      public function BkInfoRes()
      {
         super();
      }
      
      public function clearWinTimes() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         winTimes$field = new uint();
      }
      
      public function get hasWinTimes() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set winTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         winTimes$field = param1;
      }
      
      public function get winTimes() : uint
      {
         return winTimes$field;
      }
      
      public function clearFailTimes() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         failTimes$field = new uint();
      }
      
      public function get hasFailTimes() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set failTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         failTimes$field = param1;
      }
      
      public function get failTimes() : uint
      {
         return failTimes$field;
      }
      
      public function clearPenaltyStamp() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         penaltyStamp$field = new uint();
      }
      
      public function get hasPenaltyStamp() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set penaltyStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         penaltyStamp$field = param1;
      }
      
      public function get penaltyStamp() : uint
      {
         return penaltyStamp$field;
      }
      
      public function clearTodayWinTimes() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         todayWinTimes$field = new uint();
      }
      
      public function get hasTodayWinTimes() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set todayWinTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         todayWinTimes$field = param1;
      }
      
      public function get todayWinTimes() : uint
      {
         return todayWinTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.open);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_ENUM(param1,this.status);
         if(hasWinTimes)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,winTimes$field);
         }
         if(hasFailTimes)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,failTimes$field);
         }
         if(hasPenaltyStamp)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,penaltyStamp$field);
         }
         if(hasTodayWinTimes)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,todayWinTimes$field);
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
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BkInfoRes.open cannot be set twice.");
                  }
                  _loc5_++;
                  this.open = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BkInfoRes.status cannot be set twice.");
                  }
                  _loc4_++;
                  this.status = ReadUtils.read$TYPE_ENUM(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BkInfoRes.winTimes cannot be set twice.");
                  }
                  _loc7_++;
                  this.winTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: BkInfoRes.failTimes cannot be set twice.");
                  }
                  _loc9_++;
                  this.failTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BkInfoRes.penaltyStamp cannot be set twice.");
                  }
                  _loc3_++;
                  this.penaltyStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: BkInfoRes.todayWinTimes cannot be set twice.");
                  }
                  _loc8_++;
                  this.todayWinTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
