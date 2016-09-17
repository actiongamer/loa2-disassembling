package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_FLOAT;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class MineInfo extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineInfo.id","id",8 | 0);
      
      public static const PLAYER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.MineInfo.player","player",24 | 2,proto.PlayerBaseInfo);
      
      public static const HELP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.MineInfo.help","help",32 | 2,proto.PlayerBaseInfo);
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineInfo.time","time",40 | 0);
      
      public static const HTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineInfo.hTime","hTime",48 | 0);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.MineInfo.reward","reward",56 | 2,MapKey32Valuef32);
      
      public static const STATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineInfo.state","state",64 | 0);
      
      public static const USEDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineInfo.usedTime","usedTime",72 | 0);
      
      public static const LOST:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.MineInfo.lost","lost",80 | 5);
      
      public static const ISGET:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.MineInfo.isGet","isGet",88 | 0);
      
      public static const PROTECT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineInfo.protect","protect",96 | 0);
       
      
      public var id:uint;
      
      private var player$field:proto.PlayerBaseInfo;
      
      private var help$field:proto.PlayerBaseInfo;
      
      private var time$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var hTime$field:uint;
      
      public var reward:Array;
      
      private var state$field:uint;
      
      private var usedTime$field:uint;
      
      private var lost$field:Number;
      
      private var isGet$field:Boolean;
      
      private var protect$field:uint;
      
      public function MineInfo()
      {
         reward = [];
         super();
      }
      
      public function clearPlayer() : void
      {
         player$field = null;
      }
      
      public function get hasPlayer() : Boolean
      {
         return player$field != null;
      }
      
      public function set player(param1:proto.PlayerBaseInfo) : void
      {
         player$field = param1;
      }
      
      public function get player() : proto.PlayerBaseInfo
      {
         return player$field;
      }
      
      public function clearHelp() : void
      {
         help$field = null;
      }
      
      public function get hasHelp() : Boolean
      {
         return help$field != null;
      }
      
      public function set help(param1:proto.PlayerBaseInfo) : void
      {
         help$field = param1;
      }
      
      public function get help() : proto.PlayerBaseInfo
      {
         return help$field;
      }
      
      public function clearTime() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         time$field = new uint();
      }
      
      public function get hasTime() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set time(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         time$field = param1;
      }
      
      public function get time() : uint
      {
         return time$field;
      }
      
      public function clearHTime() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         hTime$field = new uint();
      }
      
      public function get hasHTime() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set hTime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         hTime$field = param1;
      }
      
      public function get hTime() : uint
      {
         return hTime$field;
      }
      
      public function clearState() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         state$field = new uint();
      }
      
      public function get hasState() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set state(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         state$field = param1;
      }
      
      public function get state() : uint
      {
         return state$field;
      }
      
      public function clearUsedTime() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         usedTime$field = new uint();
      }
      
      public function get hasUsedTime() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set usedTime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         usedTime$field = param1;
      }
      
      public function get usedTime() : uint
      {
         return usedTime$field;
      }
      
      public function clearLost() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         lost$field = new Number();
      }
      
      public function get hasLost() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set lost(param1:Number) : void
      {
         hasField$0 = hasField$0 | 16;
         lost$field = param1;
      }
      
      public function get lost() : Number
      {
         return lost$field;
      }
      
      public function clearIsGet() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         isGet$field = new Boolean();
      }
      
      public function get hasIsGet() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set isGet(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 32;
         isGet$field = param1;
      }
      
      public function get isGet() : Boolean
      {
         return isGet$field;
      }
      
      public function clearProtect() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         protect$field = new uint();
      }
      
      public function get hasProtect() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set protect(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         protect$field = param1;
      }
      
      public function get protect() : uint
      {
         return protect$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         if(hasPlayer)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,player$field);
         }
         if(hasHelp)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,help$field);
         }
         if(hasTime)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,time$field);
         }
         if(hasHTime)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,hTime$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc2_]);
            _loc2_++;
         }
         if(hasState)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,state$field);
         }
         if(hasUsedTime)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,usedTime$field);
         }
         if(hasLost)
         {
            WriteUtils.writeTag(param1,5,10);
            WriteUtils.write$TYPE_FLOAT(param1,lost$field);
         }
         if(hasIsGet)
         {
            WriteUtils.writeTag(param1,0,11);
            WriteUtils.write$TYPE_BOOL(param1,isGet$field);
         }
         if(hasProtect)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT32(param1,protect$field);
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
         var _loc7_:* = 0;
         var _loc13_:uint = 0;
         var _loc9_:uint = 0;
         var _loc11_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc8_:uint = 0;
         var _loc4_:uint = 0;
         var _loc12_:uint = 0;
         var _loc10_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: MineInfo.id cannot be set twice.");
                  }
                  _loc13_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               default:
                  super.readUnknown(param1,_loc7_);
                  continue;
               case 2:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: MineInfo.player cannot be set twice.");
                  }
                  _loc9_++;
                  this.player = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.player);
                  continue;
               case 3:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: MineInfo.help cannot be set twice.");
                  }
                  _loc11_++;
                  this.help = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.help);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: MineInfo.time cannot be set twice.");
                  }
                  _loc3_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: MineInfo.hTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.hTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new MapKey32Valuef32()));
                  continue;
               case 7:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: MineInfo.state cannot be set twice.");
                  }
                  _loc5_++;
                  this.state = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: MineInfo.usedTime cannot be set twice.");
                  }
                  _loc8_++;
                  this.usedTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: MineInfo.lost cannot be set twice.");
                  }
                  _loc4_++;
                  this.lost = ReadUtils.read$TYPE_FLOAT(param1);
                  continue;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: MineInfo.isGet cannot be set twice.");
                  }
                  _loc12_++;
                  this.isGet = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 11:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: MineInfo.protect cannot be set twice.");
                  }
                  _loc10_++;
                  this.protect = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
