package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class DragonBoatSingleRewardRes extends Message
   {
      
      public static const HAVEGETID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.DragonBoatSingleRewardRes.haveGetId","haveGetId",8 | 0);
      
      public static const MYSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.DragonBoatSingleRewardRes.myScore","myScore",16 | 0);
       
      
      public var haveGetId:Array;
      
      private var myScore$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function DragonBoatSingleRewardRes()
      {
         haveGetId = [];
         super();
      }
      
      public function clearMyScore() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         myScore$field = new uint();
      }
      
      public function get hasMyScore() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set myScore(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         myScore$field = param1;
      }
      
      public function get myScore() : uint
      {
         return myScore$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.haveGetId.length)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,this.haveGetId[_loc2_]);
            _loc2_++;
         }
         if(hasMyScore)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,myScore$field);
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
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if((_loc4_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.haveGetId);
                  }
                  else
                  {
                     this.haveGetId.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: DragonBoatSingleRewardRes.myScore cannot be set twice.");
                  }
                  _loc3_++;
                  this.myScore = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
