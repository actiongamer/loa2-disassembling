package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class QqGiftInfoRes extends Message
   {
      
      public static const BLUENEWVIP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.QqGiftInfoRes.blueNewVip","blueNewVip",8 | 0);
      
      public static const YELLOWNEWVIP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.QqGiftInfoRes.yellowNewVip","yellowNewVip",16 | 0);
      
      public static const BLUEDAYVIP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.QqGiftInfoRes.blueDayVip","blueDayVip",24 | 0);
      
      public static const YELLOWDAYVIP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.QqGiftInfoRes.yellowDayVip","yellowDayVip",32 | 0);
      
      public static const BLUEHIGHVIP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.QqGiftInfoRes.blueHighVip","blueHighVip",40 | 0);
      
      public static const YELLOWHIGHVIP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.QqGiftInfoRes.yellowHighVip","yellowHighVip",48 | 0);
      
      public static const BLUELEVELVIP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.QqGiftInfoRes.blueLevelVip","blueLevelVip",56 | 2,BoolMap);
      
      public static const YELLOWLEVELVIP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.QqGiftInfoRes.yellowLevelVip","yellowLevelVip",64 | 2,BoolMap);
       
      
      public var blueNewVip:Boolean;
      
      private var yellowNewVip$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var blueDayVip$field:Boolean;
      
      private var yellowDayVip$field:Boolean;
      
      private var blueHighVip$field:Boolean;
      
      private var yellowHighVip$field:Boolean;
      
      public var blueLevelVip:Array;
      
      public var yellowLevelVip:Array;
      
      public function QqGiftInfoRes()
      {
         blueLevelVip = [];
         yellowLevelVip = [];
         super();
      }
      
      public function clearYellowNewVip() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         yellowNewVip$field = new Boolean();
      }
      
      public function get hasYellowNewVip() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set yellowNewVip(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         yellowNewVip$field = param1;
      }
      
      public function get yellowNewVip() : Boolean
      {
         return yellowNewVip$field;
      }
      
      public function clearBlueDayVip() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         blueDayVip$field = new Boolean();
      }
      
      public function get hasBlueDayVip() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set blueDayVip(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 2;
         blueDayVip$field = param1;
      }
      
      public function get blueDayVip() : Boolean
      {
         return blueDayVip$field;
      }
      
      public function clearYellowDayVip() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         yellowDayVip$field = new Boolean();
      }
      
      public function get hasYellowDayVip() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set yellowDayVip(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 4;
         yellowDayVip$field = param1;
      }
      
      public function get yellowDayVip() : Boolean
      {
         return yellowDayVip$field;
      }
      
      public function clearBlueHighVip() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         blueHighVip$field = new Boolean();
      }
      
      public function get hasBlueHighVip() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set blueHighVip(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 8;
         blueHighVip$field = param1;
      }
      
      public function get blueHighVip() : Boolean
      {
         return blueHighVip$field;
      }
      
      public function clearYellowHighVip() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         yellowHighVip$field = new Boolean();
      }
      
      public function get hasYellowHighVip() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set yellowHighVip(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 16;
         yellowHighVip$field = param1;
      }
      
      public function get yellowHighVip() : Boolean
      {
         return yellowHighVip$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.blueNewVip);
         if(hasYellowNewVip)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_BOOL(param1,yellowNewVip$field);
         }
         if(hasBlueDayVip)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_BOOL(param1,blueDayVip$field);
         }
         if(hasYellowDayVip)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_BOOL(param1,yellowDayVip$field);
         }
         if(hasBlueHighVip)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_BOOL(param1,blueHighVip$field);
         }
         if(hasYellowHighVip)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_BOOL(param1,yellowHighVip$field);
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.blueLevelVip.length)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.blueLevelVip[_loc3_]);
            _loc3_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.yellowLevelVip.length)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.yellowLevelVip[_loc2_]);
            _loc2_++;
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc8_:uint = 0;
         var _loc4_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: QqGiftInfoRes.blueNewVip cannot be set twice.");
                  }
                  _loc6_++;
                  this.blueNewVip = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: QqGiftInfoRes.yellowNewVip cannot be set twice.");
                  }
                  _loc7_++;
                  this.yellowNewVip = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: QqGiftInfoRes.blueDayVip cannot be set twice.");
                  }
                  _loc3_++;
                  this.blueDayVip = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 3:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: QqGiftInfoRes.yellowDayVip cannot be set twice.");
                  }
                  _loc8_++;
                  this.yellowDayVip = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: QqGiftInfoRes.blueHighVip cannot be set twice.");
                  }
                  _loc4_++;
                  this.blueHighVip = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 5:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: QqGiftInfoRes.yellowHighVip cannot be set twice.");
                  }
                  _loc9_++;
                  this.yellowHighVip = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 6:
                  this.blueLevelVip.push(ReadUtils.read$TYPE_MESSAGE(param1,new BoolMap()));
                  continue;
               case 7:
                  this.yellowLevelVip.push(ReadUtils.read$TYPE_MESSAGE(param1,new BoolMap()));
                  continue;
            }
         }
      }
   }
}
