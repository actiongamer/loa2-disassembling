package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CteamPlayerInfoRes extends Message
   {
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CteamPlayerInfoRes.time","time",8 | 0);
      
      public static const WIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CteamPlayerInfoRes.win","win",16 | 0);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.CteamPlayerInfoRes.reward","reward",24 | 2,MapKey32Value32);
       
      
      private var time$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var win$field:uint;
      
      public var reward:Array;
      
      public function CteamPlayerInfoRes()
      {
         reward = [];
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
      
      public function clearWin() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         win$field = new uint();
      }
      
      public function get hasWin() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set win(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         win$field = param1;
      }
      
      public function get win() : uint
      {
         return win$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasTime)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,time$field);
         }
         if(hasWin)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,win$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc2_]);
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
         var _loc5_:* = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CteamPlayerInfoRes.time cannot be set twice.");
                  }
                  _loc4_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CteamPlayerInfoRes.win cannot be set twice.");
                  }
                  _loc3_++;
                  this.win = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new MapKey32Value32()));
                  continue;
            }
         }
      }
   }
}
