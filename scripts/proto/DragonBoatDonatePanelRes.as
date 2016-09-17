package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import proto.DragonBoatDonatePanelRes.DonateInfo;
   import proto.DragonBoatDonatePanelRes.DonateLog;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class DragonBoatDonatePanelRes extends Message
   {
      
      public static const LASTREQSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.DragonBoatDonatePanelRes.lastReqStamp","lastReqStamp",8 | 0);
      
      public static const INFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.DragonBoatDonatePanelRes.info","info",16 | 2,DonateInfo);
      
      public static const LOG:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.DragonBoatDonatePanelRes.log","log",24 | 2,DonateLog);
       
      
      private var lastReqStamp$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var info:Array;
      
      public var log:Array;
      
      public function DragonBoatDonatePanelRes()
      {
         info = [];
         log = [];
         super();
      }
      
      public function clearLastReqStamp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         lastReqStamp$field = new uint();
      }
      
      public function get hasLastReqStamp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set lastReqStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         lastReqStamp$field = param1;
      }
      
      public function get lastReqStamp() : uint
      {
         return lastReqStamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         if(hasLastReqStamp)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,lastReqStamp$field);
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.info.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.info[_loc3_]);
            _loc3_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.log.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.log[_loc2_]);
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
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: DragonBoatDonatePanelRes.lastReqStamp cannot be set twice.");
                  }
                  _loc4_++;
                  this.lastReqStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.info.push(ReadUtils.read$TYPE_MESSAGE(param1,new DonateInfo()));
                  continue;
               case 2:
                  this.log.push(ReadUtils.read$TYPE_MESSAGE(param1,new DonateLog()));
                  continue;
            }
         }
      }
   }
}
