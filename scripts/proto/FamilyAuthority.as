package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyAuthority extends Message
   {
      
      public static const POST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyAuthority.post","post",8 | 0);
      
      public static const INFO:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.FamilyAuthority.info","info",16 | 0);
       
      
      public var post:uint;
      
      public var info:Array;
      
      public function FamilyAuthority()
      {
         info = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.post);
         _loc2_ = uint(0);
         while(_loc2_ < this.info.length)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,this.info[_loc2_]);
            _loc2_++;
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
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyAuthority.post cannot be set twice.");
                  }
                  _loc3_++;
                  this.post = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if((_loc4_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.info);
                  }
                  else
                  {
                     this.info.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
            }
         }
      }
   }
}
