package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CrossArenaCheerInfo extends Message
   {
      
      public static const CHEERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaCheerInfo.cheerId","cheerId",8 | 0);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaCheerInfo.level","level",16 | 0);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaCheerInfo.exp","exp",24 | 0);
       
      
      private var cheerId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var level$field:uint;
      
      private var exp$field:uint;
      
      public function CrossArenaCheerInfo()
      {
         super();
      }
      
      public function clearCheerId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         cheerId$field = new uint();
      }
      
      public function get hasCheerId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set cheerId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         cheerId$field = param1;
      }
      
      public function get cheerId() : uint
      {
         return cheerId$field;
      }
      
      public function clearLevel() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         level$field = param1;
      }
      
      public function get level() : uint
      {
         return level$field;
      }
      
      public function clearExp() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         exp$field = new uint();
      }
      
      public function get hasExp() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set exp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         exp$field = param1;
      }
      
      public function get exp() : uint
      {
         return exp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasCheerId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,cheerId$field);
         }
         if(hasLevel)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,level$field);
         }
         if(hasExp)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,exp$field);
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
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaCheerInfo.cheerId cannot be set twice.");
                  }
                  _loc4_++;
                  this.cheerId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaCheerInfo.level cannot be set twice.");
                  }
                  _loc3_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaCheerInfo.exp cannot be set twice.");
                  }
                  _loc6_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
