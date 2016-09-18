package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class JueRoadRecordRes extends Message
   {
      
      public static const ZUIQIANG:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.JueRoadRecordRes.zuiqiang","zuiqiang",8 | 2,StageBtlReport);
      
      public static const JIXIAN:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.JueRoadRecordRes.jixian","jixian",16 | 2,StageBtlReport);
      
      public static const SHOUSHA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.JueRoadRecordRes.shousha","shousha",24 | 2,proto.PlayerBaseInfo);
      
      public static const SHOUSHAREPORTID:RepeatedFieldDescriptor$TYPE_STRING = new RepeatedFieldDescriptor$TYPE_STRING("proto.JueRoadRecordRes.shoushareportid","shoushareportid",32 | 2);
       
      
      public var zuiqiang:Array;
      
      public var jixian:Array;
      
      private var shousha$field:proto.PlayerBaseInfo;
      
      public var shoushareportid:Array;
      
      public function JueRoadRecordRes()
      {
         zuiqiang = [];
         jixian = [];
         shoushareportid = [];
         super();
      }
      
      public function clearShousha() : void
      {
         shousha$field = null;
      }
      
      public function get hasShousha() : Boolean
      {
         return shousha$field != null;
      }
      
      public function set shousha(param1:proto.PlayerBaseInfo) : void
      {
         shousha$field = param1;
      }
      
      public function get shousha() : proto.PlayerBaseInfo
      {
         return shousha$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = 0;
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         _loc4_ = uint(0);
         while(_loc4_ < this.zuiqiang.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.zuiqiang[_loc4_]);
            _loc4_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.jixian.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.jixian[_loc3_]);
            _loc3_++;
         }
         if(hasShousha)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,shousha$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.shoushareportid.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,this.shoushareportid[_loc2_]);
            _loc2_++;
         }
         var _loc7_:int = 0;
         var _loc6_:* = this;
         for(var _loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
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
                  this.zuiqiang.push(ReadUtils.read$TYPE_MESSAGE(param1,new StageBtlReport()));
                  continue;
               case 1:
                  this.jixian.push(ReadUtils.read$TYPE_MESSAGE(param1,new StageBtlReport()));
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: JueRoadRecordRes.shousha cannot be set twice.");
                  }
                  _loc4_++;
                  this.shousha = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.shousha);
                  continue;
               case 3:
                  this.shoushareportid.push(ReadUtils.read$TYPE_STRING(param1));
                  continue;
            }
         }
      }
   }
}
