package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TeamSetting extends Message
   {
      
      public static const AUTOAGREEALL:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.TeamSetting.autoagreeall","autoagreeall",8 | 0);
      
      public static const AUTOAGREELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamSetting.autoagreelevel","autoagreelevel",16 | 0);
      
      public static const AUTOAGREEABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.TeamSetting.autoagreeability","autoagreeability",24 | 0);
       
      
      private var autoagreeall$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var autoagreelevel$field:uint;
      
      private var autoagreeability$field:UInt64;
      
      public function TeamSetting()
      {
         super();
      }
      
      public function clearAutoagreeall() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         autoagreeall$field = new Boolean();
      }
      
      public function get hasAutoagreeall() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set autoagreeall(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         autoagreeall$field = param1;
      }
      
      public function get autoagreeall() : Boolean
      {
         return autoagreeall$field;
      }
      
      public function clearAutoagreelevel() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         autoagreelevel$field = new uint();
      }
      
      public function get hasAutoagreelevel() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set autoagreelevel(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         autoagreelevel$field = param1;
      }
      
      public function get autoagreelevel() : uint
      {
         return autoagreelevel$field;
      }
      
      public function clearAutoagreeability() : void
      {
         autoagreeability$field = null;
      }
      
      public function get hasAutoagreeability() : Boolean
      {
         return autoagreeability$field != null;
      }
      
      public function set autoagreeability(param1:UInt64) : void
      {
         autoagreeability$field = param1;
      }
      
      public function get autoagreeability() : UInt64
      {
         return autoagreeability$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasAutoagreeall)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_BOOL(param1,autoagreeall$field);
         }
         if(hasAutoagreelevel)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,autoagreelevel$field);
         }
         if(hasAutoagreeability)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT64(param1,autoagreeability$field);
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
                     throw new IOError("Bad data format: TeamSetting.autoagreeall cannot be set twice.");
                  }
                  _loc3_++;
                  this.autoagreeall = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: TeamSetting.autoagreelevel cannot be set twice.");
                  }
                  _loc6_++;
                  this.autoagreelevel = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: TeamSetting.autoagreeability cannot be set twice.");
                  }
                  _loc5_++;
                  this.autoagreeability = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
