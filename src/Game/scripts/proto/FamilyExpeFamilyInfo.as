package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyExpeFamilyInfo extends Message
   {
      
      public static const FAMILYID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FamilyExpeFamilyInfo.familyId","familyId",8 | 0);
      
      public static const FAMILYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeFamilyInfo.familyName","familyName",16 | 2);
      
      public static const FAMILYDIST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFamilyInfo.familyDist","familyDist",24 | 0);
      
      public static const FAMILYOPNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeFamilyInfo.familyOpName","familyOpName",32 | 2);
      
      public static const AVAINUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFamilyInfo.avaiNum","avaiNum",40 | 0);
      
      public static const TOTALNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFamilyInfo.totalNum","totalNum",48 | 0);
      
      public static const REPUTATION:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.FamilyExpeFamilyInfo.reputation","reputation",56 | 0);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FamilyExpeFamilyInfo.ability","ability",64 | 0);
      
      public static const WINREPUTATION:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.FamilyExpeFamilyInfo.winReputation","winReputation",72 | 0);
      
      public static const FAILREPUTATION:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.FamilyExpeFamilyInfo.failReputation","failReputation",80 | 0);
      
      public static const AVAIUIDS:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.FamilyExpeFamilyInfo.avaiUids","avaiUids",88 | 0);
      
      public static const RESIDUALTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFamilyInfo.residualTimes","residualTimes",96 | 0);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFamilyInfo.rank","rank",104 | 0);
      
      public static const FLAGBASE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFamilyInfo.flagBase","flagBase",112 | 0);
      
      public static const FLAGICON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFamilyInfo.flagIcon","flagIcon",120 | 0);
      
      public static const FAMILYLV:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFamilyInfo.familyLv","familyLv",128 | 0);
      
      public static const STRENGTH:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFamilyInfo.strength","strength",136 | 0);
      
      public static const WINTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeFamilyInfo.winTimes","winTimes",144 | 0);
      
      public static const BPS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeFamilyInfo.bps","bps",152 | 2,ITFamilyExpeBattlePlayers);
      
      public static const LEADER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeFamilyInfo.leader","leader",160 | 2,proto.PlayerBaseInfo);
      
      public static const DISTNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeFamilyInfo.distName","distName",168 | 2);
       
      
      public var familyId:UInt64;
      
      private var familyName$field:String;
      
      private var familyDist$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var familyOpName$field:String;
      
      private var avaiNum$field:uint;
      
      private var totalNum$field:uint;
      
      private var reputation$field:int;
      
      private var ability$field:UInt64;
      
      private var winReputation$field:int;
      
      private var failReputation$field:int;
      
      public var avaiUids:Array;
      
      private var residualTimes$field:uint;
      
      private var rank$field:uint;
      
      private var flagBase$field:uint;
      
      private var flagIcon$field:uint;
      
      private var familyLv$field:uint;
      
      private var strength$field:uint;
      
      private var winTimes$field:uint;
      
      public var bps:Array;
      
      private var leader$field:proto.PlayerBaseInfo;
      
      private var distName$field:String;
      
      public function FamilyExpeFamilyInfo()
      {
         avaiUids = [];
         bps = [];
         super();
      }
      
      public function clearFamilyName() : void
      {
         familyName$field = null;
      }
      
      public function get hasFamilyName() : Boolean
      {
         return familyName$field != null;
      }
      
      public function set familyName(param1:String) : void
      {
         familyName$field = param1;
      }
      
      public function get familyName() : String
      {
         return familyName$field;
      }
      
      public function clearFamilyDist() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         familyDist$field = new uint();
      }
      
      public function get hasFamilyDist() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set familyDist(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         familyDist$field = param1;
      }
      
      public function get familyDist() : uint
      {
         return familyDist$field;
      }
      
      public function clearFamilyOpName() : void
      {
         familyOpName$field = null;
      }
      
      public function get hasFamilyOpName() : Boolean
      {
         return familyOpName$field != null;
      }
      
      public function set familyOpName(param1:String) : void
      {
         familyOpName$field = param1;
      }
      
      public function get familyOpName() : String
      {
         return familyOpName$field;
      }
      
      public function clearAvaiNum() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         avaiNum$field = new uint();
      }
      
      public function get hasAvaiNum() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set avaiNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         avaiNum$field = param1;
      }
      
      public function get avaiNum() : uint
      {
         return avaiNum$field;
      }
      
      public function clearTotalNum() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         totalNum$field = new uint();
      }
      
      public function get hasTotalNum() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set totalNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         totalNum$field = param1;
      }
      
      public function get totalNum() : uint
      {
         return totalNum$field;
      }
      
      public function clearReputation() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         reputation$field = new int();
      }
      
      public function get hasReputation() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set reputation(param1:int) : void
      {
         hasField$0 = hasField$0 | 8;
         reputation$field = param1;
      }
      
      public function get reputation() : int
      {
         return reputation$field;
      }
      
      public function clearAbility() : void
      {
         ability$field = null;
      }
      
      public function get hasAbility() : Boolean
      {
         return ability$field != null;
      }
      
      public function set ability(param1:UInt64) : void
      {
         ability$field = param1;
      }
      
      public function get ability() : UInt64
      {
         return ability$field;
      }
      
      public function clearWinReputation() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         winReputation$field = new int();
      }
      
      public function get hasWinReputation() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set winReputation(param1:int) : void
      {
         hasField$0 = hasField$0 | 16;
         winReputation$field = param1;
      }
      
      public function get winReputation() : int
      {
         return winReputation$field;
      }
      
      public function clearFailReputation() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         failReputation$field = new int();
      }
      
      public function get hasFailReputation() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set failReputation(param1:int) : void
      {
         hasField$0 = hasField$0 | 32;
         failReputation$field = param1;
      }
      
      public function get failReputation() : int
      {
         return failReputation$field;
      }
      
      public function clearResidualTimes() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         residualTimes$field = new uint();
      }
      
      public function get hasResidualTimes() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set residualTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         residualTimes$field = param1;
      }
      
      public function get residualTimes() : uint
      {
         return residualTimes$field;
      }
      
      public function clearRank() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return rank$field;
      }
      
      public function clearFlagBase() : void
      {
         hasField$0 = hasField$0 & 4294967039;
         flagBase$field = new uint();
      }
      
      public function get hasFlagBase() : Boolean
      {
         return (hasField$0 & 256) != 0;
      }
      
      public function set flagBase(param1:uint) : void
      {
         hasField$0 = hasField$0 | 256;
         flagBase$field = param1;
      }
      
      public function get flagBase() : uint
      {
         return flagBase$field;
      }
      
      public function clearFlagIcon() : void
      {
         hasField$0 = hasField$0 & 4294966783;
         flagIcon$field = new uint();
      }
      
      public function get hasFlagIcon() : Boolean
      {
         return (hasField$0 & 512) != 0;
      }
      
      public function set flagIcon(param1:uint) : void
      {
         hasField$0 = hasField$0 | 512;
         flagIcon$field = param1;
      }
      
      public function get flagIcon() : uint
      {
         return flagIcon$field;
      }
      
      public function clearFamilyLv() : void
      {
         hasField$0 = hasField$0 & 4294966271;
         familyLv$field = new uint();
      }
      
      public function get hasFamilyLv() : Boolean
      {
         return (hasField$0 & 1024) != 0;
      }
      
      public function set familyLv(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1024;
         familyLv$field = param1;
      }
      
      public function get familyLv() : uint
      {
         return familyLv$field;
      }
      
      public function clearStrength() : void
      {
         hasField$0 = hasField$0 & 4294965247;
         strength$field = new uint();
      }
      
      public function get hasStrength() : Boolean
      {
         return (hasField$0 & 2048) != 0;
      }
      
      public function set strength(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2048;
         strength$field = param1;
      }
      
      public function get strength() : uint
      {
         return strength$field;
      }
      
      public function clearWinTimes() : void
      {
         hasField$0 = hasField$0 & 4294963199;
         winTimes$field = new uint();
      }
      
      public function get hasWinTimes() : Boolean
      {
         return (hasField$0 & 4096) != 0;
      }
      
      public function set winTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4096;
         winTimes$field = param1;
      }
      
      public function get winTimes() : uint
      {
         return winTimes$field;
      }
      
      public function clearLeader() : void
      {
         leader$field = null;
      }
      
      public function get hasLeader() : Boolean
      {
         return leader$field != null;
      }
      
      public function set leader(param1:proto.PlayerBaseInfo) : void
      {
         leader$field = param1;
      }
      
      public function get leader() : proto.PlayerBaseInfo
      {
         return leader$field;
      }
      
      public function clearDistName() : void
      {
         distName$field = null;
      }
      
      public function get hasDistName() : Boolean
      {
         return distName$field != null;
      }
      
      public function set distName(param1:String) : void
      {
         distName$field = param1;
      }
      
      public function get distName() : String
      {
         return distName$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = 0;
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.familyId);
         if(hasFamilyName)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,familyName$field);
         }
         if(hasFamilyDist)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,familyDist$field);
         }
         if(hasFamilyOpName)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,familyOpName$field);
         }
         if(hasAvaiNum)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,avaiNum$field);
         }
         if(hasTotalNum)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,totalNum$field);
         }
         if(hasReputation)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_INT32(param1,reputation$field);
         }
         if(hasAbility)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT64(param1,ability$field);
         }
         if(hasWinReputation)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_INT32(param1,winReputation$field);
         }
         if(hasFailReputation)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_INT32(param1,failReputation$field);
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.avaiUids.length)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT64(param1,this.avaiUids[_loc4_]);
            _loc4_++;
         }
         if(hasResidualTimes)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,residualTimes$field);
         }
         if(hasRank)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_UINT32(param1,rank$field);
         }
         if(hasFlagBase)
         {
            WriteUtils.writeTag(param1,0,14);
            WriteUtils.write$TYPE_UINT32(param1,flagBase$field);
         }
         if(hasFlagIcon)
         {
            WriteUtils.writeTag(param1,0,15);
            WriteUtils.write$TYPE_UINT32(param1,flagIcon$field);
         }
         if(hasFamilyLv)
         {
            WriteUtils.writeTag(param1,0,16);
            WriteUtils.write$TYPE_UINT32(param1,familyLv$field);
         }
         if(hasStrength)
         {
            WriteUtils.writeTag(param1,0,17);
            WriteUtils.write$TYPE_UINT32(param1,strength$field);
         }
         if(hasWinTimes)
         {
            WriteUtils.writeTag(param1,0,18);
            WriteUtils.write$TYPE_UINT32(param1,winTimes$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.bps.length)
         {
            WriteUtils.writeTag(param1,2,19);
            WriteUtils.write$TYPE_MESSAGE(param1,this.bps[_loc2_]);
            _loc2_++;
         }
         if(hasLeader)
         {
            WriteUtils.writeTag(param1,2,20);
            WriteUtils.write$TYPE_MESSAGE(param1,leader$field);
         }
         if(hasDistName)
         {
            WriteUtils.writeTag(param1,2,21);
            WriteUtils.write$TYPE_STRING(param1,distName$field);
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:* = 0;
         var _loc15_:uint = 0;
         var _loc3_:uint = 0;
         var _loc16_:uint = 0;
         var _loc14_:uint = 0;
         var _loc17_:uint = 0;
         var _loc9_:uint = 0;
         var _loc20_:uint = 0;
         var _loc12_:uint = 0;
         var _loc10_:uint = 0;
         var _loc6_:uint = 0;
         var _loc21_:uint = 0;
         var _loc13_:uint = 0;
         var _loc18_:uint = 0;
         var _loc5_:uint = 0;
         var _loc11_:uint = 0;
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         var _loc22_:uint = 0;
         var _loc19_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            var _loc23_:* = _loc7_ >> 3;
            if(1 !== _loc23_)
            {
               if(2 !== _loc23_)
               {
                  if(3 !== _loc23_)
                  {
                     if(4 !== _loc23_)
                     {
                        if(5 !== _loc23_)
                        {
                           if(6 !== _loc23_)
                           {
                              if(7 !== _loc23_)
                              {
                                 if(8 !== _loc23_)
                                 {
                                    if(9 !== _loc23_)
                                    {
                                       if(10 !== _loc23_)
                                       {
                                          if(11 !== _loc23_)
                                          {
                                             if(12 !== _loc23_)
                                             {
                                                if(13 !== _loc23_)
                                                {
                                                   if(14 !== _loc23_)
                                                   {
                                                      if(15 !== _loc23_)
                                                      {
                                                         if(16 !== _loc23_)
                                                         {
                                                            if(17 !== _loc23_)
                                                            {
                                                               if(18 !== _loc23_)
                                                               {
                                                                  if(19 !== _loc23_)
                                                                  {
                                                                     if(20 !== _loc23_)
                                                                     {
                                                                        if(21 !== _loc23_)
                                                                        {
                                                                           super.readUnknown(param1,_loc7_);
                                                                        }
                                                                        else
                                                                        {
                                                                           if(_loc19_ != 0)
                                                                           {
                                                                              throw new IOError("Bad data format: FamilyExpeFamilyInfo.distName cannot be set twice.");
                                                                           }
                                                                           _loc19_++;
                                                                           this.distName = ReadUtils.read$TYPE_STRING(param1);
                                                                        }
                                                                     }
                                                                     else
                                                                     {
                                                                        if(_loc22_ != 0)
                                                                        {
                                                                           throw new IOError("Bad data format: FamilyExpeFamilyInfo.leader cannot be set twice.");
                                                                        }
                                                                        _loc22_++;
                                                                        this.leader = new proto.PlayerBaseInfo();
                                                                        ReadUtils.read$TYPE_MESSAGE(param1,this.leader);
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     this.bps.push(ReadUtils.read$TYPE_MESSAGE(param1,new ITFamilyExpeBattlePlayers()));
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  if(_loc8_ != 0)
                                                                  {
                                                                     throw new IOError("Bad data format: FamilyExpeFamilyInfo.winTimes cannot be set twice.");
                                                                  }
                                                                  _loc8_++;
                                                                  this.winTimes = ReadUtils.read$TYPE_UINT32(param1);
                                                               }
                                                            }
                                                            else
                                                            {
                                                               if(_loc4_ != 0)
                                                               {
                                                                  throw new IOError("Bad data format: FamilyExpeFamilyInfo.strength cannot be set twice.");
                                                               }
                                                               _loc4_++;
                                                               this.strength = ReadUtils.read$TYPE_UINT32(param1);
                                                            }
                                                         }
                                                         else
                                                         {
                                                            if(_loc11_ != 0)
                                                            {
                                                               throw new IOError("Bad data format: FamilyExpeFamilyInfo.familyLv cannot be set twice.");
                                                            }
                                                            _loc11_++;
                                                            this.familyLv = ReadUtils.read$TYPE_UINT32(param1);
                                                         }
                                                      }
                                                      else
                                                      {
                                                         if(_loc5_ != 0)
                                                         {
                                                            throw new IOError("Bad data format: FamilyExpeFamilyInfo.flagIcon cannot be set twice.");
                                                         }
                                                         _loc5_++;
                                                         this.flagIcon = ReadUtils.read$TYPE_UINT32(param1);
                                                      }
                                                   }
                                                   else
                                                   {
                                                      if(_loc18_ != 0)
                                                      {
                                                         throw new IOError("Bad data format: FamilyExpeFamilyInfo.flagBase cannot be set twice.");
                                                      }
                                                      _loc18_++;
                                                      this.flagBase = ReadUtils.read$TYPE_UINT32(param1);
                                                   }
                                                }
                                                else
                                                {
                                                   if(_loc13_ != 0)
                                                   {
                                                      throw new IOError("Bad data format: FamilyExpeFamilyInfo.rank cannot be set twice.");
                                                   }
                                                   _loc13_++;
                                                   this.rank = ReadUtils.read$TYPE_UINT32(param1);
                                                }
                                             }
                                             else
                                             {
                                                if(_loc21_ != 0)
                                                {
                                                   throw new IOError("Bad data format: FamilyExpeFamilyInfo.residualTimes cannot be set twice.");
                                                }
                                                _loc21_++;
                                                this.residualTimes = ReadUtils.read$TYPE_UINT32(param1);
                                             }
                                          }
                                          else if((_loc7_ & 7) == 2)
                                          {
                                             ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.avaiUids);
                                          }
                                          else
                                          {
                                             this.avaiUids.push(ReadUtils.read$TYPE_UINT64(param1));
                                          }
                                       }
                                       else
                                       {
                                          if(_loc6_ != 0)
                                          {
                                             throw new IOError("Bad data format: FamilyExpeFamilyInfo.failReputation cannot be set twice.");
                                          }
                                          _loc6_++;
                                          this.failReputation = ReadUtils.read$TYPE_INT32(param1);
                                       }
                                    }
                                    else
                                    {
                                       if(_loc10_ != 0)
                                       {
                                          throw new IOError("Bad data format: FamilyExpeFamilyInfo.winReputation cannot be set twice.");
                                       }
                                       _loc10_++;
                                       this.winReputation = ReadUtils.read$TYPE_INT32(param1);
                                    }
                                 }
                                 else
                                 {
                                    if(_loc12_ != 0)
                                    {
                                       throw new IOError("Bad data format: FamilyExpeFamilyInfo.ability cannot be set twice.");
                                    }
                                    _loc12_++;
                                    this.ability = ReadUtils.read$TYPE_UINT64(param1);
                                 }
                              }
                              else
                              {
                                 if(_loc20_ != 0)
                                 {
                                    throw new IOError("Bad data format: FamilyExpeFamilyInfo.reputation cannot be set twice.");
                                 }
                                 _loc20_++;
                                 this.reputation = ReadUtils.read$TYPE_INT32(param1);
                              }
                           }
                           else
                           {
                              if(_loc9_ != 0)
                              {
                                 throw new IOError("Bad data format: FamilyExpeFamilyInfo.totalNum cannot be set twice.");
                              }
                              _loc9_++;
                              this.totalNum = ReadUtils.read$TYPE_UINT32(param1);
                           }
                        }
                        else
                        {
                           if(_loc17_ != 0)
                           {
                              throw new IOError("Bad data format: FamilyExpeFamilyInfo.avaiNum cannot be set twice.");
                           }
                           _loc17_++;
                           this.avaiNum = ReadUtils.read$TYPE_UINT32(param1);
                        }
                     }
                     else
                     {
                        if(_loc14_ != 0)
                        {
                           throw new IOError("Bad data format: FamilyExpeFamilyInfo.familyOpName cannot be set twice.");
                        }
                        _loc14_++;
                        this.familyOpName = ReadUtils.read$TYPE_STRING(param1);
                     }
                  }
                  else
                  {
                     if(_loc16_ != 0)
                     {
                        throw new IOError("Bad data format: FamilyExpeFamilyInfo.familyDist cannot be set twice.");
                     }
                     _loc16_++;
                     this.familyDist = ReadUtils.read$TYPE_UINT32(param1);
                  }
               }
               else
               {
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeFamilyInfo.familyName cannot be set twice.");
                  }
                  _loc3_++;
                  this.familyName = ReadUtils.read$TYPE_STRING(param1);
               }
            }
            else
            {
               if(_loc15_ != 0)
               {
                  throw new IOError("Bad data format: FamilyExpeFamilyInfo.familyId cannot be set twice.");
               }
               _loc15_++;
               this.familyId = ReadUtils.read$TYPE_UINT64(param1);
            }
         }
      }
   }
}
