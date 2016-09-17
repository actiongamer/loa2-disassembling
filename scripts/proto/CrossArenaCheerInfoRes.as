package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CrossArenaCheerInfoRes extends Message
   {
      
      public static const CHEERINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.CrossArenaCheerInfoRes.cheerInfos","cheerInfos",8 | 2,CrossArenaCheerInfo);
      
      public static const MYCHEEREXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaCheerInfoRes.myCheerExp","myCheerExp",16 | 0);
      
      public static const RESIDUALTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaCheerInfoRes.residualTimes","residualTimes",24 | 0);
       
      
      public var cheerInfos:Array;
      
      public var myCheerExp:uint;
      
      private var residualTimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function CrossArenaCheerInfoRes()
      {
         cheerInfos = [];
         super();
      }
      
      public function clearResidualTimes() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         residualTimes$field = new uint();
      }
      
      public function get hasResidualTimes() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set residualTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         residualTimes$field = param1;
      }
      
      public function get residualTimes() : uint
      {
         return residualTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.cheerInfos.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cheerInfos[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.myCheerExp);
         if(hasResidualTimes)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,residualTimes$field);
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
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  this.cheerInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new CrossArenaCheerInfo()));
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaCheerInfoRes.myCheerExp cannot be set twice.");
                  }
                  _loc4_++;
                  this.myCheerExp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaCheerInfoRes.residualTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.residualTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
