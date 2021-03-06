package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FashionList extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FashionList.id","id",8 | 0);
      
      public static const CURUSEID:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FashionList.curUseId","curUseId",16 | 0);
      
      public static const SKILLNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FashionList.skillNum","skillNum",24 | 0);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var curUseId$field:Boolean;
      
      private var skillNum$field:uint;
      
      public function FashionList()
      {
         super();
      }
      
      public function clearId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         id$field = param1;
      }
      
      public function get id() : uint
      {
         return id$field;
      }
      
      public function clearCurUseId() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         curUseId$field = new Boolean();
      }
      
      public function get hasCurUseId() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set curUseId(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 2;
         curUseId$field = param1;
      }
      
      public function get curUseId() : Boolean
      {
         return curUseId$field;
      }
      
      public function clearSkillNum() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         skillNum$field = new uint();
      }
      
      public function get hasSkillNum() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set skillNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         skillNum$field = param1;
      }
      
      public function get skillNum() : uint
      {
         return skillNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasCurUseId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_BOOL(param1,curUseId$field);
         }
         if(hasSkillNum)
         {
            WriteUtils.writeTag(param1,0,3);
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
         var _loc4_:* = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FashionList.id cannot be set twice.");
                  }
                  _loc6_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FashionList.curUseId cannot be set twice.");
                  }
                  _loc3_++;
                  this.curUseId = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FashionList.skillNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.skillNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
