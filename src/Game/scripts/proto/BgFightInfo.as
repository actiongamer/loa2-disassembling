package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgFightInfo extends Message
   {
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BgFightInfo.playerId","playerId",8 | 0);
      
      public static const INITPLAYER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BgFightInfo.initPlayer","initPlayer",16 | 2,BattlePlayer);
      
      public static const RESULTPLAYER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BgFightInfo.resultPlayer","resultPlayer",24 | 2,BattlePlayer);
       
      
      public var playerId:UInt64;
      
      public var initPlayer:Array;
      
      public var resultPlayer:Array;
      
      public function BgFightInfo()
      {
         initPlayer = [];
         resultPlayer = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.playerId);
         _loc3_ = uint(0);
         while(_loc3_ < this.initPlayer.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.initPlayer[_loc3_]);
            _loc3_++;
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.resultPlayer.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.resultPlayer[_loc4_]);
            _loc4_++;
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: BgFightInfo.playerId cannot be set twice.");
                  }
                  _loc4_++;
                  this.playerId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  this.initPlayer.push(ReadUtils.read$TYPE_MESSAGE(param1,new BattlePlayer()));
                  continue;
               case 2:
                  this.resultPlayer.push(ReadUtils.read$TYPE_MESSAGE(param1,new BattlePlayer()));
                  continue;
            }
         }
      }
   }
}
