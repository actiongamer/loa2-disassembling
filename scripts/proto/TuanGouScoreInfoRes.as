package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TuanGouScoreInfoRes extends Message
   {
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TuanGouScoreInfoRes.score","score",8 | 0);
      
      public static const RECEIVEDSCOREID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.TuanGouScoreInfoRes.receivedScoreId","receivedScoreId",16 | 0);
       
      
      private var score$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var receivedScoreId:Array;
      
      public function TuanGouScoreInfoRes()
      {
         receivedScoreId = [];
         super();
      }
      
      public function clearScore() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         score$field = param1;
      }
      
      public function get score() : uint
      {
         return score$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasScore)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,score$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.receivedScoreId.length)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,this.receivedScoreId[_loc2_]);
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
                     throw new IOError("Bad data format: TuanGouScoreInfoRes.score cannot be set twice.");
                  }
                  _loc4_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.receivedScoreId);
                  }
                  else
                  {
                     this.receivedScoreId.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
            }
         }
      }
   }
}
