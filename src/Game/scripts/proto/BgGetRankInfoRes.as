package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgGetRankInfoRes extends Message
   {
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgGetRankInfoRes.kind","kind",8 | 0);
      
      public static const INFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BgGetRankInfoRes.infos","infos",16 | 2,BgRankInfo);
      
      public static const MYLOCALRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgGetRankInfoRes.myLocalRank","myLocalRank",24 | 0);
      
      public static const MYCROSSRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgGetRankInfoRes.myCrossRank","myCrossRank",32 | 0);
      
      public static const RANKCLOSE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.BgGetRankInfoRes.rankClose","rankClose",40 | 0);
      
      public static const RANKLEN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgGetRankInfoRes.rankLen","rankLen",48 | 0);
      
      public static const LASTMONTHWINNER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BgGetRankInfoRes.lastMonthWinner","lastMonthWinner",56 | 2,proto.PlayerBaseInfo);
       
      
      public var kind:uint;
      
      public var infos:Array;
      
      private var myLocalRank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var myCrossRank$field:uint;
      
      private var rankClose$field:Boolean;
      
      private var rankLen$field:uint;
      
      private var lastMonthWinner$field:proto.PlayerBaseInfo;
      
      public function BgGetRankInfoRes()
      {
         infos = [];
         super();
      }
      
      public function clearMyLocalRank() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         myLocalRank$field = new uint();
      }
      
      public function get hasMyLocalRank() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set myLocalRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         myLocalRank$field = param1;
      }
      
      public function get myLocalRank() : uint
      {
         return myLocalRank$field;
      }
      
      public function clearMyCrossRank() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         myCrossRank$field = new uint();
      }
      
      public function get hasMyCrossRank() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set myCrossRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         myCrossRank$field = param1;
      }
      
      public function get myCrossRank() : uint
      {
         return myCrossRank$field;
      }
      
      public function clearRankClose() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         rankClose$field = new Boolean();
      }
      
      public function get hasRankClose() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set rankClose(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 4;
         rankClose$field = param1;
      }
      
      public function get rankClose() : Boolean
      {
         return rankClose$field;
      }
      
      public function clearRankLen() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         rankLen$field = new uint();
      }
      
      public function get hasRankLen() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set rankLen(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         rankLen$field = param1;
      }
      
      public function get rankLen() : uint
      {
         return rankLen$field;
      }
      
      public function clearLastMonthWinner() : void
      {
         lastMonthWinner$field = null;
      }
      
      public function get hasLastMonthWinner() : Boolean
      {
         return lastMonthWinner$field != null;
      }
      
      public function set lastMonthWinner(param1:proto.PlayerBaseInfo) : void
      {
         lastMonthWinner$field = param1;
      }
      
      public function get lastMonthWinner() : proto.PlayerBaseInfo
      {
         return lastMonthWinner$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.kind);
         _loc2_ = uint(0);
         while(_loc2_ < this.infos.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.infos[_loc2_]);
            _loc2_++;
         }
         if(hasMyLocalRank)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,myLocalRank$field);
         }
         if(hasMyCrossRank)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,myCrossRank$field);
         }
         if(hasRankClose)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_BOOL(param1,rankClose$field);
         }
         if(hasRankLen)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,rankLen$field);
         }
         if(hasLastMonthWinner)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,lastMonthWinner$field);
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
         var _loc4_:* = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc9_:uint = 0;
         var _loc6_:uint = 0;
         var _loc8_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BgGetRankInfoRes.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.infos.push(ReadUtils.read$TYPE_MESSAGE(param1,new BgRankInfo()));
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BgGetRankInfoRes.myLocalRank cannot be set twice.");
                  }
                  _loc7_++;
                  this.myLocalRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: BgGetRankInfoRes.myCrossRank cannot be set twice.");
                  }
                  _loc9_++;
                  this.myCrossRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BgGetRankInfoRes.rankClose cannot be set twice.");
                  }
                  _loc6_++;
                  this.rankClose = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 5:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: BgGetRankInfoRes.rankLen cannot be set twice.");
                  }
                  _loc8_++;
                  this.rankLen = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BgGetRankInfoRes.lastMonthWinner cannot be set twice.");
                  }
                  _loc5_++;
                  this.lastMonthWinner = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.lastMonthWinner);
                  continue;
            }
         }
      }
   }
}
