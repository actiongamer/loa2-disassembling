package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyInfoRes extends Message
   {
      
      public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyInfoRes.info","info",8 | 2,proto.FamilyInfo);
      
      public static const MEMBER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyInfoRes.member","member",16 | 2,proto.FamilyMemberInfoRes);
       
      
      public var info:proto.FamilyInfo;
      
      private var member$field:proto.FamilyMemberInfoRes;
      
      public function FamilyInfoRes()
      {
         super();
      }
      
      public function clearMember() : void
      {
         member$field = null;
      }
      
      public function get hasMember() : Boolean
      {
         return member$field != null;
      }
      
      public function set member(param1:proto.FamilyMemberInfoRes) : void
      {
         member$field = param1;
      }
      
      public function get member() : proto.FamilyMemberInfoRes
      {
         return member$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.info);
         if(hasMember)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,member$field);
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
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfoRes.info cannot be set twice.");
                  }
                  _loc4_++;
                  this.info = new proto.FamilyInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.info);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyInfoRes.member cannot be set twice.");
                  }
                  _loc5_++;
                  this.member = new proto.FamilyMemberInfoRes();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.member);
                  continue;
            }
         }
      }
   }
}
