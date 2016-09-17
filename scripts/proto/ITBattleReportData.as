package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ITBattleReportData extends Message
   {
      
      public static const REPORTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.ITBattleReportData.reportId","reportId",8 | 2);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ITBattleReportData.kind","kind",16 | 0);
      
      public static const GPARAM:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.ITBattleReportData.gParam","gParam",24 | 0);
      
      public static const PLAYER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ITBattleReportData.player","player",32 | 2,BattlePlayer);
      
      public static const TIMEPOINT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ITBattleReportData.timePoint","timePoint",40 | 2,SkillTimePoint);
      
      public static const PARAM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ITBattleReportData.param","param",48 | 2,proto.BattleParam);
      
      public static const STAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ITBattleReportData.stamp","stamp",56 | 0);
       
      
      public var reportId:String;
      
      public var kind:uint;
      
      public var gParam:Array;
      
      public var player:Array;
      
      public var timePoint:Array;
      
      public var param:proto.BattleParam;
      
      public var stamp:uint;
      
      public function ITBattleReportData()
      {
         gParam = [];
         player = [];
         timePoint = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         var _loc5_:* = 0;
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_STRING(param1,this.reportId);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.kind);
         _loc3_ = uint(0);
         while(_loc3_ < this.gParam.length)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,this.gParam[_loc3_]);
            _loc3_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.player.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.player[_loc2_]);
            _loc2_++;
         }
         _loc5_ = uint(0);
         while(_loc5_ < this.timePoint.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.timePoint[_loc5_]);
            _loc5_++;
         }
         WriteUtils.writeTag(param1,2,6);
         WriteUtils.write$TYPE_MESSAGE(param1,this.param);
         WriteUtils.writeTag(param1,0,7);
         WriteUtils.write$TYPE_UINT32(param1,this.stamp);
         var _loc7_:int = 0;
         var _loc6_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ITBattleReportData.reportId cannot be set twice.");
                  }
                  _loc3_++;
                  this.reportId = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ITBattleReportData.kind cannot be set twice.");
                  }
                  _loc4_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if((_loc5_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.gParam);
                  }
                  else
                  {
                     this.gParam.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 3:
                  this.player.push(ReadUtils.read$TYPE_MESSAGE(param1,new BattlePlayer()));
                  continue;
               case 4:
                  this.timePoint.push(ReadUtils.read$TYPE_MESSAGE(param1,new SkillTimePoint()));
                  continue;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: ITBattleReportData.param cannot be set twice.");
                  }
                  _loc7_++;
                  this.param = new proto.BattleParam();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.param);
                  continue;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: ITBattleReportData.stamp cannot be set twice.");
                  }
                  _loc6_++;
                  this.stamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
