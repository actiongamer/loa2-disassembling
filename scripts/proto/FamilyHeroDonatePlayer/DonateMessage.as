package proto.FamilyHeroDonatePlayer
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class DonateMessage extends Message
   {
      
      public static const USERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FamilyHeroDonatePlayer.DonateMessage.userId","userId",8 | 0);
      
      public static const USERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyHeroDonatePlayer.DonateMessage.userName","userName",16 | 2);
      
      public static const STAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyHeroDonatePlayer.DonateMessage.stamp","stamp",24 | 0);
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyHeroDonatePlayer.DonateMessage.itemId","itemId",32 | 0);
       
      
      private var userId$field:UInt64;
      
      private var userName$field:String;
      
      private var stamp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var itemId$field:uint;
      
      public function DonateMessage()
      {
         super();
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
      
      public function clearStamp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         stamp$field = new uint();
      }
      
      public function get hasStamp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set stamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         stamp$field = param1;
      }
      
      public function get stamp() : uint
      {
         return stamp$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasUserId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT64(param1,userId$field);
         }
         if(hasUserName)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,userName$field);
         }
         if(hasStamp)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,stamp$field);
         }
         if(hasItemId)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,itemId$field);
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
         var _loc5_:* = 0;
         var _loc7_:uint = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: DonateMessage.userId cannot be set twice.");
                  }
                  _loc7_++;
                  this.userId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: DonateMessage.userName cannot be set twice.");
                  }
                  _loc4_++;
                  this.userName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: DonateMessage.stamp cannot be set twice.");
                  }
                  _loc6_++;
                  this.stamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: DonateMessage.itemId cannot be set twice.");
                  }
                  _loc3_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
