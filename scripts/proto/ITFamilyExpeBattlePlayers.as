package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ITFamilyExpeBattlePlayers extends Message
   {
      
      public static const PLAYER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ITFamilyExpeBattlePlayers.player","player",8 | 2,proto.PlayerBaseInfo);
      
      public static const BPS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ITFamilyExpeBattlePlayers.bps","bps",16 | 2,BattlePlayer);
       
      
      private var player$field:proto.PlayerBaseInfo;
      
      public var bps:Array;
      
      public function ITFamilyExpeBattlePlayers()
      {
         bps = [];
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasPlayer)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,player$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.bps.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.bps[_loc2_]);
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
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ITFamilyExpeBattlePlayers.player cannot be set twice.");
                  }
                  _loc4_++;
                  this.player = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.player);
                  continue;
               case 1:
                  this.bps.push(ReadUtils.read$TYPE_MESSAGE(param1,new BattlePlayer()));
                  continue;
            }
         }
      }
   }
}
