package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FashionMakeRes extends Message
   {
      
      public static const SKILLID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FashionMakeRes.skillId","skillId",8 | 0);
      
      public static const SKILLNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FashionMakeRes.skillNum","skillNum",16 | 0);
       
      
      private var skillId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var skillNum$field:uint;
      
      public function FashionMakeRes()
      {
         super();
      }
      
      public function clearSkillId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         skillId$field = new uint();
      }
      
      public function get hasSkillId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set skillId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         skillId$field = param1;
      }
      
      public function get skillId() : uint
      {
         return skillId$field;
      }
      
      public function clearSkillNum() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         skillNum$field = new uint();
      }
      
      public function get hasSkillNum() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set skillNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         skillNum$field = param1;
      }
      
      public function get skillNum() : uint
      {
         return skillNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasSkillId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,skillId$field);
         }
         if(hasSkillNum)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,skillNum$field);
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
                     throw new IOError("Bad data format: FashionMakeRes.skillId cannot be set twice.");
                  }
                  _loc5_++;
                  this.skillId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FashionMakeRes.skillNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.skillNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
