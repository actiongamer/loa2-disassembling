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
   
   public class BgGatherNotify extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgGatherNotify.id","id",8 | 0);
      
      public static const GATHERINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BgGatherNotify.gatherInfo","gatherInfo",16 | 2,BgGatherPlayerInfo);
      
      public static const TEAMINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BgGatherNotify.teamInfo","teamInfo",24 | 2,BgGatherTeamInfo);
      
      public static const RESSTATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgGatherNotify.resStatus","resStatus",32 | 0);
      
      public static const RESIDUALNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgGatherNotify.residualNum","residualNum",40 | 0);
       
      
      public var id:uint;
      
      public var gatherInfo:Array;
      
      public var teamInfo:Array;
      
      public var resStatus:uint;
      
      public var residualNum:uint;
      
      public function BgGatherNotify()
      {
         gatherInfo = [];
         teamInfo = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = 0;
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         _loc4_ = uint(0);
         while(_loc4_ < this.gatherInfo.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.gatherInfo[_loc4_]);
            _loc4_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.teamInfo.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.teamInfo[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.resStatus);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.residualNum);
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BgGatherNotify.id cannot be set twice.");
                  }
                  _loc4_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.gatherInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new BgGatherPlayerInfo()));
                  continue;
               case 2:
                  this.teamInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new BgGatherTeamInfo()));
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BgGatherNotify.resStatus cannot be set twice.");
                  }
                  _loc6_++;
                  this.resStatus = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BgGatherNotify.residualNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.residualNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
