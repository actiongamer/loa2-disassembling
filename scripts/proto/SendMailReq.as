package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class SendMailReq extends Message
   {
      
      public static const RECEIVENAME:RepeatedFieldDescriptor$TYPE_STRING = new RepeatedFieldDescriptor$TYPE_STRING("proto.SendMailReq.receiveName","receiveName",8 | 2);
      
      public static const TITLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.SendMailReq.title","title",16 | 2);
      
      public static const CONTENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.SendMailReq.content","content",24 | 2);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.SendMailReq.kind","kind",32 | 0);
       
      
      public var receiveName:Array;
      
      public var title:String;
      
      public var content:String;
      
      public var kind:uint;
      
      public function SendMailReq()
      {
         receiveName = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.receiveName.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_STRING(param1,this.receiveName[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.title);
         WriteUtils.writeTag(param1,2,3);
         WriteUtils.write$TYPE_STRING(param1,this.content);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.kind);
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
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  this.receiveName.push(ReadUtils.read$TYPE_STRING(param1));
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: SendMailReq.title cannot be set twice.");
                  }
                  _loc6_++;
                  this.title = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: SendMailReq.content cannot be set twice.");
                  }
                  _loc5_++;
                  this.content = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: SendMailReq.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
