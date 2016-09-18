package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import proto.StaticTowerModel.Row;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class StaticTowerModel extends Message
   {
      
      public static const ROWS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.StaticTowerModel.rows","rows",8 | 2,Row);
      
      public static const ST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticTowerModel.st","st",16 | 0);
      
      public static const STT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticTowerModel.stt","stt",24 | 0);
      
      public static const ET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticTowerModel.et","et",32 | 0);
       
      
      public var rows:Array;
      
      private var st$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var stt$field:uint;
      
      private var et$field:uint;
      
      public function StaticTowerModel()
      {
         rows = [];
         super();
      }
      
      public function clearSt() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         st$field = new uint();
      }
      
      public function get hasSt() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set st(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         st$field = param1;
      }
      
      public function get st() : uint
      {
         return st$field;
      }
      
      public function clearStt() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         stt$field = new uint();
      }
      
      public function get hasStt() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set stt(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         stt$field = param1;
      }
      
      public function get stt() : uint
      {
         return stt$field;
      }
      
      public function clearEt() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         et$field = new uint();
      }
      
      public function get hasEt() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set et(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         et$field = param1;
      }
      
      public function get et() : uint
      {
         return et$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.rows.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rows[_loc2_]);
            _loc2_++;
         }
         if(hasSt)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,st$field);
         }
         if(hasStt)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,stt$field);
         }
         if(hasEt)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,et$field);
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
                  this.rows.push(ReadUtils.read$TYPE_MESSAGE(param1,new Row()));
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTowerModel.st cannot be set twice.");
                  }
                  _loc6_++;
                  this.st = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTowerModel.stt cannot be set twice.");
                  }
                  _loc5_++;
                  this.stt = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticTowerModel.et cannot be set twice.");
                  }
                  _loc3_++;
                  this.et = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
