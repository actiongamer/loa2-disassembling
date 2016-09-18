package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgStageEndNotify extends Message
   {
      
      public static const WINNERSIDE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageEndNotify.winnerSide","winnerSide",8 | 0);
      
      public static const REPORTINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BgStageEndNotify.reportInfos","reportInfos",16 | 2,BgStageReportInfo);
      
      public static const MYINITHONOR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageEndNotify.myInitHonor","myInitHonor",24 | 0);
      
      public static const MYINITSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgStageEndNotify.myInitScore","myInitScore",32 | 0);
       
      
      private var winnerSide$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var reportInfos:Array;
      
      private var myInitHonor$field:uint;
      
      private var myInitScore$field:uint;
      
      public function BgStageEndNotify()
      {
         reportInfos = [];
         super();
      }
      
      public function clearWinnerSide() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         winnerSide$field = new uint();
      }
      
      public function get hasWinnerSide() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set winnerSide(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         winnerSide$field = param1;
      }
      
      public function get winnerSide() : uint
      {
         return winnerSide$field;
      }
      
      public function clearMyInitHonor() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         myInitHonor$field = new uint();
      }
      
      public function get hasMyInitHonor() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set myInitHonor(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         myInitHonor$field = param1;
      }
      
      public function get myInitHonor() : uint
      {
         return myInitHonor$field;
      }
      
      public function clearMyInitScore() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         myInitScore$field = new uint();
      }
      
      public function get hasMyInitScore() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set myInitScore(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         myInitScore$field = param1;
      }
      
      public function get myInitScore() : uint
      {
         return myInitScore$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasWinnerSide)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,winnerSide$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.reportInfos.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reportInfos[_loc2_]);
            _loc2_++;
         }
         if(hasMyInitHonor)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,myInitHonor$field);
         }
         if(hasMyInitScore)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,myInitScore$field);
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
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageEndNotify.winnerSide cannot be set twice.");
                  }
                  _loc4_++;
                  this.winnerSide = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.reportInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new BgStageReportInfo()));
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageEndNotify.myInitHonor cannot be set twice.");
                  }
                  _loc3_++;
                  this.myInitHonor = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BgStageEndNotify.myInitScore cannot be set twice.");
                  }
                  _loc6_++;
                  this.myInitScore = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
