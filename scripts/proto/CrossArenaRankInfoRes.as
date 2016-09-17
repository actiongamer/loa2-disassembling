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
   
   public class CrossArenaRankInfoRes extends Message
   {
      
      public static const INFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.CrossArenaRankInfoRes.infos","infos",8 | 2,CrossArenaRankInfo);
      
      public static const RANKLEN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaRankInfoRes.rankLen","rankLen",16 | 0);
      
      public static const MYSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaRankInfoRes.myScore","myScore",24 | 0);
      
      public static const MYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaRankInfoRes.myRank","myRank",32 | 0);
      
      public static const MYMASSFIGHTTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaRankInfoRes.myMassFightTimes","myMassFightTimes",40 | 0);
      
      public static const MYFINALFIGHTTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaRankInfoRes.myFinalFightTimes","myFinalFightTimes",48 | 0);
      
      public static const MYWINTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaRankInfoRes.myWinTimes","myWinTimes",56 | 0);
      
      public static const MYFAILTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaRankInfoRes.myFailTimes","myFailTimes",64 | 0);
      
      public static const MYCOUNTRY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaRankInfoRes.myCountry","myCountry",72 | 0);
       
      
      public var infos:Array;
      
      public var rankLen:uint;
      
      private var myScore$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var myRank$field:uint;
      
      private var myMassFightTimes$field:uint;
      
      private var myFinalFightTimes$field:uint;
      
      private var myWinTimes$field:uint;
      
      private var myFailTimes$field:uint;
      
      private var myCountry$field:uint;
      
      public function CrossArenaRankInfoRes()
      {
         infos = [];
         super();
      }
      
      public function clearMyScore() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         myScore$field = new uint();
      }
      
      public function get hasMyScore() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set myScore(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         myScore$field = param1;
      }
      
      public function get myScore() : uint
      {
         return myScore$field;
      }
      
      public function clearMyRank() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         myRank$field = new uint();
      }
      
      public function get hasMyRank() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set myRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         myRank$field = param1;
      }
      
      public function get myRank() : uint
      {
         return myRank$field;
      }
      
      public function clearMyMassFightTimes() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         myMassFightTimes$field = new uint();
      }
      
      public function get hasMyMassFightTimes() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set myMassFightTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         myMassFightTimes$field = param1;
      }
      
      public function get myMassFightTimes() : uint
      {
         return myMassFightTimes$field;
      }
      
      public function clearMyFinalFightTimes() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         myFinalFightTimes$field = new uint();
      }
      
      public function get hasMyFinalFightTimes() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set myFinalFightTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         myFinalFightTimes$field = param1;
      }
      
      public function get myFinalFightTimes() : uint
      {
         return myFinalFightTimes$field;
      }
      
      public function clearMyWinTimes() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         myWinTimes$field = new uint();
      }
      
      public function get hasMyWinTimes() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set myWinTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         myWinTimes$field = param1;
      }
      
      public function get myWinTimes() : uint
      {
         return myWinTimes$field;
      }
      
      public function clearMyFailTimes() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         myFailTimes$field = new uint();
      }
      
      public function get hasMyFailTimes() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set myFailTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         myFailTimes$field = param1;
      }
      
      public function get myFailTimes() : uint
      {
         return myFailTimes$field;
      }
      
      public function clearMyCountry() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         myCountry$field = new uint();
      }
      
      public function get hasMyCountry() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set myCountry(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         myCountry$field = param1;
      }
      
      public function get myCountry() : uint
      {
         return myCountry$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.infos.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.infos[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.rankLen);
         if(hasMyScore)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,myScore$field);
         }
         if(hasMyRank)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,myRank$field);
         }
         if(hasMyMassFightTimes)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,myMassFightTimes$field);
         }
         if(hasMyFinalFightTimes)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,myFinalFightTimes$field);
         }
         if(hasMyWinTimes)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,myWinTimes$field);
         }
         if(hasMyFailTimes)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,myFailTimes$field);
         }
         if(hasMyCountry)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,myCountry$field);
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
         var _loc8_:* = 0;
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         var _loc9_:uint = 0;
         var _loc11_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc8_ >> 3) - 1)
            {
               case 0:
                  this.infos.push(ReadUtils.read$TYPE_MESSAGE(param1,new CrossArenaRankInfo()));
                  continue;
               case 1:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaRankInfoRes.rankLen cannot be set twice.");
                  }
                  _loc10_++;
                  this.rankLen = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaRankInfoRes.myScore cannot be set twice.");
                  }
                  _loc3_++;
                  this.myScore = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaRankInfoRes.myRank cannot be set twice.");
                  }
                  _loc7_++;
                  this.myRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaRankInfoRes.myMassFightTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.myMassFightTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaRankInfoRes.myFinalFightTimes cannot be set twice.");
                  }
                  _loc9_++;
                  this.myFinalFightTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaRankInfoRes.myWinTimes cannot be set twice.");
                  }
                  _loc11_++;
                  this.myWinTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaRankInfoRes.myFailTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.myFailTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaRankInfoRes.myCountry cannot be set twice.");
                  }
                  _loc4_++;
                  this.myCountry = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
