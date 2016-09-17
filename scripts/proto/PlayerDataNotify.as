package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import proto.PlayerDataNotify.BaseInfo;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class PlayerDataNotify extends Message
   {
      
      public static const CMD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerDataNotify.cmd","cmd",8 | 0);
      
      public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.PlayerDataNotify.info","info",16 | 2,BaseInfo);
      
      public static const ADD_ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerDataNotify.add_items","addItems",24 | 2,Item);
      
      public static const ADD_HEROES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerDataNotify.add_heroes","addHeroes",32 | 2,HeroInfo);
      
      public static const REDUCE_ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerDataNotify.reduce_items","reduceItems",40 | 2,ItemReduce);
      
      public static const REDUCE_HEROES:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.PlayerDataNotify.reduce_heroes","reduceHeroes",48 | 0);
      
      public static const NEWHEROIDS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.PlayerDataNotify.newheroids","newheroids",56 | 0);
      
      public static const SOURCE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerDataNotify.source","source",64 | 2,Source);
      
      public static const ADD_BAOWU:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerDataNotify.add_baowu","addBaowu",88 | 2,BaoWu);
      
      public static const REDUCE_BAOWU:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.PlayerDataNotify.reduce_baowu","reduceBaowu",96 | 0);
       
      
      private var cmd$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var info$field:BaseInfo;
      
      public var addItems:Array;
      
      public var addHeroes:Array;
      
      public var reduceItems:Array;
      
      public var reduceHeroes:Array;
      
      public var newheroids:Array;
      
      public var source:Array;
      
      public var addBaowu:Array;
      
      public var reduceBaowu:Array;
      
      public function PlayerDataNotify()
      {
         addItems = [];
         addHeroes = [];
         reduceItems = [];
         reduceHeroes = [];
         newheroids = [];
         source = [];
         addBaowu = [];
         reduceBaowu = [];
         super();
      }
      
      public function clearCmd() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         cmd$field = new uint();
      }
      
      public function get hasCmd() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set cmd(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         cmd$field = param1;
      }
      
      public function get cmd() : uint
      {
         return cmd$field;
      }
      
      public function clearInfo() : void
      {
         info$field = null;
      }
      
      public function get hasInfo() : Boolean
      {
         return info$field != null;
      }
      
      public function set info(param1:BaseInfo) : void
      {
         info$field = param1;
      }
      
      public function get info() : BaseInfo
      {
         return info$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         var _loc6_:* = 0;
         var _loc5_:* = 0;
         var _loc4_:* = 0;
         var _loc7_:* = 0;
         if(hasCmd)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,cmd$field);
         }
         if(hasInfo)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,info$field);
         }
         _loc9_ = uint(0);
         while(_loc9_ < this.addItems.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.addItems[_loc9_]);
            _loc9_++;
         }
         _loc10_ = uint(0);
         while(_loc10_ < this.addHeroes.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.addHeroes[_loc10_]);
            _loc10_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.reduceItems.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reduceItems[_loc3_]);
            _loc3_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.reduceHeroes.length)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT64(param1,this.reduceHeroes[_loc2_]);
            _loc2_++;
         }
         _loc6_ = uint(0);
         while(_loc6_ < this.newheroids.length)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,this.newheroids[_loc6_]);
            _loc6_++;
         }
         _loc5_ = uint(0);
         while(_loc5_ < this.source.length)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.source[_loc5_]);
            _loc5_++;
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.addBaowu.length)
         {
            WriteUtils.writeTag(param1,2,11);
            WriteUtils.write$TYPE_MESSAGE(param1,this.addBaowu[_loc4_]);
            _loc4_++;
         }
         _loc7_ = uint(0);
         while(_loc7_ < this.reduceBaowu.length)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT64(param1,this.reduceBaowu[_loc7_]);
            _loc7_++;
         }
         var _loc12_:int = 0;
         var _loc11_:* = this;
         for(var _loc8_ in this)
         {
            super.writeUnknown(param1,_loc8_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerDataNotify.cmd cannot be set twice.");
                  }
                  _loc4_++;
                  this.cmd = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerDataNotify.info cannot be set twice.");
                  }
                  _loc5_++;
                  this.info = new BaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.info);
                  continue;
               case 2:
                  this.addItems.push(ReadUtils.read$TYPE_MESSAGE(param1,new Item()));
                  continue;
               case 3:
                  this.addHeroes.push(ReadUtils.read$TYPE_MESSAGE(param1,new HeroInfo()));
                  continue;
               case 4:
                  this.reduceItems.push(ReadUtils.read$TYPE_MESSAGE(param1,new ItemReduce()));
                  continue;
               case 5:
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.reduceHeroes);
                  }
                  else
                  {
                     this.reduceHeroes.push(ReadUtils.read$TYPE_UINT64(param1));
                  }
                  continue;
               case 6:
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.newheroids);
                  }
                  else
                  {
                     this.newheroids.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 7:
                  this.source.push(ReadUtils.read$TYPE_MESSAGE(param1,new Source()));
                  continue;
               default:
               default:
                  super.readUnknown(param1,_loc3_);
                  continue;
               case 10:
                  this.addBaowu.push(ReadUtils.read$TYPE_MESSAGE(param1,new BaoWu()));
                  continue;
               case 11:
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.reduceBaowu);
                  }
                  else
                  {
                     this.reduceBaowu.push(ReadUtils.read$TYPE_UINT64(param1));
                  }
                  continue;
            }
         }
      }
   }
}
