package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class EliteInvadeFightEndRes extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.EliteInvadeFightEndRes.id","id",8 | 0);
      
      public static const RESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.EliteInvadeFightEndRes.result","result",16 | 0);
      
      public static const HP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.EliteInvadeFightEndRes.hp","hp",24 | 0);
      
      public static const MAXHP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.EliteInvadeFightEndRes.maxhp","maxhp",32 | 0);
      
      public static const PLAYER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.EliteInvadeFightEndRes.player","player",40 | 2,proto.LvExp);
       
      
      public var id:uint;
      
      private var result$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var hp$field:uint;
      
      private var maxhp$field:uint;
      
      private var player$field:proto.LvExp;
      
      public function EliteInvadeFightEndRes()
      {
         super();
      }
      
      public function clearResult() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         result$field = new uint();
      }
      
      public function get hasResult() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set result(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         result$field = param1;
      }
      
      public function get result() : uint
      {
         return result$field;
      }
      
      public function clearHp() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         hp$field = new uint();
      }
      
      public function get hasHp() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set hp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         hp$field = param1;
      }
      
      public function get hp() : uint
      {
         return hp$field;
      }
      
      public function clearMaxhp() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         maxhp$field = new uint();
      }
      
      public function get hasMaxhp() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set maxhp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         maxhp$field = param1;
      }
      
      public function get maxhp() : uint
      {
         return maxhp$field;
      }
      
      public function clearPlayer() : void
      {
         player$field = null;
      }
      
      public function get hasPlayer() : Boolean
      {
         return player$field != null;
      }
      
      public function set player(param1:proto.LvExp) : void
      {
         player$field = param1;
      }
      
      public function get player() : proto.LvExp
      {
         return player$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         if(hasResult)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,result$field);
         }
         if(hasHp)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,hp$field);
         }
         if(hasMaxhp)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,maxhp$field);
         }
         if(hasPlayer)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,player$field);
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
         var _loc5_:* = 0;
         var _loc8_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: EliteInvadeFightEndRes.id cannot be set twice.");
                  }
                  _loc8_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: EliteInvadeFightEndRes.result cannot be set twice.");
                  }
                  _loc4_++;
                  this.result = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: EliteInvadeFightEndRes.hp cannot be set twice.");
                  }
                  _loc7_++;
                  this.hp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: EliteInvadeFightEndRes.maxhp cannot be set twice.");
                  }
                  _loc3_++;
                  this.maxhp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: EliteInvadeFightEndRes.player cannot be set twice.");
                  }
                  _loc6_++;
                  this.player = new proto.LvExp();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.player);
                  continue;
            }
         }
      }
   }
}
