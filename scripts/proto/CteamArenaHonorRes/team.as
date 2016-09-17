package proto.CteamArenaHonorRes
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import proto.PlayerBaseInfo;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class team extends Message
   {
      
      public static const INFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.CteamArenaHonorRes.team.info","info",8 | 2,PlayerBaseInfo);
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CteamArenaHonorRes.team.time","time",16 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CteamArenaHonorRes.team.name","name",24 | 2);
       
      
      public var info:Array;
      
      private var time$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var name$field:String;
      
      public function team()
      {
         info = [];
         super();
      }
      
      public function clearTime() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         time$field = new uint();
      }
      
      public function get hasTime() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set time(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         time$field = param1;
      }
      
      public function get time() : uint
      {
         return time$field;
      }
      
      public function clearName() : void
      {
         name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         name$field = param1;
      }
      
      public function get name() : String
      {
         return name$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.info.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.info[_loc2_]);
            _loc2_++;
         }
         if(hasTime)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,time$field);
         }
         if(hasName)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,name$field);
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
         var _loc5_:* = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  this.info.push(ReadUtils.read$TYPE_MESSAGE(param1,new PlayerBaseInfo()));
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: team.time cannot be set twice.");
                  }
                  _loc3_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: team.name cannot be set twice.");
                  }
                  _loc4_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
