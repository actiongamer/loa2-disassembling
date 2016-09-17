package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import proto.WhiteValentineReceiveMessageRes.ReceiveInfo;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class WhiteValentineReceiveMessageRes extends Message
   {
      
      public static const RECEIVE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.WhiteValentineReceiveMessageRes.receive","receive",8 | 2,ReceiveInfo);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WhiteValentineReceiveMessageRes.kind","kind",16 | 0);
       
      
      public var receive:Array;
      
      private var kind$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function WhiteValentineReceiveMessageRes()
      {
         receive = [];
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
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.receive.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.receive[_loc2_]);
            _loc2_++;
         }
         if(hasKind)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,kind$field);
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
         var _loc4_:* = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  this.receive.push(ReadUtils.read$TYPE_MESSAGE(param1,new ReceiveInfo()));
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: WhiteValentineReceiveMessageRes.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
