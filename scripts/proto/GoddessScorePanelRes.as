package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GoddessScorePanelRes extends Message
   {
      
      public static const SCOREID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.GoddessScorePanelRes.scoreId","scoreId",8 | 0);
      
      public static const MYSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GoddessScorePanelRes.myScore","myScore",16 | 0);
      
      public static const RANKAWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.GoddessScorePanelRes.rankAward","rankAward",24 | 2,StaticGoddesAwardModel);
       
      
      public var scoreId:Array;
      
      public var myScore:uint;
      
      public var rankAward:Array;
      
      public function GoddessScorePanelRes()
      {
         scoreId = [];
         rankAward = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.scoreId.length)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,this.scoreId[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.myScore);
         _loc3_ = uint(0);
         while(_loc3_ < this.rankAward.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rankAward[_loc3_]);
            _loc3_++;
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.scoreId);
                  }
                  else
                  {
                     this.scoreId.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: GoddessScorePanelRes.myScore cannot be set twice.");
                  }
                  _loc3_++;
                  this.myScore = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  this.rankAward.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticGoddesAwardModel()));
                  continue;
            }
         }
      }
   }
}
