package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyHeroDoanteList extends Message
   {
      
      public static const FDDATAS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyHeroDoanteList.fddatas","fddatas",8 | 2,FamilyHeroDonateCase);
      
      public static const DONATECOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyHeroDoanteList.donateCount","donateCount",16 | 0);
       
      
      public var fddatas:Array;
      
      private var donateCount$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function FamilyHeroDoanteList()
      {
         fddatas = [];
         super();
      }
      
      public function clearDonateCount() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         donateCount$field = new uint();
      }
      
      public function get hasDonateCount() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set donateCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         donateCount$field = param1;
      }
      
      public function get donateCount() : uint
      {
         return donateCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.fddatas.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.fddatas[_loc2_]);
            _loc2_++;
         }
         if(hasDonateCount)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,donateCount$field);
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
                  this.fddatas.push(ReadUtils.read$TYPE_MESSAGE(param1,new FamilyHeroDonateCase()));
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyHeroDoanteList.donateCount cannot be set twice.");
                  }
                  _loc4_++;
                  this.donateCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
