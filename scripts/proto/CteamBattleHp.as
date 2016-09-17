package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CteamBattleHp extends Message
   {
      
      public static const WINMAXHP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.CteamBattleHp.winMaxHp","winMaxHp",8 | 0);
      
      public static const WINNOWHP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.CteamBattleHp.winNowHp","winNowHp",16 | 0);
      
      public static const LOSEMAXHP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.CteamBattleHp.loseMaxHp","loseMaxHp",24 | 0);
      
      public static const LOSENOWHP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.CteamBattleHp.loseNowHp","loseNowHp",32 | 0);
       
      
      private var winMaxHp$field:UInt64;
      
      private var winNowHp$field:UInt64;
      
      private var loseMaxHp$field:UInt64;
      
      private var loseNowHp$field:UInt64;
      
      public function CteamBattleHp()
      {
         super();
      }
      
      public function clearWinMaxHp() : void
      {
         winMaxHp$field = null;
      }
      
      public function get hasWinMaxHp() : Boolean
      {
         return winMaxHp$field != null;
      }
      
      public function set winMaxHp(param1:UInt64) : void
      {
         winMaxHp$field = param1;
      }
      
      public function get winMaxHp() : UInt64
      {
         return winMaxHp$field;
      }
      
      public function clearWinNowHp() : void
      {
         winNowHp$field = null;
      }
      
      public function get hasWinNowHp() : Boolean
      {
         return winNowHp$field != null;
      }
      
      public function set winNowHp(param1:UInt64) : void
      {
         winNowHp$field = param1;
      }
      
      public function get winNowHp() : UInt64
      {
         return winNowHp$field;
      }
      
      public function clearLoseMaxHp() : void
      {
         loseMaxHp$field = null;
      }
      
      public function get hasLoseMaxHp() : Boolean
      {
         return loseMaxHp$field != null;
      }
      
      public function set loseMaxHp(param1:UInt64) : void
      {
         loseMaxHp$field = param1;
      }
      
      public function get loseMaxHp() : UInt64
      {
         return loseMaxHp$field;
      }
      
      public function clearLoseNowHp() : void
      {
         loseNowHp$field = null;
      }
      
      public function get hasLoseNowHp() : Boolean
      {
         return loseNowHp$field != null;
      }
      
      public function set loseNowHp(param1:UInt64) : void
      {
         loseNowHp$field = param1;
      }
      
      public function get loseNowHp() : UInt64
      {
         return loseNowHp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasWinMaxHp)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT64(param1,winMaxHp$field);
         }
         if(hasWinNowHp)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT64(param1,winNowHp$field);
         }
         if(hasLoseMaxHp)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT64(param1,loseMaxHp$field);
         }
         if(hasLoseNowHp)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT64(param1,loseNowHp$field);
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
         var _loc3_:* = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CteamBattleHp.winMaxHp cannot be set twice.");
                  }
                  _loc6_++;
                  this.winMaxHp = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: CteamBattleHp.winNowHp cannot be set twice.");
                  }
                  _loc7_++;
                  this.winNowHp = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CteamBattleHp.loseMaxHp cannot be set twice.");
                  }
                  _loc5_++;
                  this.loseMaxHp = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CteamBattleHp.loseNowHp cannot be set twice.");
                  }
                  _loc4_++;
                  this.loseNowHp = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
