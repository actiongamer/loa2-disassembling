package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class Para extends Message
   {
      
      public static const INTV:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.Para.intv","intv",8 | 0);
      
      public static const STR:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.Para.str","str",16 | 2);
      
      public static const BIGINTV:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.Para.bigintv","bigintv",24 | 0);
      
      public static const PLAYER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.Para.player","player",32 | 2,proto.PlayerBaseInfo);
      
      public static const ITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.Para.item","item",40 | 2,proto.Item);
      
      public static const BAOWU:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.Para.baowu","baowu",48 | 2,proto.BaoWu);
      
      public static const HERO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.Para.hero","hero",56 | 2,proto.HeroInfo);
      
      public static const PARAS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.Para.paras","paras",64 | 2,Para);
       
      
      private var intv$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var str$field:String;
      
      private var bigintv$field:UInt64;
      
      private var player$field:proto.PlayerBaseInfo;
      
      private var item$field:proto.Item;
      
      private var baowu$field:proto.BaoWu;
      
      private var hero$field:proto.HeroInfo;
      
      public var paras:Array;
      
      public function Para()
      {
         paras = [];
         super();
      }
      
      public function clearIntv() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         intv$field = new uint();
      }
      
      public function get hasIntv() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set intv(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         intv$field = param1;
      }
      
      public function get intv() : uint
      {
         return intv$field;
      }
      
      public function clearStr() : void
      {
         str$field = null;
      }
      
      public function get hasStr() : Boolean
      {
         return str$field != null;
      }
      
      public function set str(param1:String) : void
      {
         str$field = param1;
      }
      
      public function get str() : String
      {
         return str$field;
      }
      
      public function clearBigintv() : void
      {
         bigintv$field = null;
      }
      
      public function get hasBigintv() : Boolean
      {
         return bigintv$field != null;
      }
      
      public function set bigintv(param1:UInt64) : void
      {
         bigintv$field = param1;
      }
      
      public function get bigintv() : UInt64
      {
         return bigintv$field;
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
      
      public function clearItem() : void
      {
         item$field = null;
      }
      
      public function get hasItem() : Boolean
      {
         return item$field != null;
      }
      
      public function set item(param1:proto.Item) : void
      {
         item$field = param1;
      }
      
      public function get item() : proto.Item
      {
         return item$field;
      }
      
      public function clearBaowu() : void
      {
         baowu$field = null;
      }
      
      public function get hasBaowu() : Boolean
      {
         return baowu$field != null;
      }
      
      public function set baowu(param1:proto.BaoWu) : void
      {
         baowu$field = param1;
      }
      
      public function get baowu() : proto.BaoWu
      {
         return baowu$field;
      }
      
      public function clearHero() : void
      {
         hero$field = null;
      }
      
      public function get hasHero() : Boolean
      {
         return hero$field != null;
      }
      
      public function set hero(param1:proto.HeroInfo) : void
      {
         hero$field = param1;
      }
      
      public function get hero() : proto.HeroInfo
      {
         return hero$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasIntv)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,intv$field);
         }
         if(hasStr)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,str$field);
         }
         if(hasBigintv)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT64(param1,bigintv$field);
         }
         if(hasPlayer)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,player$field);
         }
         if(hasItem)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,item$field);
         }
         if(hasBaowu)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_MESSAGE(param1,baowu$field);
         }
         if(hasHero)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,hero$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.paras.length)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.paras[_loc2_]);
            _loc2_++;
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
         var _loc4_:* = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc10_:uint = 0;
         var _loc7_:uint = 0;
         var _loc9_:uint = 0;
         var _loc5_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Para.intv cannot be set twice.");
                  }
                  _loc6_++;
                  this.intv = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Para.str cannot be set twice.");
                  }
                  _loc3_++;
                  this.str = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Para.bigintv cannot be set twice.");
                  }
                  _loc10_++;
                  this.bigintv = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Para.player cannot be set twice.");
                  }
                  _loc7_++;
                  this.player = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.player);
                  continue;
               case 4:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Para.item cannot be set twice.");
                  }
                  _loc9_++;
                  this.item = new proto.Item();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.item);
                  continue;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Para.baowu cannot be set twice.");
                  }
                  _loc5_++;
                  this.baowu = new proto.BaoWu();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baowu);
                  continue;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Para.hero cannot be set twice.");
                  }
                  _loc8_++;
                  this.hero = new proto.HeroInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.hero);
                  continue;
               case 7:
                  this.paras.push(ReadUtils.read$TYPE_MESSAGE(param1,new Para()));
                  continue;
            }
         }
      }
   }
}
