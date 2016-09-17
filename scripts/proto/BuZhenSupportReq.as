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
   
   public class BuZhenSupportReq extends Message
   {
      
      public static const POSITION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BuZhenSupportReq.position","position",8 | 0);
      
      public static const HERO:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BuZhenSupportReq.hero","hero",16 | 0);
       
      
      public var position:uint;
      
      private var hero$field:UInt64;
      
      public function BuZhenSupportReq()
      {
         super();
      }
      
      public function clearHero() : void
      {
         hero$field = null;
      }
      
      public function get hasHero() : Boolean
      {
         return hero$field != null;
      }
      
      public function set hero(param1:UInt64) : void
      {
         hero$field = param1;
      }
      
      public function get hero() : UInt64
      {
         return hero$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.position);
         if(hasHero)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT64(param1,hero$field);
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
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BuZhenSupportReq.position cannot be set twice.");
                  }
                  _loc5_++;
                  this.position = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BuZhenSupportReq.hero cannot be set twice.");
                  }
                  _loc4_++;
                  this.hero = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
