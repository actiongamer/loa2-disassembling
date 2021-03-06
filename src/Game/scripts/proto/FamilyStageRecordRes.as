package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyStageRecordRes extends Message
   {
      
      public static const RANK:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyStageRecordRes.rank","rank",8 | 2,proto.StageBtlReport);
      
      public static const LASTFIGHT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyStageRecordRes.lastfight","lastfight",16 | 2,proto.StageBtlReport);
       
      
      public var rank:Array;
      
      private var lastfight$field:proto.StageBtlReport;
      
      public function FamilyStageRecordRes()
      {
         rank = [];
         super();
      }
      
      public function clearLastfight() : void
      {
         lastfight$field = null;
      }
      
      public function get hasLastfight() : Boolean
      {
         return lastfight$field != null;
      }
      
      public function set lastfight(param1:proto.StageBtlReport) : void
      {
         lastfight$field = param1;
      }
      
      public function get lastfight() : proto.StageBtlReport
      {
         return lastfight$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.rank.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rank[_loc2_]);
            _loc2_++;
         }
         if(hasLastfight)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,lastfight$field);
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
                  this.rank.push(ReadUtils.read$TYPE_MESSAGE(param1,new proto.StageBtlReport()));
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageRecordRes.lastfight cannot be set twice.");
                  }
                  _loc3_++;
                  this.lastfight = new proto.StageBtlReport();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.lastfight);
                  continue;
            }
         }
      }
   }
}
