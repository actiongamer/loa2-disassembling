package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GuajiInfoRes extends Message
   {
      
      public static const TEAMID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.GuajiInfoRes.teamId","teamId",8 | 0);
      
      public static const STARTTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoRes.startTm","startTm",16 | 0);
      
      public static const KILLED:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoRes.killed","killed",24 | 0);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoRes.rank","rank",32 | 0);
      
      public static const AUTOTEAM:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GuajiInfoRes.autoTeam","autoTeam",40 | 0);
      
      public static const STARTFIGHT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GuajiInfoRes.startFight","startFight",48 | 0);
      
      public static const CURGUAJIID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoRes.curGuajiId","curGuajiId",56 | 0);
      
      public static const MAXPASSEDGUAJIID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoRes.maxPassedGuajiId","maxPassedGuajiId",64 | 0);
      
      public static const WINCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoRes.winCount","winCount",72 | 0);
      
      public static const LOSECOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoRes.loseCount","loseCount",80 | 0);
      
      public static const TOTALTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoRes.totalTm","totalTm",88 | 0);
      
      public static const REPORTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.GuajiInfoRes.reports","reports",96 | 2,GuajiReport);
      
      public static const PVPCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoRes.pvpCount","pvpCount",104 | 0);
      
      public static const IMMUTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoRes.immuTm","immuTm",112 | 0);
      
      public static const GJSPEED:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoRes.gjSpeed","gjSpeed",120 | 0);
      
      public static const STEALCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoRes.stealCount","stealCount",128 | 0);
      
      public static const NEXTPVPCOUNTTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoRes.nextPvpCountTm","nextPvpCountTm",136 | 0);
      
      public static const TODAYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoRes.todayRank","todayRank",144 | 0);
      
      public static const YESTODAYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiInfoRes.yestodayRank","yestodayRank",152 | 0);
      
      public static const YESTODAYRWDISGET:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GuajiInfoRes.yestodayRwdIsGet","yestodayRwdIsGet",160 | 0);
       
      
      public var teamId:UInt64;
      
      public var startTm:uint;
      
      public var killed:uint;
      
      public var rank:uint;
      
      public var autoTeam:Boolean;
      
      public var startFight:Boolean;
      
      public var curGuajiId:uint;
      
      public var maxPassedGuajiId:uint;
      
      public var winCount:uint;
      
      public var loseCount:uint;
      
      private var totalTm$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var reports:Array;
      
      private var pvpCount$field:uint;
      
      private var immuTm$field:uint;
      
      private var gjSpeed$field:uint;
      
      private var stealCount$field:uint;
      
      private var nextPvpCountTm$field:uint;
      
      private var todayRank$field:uint;
      
      private var yestodayRank$field:uint;
      
      private var yestodayRwdIsGet$field:Boolean;
      
      public function GuajiInfoRes()
      {
         reports = [];
         super();
      }
      
      public function clearTotalTm() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         totalTm$field = new uint();
      }
      
      public function get hasTotalTm() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set totalTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         totalTm$field = param1;
      }
      
      public function get totalTm() : uint
      {
         return totalTm$field;
      }
      
      public function clearPvpCount() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         pvpCount$field = new uint();
      }
      
      public function get hasPvpCount() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set pvpCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         pvpCount$field = param1;
      }
      
      public function get pvpCount() : uint
      {
         return pvpCount$field;
      }
      
      public function clearImmuTm() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         immuTm$field = new uint();
      }
      
      public function get hasImmuTm() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set immuTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         immuTm$field = param1;
      }
      
      public function get immuTm() : uint
      {
         return immuTm$field;
      }
      
      public function clearGjSpeed() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         gjSpeed$field = new uint();
      }
      
      public function get hasGjSpeed() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set gjSpeed(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         gjSpeed$field = param1;
      }
      
      public function get gjSpeed() : uint
      {
         return gjSpeed$field;
      }
      
      public function clearStealCount() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         stealCount$field = new uint();
      }
      
      public function get hasStealCount() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set stealCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         stealCount$field = param1;
      }
      
      public function get stealCount() : uint
      {
         return stealCount$field;
      }
      
      public function clearNextPvpCountTm() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         nextPvpCountTm$field = new uint();
      }
      
      public function get hasNextPvpCountTm() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set nextPvpCountTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         nextPvpCountTm$field = param1;
      }
      
      public function get nextPvpCountTm() : uint
      {
         return nextPvpCountTm$field;
      }
      
      public function clearTodayRank() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         todayRank$field = new uint();
      }
      
      public function get hasTodayRank() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set todayRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         todayRank$field = param1;
      }
      
      public function get todayRank() : uint
      {
         return todayRank$field;
      }
      
      public function clearYestodayRank() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         yestodayRank$field = new uint();
      }
      
      public function get hasYestodayRank() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set yestodayRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         yestodayRank$field = param1;
      }
      
      public function get yestodayRank() : uint
      {
         return yestodayRank$field;
      }
      
      public function clearYestodayRwdIsGet() : void
      {
         hasField$0 = hasField$0 & 4294967039;
         yestodayRwdIsGet$field = new Boolean();
      }
      
      public function get hasYestodayRwdIsGet() : Boolean
      {
         return (hasField$0 & 256) != 0;
      }
      
      public function set yestodayRwdIsGet(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 256;
         yestodayRwdIsGet$field = param1;
      }
      
      public function get yestodayRwdIsGet() : Boolean
      {
         return yestodayRwdIsGet$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.teamId);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.startTm);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.killed);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.rank);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_BOOL(param1,this.autoTeam);
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_BOOL(param1,this.startFight);
         WriteUtils.writeTag(param1,0,7);
         WriteUtils.write$TYPE_UINT32(param1,this.curGuajiId);
         WriteUtils.writeTag(param1,0,8);
         WriteUtils.write$TYPE_UINT32(param1,this.maxPassedGuajiId);
         WriteUtils.writeTag(param1,0,9);
         WriteUtils.write$TYPE_UINT32(param1,this.winCount);
         WriteUtils.writeTag(param1,0,10);
         WriteUtils.write$TYPE_UINT32(param1,this.loseCount);
         if(hasTotalTm)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,totalTm$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.reports.length)
         {
            WriteUtils.writeTag(param1,2,12);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reports[_loc2_]);
            _loc2_++;
         }
         if(hasPvpCount)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_UINT32(param1,pvpCount$field);
         }
         if(hasImmuTm)
         {
            WriteUtils.writeTag(param1,0,14);
            WriteUtils.write$TYPE_UINT32(param1,immuTm$field);
         }
         if(hasGjSpeed)
         {
            WriteUtils.writeTag(param1,0,15);
            WriteUtils.write$TYPE_UINT32(param1,gjSpeed$field);
         }
         if(hasStealCount)
         {
            WriteUtils.writeTag(param1,0,16);
            WriteUtils.write$TYPE_UINT32(param1,stealCount$field);
         }
         if(hasNextPvpCountTm)
         {
            WriteUtils.writeTag(param1,0,17);
            WriteUtils.write$TYPE_UINT32(param1,nextPvpCountTm$field);
         }
         if(hasTodayRank)
         {
            WriteUtils.writeTag(param1,0,18);
            WriteUtils.write$TYPE_UINT32(param1,todayRank$field);
         }
         if(hasYestodayRank)
         {
            WriteUtils.writeTag(param1,0,19);
            WriteUtils.write$TYPE_UINT32(param1,yestodayRank$field);
         }
         if(hasYestodayRwdIsGet)
         {
            WriteUtils.writeTag(param1,0,20);
            WriteUtils.write$TYPE_BOOL(param1,yestodayRwdIsGet$field);
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
         var _loc11_:* = 0;
         var _loc8_:uint = 0;
         var _loc17_:uint = 0;
         var _loc20_:uint = 0;
         var _loc15_:uint = 0;
         var _loc6_:uint = 0;
         var _loc19_:uint = 0;
         var _loc10_:uint = 0;
         var _loc12_:uint = 0;
         var _loc22_:uint = 0;
         var _loc21_:uint = 0;
         var _loc18_:uint = 0;
         var _loc5_:uint = 0;
         var _loc9_:uint = 0;
         var _loc16_:uint = 0;
         var _loc4_:uint = 0;
         var _loc14_:uint = 0;
         var _loc3_:uint = 0;
         var _loc13_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc11_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            var _loc23_:* = _loc11_ >> 3;
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
                                                                        super.readUnknown(param1,_loc11_);
                                                                     }
                                                                     else
                                                                     {
                                                                        if(_loc7_ != 0)
                                                                        {
                                                                           throw new IOError("Bad data format: GuajiInfoRes.yestodayRwdIsGet cannot be set twice.");
                                                                        }
                                                                        _loc7_++;
                                                                        this.yestodayRwdIsGet = ReadUtils.read$TYPE_BOOL(param1);
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     if(_loc13_ != 0)
                                                                     {
                                                                        throw new IOError("Bad data format: GuajiInfoRes.yestodayRank cannot be set twice.");
                                                                     }
                                                                     _loc13_++;
                                                                     this.yestodayRank = ReadUtils.read$TYPE_UINT32(param1);
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  if(_loc3_ != 0)
                                                                  {
                                                                     throw new IOError("Bad data format: GuajiInfoRes.todayRank cannot be set twice.");
                                                                  }
                                                                  _loc3_++;
                                                                  this.todayRank = ReadUtils.read$TYPE_UINT32(param1);
                                                               }
                                                            }
                                                            else
                                                            {
                                                               if(_loc14_ != 0)
                                                               {
                                                                  throw new IOError("Bad data format: GuajiInfoRes.nextPvpCountTm cannot be set twice.");
                                                               }
                                                               _loc14_++;
                                                               this.nextPvpCountTm = ReadUtils.read$TYPE_UINT32(param1);
                                                            }
                                                         }
                                                         else
                                                         {
                                                            if(_loc4_ != 0)
                                                            {
                                                               throw new IOError("Bad data format: GuajiInfoRes.stealCount cannot be set twice.");
                                                            }
                                                            _loc4_++;
                                                            this.stealCount = ReadUtils.read$TYPE_UINT32(param1);
                                                         }
                                                      }
                                                      else
                                                      {
                                                         if(_loc16_ != 0)
                                                         {
                                                            throw new IOError("Bad data format: GuajiInfoRes.gjSpeed cannot be set twice.");
                                                         }
                                                         _loc16_++;
                                                         this.gjSpeed = ReadUtils.read$TYPE_UINT32(param1);
                                                      }
                                                   }
                                                   else
                                                   {
                                                      if(_loc9_ != 0)
                                                      {
                                                         throw new IOError("Bad data format: GuajiInfoRes.immuTm cannot be set twice.");
                                                      }
                                                      _loc9_++;
                                                      this.immuTm = ReadUtils.read$TYPE_UINT32(param1);
                                                   }
                                                }
                                                else
                                                {
                                                   if(_loc5_ != 0)
                                                   {
                                                      throw new IOError("Bad data format: GuajiInfoRes.pvpCount cannot be set twice.");
                                                   }
                                                   _loc5_++;
                                                   this.pvpCount = ReadUtils.read$TYPE_UINT32(param1);
                                                }
                                             }
                                             else
                                             {
                                                this.reports.push(ReadUtils.read$TYPE_MESSAGE(param1,new GuajiReport()));
                                             }
                                          }
                                          else
                                          {
                                             if(_loc18_ != 0)
                                             {
                                                throw new IOError("Bad data format: GuajiInfoRes.totalTm cannot be set twice.");
                                             }
                                             _loc18_++;
                                             this.totalTm = ReadUtils.read$TYPE_UINT32(param1);
                                          }
                                       }
                                       else
                                       {
                                          if(_loc21_ != 0)
                                          {
                                             throw new IOError("Bad data format: GuajiInfoRes.loseCount cannot be set twice.");
                                          }
                                          _loc21_++;
                                          this.loseCount = ReadUtils.read$TYPE_UINT32(param1);
                                       }
                                    }
                                    else
                                    {
                                       if(_loc22_ != 0)
                                       {
                                          throw new IOError("Bad data format: GuajiInfoRes.winCount cannot be set twice.");
                                       }
                                       _loc22_++;
                                       this.winCount = ReadUtils.read$TYPE_UINT32(param1);
                                    }
                                 }
                                 else
                                 {
                                    if(_loc12_ != 0)
                                    {
                                       throw new IOError("Bad data format: GuajiInfoRes.maxPassedGuajiId cannot be set twice.");
                                    }
                                    _loc12_++;
                                    this.maxPassedGuajiId = ReadUtils.read$TYPE_UINT32(param1);
                                 }
                              }
                              else
                              {
                                 if(_loc10_ != 0)
                                 {
                                    throw new IOError("Bad data format: GuajiInfoRes.curGuajiId cannot be set twice.");
                                 }
                                 _loc10_++;
                                 this.curGuajiId = ReadUtils.read$TYPE_UINT32(param1);
                              }
                           }
                           else
                           {
                              if(_loc19_ != 0)
                              {
                                 throw new IOError("Bad data format: GuajiInfoRes.startFight cannot be set twice.");
                              }
                              _loc19_++;
                              this.startFight = ReadUtils.read$TYPE_BOOL(param1);
                           }
                        }
                        else
                        {
                           if(_loc6_ != 0)
                           {
                              throw new IOError("Bad data format: GuajiInfoRes.autoTeam cannot be set twice.");
                           }
                           _loc6_++;
                           this.autoTeam = ReadUtils.read$TYPE_BOOL(param1);
                        }
                     }
                     else
                     {
                        if(_loc15_ != 0)
                        {
                           throw new IOError("Bad data format: GuajiInfoRes.rank cannot be set twice.");
                        }
                        _loc15_++;
                        this.rank = ReadUtils.read$TYPE_UINT32(param1);
                     }
                  }
                  else
                  {
                     if(_loc20_ != 0)
                     {
                        throw new IOError("Bad data format: GuajiInfoRes.killed cannot be set twice.");
                     }
                     _loc20_++;
                     this.killed = ReadUtils.read$TYPE_UINT32(param1);
                  }
               }
               else
               {
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiInfoRes.startTm cannot be set twice.");
                  }
                  _loc17_++;
                  this.startTm = ReadUtils.read$TYPE_UINT32(param1);
               }
            }
            else
            {
               if(_loc8_ != 0)
               {
                  throw new IOError("Bad data format: GuajiInfoRes.teamId cannot be set twice.");
               }
               _loc8_++;
               this.teamId = ReadUtils.read$TYPE_UINT64(param1);
            }
         }
      }
   }
}
