package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TowerInfoRes extends Message
   {
      
      public static const LVS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("proto.TowerInfoRes.lvs","lvs",8 | 0);
      
      public static const SCORE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.TowerInfoRes.score","score",16 | 0);
      
      public static const INFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.TowerInfoRes.info","info",24 | 2,MineSweepShopInfo);
      
      public static const SCORED:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("proto.TowerInfoRes.scored","scored",32 | 0);
       
      
      public var lvs:Array;
      
      public var score:int;
      
      public var info:Array;
      
      public var scored:Array;
      
      public function TowerInfoRes()
      {
         lvs = [];
         info = [];
         scored = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = 0;
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         _loc5_ = uint(0);
         while(_loc5_ < this.lvs.length)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_INT32(param1,this.lvs[_loc5_]);
            _loc5_++;
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_INT32(param1,this.score);
         _loc3_ = uint(0);
         while(_loc3_ < this.info.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.info[_loc3_]);
            _loc3_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.scored.length)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_INT32(param1,this.scored[_loc2_]);
            _loc2_++;
         }
         var _loc7_:int = 0;
         var _loc6_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_INT32,this.lvs);
                  }
                  else
                  {
                     this.lvs.push(ReadUtils.read$TYPE_INT32(param1));
                  }
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: TowerInfoRes.score cannot be set twice.");
                  }
                  _loc4_++;
                  this.score = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 2:
                  this.info.push(ReadUtils.read$TYPE_MESSAGE(param1,new MineSweepShopInfo()));
                  continue;
               case 3:
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_INT32,this.scored);
                  }
                  else
                  {
                     this.scored.push(ReadUtils.read$TYPE_INT32(param1));
                  }
                  continue;
            }
         }
      }
   }
}
