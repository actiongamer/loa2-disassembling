package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgStageGetReportRes extends Message
   {
      
      public static const REPORTINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BgStageGetReportRes.reportInfos","reportInfos",8 | 2,BgStageReportInfo);
      
      public static const MYINITHONOR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageGetReportRes.myInitHonor","myInitHonor",16 | 0);
      
      public static const MYINITSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageGetReportRes.myInitScore","myInitScore",24 | 0);
      
      public static const END:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.BgStageGetReportRes.end","end",32 | 0);
       
      
      public var reportInfos:Array;
      
      private var myInitHonor$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var myInitScore$field:uint;
      
      private var end$field:Boolean;
      
      public function BgStageGetReportRes()
      {
         reportInfos = [];
         super();
      }
      
      public function clearMyInitHonor() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         myInitHonor$field = new uint();
      }
      
      public function get hasMyInitHonor() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set myInitHonor(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         myInitHonor$field = param1;
      }
      
      public function get myInitHonor() : uint
      {
         return myInitHonor$field;
      }
      
      public function clearMyInitScore() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         myInitScore$field = new uint();
      }
      
      public function get hasMyInitScore() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set myInitScore(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         myInitScore$field = param1;
      }
      
      public function get myInitScore() : uint
      {
         return myInitScore$field;
      }
      
      public function clearEnd() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         end$field = new Boolean();
      }
      
      public function get hasEnd() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set end(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 4;
         end$field = param1;
      }
      
      public function get end() : Boolean
      {
         return end$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.reportInfos.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reportInfos[_loc2_]);
            _loc2_++;
         }
         if(hasMyInitHonor)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,myInitHonor$field);
         }
         if(hasMyInitScore)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,myInitScore$field);
         }
         if(hasEnd)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_BOOL(param1,end$field);
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
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  this.reportInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new BgStageReportInfo()));
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageGetReportRes.myInitHonor cannot be set twice.");
                  }
                  _loc3_++;
                  this.myInitHonor = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageGetReportRes.myInitScore cannot be set twice.");
                  }
                  _loc6_++;
                  this.myInitScore = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageGetReportRes.end cannot be set twice.");
                  }
                  _loc5_++;
                  this.end = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
