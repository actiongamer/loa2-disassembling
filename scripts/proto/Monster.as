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
   
   public class Monster extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.Monster.id","id",8 | 0);
      
      public static const POSITION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.Monster.position","position",16 | 0);
      
      public static const MULTI:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.Monster.multi","multi",24 | 0);
      
      public static const LOCKED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.Monster.locked","locked",32 | 0);
       
      
      public var id:uint;
      
      public var position:uint;
      
      public var multi:uint;
      
      private var locked$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function Monster()
      {
         super();
      }
      
      public function clearLocked() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         locked$field = new Boolean();
      }
      
      public function get hasLocked() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set locked(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         locked$field = param1;
      }
      
      public function get locked() : Boolean
      {
         return locked$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.position);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.multi);
         if(hasLocked)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_BOOL(param1,locked$field);
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
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Monster.id cannot be set twice.");
                  }
                  _loc5_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Monster.position cannot be set twice.");
                  }
                  _loc6_++;
                  this.position = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Monster.multi cannot be set twice.");
                  }
                  _loc7_++;
                  this.multi = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Monster.locked cannot be set twice.");
                  }
                  _loc3_++;
                  this.locked = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
