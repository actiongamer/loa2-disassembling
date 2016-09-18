package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ViewOtherPlayerRes extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.ViewOtherPlayerRes.id","id",8 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.ViewOtherPlayerRes.name","name",16 | 2);
      
      public static const FASHION:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.ViewOtherPlayerRes.fashion","fashion",24 | 0);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.ViewOtherPlayerRes.ability","ability",32 | 0);
      
      public static const MILITARY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ViewOtherPlayerRes.military","military",40 | 0);
      
      public static const HORSE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ViewOtherPlayerRes.horse","horse",48 | 0);
      
      public static const HORSEGLORY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ViewOtherPlayerRes.horseGlory","horseGlory",56 | 0);
      
      public static const HORSEIDS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.ViewOtherPlayerRes.horseIds","horseIds",64 | 0);
      
      public static const HORSESTAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ViewOtherPlayerRes.horseStar","horseStar",72 | 0);
      
      public static const ROLE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ViewOtherPlayerRes.role","role",80 | 2,proto.HeroInfo);
      
      public static const HEROES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ViewOtherPlayerRes.heroes","heroes",88 | 2,proto.HeroInfo);
      
      public static const FASHIONCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ViewOtherPlayerRes.fashionCount","fashionCount",96 | 0);
      
      public static const HORSECOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ViewOtherPlayerRes.horseCount","horseCount",104 | 0);
      
      public static const DIST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ViewOtherPlayerRes.dist","dist",112 | 0);
      
      public static const FASHIONNOW:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.ViewOtherPlayerRes.fashionNow","fashionNow",120 | 0);
      
      public static const FAMILYTECH:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ViewOtherPlayerRes.familyTech","familyTech",128 | 2,FMTechItem);
      
      public static const FASHIONLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ViewOtherPlayerRes.fashionList","fashionList",136 | 2,FashionList);
      
      public static const HEROSKINLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ViewOtherPlayerRes.heroSkinList","heroSkinList",144 | 2,Item);
      
      public static const FAMILYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.ViewOtherPlayerRes.familyName","familyName",152 | 2);
      
      public static const PET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ViewOtherPlayerRes.pet","pet",160 | 2,proto.PetInfo);
       
      
      public var id:UInt64;
      
      public var name:String;
      
      public var fashion:Array;
      
      public var ability:UInt64;
      
      private var military$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var horse$field:uint;
      
      private var horseGlory$field:uint;
      
      public var horseIds:Array;
      
      private var horseStar$field:uint;
      
      public var role:proto.HeroInfo;
      
      public var heroes:Array;
      
      private var fashionCount$field:uint;
      
      private var horseCount$field:uint;
      
      private var dist$field:uint;
      
      public var fashionNow:Array;
      
      public var familyTech:Array;
      
      public var fashionList:Array;
      
      public var heroSkinList:Array;
      
      private var familyName$field:String;
      
      private var pet$field:proto.PetInfo;
      
      public function ViewOtherPlayerRes()
      {
         fashion = [];
         horseIds = [];
         heroes = [];
         fashionNow = [];
         familyTech = [];
         fashionList = [];
         heroSkinList = [];
         super();
      }
      
      public function clearMilitary() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         military$field = new uint();
      }
      
      public function get hasMilitary() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set military(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         military$field = param1;
      }
      
      public function get military() : uint
      {
         return military$field;
      }
      
      public function clearHorse() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         horse$field = new uint();
      }
      
      public function get hasHorse() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set horse(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         horse$field = param1;
      }
      
      public function get horse() : uint
      {
         return horse$field;
      }
      
      public function clearHorseGlory() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         horseGlory$field = new uint();
      }
      
      public function get hasHorseGlory() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set horseGlory(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         horseGlory$field = param1;
      }
      
      public function get horseGlory() : uint
      {
         return horseGlory$field;
      }
      
      public function clearHorseStar() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         horseStar$field = new uint();
      }
      
      public function get hasHorseStar() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set horseStar(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         horseStar$field = param1;
      }
      
      public function get horseStar() : uint
      {
         return horseStar$field;
      }
      
      public function clearFashionCount() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         fashionCount$field = new uint();
      }
      
      public function get hasFashionCount() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set fashionCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         fashionCount$field = param1;
      }
      
      public function get fashionCount() : uint
      {
         return fashionCount$field;
      }
      
      public function clearHorseCount() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         horseCount$field = new uint();
      }
      
      public function get hasHorseCount() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set horseCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         horseCount$field = param1;
      }
      
      public function get horseCount() : uint
      {
         return horseCount$field;
      }
      
      public function clearDist() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         dist$field = new uint();
      }
      
      public function get hasDist() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set dist(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         dist$field = param1;
      }
      
      public function get dist() : uint
      {
         return dist$field;
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
      
      public function clearPet() : void
      {
         pet$field = null;
      }
      
      public function get hasPet() : Boolean
      {
         return pet$field != null;
      }
      
      public function set pet(param1:proto.PetInfo) : void
      {
         pet$field = param1;
      }
      
      public function get pet() : proto.PetInfo
      {
         return pet$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc7_:* = 0;
         var _loc6_:* = 0;
         var _loc8_:* = 0;
         var _loc5_:* = 0;
         var _loc4_:* = 0;
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         _loc2_ = uint(0);
         while(_loc2_ < this.fashion.length)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,this.fashion[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT64(param1,this.ability);
         if(hasMilitary)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,military$field);
         }
         if(hasHorse)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,horse$field);
         }
         if(hasHorseGlory)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,horseGlory$field);
         }
         _loc7_ = uint(0);
         while(_loc7_ < this.horseIds.length)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,this.horseIds[_loc7_]);
            _loc7_++;
         }
         if(hasHorseStar)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,horseStar$field);
         }
         WriteUtils.writeTag(param1,2,10);
         WriteUtils.write$TYPE_MESSAGE(param1,this.role);
         _loc6_ = uint(0);
         while(_loc6_ < this.heroes.length)
         {
            WriteUtils.writeTag(param1,2,11);
            WriteUtils.write$TYPE_MESSAGE(param1,this.heroes[_loc6_]);
            _loc6_++;
         }
         if(hasFashionCount)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,fashionCount$field);
         }
         if(hasHorseCount)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_UINT32(param1,horseCount$field);
         }
         if(hasDist)
         {
            WriteUtils.writeTag(param1,0,14);
            WriteUtils.write$TYPE_UINT32(param1,dist$field);
         }
         _loc8_ = uint(0);
         while(_loc8_ < this.fashionNow.length)
         {
            WriteUtils.writeTag(param1,0,15);
            WriteUtils.write$TYPE_UINT32(param1,this.fashionNow[_loc8_]);
            _loc8_++;
         }
         _loc5_ = uint(0);
         while(_loc5_ < this.familyTech.length)
         {
            WriteUtils.writeTag(param1,2,16);
            WriteUtils.write$TYPE_MESSAGE(param1,this.familyTech[_loc5_]);
            _loc5_++;
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.fashionList.length)
         {
            WriteUtils.writeTag(param1,2,17);
            WriteUtils.write$TYPE_MESSAGE(param1,this.fashionList[_loc4_]);
            _loc4_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.heroSkinList.length)
         {
            WriteUtils.writeTag(param1,2,18);
            WriteUtils.write$TYPE_MESSAGE(param1,this.heroSkinList[_loc3_]);
            _loc3_++;
         }
         if(hasFamilyName)
         {
            WriteUtils.writeTag(param1,2,19);
            WriteUtils.write$TYPE_STRING(param1,familyName$field);
         }
         if(hasPet)
         {
            WriteUtils.writeTag(param1,2,20);
            WriteUtils.write$TYPE_MESSAGE(param1,pet$field);
         }
         var _loc11_:int = 0;
         var _loc10_:* = this;
         for(var _loc9_ in this)
         {
            super.writeUnknown(param1,_loc9_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:* = 0;
         var _loc15_:uint = 0;
         var _loc11_:uint = 0;
         var _loc9_:uint = 0;
         var _loc13_:uint = 0;
         var _loc8_:uint = 0;
         var _loc10_:uint = 0;
         var _loc16_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc12_:uint = 0;
         var _loc14_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            var _loc17_:* = _loc7_ >> 3;
            if(1 !== _loc17_)
            {
               if(2 !== _loc17_)
               {
                  if(3 !== _loc17_)
                  {
                     if(4 !== _loc17_)
                     {
                        if(5 !== _loc17_)
                        {
                           if(6 !== _loc17_)
                           {
                              if(7 !== _loc17_)
                              {
                                 if(8 !== _loc17_)
                                 {
                                    if(9 !== _loc17_)
                                    {
                                       if(10 !== _loc17_)
                                       {
                                          if(11 !== _loc17_)
                                          {
                                             if(12 !== _loc17_)
                                             {
                                                if(13 !== _loc17_)
                                                {
                                                   if(14 !== _loc17_)
                                                   {
                                                      if(15 !== _loc17_)
                                                      {
                                                         if(16 !== _loc17_)
                                                         {
                                                            if(17 !== _loc17_)
                                                            {
                                                               if(18 !== _loc17_)
                                                               {
                                                                  if(19 !== _loc17_)
                                                                  {
                                                                     if(20 !== _loc17_)
                                                                     {
                                                                        super.readUnknown(param1,_loc7_);
                                                                     }
                                                                     else
                                                                     {
                                                                        if(_loc6_ != 0)
                                                                        {
                                                                           throw new IOError("Bad data format: ViewOtherPlayerRes.pet cannot be set twice.");
                                                                        }
                                                                        _loc6_++;
                                                                        this.pet = new proto.PetInfo();
                                                                        ReadUtils.read$TYPE_MESSAGE(param1,this.pet);
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     if(_loc3_ != 0)
                                                                     {
                                                                        throw new IOError("Bad data format: ViewOtherPlayerRes.familyName cannot be set twice.");
                                                                     }
                                                                     _loc3_++;
                                                                     this.familyName = ReadUtils.read$TYPE_STRING(param1);
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  this.heroSkinList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Item()));
                                                               }
                                                            }
                                                            else
                                                            {
                                                               this.fashionList.push(ReadUtils.read$TYPE_MESSAGE(param1,new FashionList()));
                                                            }
                                                         }
                                                         else
                                                         {
                                                            this.familyTech.push(ReadUtils.read$TYPE_MESSAGE(param1,new FMTechItem()));
                                                         }
                                                      }
                                                      else if((_loc7_ & 7) == 2)
                                                      {
                                                         ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.fashionNow);
                                                      }
                                                      else
                                                      {
                                                         this.fashionNow.push(ReadUtils.read$TYPE_UINT32(param1));
                                                      }
                                                   }
                                                   else
                                                   {
                                                      if(_loc14_ != 0)
                                                      {
                                                         throw new IOError("Bad data format: ViewOtherPlayerRes.dist cannot be set twice.");
                                                      }
                                                      _loc14_++;
                                                      this.dist = ReadUtils.read$TYPE_UINT32(param1);
                                                   }
                                                }
                                                else
                                                {
                                                   if(_loc12_ != 0)
                                                   {
                                                      throw new IOError("Bad data format: ViewOtherPlayerRes.horseCount cannot be set twice.");
                                                   }
                                                   _loc12_++;
                                                   this.horseCount = ReadUtils.read$TYPE_UINT32(param1);
                                                }
                                             }
                                             else
                                             {
                                                if(_loc5_ != 0)
                                                {
                                                   throw new IOError("Bad data format: ViewOtherPlayerRes.fashionCount cannot be set twice.");
                                                }
                                                _loc5_++;
                                                this.fashionCount = ReadUtils.read$TYPE_UINT32(param1);
                                             }
                                          }
                                          else
                                          {
                                             this.heroes.push(ReadUtils.read$TYPE_MESSAGE(param1,new proto.HeroInfo()));
                                          }
                                       }
                                       else
                                       {
                                          if(_loc4_ != 0)
                                          {
                                             throw new IOError("Bad data format: ViewOtherPlayerRes.role cannot be set twice.");
                                          }
                                          _loc4_++;
                                          this.role = new proto.HeroInfo();
                                          ReadUtils.read$TYPE_MESSAGE(param1,this.role);
                                       }
                                    }
                                    else
                                    {
                                       if(_loc16_ != 0)
                                       {
                                          throw new IOError("Bad data format: ViewOtherPlayerRes.horseStar cannot be set twice.");
                                       }
                                       _loc16_++;
                                       this.horseStar = ReadUtils.read$TYPE_UINT32(param1);
                                    }
                                 }
                                 else if((_loc7_ & 7) == 2)
                                 {
                                    ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.horseIds);
                                 }
                                 else
                                 {
                                    this.horseIds.push(ReadUtils.read$TYPE_UINT32(param1));
                                 }
                              }
                              else
                              {
                                 if(_loc10_ != 0)
                                 {
                                    throw new IOError("Bad data format: ViewOtherPlayerRes.horseGlory cannot be set twice.");
                                 }
                                 _loc10_++;
                                 this.horseGlory = ReadUtils.read$TYPE_UINT32(param1);
                              }
                           }
                           else
                           {
                              if(_loc8_ != 0)
                              {
                                 throw new IOError("Bad data format: ViewOtherPlayerRes.horse cannot be set twice.");
                              }
                              _loc8_++;
                              this.horse = ReadUtils.read$TYPE_UINT32(param1);
                           }
                        }
                        else
                        {
                           if(_loc13_ != 0)
                           {
                              throw new IOError("Bad data format: ViewOtherPlayerRes.military cannot be set twice.");
                           }
                           _loc13_++;
                           this.military = ReadUtils.read$TYPE_UINT32(param1);
                        }
                     }
                     else
                     {
                        if(_loc9_ != 0)
                        {
                           throw new IOError("Bad data format: ViewOtherPlayerRes.ability cannot be set twice.");
                        }
                        _loc9_++;
                        this.ability = ReadUtils.read$TYPE_UINT64(param1);
                     }
                  }
                  else if((_loc7_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.fashion);
                  }
                  else
                  {
                     this.fashion.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
               }
               else
               {
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: ViewOtherPlayerRes.name cannot be set twice.");
                  }
                  _loc11_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
               }
            }
            else
            {
               if(_loc15_ != 0)
               {
                  throw new IOError("Bad data format: ViewOtherPlayerRes.id cannot be set twice.");
               }
               _loc15_++;
               this.id = ReadUtils.read$TYPE_UINT64(param1);
            }
         }
      }
   }
}
