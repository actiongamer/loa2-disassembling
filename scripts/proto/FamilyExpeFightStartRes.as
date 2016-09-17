package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   
   public class FamilyExpeFightStartRes extends Message
   {
      
      public static const RANDOM:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.FamilyExpeFightStartRes.random","random",8 | 0);
      
      public static const BPS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeFightStartRes.bps","bps",16 | 2,BattlePlayer);
       
      
      public var random:Array;
      
      public var bps:Array;
      
      public function FamilyExpeFightStartRes()
      {
         random = [];
         bps = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         _loc3_ = uint(0);
         while(_loc3_ < this.random.length)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,this.random[_loc3_]);
            _loc3_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.bps.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.bps[_loc2_]);
            _loc2_++;
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
         var _loc3_:* = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.random);
                  }
                  else
                  {
                     this.random.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 1:
                  this.bps.push(ReadUtils.read$TYPE_MESSAGE(param1,new BattlePlayer()));
                  continue;
            }
         }
      }
   }
}
