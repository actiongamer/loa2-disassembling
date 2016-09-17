package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class PlayerFriendsInfoRes extends Message
   {
      
      public static const FRIENDSINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerFriendsInfoRes.friendsinfo","friendsinfo",8 | 2,GameFriendData);
      
      public static const RECENCTCONTACTINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerFriendsInfoRes.recenctcontactinfo","recenctcontactinfo",16 | 2,GameFriendData);
      
      public static const GANGFRIENDSINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerFriendsInfoRes.gangfriendsinfo","gangfriendsinfo",24 | 2,GameFriendData);
      
      public static const CROSSFRIENDSINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerFriendsInfoRes.crossfriendsinfo","crossfriendsinfo",32 | 2,GameFriendData);
      
      public static const STRANGERFRIENDSINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerFriendsInfoRes.strangerfriendsinfo","strangerfriendsinfo",40 | 2,GameFriendData);
      
      public static const HEIMINGDANINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerFriendsInfoRes.heimingdaninfo","heimingdaninfo",48 | 2,GameFriendData);
      
      public static const APPLYFRIENDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerFriendsInfoRes.applyfriends","applyfriends",56 | 2,GameFriendData);
      
      public static const APPLYAGREEFRIENDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerFriendsInfoRes.applyagreefriends","applyagreefriends",64 | 2,GameFriendData);
      
      public static const APPLYREFUSEFRIENDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerFriendsInfoRes.applyrefusefriends","applyrefusefriends",72 | 2,GameFriendData);
      
      public static const DELETEFRIENDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerFriendsInfoRes.deletefriends","deletefriends",80 | 2,GameFriendData);
      
      public static const TALK:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerFriendsInfoRes.talk","talk",88 | 2,PrivateTalk);
      
      public static const CHATLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerFriendsInfoRes.chatlist","chatlist",96 | 2,ChatList);
      
      public static const SIGNATUE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.PlayerFriendsInfoRes.signatue","signatue",104 | 2);
      
      public static const DONATETOIDS:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.PlayerFriendsInfoRes.donateToIds","donateToIds",112 | 0);
      
      public static const HASGETSTAMINAS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerFriendsInfoRes.hasGetstaminas","hasGetstaminas",120 | 0);
      
      public static const CANGETSTAMINAIDS:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.PlayerFriendsInfoRes.canGetstaminaIds","canGetstaminaIds",128 | 0);
      
      public static const HASCONGCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerFriendsInfoRes.hascongcount","hascongcount",136 | 0);
      
      public static const HASBEENCONGEDCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerFriendsInfoRes.hasbeencongedcount","hasbeencongedcount",144 | 0);
      
      public static const CANCONGINFOS:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.PlayerFriendsInfoRes.canconginfos","canconginfos",152 | 0);
      
      public static const CONTACTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerFriendsInfoRes.contacts","contacts",160 | 2,RecentContact);
       
      
      public var friendsinfo:Array;
      
      public var recenctcontactinfo:Array;
      
      public var gangfriendsinfo:Array;
      
      public var crossfriendsinfo:Array;
      
      public var strangerfriendsinfo:Array;
      
      public var heimingdaninfo:Array;
      
      public var applyfriends:Array;
      
      public var applyagreefriends:Array;
      
      public var applyrefusefriends:Array;
      
      public var deletefriends:Array;
      
      public var talk:Array;
      
      public var chatlist:Array;
      
      public var signatue:String;
      
      public var donateToIds:Array;
      
      private var hasGetstaminas$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var canGetstaminaIds:Array;
      
      private var hascongcount$field:uint;
      
      private var hasbeencongedcount$field:uint;
      
      public var canconginfos:Array;
      
      public var contacts:Array;
      
      public function PlayerFriendsInfoRes()
      {
         friendsinfo = [];
         recenctcontactinfo = [];
         gangfriendsinfo = [];
         crossfriendsinfo = [];
         strangerfriendsinfo = [];
         heimingdaninfo = [];
         applyfriends = [];
         applyagreefriends = [];
         applyrefusefriends = [];
         deletefriends = [];
         talk = [];
         chatlist = [];
         donateToIds = [];
         canGetstaminaIds = [];
         canconginfos = [];
         contacts = [];
         super();
      }
      
      public function clearHasGetstaminas() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         hasGetstaminas$field = new uint();
      }
      
      public function get hasHasGetstaminas() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set hasGetstaminas(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         hasGetstaminas$field = param1;
      }
      
      public function get hasGetstaminas() : uint
      {
         return hasGetstaminas$field;
      }
      
      public function clearHascongcount() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         hascongcount$field = new uint();
      }
      
      public function get hasHascongcount() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set hascongcount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         hascongcount$field = param1;
      }
      
      public function get hascongcount() : uint
      {
         return hascongcount$field;
      }
      
      public function clearHasbeencongedcount() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         hasbeencongedcount$field = new uint();
      }
      
      public function get hasHasbeencongedcount() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set hasbeencongedcount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         hasbeencongedcount$field = param1;
      }
      
      public function get hasbeencongedcount() : uint
      {
         return hasbeencongedcount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc14_:* = 0;
         var _loc3_:* = 0;
         var _loc17_:* = 0;
         var _loc18_:* = 0;
         var _loc9_:* = 0;
         var _loc11_:* = 0;
         var _loc15_:* = 0;
         var _loc10_:* = 0;
         var _loc2_:* = 0;
         var _loc13_:* = 0;
         var _loc12_:* = 0;
         var _loc5_:* = 0;
         var _loc4_:* = 0;
         var _loc8_:* = 0;
         var _loc16_:* = 0;
         var _loc6_:* = 0;
         _loc14_ = uint(0);
         while(_loc14_ < this.friendsinfo.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.friendsinfo[_loc14_]);
            _loc14_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.recenctcontactinfo.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.recenctcontactinfo[_loc3_]);
            _loc3_++;
         }
         _loc17_ = uint(0);
         while(_loc17_ < this.gangfriendsinfo.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.gangfriendsinfo[_loc17_]);
            _loc17_++;
         }
         _loc18_ = uint(0);
         while(_loc18_ < this.crossfriendsinfo.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.crossfriendsinfo[_loc18_]);
            _loc18_++;
         }
         _loc9_ = uint(0);
         while(_loc9_ < this.strangerfriendsinfo.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.strangerfriendsinfo[_loc9_]);
            _loc9_++;
         }
         _loc11_ = uint(0);
         while(_loc11_ < this.heimingdaninfo.length)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.heimingdaninfo[_loc11_]);
            _loc11_++;
         }
         _loc15_ = uint(0);
         while(_loc15_ < this.applyfriends.length)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.applyfriends[_loc15_]);
            _loc15_++;
         }
         _loc10_ = uint(0);
         while(_loc10_ < this.applyagreefriends.length)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.applyagreefriends[_loc10_]);
            _loc10_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.applyrefusefriends.length)
         {
            WriteUtils.writeTag(param1,2,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.applyrefusefriends[_loc2_]);
            _loc2_++;
         }
         _loc13_ = uint(0);
         while(_loc13_ < this.deletefriends.length)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.deletefriends[_loc13_]);
            _loc13_++;
         }
         _loc12_ = uint(0);
         while(_loc12_ < this.talk.length)
         {
            WriteUtils.writeTag(param1,2,11);
            WriteUtils.write$TYPE_MESSAGE(param1,this.talk[_loc12_]);
            _loc12_++;
         }
         _loc5_ = uint(0);
         while(_loc5_ < this.chatlist.length)
         {
            WriteUtils.writeTag(param1,2,12);
            WriteUtils.write$TYPE_MESSAGE(param1,this.chatlist[_loc5_]);
            _loc5_++;
         }
         WriteUtils.writeTag(param1,2,13);
         WriteUtils.write$TYPE_STRING(param1,this.signatue);
         _loc4_ = uint(0);
         while(_loc4_ < this.donateToIds.length)
         {
            WriteUtils.writeTag(param1,0,14);
            WriteUtils.write$TYPE_UINT64(param1,this.donateToIds[_loc4_]);
            _loc4_++;
         }
         if(hasHasGetstaminas)
         {
            WriteUtils.writeTag(param1,0,15);
            WriteUtils.write$TYPE_UINT32(param1,hasGetstaminas$field);
         }
         _loc8_ = uint(0);
         while(_loc8_ < this.canGetstaminaIds.length)
         {
            WriteUtils.writeTag(param1,0,16);
            WriteUtils.write$TYPE_UINT64(param1,this.canGetstaminaIds[_loc8_]);
            _loc8_++;
         }
         if(hasHascongcount)
         {
            WriteUtils.writeTag(param1,0,17);
            WriteUtils.write$TYPE_UINT32(param1,hascongcount$field);
         }
         if(hasHasbeencongedcount)
         {
            WriteUtils.writeTag(param1,0,18);
            WriteUtils.write$TYPE_UINT32(param1,hasbeencongedcount$field);
         }
         _loc16_ = uint(0);
         while(_loc16_ < this.canconginfos.length)
         {
            WriteUtils.writeTag(param1,0,19);
            WriteUtils.write$TYPE_UINT64(param1,this.canconginfos[_loc16_]);
            _loc16_++;
         }
         _loc6_ = uint(0);
         while(_loc6_ < this.contacts.length)
         {
            WriteUtils.writeTag(param1,2,20);
            WriteUtils.write$TYPE_MESSAGE(param1,this.contacts[_loc6_]);
            _loc6_++;
         }
         var _loc20_:int = 0;
         var _loc19_:* = this;
         for(var _loc7_ in this)
         {
            super.writeUnknown(param1,_loc7_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            var _loc8_:* = _loc4_ >> 3;
            if(1 !== _loc8_)
            {
               if(2 !== _loc8_)
               {
                  if(3 !== _loc8_)
                  {
                     if(4 !== _loc8_)
                     {
                        if(5 !== _loc8_)
                        {
                           if(6 !== _loc8_)
                           {
                              if(7 !== _loc8_)
                              {
                                 if(8 !== _loc8_)
                                 {
                                    if(9 !== _loc8_)
                                    {
                                       if(10 !== _loc8_)
                                       {
                                          if(11 !== _loc8_)
                                          {
                                             if(12 !== _loc8_)
                                             {
                                                if(13 !== _loc8_)
                                                {
                                                   if(14 !== _loc8_)
                                                   {
                                                      if(15 !== _loc8_)
                                                      {
                                                         if(16 !== _loc8_)
                                                         {
                                                            if(17 !== _loc8_)
                                                            {
                                                               if(18 !== _loc8_)
                                                               {
                                                                  if(19 !== _loc8_)
                                                                  {
                                                                     if(20 !== _loc8_)
                                                                     {
                                                                        super.readUnknown(param1,_loc4_);
                                                                     }
                                                                     else
                                                                     {
                                                                        this.contacts.push(ReadUtils.read$TYPE_MESSAGE(param1,new RecentContact()));
                                                                     }
                                                                  }
                                                                  else if((_loc4_ & 7) == 2)
                                                                  {
                                                                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.canconginfos);
                                                                  }
                                                                  else
                                                                  {
                                                                     this.canconginfos.push(ReadUtils.read$TYPE_UINT64(param1));
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  if(_loc7_ != 0)
                                                                  {
                                                                     throw new IOError("Bad data format: PlayerFriendsInfoRes.hasbeencongedcount cannot be set twice.");
                                                                  }
                                                                  _loc7_++;
                                                                  this.hasbeencongedcount = ReadUtils.read$TYPE_UINT32(param1);
                                                               }
                                                            }
                                                            else
                                                            {
                                                               if(_loc3_ != 0)
                                                               {
                                                                  throw new IOError("Bad data format: PlayerFriendsInfoRes.hascongcount cannot be set twice.");
                                                               }
                                                               _loc3_++;
                                                               this.hascongcount = ReadUtils.read$TYPE_UINT32(param1);
                                                            }
                                                         }
                                                         else if((_loc4_ & 7) == 2)
                                                         {
                                                            ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.canGetstaminaIds);
                                                         }
                                                         else
                                                         {
                                                            this.canGetstaminaIds.push(ReadUtils.read$TYPE_UINT64(param1));
                                                         }
                                                      }
                                                      else
                                                      {
                                                         if(_loc6_ != 0)
                                                         {
                                                            throw new IOError("Bad data format: PlayerFriendsInfoRes.hasGetstaminas cannot be set twice.");
                                                         }
                                                         _loc6_++;
                                                         this.hasGetstaminas = ReadUtils.read$TYPE_UINT32(param1);
                                                      }
                                                   }
                                                   else if((_loc4_ & 7) == 2)
                                                   {
                                                      ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.donateToIds);
                                                   }
                                                   else
                                                   {
                                                      this.donateToIds.push(ReadUtils.read$TYPE_UINT64(param1));
                                                   }
                                                }
                                                else
                                                {
                                                   if(_loc5_ != 0)
                                                   {
                                                      throw new IOError("Bad data format: PlayerFriendsInfoRes.signatue cannot be set twice.");
                                                   }
                                                   _loc5_++;
                                                   this.signatue = ReadUtils.read$TYPE_STRING(param1);
                                                }
                                             }
                                             else
                                             {
                                                this.chatlist.push(ReadUtils.read$TYPE_MESSAGE(param1,new ChatList()));
                                             }
                                          }
                                          else
                                          {
                                             this.talk.push(ReadUtils.read$TYPE_MESSAGE(param1,new PrivateTalk()));
                                          }
                                       }
                                       else
                                       {
                                          this.deletefriends.push(ReadUtils.read$TYPE_MESSAGE(param1,new GameFriendData()));
                                       }
                                    }
                                    else
                                    {
                                       this.applyrefusefriends.push(ReadUtils.read$TYPE_MESSAGE(param1,new GameFriendData()));
                                    }
                                 }
                                 else
                                 {
                                    this.applyagreefriends.push(ReadUtils.read$TYPE_MESSAGE(param1,new GameFriendData()));
                                 }
                              }
                              else
                              {
                                 this.applyfriends.push(ReadUtils.read$TYPE_MESSAGE(param1,new GameFriendData()));
                              }
                           }
                           else
                           {
                              this.heimingdaninfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new GameFriendData()));
                           }
                        }
                        else
                        {
                           this.strangerfriendsinfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new GameFriendData()));
                        }
                     }
                     else
                     {
                        this.crossfriendsinfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new GameFriendData()));
                     }
                  }
                  else
                  {
                     this.gangfriendsinfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new GameFriendData()));
                  }
               }
               else
               {
                  this.recenctcontactinfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new GameFriendData()));
               }
            }
            else
            {
               this.friendsinfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new GameFriendData()));
            }
         }
      }
   }
}
