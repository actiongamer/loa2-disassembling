package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ArenaGetRankListRes extends Message
   {
      
      public static const PLAYERARENAINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ArenaGetRankListRes.playerArenaInfos","playerArenaInfos",8 | 2,PlayerArenaInfo);
      
      public static const MYARENARANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaGetRankListRes.myArenaRank","myArenaRank",16 | 0);
      
      public static const MYYESTERDAYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaGetRankListRes.myYesterdayRank","myYesterdayRank",24 | 0);
       
      
      public var playerArenaInfos:Array;
      
      private var myArenaRank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var myYesterdayRank$field:uint;
      
      public function ArenaGetRankListRes()
      {
         playerArenaInfos = [];
         super();
      }
      
      public function clearMyArenaRank() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         myArenaRank$field = new uint();
      }
      
      public function get hasMyArenaRank() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set myArenaRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         myArenaRank$field = param1;
      }
      
      public function get myArenaRank() : uint
      {
         return myArenaRank$field;
      }
      
      public function clearMyYesterdayRank() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         myYesterdayRank$field = new uint();
      }
      
      public function get hasMyYesterdayRank() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set myYesterdayRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         myYesterdayRank$field = param1;
      }
      
      public function get myYesterdayRank() : uint
      {
         return myYesterdayRank$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.playerArenaInfos.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.playerArenaInfos[_loc2_]);
            _loc2_++;
         }
         if(hasMyArenaRank)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,myArenaRank$field);
         }
         if(hasMyYesterdayRank)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,myYesterdayRank$field);
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
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  this.playerArenaInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new PlayerArenaInfo()));
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaGetRankListRes.myArenaRank cannot be set twice.");
                  }
                  _loc4_++;
                  this.myArenaRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaGetRankListRes.myYesterdayRank cannot be set twice.");
                  }
                  _loc5_++;
                  this.myYesterdayRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
