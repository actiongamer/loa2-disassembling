package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import proto.StaticQuestionModel.Row;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class StaticQuestionModel extends Message
   {
      
      public static const ROWS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.StaticQuestionModel.rows","rows",8 | 2,Row);
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticQuestionModel.version","version",16 | 0);
      
      public static const STARTTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticQuestionModel.startTm","startTm",24 | 0);
      
      public static const ENDTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticQuestionModel.endTm","endTm",32 | 0);
      
      public static const TITLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticQuestionModel.title","title",40 | 2);
      
      public static const DETAIL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticQuestionModel.detail","detail",48 | 2);
       
      
      public var rows:Array;
      
      private var version$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var startTm$field:uint;
      
      private var endTm$field:uint;
      
      private var title$field:String;
      
      private var detail$field:String;
      
      public function StaticQuestionModel()
      {
         rows = [];
         super();
      }
      
      public function clearVersion() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         version$field = new uint();
      }
      
      public function get hasVersion() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set version(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         version$field = param1;
      }
      
      public function get version() : uint
      {
         return version$field;
      }
      
      public function clearStartTm() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         startTm$field = new uint();
      }
      
      public function get hasStartTm() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set startTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         startTm$field = param1;
      }
      
      public function get startTm() : uint
      {
         return startTm$field;
      }
      
      public function clearEndTm() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         endTm$field = new uint();
      }
      
      public function get hasEndTm() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set endTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         endTm$field = param1;
      }
      
      public function get endTm() : uint
      {
         return endTm$field;
      }
      
      public function clearTitle() : void
      {
         title$field = null;
      }
      
      public function get hasTitle() : Boolean
      {
         return title$field != null;
      }
      
      public function set title(param1:String) : void
      {
         title$field = param1;
      }
      
      public function get title() : String
      {
         return title$field;
      }
      
      public function clearDetail() : void
      {
         detail$field = null;
      }
      
      public function get hasDetail() : Boolean
      {
         return detail$field != null;
      }
      
      public function set detail(param1:String) : void
      {
         detail$field = param1;
      }
      
      public function get detail() : String
      {
         return detail$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.rows.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rows[_loc2_]);
            _loc2_++;
         }
         if(hasVersion)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,version$field);
         }
         if(hasStartTm)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,startTm$field);
         }
         if(hasEndTm)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,endTm$field);
         }
         if(hasTitle)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,title$field);
         }
         if(hasDetail)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,detail$field);
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
         var _loc5_:* = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  this.rows.push(ReadUtils.read$TYPE_MESSAGE(param1,new Row()));
                  continue;
               case 1:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticQuestionModel.version cannot be set twice.");
                  }
                  _loc8_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticQuestionModel.startTm cannot be set twice.");
                  }
                  _loc3_++;
                  this.startTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticQuestionModel.endTm cannot be set twice.");
                  }
                  _loc4_++;
                  this.endTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticQuestionModel.title cannot be set twice.");
                  }
                  _loc6_++;
                  this.title = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticQuestionModel.detail cannot be set twice.");
                  }
                  _loc7_++;
                  this.detail = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
