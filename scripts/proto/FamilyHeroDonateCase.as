package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyHeroDonateCase extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyHeroDonateCase.id","id",8 | 0);
      
      public static const USERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FamilyHeroDonateCase.userId","userId",16 | 0);
      
      public static const USERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyHeroDonateCase.userName","userName",24 | 2);
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyHeroDonateCase.itemId","itemId",32 | 0);
      
      public static const STAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyHeroDonateCase.stamp","stamp",40 | 0);
      
      public static const NOWNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyHeroDonateCase.nowNum","nowNum",48 | 0);
      
      public static const MAXNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyHeroDonateCase.maxNum","maxNum",56 | 0);
      
      public static const DONATEUSER:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.FamilyHeroDonateCase.donateUser","donateUser",64 | 0);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var userId$field:UInt64;
      
      private var userName$field:String;
      
      private var itemId$field:uint;
      
      private var stamp$field:uint;
      
      private var nowNum$field:uint;
      
      private var maxNum$field:uint;
      
      public var donateUser:Array;
      
      public function FamilyHeroDonateCase()
      {
         donateUser = [];
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
      
      public function clearUserId() : void
      {
         userId$field = null;
      }
      
      public function get hasUserId() : Boolean
      {
         return userId$field != null;
      }
      
      public function set userId(param1:UInt64) : void
      {
         userId$field = param1;
      }
      
      public function get userId() : UInt64
      {
         return userId$field;
      }
      
      public function clearUserName() : void
      {
         userName$field = null;
      }
      
      public function get hasUserName() : Boolean
      {
         return userName$field != null;
      }
      
      public function set userName(param1:String) : void
      {
         userName$field = param1;
      }
      
      public function get userName() : String
      {
         return userName$field;
      }
      
      public function clearItemId() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         itemId$field = new uint();
      }
      
      public function get hasItemId() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set itemId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         itemId$field = param1;
      }
      
      public function get itemId() : uint
      {
         return itemId$field;
      }
      
      public function clearStamp() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         stamp$field = new uint();
      }
      
      public function get hasStamp() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set stamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         stamp$field = param1;
      }
      
      public function get stamp() : uint
      {
         return stamp$field;
      }
      
      public function clearNowNum() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         nowNum$field = new uint();
      }
      
      public function get hasNowNum() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set nowNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         nowNum$field = param1;
      }
      
      public function get nowNum() : uint
      {
         return nowNum$field;
      }
      
      public function clearMaxNum() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         maxNum$field = new uint();
      }
      
      public function get hasMaxNum() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set maxNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         maxNum$field = param1;
      }
      
      public function get maxNum() : uint
      {
         return maxNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasUserId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT64(param1,userId$field);
         }
         if(hasUserName)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,userName$field);
         }
         if(hasItemId)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,itemId$field);
         }
         if(hasStamp)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,stamp$field);
         }
         if(hasNowNum)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,nowNum$field);
         }
         if(hasMaxNum)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,maxNum$field);
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.donateUser.length)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT64(param1,this.donateUser[_loc3_]);
            _loc3_++;
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:* = 0;
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc10_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyHeroDonateCase.id cannot be set twice.");
                  }
                  _loc9_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyHeroDonateCase.userId cannot be set twice.");
                  }
                  _loc8_++;
                  this.userId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyHeroDonateCase.userName cannot be set twice.");
                  }
                  _loc5_++;
                  this.userName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyHeroDonateCase.itemId cannot be set twice.");
                  }
                  _loc3_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyHeroDonateCase.stamp cannot be set twice.");
                  }
                  _loc7_++;
                  this.stamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyHeroDonateCase.nowNum cannot be set twice.");
                  }
                  _loc10_++;
                  this.nowNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyHeroDonateCase.maxNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.maxNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if((_loc6_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.donateUser);
                  }
                  else
                  {
                     this.donateUser.push(ReadUtils.read$TYPE_UINT64(param1));
                  }
                  continue;
            }
         }
      }
   }
}
