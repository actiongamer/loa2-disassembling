package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class StageBtlGuideRes extends Message
   {
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StageBtlGuideRes.stageId","stageId",8 | 0);
      
      public static const SHOUSHA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.StageBtlGuideRes.shousha","shousha",16 | 2,proto.StageBtlReport);
      
      public static const ZUIQIANG:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.StageBtlGuideRes.zuiqiang","zuiqiang",24 | 2,proto.StageBtlReport);
      
      public static const JIXIAN:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.StageBtlGuideRes.jixian","jixian",32 | 2,proto.StageBtlReport);
       
      
      public var stageId:uint;
      
      private var shousha$field:proto.StageBtlReport;
      
      public var zuiqiang:Array;
      
      public var jixian:Array;
      
      public function StageBtlGuideRes()
      {
         zuiqiang = [];
         jixian = [];
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
      
      public function set shousha(param1:proto.StageBtlReport) : void
      {
         shousha$field = param1;
      }
      
      public function get shousha() : proto.StageBtlReport
      {
         return shousha$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.stageId);
         if(hasShousha)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,shousha$field);
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.zuiqiang.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.zuiqiang[_loc3_]);
            _loc3_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.jixian.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.jixian[_loc2_]);
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
         var _loc4_:* = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StageBtlGuideRes.stageId cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StageBtlGuideRes.shousha cannot be set twice.");
                  }
                  _loc5_++;
                  this.shousha = new proto.StageBtlReport();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.shousha);
                  continue;
               case 2:
                  this.zuiqiang.push(ReadUtils.read$TYPE_MESSAGE(param1,new proto.StageBtlReport()));
                  continue;
               case 3:
                  this.jixian.push(ReadUtils.read$TYPE_MESSAGE(param1,new proto.StageBtlReport()));
                  continue;
            }
         }
      }
   }
}
