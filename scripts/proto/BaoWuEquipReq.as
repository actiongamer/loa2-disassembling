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
   
   public class BaoWuEquipReq extends Message
   {
      
      public static const HERO:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BaoWuEquipReq.hero","hero",8 | 0);
      
      public static const ITEM:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BaoWuEquipReq.item","item",16 | 0);
      
      public static const PLACE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BaoWuEquipReq.place","place",24 | 0);
       
      
      public var hero:UInt64;
      
      public var item:UInt64;
      
      private var place$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function BaoWuEquipReq()
      {
         super();
      }
      
      public function clearPlace() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         place$field = new uint();
      }
      
      public function get hasPlace() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set place(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         place$field = param1;
      }
      
      public function get place() : uint
      {
         return place$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.hero);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT64(param1,this.item);
         if(hasPlace)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,place$field);
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
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWuEquipReq.hero cannot be set twice.");
                  }
                  _loc5_++;
                  this.hero = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWuEquipReq.item cannot be set twice.");
                  }
                  _loc6_++;
                  this.item = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BaoWuEquipReq.place cannot be set twice.");
                  }
                  _loc3_++;
                  this.place = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
