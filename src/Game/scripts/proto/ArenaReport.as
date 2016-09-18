package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ArenaReport extends Message
   {
      
      public static const ISATTACKER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.ArenaReport.isAttacker","isAttacker",8 | 0);
      
      public static const ISWIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.ArenaReport.isWin","isWin",16 | 0);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaReport.rank","rank",24 | 0);
      
      public static const ISNEW:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.ArenaReport.isNew","isNew",32 | 0);
      
      public static const CREATETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaReport.createTime","createTime",40 | 0);
      
      public static const REPORTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.ArenaReport.reportId","reportId",48 | 2);
      
      public static const PLAYER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ArenaReport.player","player",56 | 2,proto.PlayerBaseInfo);
      
      public static const ISRANKCHANGE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.ArenaReport.isRankChange","isRankChange",64 | 0);
       
      
      private var isAttacker$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var isWin$field:Boolean;
      
      private var rank$field:uint;
      
      private var isNew$field:Boolean;
      
      private var createTime$field:uint;
      
      private var reportId$field:String;
      
      private var player$field:proto.PlayerBaseInfo;
      
      private var isRankChange$field:Boolean;
      
      public function ArenaReport()
      {
         super();
      }
      
      public function clearIsAttacker() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         isAttacker$field = new Boolean();
      }
      
      public function get hasIsAttacker() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set isAttacker(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         isAttacker$field = param1;
      }
      
      public function get isAttacker() : Boolean
      {
         return isAttacker$field;
      }
      
      public function clearIsWin() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         isWin$field = new Boolean();
      }
      
      public function get hasIsWin() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set isWin(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 2;
         isWin$field = param1;
      }
      
      public function get isWin() : Boolean
      {
         return isWin$field;
      }
      
      public function clearRank() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return rank$field;
      }
      
      public function clearIsNew() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         isNew$field = new Boolean();
      }
      
      public function get hasIsNew() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set isNew(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 8;
         isNew$field = param1;
      }
      
      public function get isNew() : Boolean
      {
         return isNew$field;
      }
      
      public function clearCreateTime() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         createTime$field = new uint();
      }
      
      public function get hasCreateTime() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set createTime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         createTime$field = param1;
      }
      
      public function get createTime() : uint
      {
         return createTime$field;
      }
      
      public function clearReportId() : void
      {
         reportId$field = null;
      }
      
      public function get hasReportId() : Boolean
      {
         return reportId$field != null;
      }
      
      public function set reportId(param1:String) : void
      {
         reportId$field = param1;
      }
      
      public function get reportId() : String
      {
         return reportId$field;
      }
      
      public function clearPlayer() : void
      {
         player$field = null;
      }
      
      public function get hasPlayer() : Boolean
      {
         return player$field != null;
      }
      
      public function set player(param1:proto.PlayerBaseInfo) : void
      {
         player$field = param1;
      }
      
      public function get player() : proto.PlayerBaseInfo
      {
         return player$field;
      }
      
      public function clearIsRankChange() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         isRankChange$field = new Boolean();
      }
      
      public function get hasIsRankChange() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set isRankChange(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 32;
         isRankChange$field = param1;
      }
      
      public function get isRankChange() : Boolean
      {
         return isRankChange$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasIsAttacker)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_BOOL(param1,isAttacker$field);
         }
         if(hasIsWin)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_BOOL(param1,isWin$field);
         }
         if(hasRank)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,rank$field);
         }
         if(hasIsNew)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_BOOL(param1,isNew$field);
         }
         if(hasCreateTime)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,createTime$field);
         }
         if(hasReportId)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,reportId$field);
         }
         if(hasPlayer)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,player$field);
         }
         if(hasIsRankChange)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_BOOL(param1,isRankChange$field);
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
         var _loc6_:* = 0;
         var _loc8_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc11_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc10_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaReport.isAttacker cannot be set twice.");
                  }
                  _loc8_++;
                  this.isAttacker = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaReport.isWin cannot be set twice.");
                  }
                  _loc5_++;
                  this.isWin = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaReport.rank cannot be set twice.");
                  }
                  _loc4_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaReport.isNew cannot be set twice.");
                  }
                  _loc11_++;
                  this.isNew = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaReport.createTime cannot be set twice.");
                  }
                  _loc7_++;
                  this.createTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaReport.reportId cannot be set twice.");
                  }
                  _loc3_++;
                  this.reportId = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaReport.player cannot be set twice.");
                  }
                  _loc10_++;
                  this.player = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.player);
                  continue;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaReport.isRankChange cannot be set twice.");
                  }
                  _loc9_++;
                  this.isRankChange = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
