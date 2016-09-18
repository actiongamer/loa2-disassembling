package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import proto.FamilyHeroDonatePlayer.DonateItem;
   import proto.FamilyHeroDonatePlayer.DonateMessage;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyHeroDonatePlayer extends Message
   {
      
      public static const DONATESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyHeroDonatePlayer.donateStamp","donateStamp",8 | 0);
      
      public static const LAUNCHLIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyHeroDonatePlayer.launchLimit","launchLimit",16 | 0);
      
      public static const DONATELIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyHeroDonatePlayer.donateLimit","donateLimit",24 | 0);
      
      public static const RECEIVELIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyHeroDonatePlayer.receiveList","receiveList",32 | 2,DonateItem);
      
      public static const DONATEMESSAGE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyHeroDonatePlayer.donateMessage","donateMessage",40 | 2,DonateMessage);
       
      
      private var donateStamp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var launchLimit$field:uint;
      
      private var donateLimit$field:uint;
      
      public var receiveList:Array;
      
      public var donateMessage:Array;
      
      public function FamilyHeroDonatePlayer()
      {
         receiveList = [];
         donateMessage = [];
         super();
      }
      
      public function clearDonateStamp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         donateStamp$field = new uint();
      }
      
      public function get hasDonateStamp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set donateStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         donateStamp$field = param1;
      }
      
      public function get donateStamp() : uint
      {
         return donateStamp$field;
      }
      
      public function clearLaunchLimit() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         launchLimit$field = new uint();
      }
      
      public function get hasLaunchLimit() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set launchLimit(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         launchLimit$field = param1;
      }
      
      public function get launchLimit() : uint
      {
         return launchLimit$field;
      }
      
      public function clearDonateLimit() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         donateLimit$field = new uint();
      }
      
      public function get hasDonateLimit() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set donateLimit(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         donateLimit$field = param1;
      }
      
      public function get donateLimit() : uint
      {
         return donateLimit$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = 0;
         var _loc2_:* = 0;
         if(hasDonateStamp)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,donateStamp$field);
         }
         if(hasLaunchLimit)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,launchLimit$field);
         }
         if(hasDonateLimit)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,donateLimit$field);
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.receiveList.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.receiveList[_loc4_]);
            _loc4_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.donateMessage.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.donateMessage[_loc2_]);
            _loc2_++;
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyHeroDonatePlayer.donateStamp cannot be set twice.");
                  }
                  _loc3_++;
                  this.donateStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyHeroDonatePlayer.launchLimit cannot be set twice.");
                  }
                  _loc6_++;
                  this.launchLimit = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyHeroDonatePlayer.donateLimit cannot be set twice.");
                  }
                  _loc5_++;
                  this.donateLimit = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  this.receiveList.push(ReadUtils.read$TYPE_MESSAGE(param1,new DonateItem()));
                  continue;
               case 4:
                  this.donateMessage.push(ReadUtils.read$TYPE_MESSAGE(param1,new DonateMessage()));
                  continue;
            }
         }
      }
   }
}
