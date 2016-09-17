package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CteamArenaInfoRes extends Message
   {
      
      public static const ENEMY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.CteamArenaInfoRes.enemy","enemy",8 | 2,proto.CTeamInfo);
      
      public static const OUR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.CteamArenaInfoRes.our","our",16 | 2,proto.CTeamInfo);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CteamArenaInfoRes.score","score",24 | 0);
      
      public static const SOURCE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CteamArenaInfoRes.source","source",32 | 0);
       
      
      public var enemy:proto.CTeamInfo;
      
      public var our:proto.CTeamInfo;
      
      public var score:uint;
      
      private var source$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function CteamArenaInfoRes()
      {
         super();
      }
      
      public function clearSource() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         source$field = new uint();
      }
      
      public function get hasSource() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set source(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         source$field = param1;
      }
      
      public function get source() : uint
      {
         return source$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.enemy);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_MESSAGE(param1,this.our);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.score);
         if(hasSource)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,source$field);
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
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: CteamArenaInfoRes.enemy cannot be set twice.");
                  }
                  _loc7_++;
                  this.enemy = new proto.CTeamInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.enemy);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CteamArenaInfoRes.our cannot be set twice.");
                  }
                  _loc5_++;
                  this.our = new proto.CTeamInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.our);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CteamArenaInfoRes.score cannot be set twice.");
                  }
                  _loc4_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CteamArenaInfoRes.source cannot be set twice.");
                  }
                  _loc6_++;
                  this.source = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
