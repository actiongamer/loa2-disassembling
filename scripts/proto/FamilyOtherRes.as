package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyOtherRes extends Message
   {
      
      public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyOtherRes.info","info",8 | 2,proto.FamilyInfo);
      
      public static const LIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyOtherRes.list","list",16 | 2,FamilyMember);
       
      
      public var info:proto.FamilyInfo;
      
      public var list:Array;
      
      public function FamilyOtherRes()
      {
         list = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.info);
         _loc2_ = uint(0);
         while(_loc2_ < this.list.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.list[_loc2_]);
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
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyOtherRes.info cannot be set twice.");
                  }
                  _loc4_++;
                  this.info = new proto.FamilyInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.info);
                  continue;
               case 1:
                  this.list.push(ReadUtils.read$TYPE_MESSAGE(param1,new FamilyMember()));
                  continue;
            }
         }
      }
   }
}
