package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgFightNpcRes extends Message
   {
      
      public static const ATTACKER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BgFightNpcRes.attacker","attacker",8 | 2,proto.BgFightInfo);
      
      public static const TARGET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BgFightNpcRes.target","target",16 | 2,proto.BgFightInfo);
      
      public static const ISWIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.BgFightNpcRes.isWin","isWin",24 | 0);
      
      public static const NPCABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BgFightNpcRes.npcAbility","npcAbility",32 | 0);
       
      
      public var attacker:proto.BgFightInfo;
      
      public var target:proto.BgFightInfo;
      
      private var isWin$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var npcAbility$field:UInt64;
      
      public function BgFightNpcRes()
      {
         super();
      }
      
      public function clearIsWin() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         isWin$field = new Boolean();
      }
      
      public function get hasIsWin() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set isWin(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         isWin$field = param1;
      }
      
      public function get isWin() : Boolean
      {
         return isWin$field;
      }
      
      public function clearNpcAbility() : void
      {
         npcAbility$field = null;
      }
      
      public function get hasNpcAbility() : Boolean
      {
         return npcAbility$field != null;
      }
      
      public function set npcAbility(param1:UInt64) : void
      {
         npcAbility$field = param1;
      }
      
      public function get npcAbility() : UInt64
      {
         return npcAbility$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.attacker);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_MESSAGE(param1,this.target);
         if(hasIsWin)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_BOOL(param1,isWin$field);
         }
         if(hasNpcAbility)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT64(param1,npcAbility$field);
         }
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc5_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BgFightNpcRes.attacker cannot be set twice.");
                  }
                  _loc5_++;
                  this.attacker = new proto.BgFightInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.attacker);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BgFightNpcRes.target cannot be set twice.");
                  }
                  _loc7_++;
                  this.target = new proto.BgFightInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.target);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BgFightNpcRes.isWin cannot be set twice.");
                  }
                  _loc3_++;
                  this.isWin = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BgFightNpcRes.npcAbility cannot be set twice.");
                  }
                  _loc6_++;
                  this.npcAbility = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
