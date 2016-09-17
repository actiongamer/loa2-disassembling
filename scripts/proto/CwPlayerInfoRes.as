package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CwPlayerInfoRes extends Message
   {
      
      public static const GENERALVOTE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CwPlayerInfoRes.generalVote","generalVote",8 | 0);
      
      public static const MARSHALVOTE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CwPlayerInfoRes.marshalVote","marshalVote",16 | 0);
       
      
      private var generalVote$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var marshalVote$field:uint;
      
      public function CwPlayerInfoRes()
      {
         super();
      }
      
      public function clearGeneralVote() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         generalVote$field = new uint();
      }
      
      public function get hasGeneralVote() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set generalVote(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         generalVote$field = param1;
      }
      
      public function get generalVote() : uint
      {
         return generalVote$field;
      }
      
      public function clearMarshalVote() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         marshalVote$field = new uint();
      }
      
      public function get hasMarshalVote() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set marshalVote(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         marshalVote$field = param1;
      }
      
      public function get marshalVote() : uint
      {
         return marshalVote$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasGeneralVote)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,generalVote$field);
         }
         if(hasMarshalVote)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,marshalVote$field);
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
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CwPlayerInfoRes.generalVote cannot be set twice.");
                  }
                  _loc3_++;
                  this.generalVote = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CwPlayerInfoRes.marshalVote cannot be set twice.");
                  }
                  _loc5_++;
                  this.marshalVote = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
