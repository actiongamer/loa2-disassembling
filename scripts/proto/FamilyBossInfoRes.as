package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyBossInfoRes extends Message
   {
      
      public static const STATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossInfoRes.state","state",8 | 0);
      
      public static const AUTOFIGHT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FamilyBossInfoRes.autofight","autofight",16 | 0);
      
      public static const SIMPLEREPORT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FamilyBossInfoRes.simplereport","simplereport",24 | 0);
      
      public static const REMAINTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossInfoRes.remaintimes","remaintimes",32 | 0);
      
      public static const CURRSTARTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossInfoRes.currstarttime","currstarttime",40 | 0);
      
      public static const NEXTSTARTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossInfoRes.nextstarttime","nextstarttime",48 | 0);
      
      public static const GUWUCDOVERTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossInfoRes.guwucdovertime","guwucdovertime",56 | 0);
      
      public static const NEXTRESETTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossInfoRes.nextresettime","nextresettime",64 | 0);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossInfoRes.rank","rank",72 | 0);
      
      public static const BOSSINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyBossInfoRes.bossinfo","bossinfo",80 | 2,FamilyBossInfo);
      
      public static const HURTRANKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyBossInfoRes.hurtranks","hurtranks",88 | 2,FamilyBossRankData);
      
      public static const TOTALHURT:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FamilyBossInfoRes.totalhurt","totalhurt",96 | 0);
      
      public static const ISDEAD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FamilyBossInfoRes.isdead","isdead",104 | 0);
      
      public static const LASTDEADTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossInfoRes.lastdeadtime","lastdeadtime",112 | 0);
      
      public static const NORMALGUWUCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossInfoRes.normalguwucount","normalguwucount",120 | 0);
      
      public static const SUPERGUWUCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossInfoRes.superguwucount","superguwucount",128 | 0);
      
      public static const BUFFIDS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.FamilyBossInfoRes.buffids","buffids",136 | 0);
      
      public static const NEXTSTATETIMELONG:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossInfoRes.nextstatetimelong","nextstatetimelong",144 | 0);
      
      public static const REWARDIDS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.FamilyBossInfoRes.rewardids","rewardids",152 | 0);
      
      public static const ISNEXTSELECT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FamilyBossInfoRes.isnextselect","isnextselect",160 | 0);
       
      
      public var state:uint;
      
      public var autofight:Boolean;
      
      public var simplereport:Boolean;
      
      public var remaintimes:uint;
      
      public var currstarttime:uint;
      
      public var nextstarttime:uint;
      
      public var guwucdovertime:uint;
      
      public var nextresettime:uint;
      
      public var rank:uint;
      
      public var bossinfo:Array;
      
      public var hurtranks:Array;
      
      public var totalhurt:UInt64;
      
      public var isdead:Boolean;
      
      public var lastdeadtime:uint;
      
      public var normalguwucount:uint;
      
      public var superguwucount:uint;
      
      public var buffids:Array;
      
      public var nextstatetimelong:uint;
      
      public var rewardids:Array;
      
      public var isnextselect:Boolean;
      
      public function FamilyBossInfoRes()
      {
         bossinfo = [];
         hurtranks = [];
         buffids = [];
         rewardids = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc6_:* = 0;
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.state);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_BOOL(param1,this.autofight);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_BOOL(param1,this.simplereport);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.remaintimes);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.currstarttime);
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_UINT32(param1,this.nextstarttime);
         WriteUtils.writeTag(param1,0,7);
         WriteUtils.write$TYPE_UINT32(param1,this.guwucdovertime);
         WriteUtils.writeTag(param1,0,8);
         WriteUtils.write$TYPE_UINT32(param1,this.nextresettime);
         WriteUtils.writeTag(param1,0,9);
         WriteUtils.write$TYPE_UINT32(param1,this.rank);
         _loc6_ = uint(0);
         while(_loc6_ < this.bossinfo.length)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.bossinfo[_loc6_]);
            _loc6_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.hurtranks.length)
         {
            WriteUtils.writeTag(param1,2,11);
            WriteUtils.write$TYPE_MESSAGE(param1,this.hurtranks[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,12);
         WriteUtils.write$TYPE_UINT64(param1,this.totalhurt);
         WriteUtils.writeTag(param1,0,13);
         WriteUtils.write$TYPE_BOOL(param1,this.isdead);
         WriteUtils.writeTag(param1,0,14);
         WriteUtils.write$TYPE_UINT32(param1,this.lastdeadtime);
         WriteUtils.writeTag(param1,0,15);
         WriteUtils.write$TYPE_UINT32(param1,this.normalguwucount);
         WriteUtils.writeTag(param1,0,16);
         WriteUtils.write$TYPE_UINT32(param1,this.superguwucount);
         _loc3_ = uint(0);
         while(_loc3_ < this.buffids.length)
         {
            WriteUtils.writeTag(param1,0,17);
            WriteUtils.write$TYPE_UINT32(param1,this.buffids[_loc3_]);
            _loc3_++;
         }
         WriteUtils.writeTag(param1,0,18);
         WriteUtils.write$TYPE_UINT32(param1,this.nextstatetimelong);
         _loc4_ = uint(0);
         while(_loc4_ < this.rewardids.length)
         {
            WriteUtils.writeTag(param1,0,19);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardids[_loc4_]);
            _loc4_++;
         }
         WriteUtils.writeTag(param1,0,20);
         WriteUtils.write$TYPE_BOOL(param1,this.isnextselect);
         var _loc8_:int = 0;
         var _loc7_:* = this;
         for(var _loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:* = 0;
         var _loc5_:uint = 0;
         var _loc15_:uint = 0;
         var _loc16_:uint = 0;
         var _loc3_:uint = 0;
         var _loc18_:uint = 0;
         var _loc9_:uint = 0;
         var _loc19_:uint = 0;
         var _loc13_:uint = 0;
         var _loc14_:uint = 0;
         var _loc10_:uint = 0;
         var _loc8_:uint = 0;
         var _loc12_:uint = 0;
         var _loc11_:uint = 0;
         var _loc7_:uint = 0;
         var _loc17_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            var _loc20_:* = _loc6_ >> 3;
            if(1 !== _loc20_)
            {
               if(2 !== _loc20_)
               {
                  if(3 !== _loc20_)
                  {
                     if(4 !== _loc20_)
                     {
                        if(5 !== _loc20_)
                        {
                           if(6 !== _loc20_)
                           {
                              if(7 !== _loc20_)
                              {
                                 if(8 !== _loc20_)
                                 {
                                    if(9 !== _loc20_)
                                    {
                                       if(10 !== _loc20_)
                                       {
                                          if(11 !== _loc20_)
                                          {
                                             if(12 !== _loc20_)
                                             {
                                                if(13 !== _loc20_)
                                                {
                                                   if(14 !== _loc20_)
                                                   {
                                                      if(15 !== _loc20_)
                                                      {
                                                         if(16 !== _loc20_)
                                                         {
                                                            if(17 !== _loc20_)
                                                            {
                                                               if(18 !== _loc20_)
                                                               {
                                                                  if(19 !== _loc20_)
                                                                  {
                                                                     if(20 !== _loc20_)
                                                                     {
                                                                        super.readUnknown(param1,_loc6_);
                                                                     }
                                                                     else
                                                                     {
                                                                        if(_loc4_ != 0)
                                                                        {
                                                                           throw new IOError("Bad data format: FamilyBossInfoRes.isnextselect cannot be set twice.");
                                                                        }
                                                                        _loc4_++;
                                                                        this.isnextselect = ReadUtils.read$TYPE_BOOL(param1);
                                                                     }
                                                                  }
                                                                  else if((_loc6_ & 7) == 2)
                                                                  {
                                                                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.rewardids);
                                                                  }
                                                                  else
                                                                  {
                                                                     this.rewardids.push(ReadUtils.read$TYPE_UINT32(param1));
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  if(_loc17_ != 0)
                                                                  {
                                                                     throw new IOError("Bad data format: FamilyBossInfoRes.nextstatetimelong cannot be set twice.");
                                                                  }
                                                                  _loc17_++;
                                                                  this.nextstatetimelong = ReadUtils.read$TYPE_UINT32(param1);
                                                               }
                                                            }
                                                            else if((_loc6_ & 7) == 2)
                                                            {
                                                               ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.buffids);
                                                            }
                                                            else
                                                            {
                                                               this.buffids.push(ReadUtils.read$TYPE_UINT32(param1));
                                                            }
                                                         }
                                                         else
                                                         {
                                                            if(_loc7_ != 0)
                                                            {
                                                               throw new IOError("Bad data format: FamilyBossInfoRes.superguwucount cannot be set twice.");
                                                            }
                                                            _loc7_++;
                                                            this.superguwucount = ReadUtils.read$TYPE_UINT32(param1);
                                                         }
                                                      }
                                                      else
                                                      {
                                                         if(_loc11_ != 0)
                                                         {
                                                            throw new IOError("Bad data format: FamilyBossInfoRes.normalguwucount cannot be set twice.");
                                                         }
                                                         _loc11_++;
                                                         this.normalguwucount = ReadUtils.read$TYPE_UINT32(param1);
                                                      }
                                                   }
                                                   else
                                                   {
                                                      if(_loc12_ != 0)
                                                      {
                                                         throw new IOError("Bad data format: FamilyBossInfoRes.lastdeadtime cannot be set twice.");
                                                      }
                                                      _loc12_++;
                                                      this.lastdeadtime = ReadUtils.read$TYPE_UINT32(param1);
                                                   }
                                                }
                                                else
                                                {
                                                   if(_loc8_ != 0)
                                                   {
                                                      throw new IOError("Bad data format: FamilyBossInfoRes.isdead cannot be set twice.");
                                                   }
                                                   _loc8_++;
                                                   this.isdead = ReadUtils.read$TYPE_BOOL(param1);
                                                }
                                             }
                                             else
                                             {
                                                if(_loc10_ != 0)
                                                {
                                                   throw new IOError("Bad data format: FamilyBossInfoRes.totalhurt cannot be set twice.");
                                                }
                                                _loc10_++;
                                                this.totalhurt = ReadUtils.read$TYPE_UINT64(param1);
                                             }
                                          }
                                          else
                                          {
                                             this.hurtranks.push(ReadUtils.read$TYPE_MESSAGE(param1,new FamilyBossRankData()));
                                          }
                                       }
                                       else
                                       {
                                          this.bossinfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new FamilyBossInfo()));
                                       }
                                    }
                                    else
                                    {
                                       if(_loc14_ != 0)
                                       {
                                          throw new IOError("Bad data format: FamilyBossInfoRes.rank cannot be set twice.");
                                       }
                                       _loc14_++;
                                       this.rank = ReadUtils.read$TYPE_UINT32(param1);
                                    }
                                 }
                                 else
                                 {
                                    if(_loc13_ != 0)
                                    {
                                       throw new IOError("Bad data format: FamilyBossInfoRes.nextresettime cannot be set twice.");
                                    }
                                    _loc13_++;
                                    this.nextresettime = ReadUtils.read$TYPE_UINT32(param1);
                                 }
                              }
                              else
                              {
                                 if(_loc19_ != 0)
                                 {
                                    throw new IOError("Bad data format: FamilyBossInfoRes.guwucdovertime cannot be set twice.");
                                 }
                                 _loc19_++;
                                 this.guwucdovertime = ReadUtils.read$TYPE_UINT32(param1);
                              }
                           }
                           else
                           {
                              if(_loc9_ != 0)
                              {
                                 throw new IOError("Bad data format: FamilyBossInfoRes.nextstarttime cannot be set twice.");
                              }
                              _loc9_++;
                              this.nextstarttime = ReadUtils.read$TYPE_UINT32(param1);
                           }
                        }
                        else
                        {
                           if(_loc18_ != 0)
                           {
                              throw new IOError("Bad data format: FamilyBossInfoRes.currstarttime cannot be set twice.");
                           }
                           _loc18_++;
                           this.currstarttime = ReadUtils.read$TYPE_UINT32(param1);
                        }
                     }
                     else
                     {
                        if(_loc3_ != 0)
                        {
                           throw new IOError("Bad data format: FamilyBossInfoRes.remaintimes cannot be set twice.");
                        }
                        _loc3_++;
                        this.remaintimes = ReadUtils.read$TYPE_UINT32(param1);
                     }
                  }
                  else
                  {
                     if(_loc16_ != 0)
                     {
                        throw new IOError("Bad data format: FamilyBossInfoRes.simplereport cannot be set twice.");
                     }
                     _loc16_++;
                     this.simplereport = ReadUtils.read$TYPE_BOOL(param1);
                  }
               }
               else
               {
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyBossInfoRes.autofight cannot be set twice.");
                  }
                  _loc15_++;
                  this.autofight = ReadUtils.read$TYPE_BOOL(param1);
               }
            }
            else
            {
               if(_loc5_ != 0)
               {
                  throw new IOError("Bad data format: FamilyBossInfoRes.state cannot be set twice.");
               }
               _loc5_++;
               this.state = ReadUtils.read$TYPE_UINT32(param1);
            }
         }
      }
   }
}
