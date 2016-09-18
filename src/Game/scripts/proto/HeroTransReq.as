package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class HeroTransReq extends Message
   {
      
      public static const OLDID:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.HeroTransReq.oldId","oldId",8 | 0);
      
      public static const TOID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroTransReq.toId","toId",16 | 0);
       
      
      public var oldId:Array;
      
      private var toId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function HeroTransReq()
      {
         oldId = [];
         super();
      }
      
      public function clearToId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         toId$field = new uint();
      }
      
      public function get hasToId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set toId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         toId$field = param1;
      }
      
      public function get toId() : uint
      {
         return toId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.oldId.length)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT64(param1,this.oldId[_loc2_]);
            _loc2_++;
         }
         if(hasToId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,toId$field);
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
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.oldId);
                  }
                  else
                  {
                     this.oldId.push(ReadUtils.read$TYPE_UINT64(param1));
                  }
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: HeroTransReq.toId cannot be set twice.");
                  }
                  _loc4_++;
                  this.toId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
