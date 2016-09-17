package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CompeteStageInfoRes extends Message
   {
      
      public static const PLAYERINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.CompeteStageInfoRes.playerInfos","playerInfos",8 | 2,CompeteStagePlayerInfo);
      
      public static const REPORTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.CompeteStageInfoRes.reports","reports",16 | 2,CompeteStageReport);
      
      public static const GAMBLESTATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.CompeteStageInfoRes.gambleStatus","gambleStatus",24 | 0,COMP_GAMBLE_STATUS);
      
      public static const GAMBLEINDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompeteStageInfoRes.gambleIndex","gambleIndex",32 | 0);
       
      
      public var playerInfos:Array;
      
      public var reports:Array;
      
      private var gambleStatus$field:int;
      
      private var hasField$0:uint = 0;
      
      private var gambleIndex$field:int;
      
      public function CompeteStageInfoRes()
      {
         playerInfos = [];
         reports = [];
         super();
      }
      
      public function clearGambleStatus() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         gambleStatus$field = new int();
      }
      
      public function get hasGambleStatus() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set gambleStatus(param1:int) : void
      {
         hasField$0 = hasField$0 | 1;
         gambleStatus$field = param1;
      }
      
      public function get gambleStatus() : int
      {
         return gambleStatus$field;
      }
      
      public function clearGambleIndex() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         gambleIndex$field = new int();
      }
      
      public function get hasGambleIndex() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set gambleIndex(param1:int) : void
      {
         hasField$0 = hasField$0 | 2;
         gambleIndex$field = param1;
      }
      
      public function get gambleIndex() : int
      {
         return gambleIndex$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.playerInfos.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.playerInfos[_loc2_]);
            _loc2_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.reports.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reports[_loc3_]);
            _loc3_++;
         }
         if(hasGambleStatus)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_ENUM(param1,gambleStatus$field);
         }
         if(hasGambleIndex)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_INT32(param1,gambleIndex$field);
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                  this.playerInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new CompeteStagePlayerInfo()));
                  continue;
               case 1:
                  this.reports.push(ReadUtils.read$TYPE_MESSAGE(param1,new CompeteStageReport()));
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteStageInfoRes.gambleStatus cannot be set twice.");
                  }
                  _loc3_++;
                  this.gambleStatus = ReadUtils.read$TYPE_ENUM(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteStageInfoRes.gambleIndex cannot be set twice.");
                  }
                  _loc4_++;
                  this.gambleIndex = ReadUtils.read$TYPE_INT32(param1);
                  continue;
            }
         }
      }
   }
}
