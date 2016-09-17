package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class QuestionPanelRes extends Message
   {
      
      public static const FINISH:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.QuestionPanelRes.finish","finish",8 | 0);
      
      public static const AN:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.QuestionPanelRes.an","an",16 | 2,Answer);
       
      
      public var finish:Boolean;
      
      public var an:Array;
      
      public function QuestionPanelRes()
      {
         an = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.finish);
         _loc3_ = uint(0);
         while(_loc3_ < this.an.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.an[_loc3_]);
            _loc3_++;
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: QuestionPanelRes.finish cannot be set twice.");
                  }
                  _loc4_++;
                  this.finish = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  this.an.push(ReadUtils.read$TYPE_MESSAGE(param1,new Answer()));
                  continue;
            }
         }
      }
   }
}
