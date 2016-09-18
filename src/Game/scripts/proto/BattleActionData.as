package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BattleActionData extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattleActionData.id","id",8 | 0);
      
      public static const DATA0:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattleActionData.data0","data0",16 | 0);
      
      public static const DATA1:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattleActionData.data1","data1",24 | 0);
      
      public static const DATA2:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattleActionData.data2","data2",32 | 0);
      
      public static const DATA3:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.BattleActionData.data3","data3",40 | 0);
       
      
      public var id:int;
      
      private var data0$field:int;
      
      private var hasField$0:uint = 0;
      
      private var data1$field:int;
      
      private var data2$field:int;
      
      private var data3$field:int;
      
      public function BattleActionData()
      {
         super();
      }
      
      public function clearData0() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         data0$field = new int();
      }
      
      public function get hasData0() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set data0(param1:int) : void
      {
         hasField$0 = hasField$0 | 1;
         data0$field = param1;
      }
      
      public function get data0() : int
      {
         return data0$field;
      }
      
      public function clearData1() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         data1$field = new int();
      }
      
      public function get hasData1() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set data1(param1:int) : void
      {
         hasField$0 = hasField$0 | 2;
         data1$field = param1;
      }
      
      public function get data1() : int
      {
         return data1$field;
      }
      
      public function clearData2() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         data2$field = new int();
      }
      
      public function get hasData2() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set data2(param1:int) : void
      {
         hasField$0 = hasField$0 | 4;
         data2$field = param1;
      }
      
      public function get data2() : int
      {
         return data2$field;
      }
      
      public function clearData3() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         data3$field = new int();
      }
      
      public function get hasData3() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set data3(param1:int) : void
      {
         hasField$0 = hasField$0 | 8;
         data3$field = param1;
      }
      
      public function get data3() : int
      {
         return data3$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_INT32(param1,this.id);
         if(hasData0)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_INT32(param1,data0$field);
         }
         if(hasData1)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_INT32(param1,data1$field);
         }
         if(hasData2)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_INT32(param1,data2$field);
         }
         if(hasData3)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_INT32(param1,data3$field);
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
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc8_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BattleActionData.id cannot be set twice.");
                  }
                  _loc7_++;
                  this.id = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BattleActionData.data0 cannot be set twice.");
                  }
                  _loc6_++;
                  this.data0 = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BattleActionData.data1 cannot be set twice.");
                  }
                  _loc3_++;
                  this.data1 = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 3:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: BattleActionData.data2 cannot be set twice.");
                  }
                  _loc8_++;
                  this.data2 = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BattleActionData.data3 cannot be set twice.");
                  }
                  _loc4_++;
                  this.data3 = ReadUtils.read$TYPE_INT32(param1);
                  continue;
            }
         }
      }
   }
}
