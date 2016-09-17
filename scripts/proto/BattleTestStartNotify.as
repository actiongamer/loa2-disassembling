package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BattleTestStartNotify extends Message
   {
      
      public static const LEFT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.BattleTestStartNotify.left","left",8 | 0);
      
      public static const PLAYER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BattleTestStartNotify.player","player",16 | 2,BattlePlayer);
       
      
      public var left:Boolean;
      
      public var player:Array;
      
      public function BattleTestStartNotify()
      {
         player = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.left);
         _loc2_ = uint(0);
         while(_loc2_ < this.player.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.player[_loc2_]);
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
                     throw new IOError("Bad data format: BattleTestStartNotify.left cannot be set twice.");
                  }
                  _loc4_++;
                  this.left = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  this.player.push(ReadUtils.read$TYPE_MESSAGE(param1,new BattlePlayer()));
                  continue;
            }
         }
      }
   }
}
