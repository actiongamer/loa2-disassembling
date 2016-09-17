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
   
   public class ArenaMultiChallengeResult extends Message
   {
      
      public static const ISWIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.ArenaMultiChallengeResult.isWin","isWin",8 | 0);
      
      public static const DROPS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ArenaMultiChallengeResult.drops","drops",16 | 2,Reward);
       
      
      public var isWin:Boolean;
      
      public var drops:Array;
      
      public function ArenaMultiChallengeResult()
      {
         drops = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.isWin);
         _loc3_ = uint(0);
         while(_loc3_ < this.drops.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.drops[_loc3_]);
            _loc3_++;
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaMultiChallengeResult.isWin cannot be set twice.");
                  }
                  _loc3_++;
                  this.isWin = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  this.drops.push(ReadUtils.read$TYPE_MESSAGE(param1,new Reward()));
                  continue;
            }
         }
      }
   }
}
