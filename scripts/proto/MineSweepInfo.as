package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class MineSweepInfo extends Message
   {
      
      public static const X:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineSweepInfo.x","x",8 | 0);
      
      public static const Y:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineSweepInfo.y","y",16 | 0);
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineSweepInfo.id","id",24 | 0);
      
      public static const ISNUMBER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.MineSweepInfo.isNumber","isNumber",32 | 0);
       
      
      private var x$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var y$field:uint;
      
      private var id$field:uint;
      
      private var isNumber$field:Boolean;
      
      public function MineSweepInfo()
      {
         super();
      }
      
      public function clearX() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         x$field = new uint();
      }
      
      public function get hasX() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set x(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         x$field = param1;
      }
      
      public function get x() : uint
      {
         return x$field;
      }
      
      public function clearY() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         y$field = new uint();
      }
      
      public function get hasY() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set y(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         y$field = param1;
      }
      
      public function get y() : uint
      {
         return y$field;
      }
      
      public function clearId() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         id$field = param1;
      }
      
      public function get id() : uint
      {
         return id$field;
      }
      
      public function clearIsNumber() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         isNumber$field = new Boolean();
      }
      
      public function get hasIsNumber() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set isNumber(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 8;
         isNumber$field = param1;
      }
      
      public function get isNumber() : Boolean
      {
         return isNumber$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasX)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,x$field);
         }
         if(hasY)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,y$field);
         }
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasIsNumber)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_BOOL(param1,isNumber$field);
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
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: MineSweepInfo.x cannot be set twice.");
                  }
                  _loc3_++;
                  this.x = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: MineSweepInfo.y cannot be set twice.");
                  }
                  _loc5_++;
                  this.y = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: MineSweepInfo.id cannot be set twice.");
                  }
                  _loc7_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: MineSweepInfo.isNumber cannot be set twice.");
                  }
                  _loc6_++;
                  this.isNumber = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
