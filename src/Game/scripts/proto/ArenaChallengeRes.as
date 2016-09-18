package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ArenaChallengeRes extends Message
   {
      
      public static const ISWIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.ArenaChallengeRes.isWin","isWin",8 | 0);
      
      public static const DROPS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ArenaChallengeRes.drops","drops",16 | 2,Reward);
      
      public static const SCORES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaChallengeRes.scores","scores",24 | 0);
      
      public static const CDSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaChallengeRes.cdStamp","cdStamp",32 | 0);
      
      public static const ISCDRED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.ArenaChallengeRes.isCdRed","isCdRed",40 | 0);
      
      public static const RESIDUALTIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.ArenaChallengeRes.residualTimes","residualTimes",48 | 0);
      
      public static const CANPASS:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.ArenaChallengeRes.canPass","canPass",56 | 0);
      
      public static const HISTTOPRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaChallengeRes.histTopRank","histTopRank",64 | 0);
      
      public static const REPORTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.ArenaChallengeRes.reportId","reportId",72 | 2);
      
      public static const ATTACKER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ArenaChallengeRes.attacker","attacker",80 | 2,proto.BgFightInfo);
      
      public static const TARGET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ArenaChallengeRes.target","target",88 | 2,proto.BgFightInfo);
       
      
      public var isWin:Boolean;
      
      public var drops:Array;
      
      private var scores$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var cdStamp$field:uint;
      
      private var isCdRed$field:Boolean;
      
      private var residualTimes$field:int;
      
      private var canPass$field:Boolean;
      
      private var histTopRank$field:uint;
      
      public var reportId:String;
      
      private var attacker$field:proto.BgFightInfo;
      
      private var target$field:proto.BgFightInfo;
      
      public function ArenaChallengeRes()
      {
         drops = [];
         super();
      }
      
      public function clearScores() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         scores$field = new uint();
      }
      
      public function get hasScores() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set scores(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         scores$field = param1;
      }
      
      public function get scores() : uint
      {
         return scores$field;
      }
      
      public function clearCdStamp() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         cdStamp$field = new uint();
      }
      
      public function get hasCdStamp() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set cdStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         cdStamp$field = param1;
      }
      
      public function get cdStamp() : uint
      {
         return cdStamp$field;
      }
      
      public function clearIsCdRed() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         isCdRed$field = new Boolean();
      }
      
      public function get hasIsCdRed() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set isCdRed(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 4;
         isCdRed$field = param1;
      }
      
      public function get isCdRed() : Boolean
      {
         return isCdRed$field;
      }
      
      public function clearResidualTimes() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         residualTimes$field = new int();
      }
      
      public function get hasResidualTimes() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set residualTimes(param1:int) : void
      {
         hasField$0 = hasField$0 | 8;
         residualTimes$field = param1;
      }
      
      public function get residualTimes() : int
      {
         return residualTimes$field;
      }
      
      public function clearCanPass() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         canPass$field = new Boolean();
      }
      
      public function get hasCanPass() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set canPass(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 16;
         canPass$field = param1;
      }
      
      public function get canPass() : Boolean
      {
         return canPass$field;
      }
      
      public function clearHistTopRank() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         histTopRank$field = new uint();
      }
      
      public function get hasHistTopRank() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set histTopRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         histTopRank$field = param1;
      }
      
      public function get histTopRank() : uint
      {
         return histTopRank$field;
      }
      
      public function clearAttacker() : void
      {
         attacker$field = null;
      }
      
      public function get hasAttacker() : Boolean
      {
         return attacker$field != null;
      }
      
      public function set attacker(param1:proto.BgFightInfo) : void
      {
         attacker$field = param1;
      }
      
      public function get attacker() : proto.BgFightInfo
      {
         return attacker$field;
      }
      
      public function clearTarget() : void
      {
         target$field = null;
      }
      
      public function get hasTarget() : Boolean
      {
         return target$field != null;
      }
      
      public function set target(param1:proto.BgFightInfo) : void
      {
         target$field = param1;
      }
      
      public function get target() : proto.BgFightInfo
      {
         return target$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.isWin);
         _loc3_ = uint(0);
         while(_loc3_ < this.drops.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.drops[_loc3_]);
            _loc3_++;
         }
         if(hasScores)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,scores$field);
         }
         if(hasCdStamp)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,cdStamp$field);
         }
         if(hasIsCdRed)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_BOOL(param1,isCdRed$field);
         }
         if(hasResidualTimes)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_INT32(param1,residualTimes$field);
         }
         if(hasCanPass)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_BOOL(param1,canPass$field);
         }
         if(hasHistTopRank)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,histTopRank$field);
         }
         WriteUtils.writeTag(param1,2,9);
         WriteUtils.write$TYPE_STRING(param1,this.reportId);
         if(hasAttacker)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_MESSAGE(param1,attacker$field);
         }
         if(hasTarget)
         {
            WriteUtils.writeTag(param1,2,11);
            WriteUtils.write$TYPE_MESSAGE(param1,target$field);
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc3_:uint = 0;
         var _loc9_:uint = 0;
         var _loc13_:uint = 0;
         var _loc8_:uint = 0;
         var _loc11_:uint = 0;
         var _loc6_:uint = 0;
         var _loc10_:uint = 0;
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         var _loc12_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaChallengeRes.isWin cannot be set twice.");
                  }
                  _loc3_++;
                  this.isWin = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  this.drops.push(ReadUtils.read$TYPE_MESSAGE(param1,new Reward()));
                  continue;
               case 2:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaChallengeRes.scores cannot be set twice.");
                  }
                  _loc9_++;
                  this.scores = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaChallengeRes.cdStamp cannot be set twice.");
                  }
                  _loc13_++;
                  this.cdStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaChallengeRes.isCdRed cannot be set twice.");
                  }
                  _loc8_++;
                  this.isCdRed = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 5:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaChallengeRes.residualTimes cannot be set twice.");
                  }
                  _loc11_++;
                  this.residualTimes = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaChallengeRes.canPass cannot be set twice.");
                  }
                  _loc6_++;
                  this.canPass = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 7:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaChallengeRes.histTopRank cannot be set twice.");
                  }
                  _loc10_++;
                  this.histTopRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaChallengeRes.reportId cannot be set twice.");
                  }
                  _loc7_++;
                  this.reportId = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 9:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaChallengeRes.attacker cannot be set twice.");
                  }
                  _loc5_++;
                  this.attacker = new proto.BgFightInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.attacker);
                  continue;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaChallengeRes.target cannot be set twice.");
                  }
                  _loc12_++;
                  this.target = new proto.BgFightInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.target);
                  continue;
            }
         }
      }
   }
}
