package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyLog extends Message
   {
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyLog.time","time",8 | 0);
      
      public static const KEY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyLog.key","key",16 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyLog.name","name",24 | 2);
      
      public static const TNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyLog.tname","tname",32 | 2);
      
      public static const CON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyLog.con","con",40 | 0);
       
      
      public var time:uint;
      
      public var key:uint;
      
      public var name:String;
      
      private var tname$field:String;
      
      private var con$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function FamilyLog()
      {
         super();
      }
      
      public function clearTname() : void
      {
         tname$field = null;
      }
      
      public function get hasTname() : Boolean
      {
         return tname$field != null;
      }
      
      public function set tname(param1:String) : void
      {
         tname$field = param1;
      }
      
      public function get tname() : String
      {
         return tname$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.time);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.key);
         WriteUtils.writeTag(param1,2,3);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         if(hasTname)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,tname$field);
         }
         if(hasCon)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,con$field);
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
         var _loc7_:* = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyLog.time cannot be set twice.");
                  }
                  _loc4_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyLog.key cannot be set twice.");
                  }
                  _loc3_++;
                  this.key = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyLog.name cannot be set twice.");
                  }
                  _loc6_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyLog.tname cannot be set twice.");
                  }
                  _loc5_++;
                  this.tname = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyLog.con cannot be set twice.");
                  }
                  _loc8_++;
                  this.con = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
