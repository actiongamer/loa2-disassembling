package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class HeroBaseInfo extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.HeroBaseInfo.id","id",8 | 0);
      
      public static const BASEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroBaseInfo.baseId","baseId",16 | 0);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroBaseInfo.level","level",24 | 0);
      
      public static const EXP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.HeroBaseInfo.exp","exp",32 | 0);
      
      public static const PEIYANG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.HeroBaseInfo.peiyang","peiyang",40 | 2,proto.BaseProp);
      
      public static const SJ_LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroBaseInfo.sj_level","sjLevel",48 | 0);
      
      public static const SJ_EXP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.HeroBaseInfo.sj_exp","sjExp",56 | 0);
      
      public static const MENGYUE:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.HeroBaseInfo.mengyue","mengyue",64 | 0);
      
      public static const FIGHTVALUE:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.HeroBaseInfo.fightValue","fightValue",72 | 0);
      
      public static const STRENGTHLSLV:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroBaseInfo.strengthLSlv","strengthLSlv",80 | 0);
      
      public static const JINGLIANLSLV:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroBaseInfo.jinglianLSLv","jinglianLSLv",88 | 0);
      
      public static const SKILL:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.HeroBaseInfo.skill","skill",96 | 0);
      
      public static const PLACE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroBaseInfo.place","place",104 | 0);
      
      public static const POSITION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroBaseInfo.position","position",112 | 0);
      
      public static const BAOWUSTRLS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroBaseInfo.baowuStrLs","baowuStrLs",120 | 0);
      
      public static const BAOWUFUMLS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroBaseInfo.baowuFumLs","baowuFumLs",128 | 0);
      
      public static const TUPOITEM:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.HeroBaseInfo.tupoItem","tupoItem",136 | 0);
      
      public static const TALENT:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.HeroBaseInfo.talent","talent",144 | 0);
      
      public static const SKIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroBaseInfo.skin","skin",152 | 0);
      
      public static const FASHIONSKILL:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.HeroBaseInfo.fashionSkill","fashionSkill",160 | 2,MapKey32Value32);
       
      
      public var id:UInt64;
      
      public var baseId:uint;
      
      public var level:uint;
      
      public var exp:UInt64;
      
      private var peiyang$field:proto.BaseProp;
      
      private var sj_level$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var sj_exp$field:UInt64;
      
      public var mengyue:Array;
      
      private var fightValue$field:UInt64;
      
      private var strengthLSlv$field:uint;
      
      private var jinglianLSLv$field:uint;
      
      public var skill:Array;
      
      private var place$field:uint;
      
      private var position$field:uint;
      
      private var baowuStrLs$field:uint;
      
      private var baowuFumLs$field:uint;
      
      public var tupoItem:Array;
      
      public var talent:Array;
      
      private var skin$field:uint;
      
      public var fashionSkill:Array;
      
      public function HeroBaseInfo()
      {
         mengyue = [];
         skill = [];
         tupoItem = [];
         talent = [];
         fashionSkill = [];
         super();
      }
      
      public function clearPeiyang() : void
      {
         peiyang$field = null;
      }
      
      public function get hasPeiyang() : Boolean
      {
         return peiyang$field != null;
      }
      
      public function set peiyang(param1:proto.BaseProp) : void
      {
         peiyang$field = param1;
      }
      
      public function get peiyang() : proto.BaseProp
      {
         return peiyang$field;
      }
      
      public function clearSjLevel() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         sj_level$field = new uint();
      }
      
      public function get hasSjLevel() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set sjLevel(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         sj_level$field = param1;
      }
      
      public function get sjLevel() : uint
      {
         return sj_level$field;
      }
      
      public function clearSjExp() : void
      {
         sj_exp$field = null;
      }
      
      public function get hasSjExp() : Boolean
      {
         return sj_exp$field != null;
      }
      
      public function set sjExp(param1:UInt64) : void
      {
         sj_exp$field = param1;
      }
      
      public function get sjExp() : UInt64
      {
         return sj_exp$field;
      }
      
      public function clearFightValue() : void
      {
         fightValue$field = null;
      }
      
      public function get hasFightValue() : Boolean
      {
         return fightValue$field != null;
      }
      
      public function set fightValue(param1:UInt64) : void
      {
         fightValue$field = param1;
      }
      
      public function get fightValue() : UInt64
      {
         return fightValue$field;
      }
      
      public function clearStrengthLSlv() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         strengthLSlv$field = new uint();
      }
      
      public function get hasStrengthLSlv() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set strengthLSlv(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         strengthLSlv$field = param1;
      }
      
      public function get strengthLSlv() : uint
      {
         return strengthLSlv$field;
      }
      
      public function clearJinglianLSLv() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         jinglianLSLv$field = new uint();
      }
      
      public function get hasJinglianLSLv() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set jinglianLSLv(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         jinglianLSLv$field = param1;
      }
      
      public function get jinglianLSLv() : uint
      {
         return jinglianLSLv$field;
      }
      
      public function clearPlace() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         place$field = new uint();
      }
      
      public function get hasPlace() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set place(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         place$field = param1;
      }
      
      public function get place() : uint
      {
         return place$field;
      }
      
      public function clearPosition() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         position$field = new uint();
      }
      
      public function get hasPosition() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set position(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         position$field = param1;
      }
      
      public function get position() : uint
      {
         return position$field;
      }
      
      public function clearBaowuStrLs() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         baowuStrLs$field = new uint();
      }
      
      public function get hasBaowuStrLs() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set baowuStrLs(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         baowuStrLs$field = param1;
      }
      
      public function get baowuStrLs() : uint
      {
         return baowuStrLs$field;
      }
      
      public function clearBaowuFumLs() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         baowuFumLs$field = new uint();
      }
      
      public function get hasBaowuFumLs() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set baowuFumLs(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         baowuFumLs$field = param1;
      }
      
      public function get baowuFumLs() : uint
      {
         return baowuFumLs$field;
      }
      
      public function clearSkin() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         skin$field = new uint();
      }
      
      public function get hasSkin() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set skin(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         skin$field = param1;
      }
      
      public function get skin() : uint
      {
         return skin$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.baseId);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.level);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT64(param1,this.exp);
         if(hasPeiyang)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,peiyang$field);
         }
         if(hasSjLevel)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,sj_level$field);
         }
         if(hasSjExp)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT64(param1,sj_exp$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.mengyue.length)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,this.mengyue[_loc2_]);
            _loc2_++;
         }
         if(hasFightValue)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT64(param1,fightValue$field);
         }
         if(hasStrengthLSlv)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,strengthLSlv$field);
         }
         if(hasJinglianLSLv)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_UINT32(param1,jinglianLSLv$field);
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.skill.length)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,this.skill[_loc3_]);
            _loc3_++;
         }
         if(hasPlace)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_UINT32(param1,place$field);
         }
         if(hasPosition)
         {
            WriteUtils.writeTag(param1,0,14);
            WriteUtils.write$TYPE_UINT32(param1,position$field);
         }
         if(hasBaowuStrLs)
         {
            WriteUtils.writeTag(param1,0,15);
            WriteUtils.write$TYPE_UINT32(param1,baowuStrLs$field);
         }
         if(hasBaowuFumLs)
         {
            WriteUtils.writeTag(param1,0,16);
            WriteUtils.write$TYPE_UINT32(param1,baowuFumLs$field);
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.tupoItem.length)
         {
            WriteUtils.writeTag(param1,0,17);
            WriteUtils.write$TYPE_UINT32(param1,this.tupoItem[_loc4_]);
            _loc4_++;
         }
         _loc5_ = uint(0);
         while(_loc5_ < this.talent.length)
         {
            WriteUtils.writeTag(param1,0,18);
            WriteUtils.write$TYPE_UINT32(param1,this.talent[_loc5_]);
            _loc5_++;
         }
         if(hasSkin)
         {
            WriteUtils.writeTag(param1,0,19);
            WriteUtils.write$TYPE_UINT32(param1,skin$field);
         }
         _loc6_ = uint(0);
         while(_loc6_ < this.fashionSkill.length)
         {
            WriteUtils.writeTag(param1,2,20);
            WriteUtils.write$TYPE_MESSAGE(param1,this.fashionSkill[_loc6_]);
            _loc6_++;
         }
         var _loc9_:int = 0;
         var _loc8_:* = this;
         for(var _loc7_ in this)
         {
            super.writeUnknown(param1,_loc7_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc17_:uint = 0;
         var _loc8_:uint = 0;
         var _loc11_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc4_:uint = 0;
         var _loc13_:uint = 0;
         var _loc10_:uint = 0;
         var _loc9_:uint = 0;
         var _loc14_:uint = 0;
         var _loc15_:uint = 0;
         var _loc18_:uint = 0;
         var _loc12_:uint = 0;
         var _loc16_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            var _loc19_:* = _loc5_ >> 3;
            if(1 !== _loc19_)
            {
               if(2 !== _loc19_)
               {
                  if(3 !== _loc19_)
                  {
                     if(4 !== _loc19_)
                     {
                        if(5 !== _loc19_)
                        {
                           if(6 !== _loc19_)
                           {
                              if(7 !== _loc19_)
                              {
                                 if(8 !== _loc19_)
                                 {
                                    if(9 !== _loc19_)
                                    {
                                       if(10 !== _loc19_)
                                       {
                                          if(11 !== _loc19_)
                                          {
                                             if(12 !== _loc19_)
                                             {
                                                if(13 !== _loc19_)
                                                {
                                                   if(14 !== _loc19_)
                                                   {
                                                      if(15 !== _loc19_)
                                                      {
                                                         if(16 !== _loc19_)
                                                         {
                                                            if(17 !== _loc19_)
                                                            {
                                                               if(18 !== _loc19_)
                                                               {
                                                                  if(19 !== _loc19_)
                                                                  {
                                                                     if(20 !== _loc19_)
                                                                     {
                                                                        super.readUnknown(param1,_loc5_);
                                                                     }
                                                                     else
                                                                     {
                                                                        this.fashionSkill.push(ReadUtils.read$TYPE_MESSAGE(param1,new MapKey32Value32()));
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     if(_loc3_ != 0)
                                                                     {
                                                                        throw new IOError("Bad data format: HeroBaseInfo.skin cannot be set twice.");
                                                                     }
                                                                     _loc3_++;
                                                                     this.skin = ReadUtils.read$TYPE_UINT32(param1);
                                                                  }
                                                               }
                                                               else if((_loc5_ & 7) == 2)
                                                               {
                                                                  ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.talent);
                                                               }
                                                               else
                                                               {
                                                                  this.talent.push(ReadUtils.read$TYPE_UINT32(param1));
                                                               }
                                                            }
                                                            else if((_loc5_ & 7) == 2)
                                                            {
                                                               ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.tupoItem);
                                                            }
                                                            else
                                                            {
                                                               this.tupoItem.push(ReadUtils.read$TYPE_UINT32(param1));
                                                            }
                                                         }
                                                         else
                                                         {
                                                            if(_loc16_ != 0)
                                                            {
                                                               throw new IOError("Bad data format: HeroBaseInfo.baowuFumLs cannot be set twice.");
                                                            }
                                                            _loc16_++;
                                                            this.baowuFumLs = ReadUtils.read$TYPE_UINT32(param1);
                                                         }
                                                      }
                                                      else
                                                      {
                                                         if(_loc12_ != 0)
                                                         {
                                                            throw new IOError("Bad data format: HeroBaseInfo.baowuStrLs cannot be set twice.");
                                                         }
                                                         _loc12_++;
                                                         this.baowuStrLs = ReadUtils.read$TYPE_UINT32(param1);
                                                      }
                                                   }
                                                   else
                                                   {
                                                      if(_loc18_ != 0)
                                                      {
                                                         throw new IOError("Bad data format: HeroBaseInfo.position cannot be set twice.");
                                                      }
                                                      _loc18_++;
                                                      this.position = ReadUtils.read$TYPE_UINT32(param1);
                                                   }
                                                }
                                                else
                                                {
                                                   if(_loc15_ != 0)
                                                   {
                                                      throw new IOError("Bad data format: HeroBaseInfo.place cannot be set twice.");
                                                   }
                                                   _loc15_++;
                                                   this.place = ReadUtils.read$TYPE_UINT32(param1);
                                                }
                                             }
                                             else if((_loc5_ & 7) == 2)
                                             {
                                                ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.skill);
                                             }
                                             else
                                             {
                                                this.skill.push(ReadUtils.read$TYPE_UINT32(param1));
                                             }
                                          }
                                          else
                                          {
                                             if(_loc14_ != 0)
                                             {
                                                throw new IOError("Bad data format: HeroBaseInfo.jinglianLSLv cannot be set twice.");
                                             }
                                             _loc14_++;
                                             this.jinglianLSLv = ReadUtils.read$TYPE_UINT32(param1);
                                          }
                                       }
                                       else
                                       {
                                          if(_loc9_ != 0)
                                          {
                                             throw new IOError("Bad data format: HeroBaseInfo.strengthLSlv cannot be set twice.");
                                          }
                                          _loc9_++;
                                          this.strengthLSlv = ReadUtils.read$TYPE_UINT32(param1);
                                       }
                                    }
                                    else
                                    {
                                       if(_loc10_ != 0)
                                       {
                                          throw new IOError("Bad data format: HeroBaseInfo.fightValue cannot be set twice.");
                                       }
                                       _loc10_++;
                                       this.fightValue = ReadUtils.read$TYPE_UINT64(param1);
                                    }
                                 }
                                 else if((_loc5_ & 7) == 2)
                                 {
                                    ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.mengyue);
                                 }
                                 else
                                 {
                                    this.mengyue.push(ReadUtils.read$TYPE_UINT32(param1));
                                 }
                              }
                              else
                              {
                                 if(_loc13_ != 0)
                                 {
                                    throw new IOError("Bad data format: HeroBaseInfo.sjExp cannot be set twice.");
                                 }
                                 _loc13_++;
                                 this.sjExp = ReadUtils.read$TYPE_UINT64(param1);
                              }
                           }
                           else
                           {
                              if(_loc4_ != 0)
                              {
                                 throw new IOError("Bad data format: HeroBaseInfo.sjLevel cannot be set twice.");
                              }
                              _loc4_++;
                              this.sjLevel = ReadUtils.read$TYPE_UINT32(param1);
                           }
                        }
                        else
                        {
                           if(_loc7_ != 0)
                           {
                              throw new IOError("Bad data format: HeroBaseInfo.peiyang cannot be set twice.");
                           }
                           _loc7_++;
                           this.peiyang = new proto.BaseProp();
                           ReadUtils.read$TYPE_MESSAGE(param1,this.peiyang);
                        }
                     }
                     else
                     {
                        if(_loc6_ != 0)
                        {
                           throw new IOError("Bad data format: HeroBaseInfo.exp cannot be set twice.");
                        }
                        _loc6_++;
                        this.exp = ReadUtils.read$TYPE_UINT64(param1);
                     }
                  }
                  else
                  {
                     if(_loc11_ != 0)
                     {
                        throw new IOError("Bad data format: HeroBaseInfo.level cannot be set twice.");
                     }
                     _loc11_++;
                     this.level = ReadUtils.read$TYPE_UINT32(param1);
                  }
               }
               else
               {
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: HeroBaseInfo.baseId cannot be set twice.");
                  }
                  _loc8_++;
                  this.baseId = ReadUtils.read$TYPE_UINT32(param1);
               }
            }
            else
            {
               if(_loc17_ != 0)
               {
                  throw new IOError("Bad data format: HeroBaseInfo.id cannot be set twice.");
               }
               _loc17_++;
               this.id = ReadUtils.read$TYPE_UINT64(param1);
            }
         }
      }
   }
}
