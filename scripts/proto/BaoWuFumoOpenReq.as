package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BaoWuFumoOpenReq extends Message
   {
      
      public static const HERO:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BaoWuFumoOpenReq.hero","hero",8 | 0);
      
      public static const ITEM:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BaoWuFumoOpenReq.item","item",16 | 0);
      
      public static const PLACE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BaoWuFumoOpenReq.place","place",24 | 0);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BaoWuFumoOpenReq.kind","kind",32 | 0);
       
      
      public var hero:UInt64;
      
      public var item:UInt64;
      
      public var place:uint;
      
      private var kind$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function BaoWuFumoOpenReq()
      {
         super();
      }
      
      public function clearKind() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         kind$field = new uint();
      }
      
      public function get hasKind() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set kind(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         kind$field = param1;
      }
      
      public function get kind() : uint
      {
         return kind$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.hero);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT64(param1,this.item);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.place);
         if(hasKind)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,kind$field);
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
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWuFumoOpenReq.hero cannot be set twice.");
                  }
                  _loc6_++;
                  this.hero = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWuFumoOpenReq.item cannot be set twice.");
                  }
                  _loc7_++;
                  this.item = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWuFumoOpenReq.place cannot be set twice.");
                  }
                  _loc4_++;
                  this.place = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWuFumoOpenReq.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
