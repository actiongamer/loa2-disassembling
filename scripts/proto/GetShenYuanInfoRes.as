package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GetShenYuanInfoRes extends Message
   {
      
      public static const CANREVIVE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetShenYuanInfoRes.canRevive","canRevive",8 | 0);
      
      public static const CURRENTLAYER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetShenYuanInfoRes.currentlayer","currentlayer",16 | 0);
      
      public static const NOWSTAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetShenYuanInfoRes.nowstar","nowstar",24 | 0);
      
      public static const BUFFID:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.GetShenYuanInfoRes.buffid","buffid",32 | 2,BuffInfo);
      
      public static const MONSTER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.GetShenYuanInfoRes.monster","monster",40 | 2,Monster);
      
      public static const TONGGUAN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GetShenYuanInfoRes.tongguan","tongguan",48 | 0);
      
      public static const NUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetShenYuanInfoRes.num","num",56 | 0);
      
      public static const BUFF:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.GetShenYuanInfoRes.buff","buff",64 | 2,ShenYuanBuff);
      
      public static const BOX:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GetShenYuanInfoRes.box","box",72 | 0);
      
      public static const SHENYUANCOIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetShenYuanInfoRes.shenyuancoin","shenyuancoin",80 | 0);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetShenYuanInfoRes.rank","rank",88 | 0);
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetShenYuanInfoRes.time","time",96 | 0);
      
      public static const CANGETREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GetShenYuanInfoRes.canGetReward","canGetReward",104 | 0);
      
      public static const LASTRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetShenYuanInfoRes.lastrank","lastrank",112 | 0);
      
      public static const TOPSTAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetShenYuanInfoRes.topStar","topStar",120 | 0);
      
      public static const MONSTERSFORNEXTLAYERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.GetShenYuanInfoRes.monstersForNextLayers","monstersForNextLayers",128 | 2,Monster);
      
      public static const HELPTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetShenYuanInfoRes.helptime","helptime",136 | 0);
      
      public static const CANREACHLAYER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetShenYuanInfoRes.canReachLayer","canReachLayer",144 | 0);
      
      public static const HISTTOPSTAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetShenYuanInfoRes.histTopStar","histTopStar",152 | 0);
      
      public static const LUCKVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetShenYuanInfoRes.luckValue","luckValue",160 | 0);
       
      
      public var canRevive:uint;
      
      public var currentlayer:uint;
      
      public var nowstar:uint;
      
      public var buffid:Array;
      
      public var monster:Array;
      
      public var tongguan:Boolean;
      
      private var num$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var buff:Array;
      
      private var box$field:Boolean;
      
      public var shenyuancoin:uint;
      
      private var rank$field:uint;
      
      public var time:uint;
      
      private var canGetReward$field:Boolean;
      
      private var lastrank$field:uint;
      
      private var topStar$field:uint;
      
      public var monstersForNextLayers:Array;
      
      private var helptime$field:uint;
      
      private var canReachLayer$field:uint;
      
      private var histTopStar$field:uint;
      
      private var luckValue$field:uint;
      
      public function GetShenYuanInfoRes()
      {
         buffid = [];
         monster = [];
         buff = [];
         monstersForNextLayers = [];
         super();
      }
      
      public function clearNum() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         num$field = new uint();
      }
      
      public function get hasNum() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set num(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         num$field = param1;
      }
      
      public function get num() : uint
      {
         return num$field;
      }
      
      public function clearBox() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         box$field = new Boolean();
      }
      
      public function get hasBox() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set box(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 2;
         box$field = param1;
      }
      
      public function get box() : Boolean
      {
         return box$field;
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
      
      public function clearCanGetReward() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         canGetReward$field = new Boolean();
      }
      
      public function get hasCanGetReward() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set canGetReward(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 8;
         canGetReward$field = param1;
      }
      
      public function get canGetReward() : Boolean
      {
         return canGetReward$field;
      }
      
      public function clearLastrank() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         lastrank$field = new uint();
      }
      
      public function get hasLastrank() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set lastrank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         lastrank$field = param1;
      }
      
      public function get lastrank() : uint
      {
         return lastrank$field;
      }
      
      public function clearTopStar() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         topStar$field = new uint();
      }
      
      public function get hasTopStar() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set topStar(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         topStar$field = param1;
      }
      
      public function get topStar() : uint
      {
         return topStar$field;
      }
      
      public function clearHelptime() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         helptime$field = new uint();
      }
      
      public function get hasHelptime() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set helptime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         helptime$field = param1;
      }
      
      public function get helptime() : uint
      {
         return helptime$field;
      }
      
      public function clearCanReachLayer() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         canReachLayer$field = new uint();
      }
      
      public function get hasCanReachLayer() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set canReachLayer(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         canReachLayer$field = param1;
      }
      
      public function get canReachLayer() : uint
      {
         return canReachLayer$field;
      }
      
      public function clearHistTopStar() : void
      {
         hasField$0 = hasField$0 & 4294967039;
         histTopStar$field = new uint();
      }
      
      public function get hasHistTopStar() : Boolean
      {
         return (hasField$0 & 256) != 0;
      }
      
      public function set histTopStar(param1:uint) : void
      {
         hasField$0 = hasField$0 | 256;
         histTopStar$field = param1;
      }
      
      public function get histTopStar() : uint
      {
         return histTopStar$field;
      }
      
      public function clearLuckValue() : void
      {
         hasField$0 = hasField$0 & 4294966783;
         luckValue$field = new uint();
      }
      
      public function get hasLuckValue() : Boolean
      {
         return (hasField$0 & 512) != 0;
      }
      
      public function set luckValue(param1:uint) : void
      {
         hasField$0 = hasField$0 | 512;
         luckValue$field = param1;
      }
      
      public function get luckValue() : uint
      {
         return luckValue$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc5_:* = 0;
         var _loc2_:* = 0;
         var _loc4_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.canRevive);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.currentlayer);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.nowstar);
         _loc3_ = uint(0);
         while(_loc3_ < this.buffid.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.buffid[_loc3_]);
            _loc3_++;
         }
         _loc5_ = uint(0);
         while(_loc5_ < this.monster.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.monster[_loc5_]);
            _loc5_++;
         }
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_BOOL(param1,this.tongguan);
         if(hasNum)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,num$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.buff.length)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.buff[_loc2_]);
            _loc2_++;
         }
         if(hasBox)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_BOOL(param1,box$field);
         }
         WriteUtils.writeTag(param1,0,10);
         WriteUtils.write$TYPE_UINT32(param1,this.shenyuancoin);
         if(hasRank)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,rank$field);
         }
         WriteUtils.writeTag(param1,0,12);
         WriteUtils.write$TYPE_UINT32(param1,this.time);
         if(hasCanGetReward)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_BOOL(param1,canGetReward$field);
         }
         if(hasLastrank)
         {
            WriteUtils.writeTag(param1,0,14);
            WriteUtils.write$TYPE_UINT32(param1,lastrank$field);
         }
         if(hasTopStar)
         {
            WriteUtils.writeTag(param1,0,15);
            WriteUtils.write$TYPE_UINT32(param1,topStar$field);
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.monstersForNextLayers.length)
         {
            WriteUtils.writeTag(param1,2,16);
            WriteUtils.write$TYPE_MESSAGE(param1,this.monstersForNextLayers[_loc4_]);
            _loc4_++;
         }
         if(hasHelptime)
         {
            WriteUtils.writeTag(param1,0,17);
            WriteUtils.write$TYPE_UINT32(param1,helptime$field);
         }
         if(hasCanReachLayer)
         {
            WriteUtils.writeTag(param1,0,18);
            WriteUtils.write$TYPE_UINT32(param1,canReachLayer$field);
         }
         if(hasHistTopStar)
         {
            WriteUtils.writeTag(param1,0,19);
            WriteUtils.write$TYPE_UINT32(param1,histTopStar$field);
         }
         if(hasLuckValue)
         {
            WriteUtils.writeTag(param1,0,20);
            WriteUtils.write$TYPE_UINT32(param1,luckValue$field);
         }
         var _loc8_:int = 0;
         var _loc7_:* = this;
         for(var _loc6_ in this)
         {
            super.writeUnknown(param1,_loc6_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:* = 0;
         var _loc14_:uint = 0;
         var _loc18_:uint = 0;
         var _loc15_:uint = 0;
         var _loc5_:uint = 0;
         var _loc19_:uint = 0;
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         var _loc13_:uint = 0;
         var _loc3_:uint = 0;
         var _loc17_:uint = 0;
         var _loc10_:uint = 0;
         var _loc12_:uint = 0;
         var _loc16_:uint = 0;
         var _loc9_:uint = 0;
         var _loc11_:uint = 0;
         var _loc7_:uint = 0;
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
                                                                        if(_loc7_ != 0)
                                                                        {
                                                                           throw new IOError("Bad data format: GetShenYuanInfoRes.luckValue cannot be set twice.");
                                                                        }
                                                                        _loc7_++;
                                                                        this.luckValue = ReadUtils.read$TYPE_UINT32(param1);
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     if(_loc11_ != 0)
                                                                     {
                                                                        throw new IOError("Bad data format: GetShenYuanInfoRes.histTopStar cannot be set twice.");
                                                                     }
                                                                     _loc11_++;
                                                                     this.histTopStar = ReadUtils.read$TYPE_UINT32(param1);
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  if(_loc9_ != 0)
                                                                  {
                                                                     throw new IOError("Bad data format: GetShenYuanInfoRes.canReachLayer cannot be set twice.");
                                                                  }
                                                                  _loc9_++;
                                                                  this.canReachLayer = ReadUtils.read$TYPE_UINT32(param1);
                                                               }
                                                            }
                                                            else
                                                            {
                                                               if(_loc16_ != 0)
                                                               {
                                                                  throw new IOError("Bad data format: GetShenYuanInfoRes.helptime cannot be set twice.");
                                                               }
                                                               _loc16_++;
                                                               this.helptime = ReadUtils.read$TYPE_UINT32(param1);
                                                            }
                                                         }
                                                         else
                                                         {
                                                            this.monstersForNextLayers.push(ReadUtils.read$TYPE_MESSAGE(param1,new Monster()));
                                                         }
                                                      }
                                                      else
                                                      {
                                                         if(_loc12_ != 0)
                                                         {
                                                            throw new IOError("Bad data format: GetShenYuanInfoRes.topStar cannot be set twice.");
                                                         }
                                                         _loc12_++;
                                                         this.topStar = ReadUtils.read$TYPE_UINT32(param1);
                                                      }
                                                   }
                                                   else
                                                   {
                                                      if(_loc10_ != 0)
                                                      {
                                                         throw new IOError("Bad data format: GetShenYuanInfoRes.lastrank cannot be set twice.");
                                                      }
                                                      _loc10_++;
                                                      this.lastrank = ReadUtils.read$TYPE_UINT32(param1);
                                                   }
                                                }
                                                else
                                                {
                                                   if(_loc17_ != 0)
                                                   {
                                                      throw new IOError("Bad data format: GetShenYuanInfoRes.canGetReward cannot be set twice.");
                                                   }
                                                   _loc17_++;
                                                   this.canGetReward = ReadUtils.read$TYPE_BOOL(param1);
                                                }
                                             }
                                             else
                                             {
                                                if(_loc3_ != 0)
                                                {
                                                   throw new IOError("Bad data format: GetShenYuanInfoRes.time cannot be set twice.");
                                                }
                                                _loc3_++;
                                                this.time = ReadUtils.read$TYPE_UINT32(param1);
                                             }
                                          }
                                          else
                                          {
                                             if(_loc13_ != 0)
                                             {
                                                throw new IOError("Bad data format: GetShenYuanInfoRes.rank cannot be set twice.");
                                             }
                                             _loc13_++;
                                             this.rank = ReadUtils.read$TYPE_UINT32(param1);
                                          }
                                       }
                                       else
                                       {
                                          if(_loc8_ != 0)
                                          {
                                             throw new IOError("Bad data format: GetShenYuanInfoRes.shenyuancoin cannot be set twice.");
                                          }
                                          _loc8_++;
                                          this.shenyuancoin = ReadUtils.read$TYPE_UINT32(param1);
                                       }
                                    }
                                    else
                                    {
                                       if(_loc4_ != 0)
                                       {
                                          throw new IOError("Bad data format: GetShenYuanInfoRes.box cannot be set twice.");
                                       }
                                       _loc4_++;
                                       this.box = ReadUtils.read$TYPE_BOOL(param1);
                                    }
                                 }
                                 else
                                 {
                                    this.buff.push(ReadUtils.read$TYPE_MESSAGE(param1,new ShenYuanBuff()));
                                 }
                              }
                              else
                              {
                                 if(_loc19_ != 0)
                                 {
                                    throw new IOError("Bad data format: GetShenYuanInfoRes.num cannot be set twice.");
                                 }
                                 _loc19_++;
                                 this.num = ReadUtils.read$TYPE_UINT32(param1);
                              }
                           }
                           else
                           {
                              if(_loc5_ != 0)
                              {
                                 throw new IOError("Bad data format: GetShenYuanInfoRes.tongguan cannot be set twice.");
                              }
                              _loc5_++;
                              this.tongguan = ReadUtils.read$TYPE_BOOL(param1);
                           }
                        }
                        else
                        {
                           this.monster.push(ReadUtils.read$TYPE_MESSAGE(param1,new Monster()));
                        }
                     }
                     else
                     {
                        this.buffid.push(ReadUtils.read$TYPE_MESSAGE(param1,new BuffInfo()));
                     }
                  }
                  else
                  {
                     if(_loc15_ != 0)
                     {
                        throw new IOError("Bad data format: GetShenYuanInfoRes.nowstar cannot be set twice.");
                     }
                     _loc15_++;
                     this.nowstar = ReadUtils.read$TYPE_UINT32(param1);
                  }
               }
               else
               {
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: GetShenYuanInfoRes.currentlayer cannot be set twice.");
                  }
                  _loc18_++;
                  this.currentlayer = ReadUtils.read$TYPE_UINT32(param1);
               }
            }
            else
            {
               if(_loc14_ != 0)
               {
                  throw new IOError("Bad data format: GetShenYuanInfoRes.canRevive cannot be set twice.");
               }
               _loc14_++;
               this.canRevive = ReadUtils.read$TYPE_UINT32(param1);
            }
         }
      }
   }
}
