package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ChapterInfo extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ChapterInfo.id","id",8 | 0);
      
      public static const STEP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ChapterInfo.step","step",16 | 0);
      
      public static const FRIEND:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.ChapterInfo.friend","friend",24 | 0);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var step$field:uint;
      
      private var friend$field:UInt64;
      
      public function ChapterInfo()
      {
         super();
      }
      
      public function clearId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         id$field = param1;
      }
      
      public function get id() : uint
      {
         return id$field;
      }
      
      public function clearStep() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         step$field = new uint();
      }
      
      public function get hasStep() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set step(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         step$field = param1;
      }
      
      public function get step() : uint
      {
         return step$field;
      }
      
      public function clearFriend() : void
      {
         friend$field = null;
      }
      
      public function get hasFriend() : Boolean
      {
         return friend$field != null;
      }
      
      public function set friend(param1:UInt64) : void
      {
         friend$field = param1;
      }
      
      public function get friend() : UInt64
      {
         return friend$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasStep)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,step$field);
         }
         if(hasFriend)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT64(param1,friend$field);
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
         var _loc3_:* = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: ChapterInfo.id cannot be set twice.");
                  }
                  _loc6_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ChapterInfo.step cannot be set twice.");
                  }
                  _loc5_++;
                  this.step = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ChapterInfo.friend cannot be set twice.");
                  }
                  _loc4_++;
                  this.friend = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
