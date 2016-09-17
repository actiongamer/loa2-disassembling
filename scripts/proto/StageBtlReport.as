package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class StageBtlReport extends Message
   {
      
      public static const REPORTID:RepeatedFieldDescriptor$TYPE_STRING = new RepeatedFieldDescriptor$TYPE_STRING("proto.StageBtlReport.reportId","reportId",8 | 2);
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.StageBtlReport.playerId","playerId",16 | 0);
      
      public static const HEROID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StageBtlReport.heroId","heroId",24 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StageBtlReport.name","name",32 | 2);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StageBtlReport.level","level",40 | 0);
      
      public static const ZHANLI:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.StageBtlReport.zhanli","zhanli",48 | 0);
      
      public static const TIME:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.StageBtlReport.time","time",56 | 0);
      
      public static const BUZHEN:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.StageBtlReport.buzhen","buzhen",64 | 2,proto.StageBtlReport.BuZhen);
      
      public static const HURT:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.StageBtlReport.hurt","hurt",72 | 0);
       
      
      public var reportId:Array;
      
      public var playerId:UInt64;
      
      public var heroId:uint;
      
      public var name:String;
      
      public var level:uint;
      
      public var zhanli:UInt64;
      
      public var time:UInt64;
      
      public var buzhen:Array;
      
      private var hurt$field:UInt64;
      
      public function StageBtlReport()
      {
         reportId = [];
         buzhen = [];
         super();
      }
      
      public function clearHurt() : void
      {
         hurt$field = null;
      }
      
      public function get hasHurt() : Boolean
      {
         return hurt$field != null;
      }
      
      public function set hurt(param1:UInt64) : void
      {
         hurt$field = param1;
      }
      
      public function get hurt() : UInt64
      {
         return hurt$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.reportId.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_STRING(param1,this.reportId[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT64(param1,this.playerId);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.heroId);
         WriteUtils.writeTag(param1,2,4);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.level);
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_UINT64(param1,this.zhanli);
         WriteUtils.writeTag(param1,0,7);
         WriteUtils.write$TYPE_UINT64(param1,this.time);
         _loc3_ = uint(0);
         while(_loc3_ < this.buzhen.length)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.buzhen[_loc3_]);
            _loc3_++;
         }
         if(hasHurt)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT64(param1,hurt$field);
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
         var _loc6_:* = 0;
         var _loc9_:uint = 0;
         var _loc7_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  this.reportId.push(ReadUtils.read$TYPE_STRING(param1));
                  continue;
               case 1:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StageBtlReport.playerId cannot be set twice.");
                  }
                  _loc9_++;
                  this.playerId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StageBtlReport.heroId cannot be set twice.");
                  }
                  _loc7_++;
                  this.heroId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StageBtlReport.name cannot be set twice.");
                  }
                  _loc4_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StageBtlReport.level cannot be set twice.");
                  }
                  _loc5_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: StageBtlReport.zhanli cannot be set twice.");
                  }
                  _loc10_++;
                  this.zhanli = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 6:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StageBtlReport.time cannot be set twice.");
                  }
                  _loc3_++;
                  this.time = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 7:
                  this.buzhen.push(ReadUtils.read$TYPE_MESSAGE(param1,new proto.StageBtlReport.BuZhen()));
                  continue;
               case 8:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StageBtlReport.hurt cannot be set twice.");
                  }
                  _loc8_++;
                  this.hurt = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
