package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   
   public class GuajiLogRes extends Message
   {
      
      public static const LOG:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.GuajiLogRes.log","log",8 | 2,EventLog);
      
      public static const PVPLOG:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.GuajiLogRes.pvpLog","pvpLog",16 | 2,EventLog);
       
      
      public var log:Array;
      
      public var pvpLog:Array;
      
      public function GuajiLogRes()
      {
         log = [];
         pvpLog = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.log.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.log[_loc2_]);
            _loc2_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.pvpLog.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.pvpLog[_loc3_]);
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
         var _loc3_:* = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  this.log.push(ReadUtils.read$TYPE_MESSAGE(param1,new EventLog()));
                  continue;
               case 1:
                  this.pvpLog.push(ReadUtils.read$TYPE_MESSAGE(param1,new EventLog()));
                  continue;
            }
         }
      }
   }
}
