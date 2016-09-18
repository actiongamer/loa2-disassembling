package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgCryStageInfoNotify extends Message
   {
      
      public static const STARTSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgCryStageInfoNotify.startStamp","startStamp",8 | 0);
      
      public static const TEAMINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BgCryStageInfoNotify.teamInfos","teamInfos",16 | 2,BgCryTeamInfo);
      
      public static const RESINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BgCryStageInfoNotify.resInfos","resInfos",24 | 2,BgStageResInfo);
      
      public static const MYINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BgCryStageInfoNotify.myInfo","myInfo",32 | 2,proto.BgStageMyInfo);
       
      
      public var startStamp:uint;
      
      public var teamInfos:Array;
      
      public var resInfos:Array;
      
      private var myInfo$field:proto.BgStageMyInfo;
      
      public function BgCryStageInfoNotify()
      {
         teamInfos = [];
         resInfos = [];
         super();
      }
      
      public function clearMyInfo() : void
      {
         myInfo$field = null;
      }
      
      public function get hasMyInfo() : Boolean
      {
         return myInfo$field != null;
      }
      
      public function set myInfo(param1:proto.BgStageMyInfo) : void
      {
         myInfo$field = param1;
      }
      
      public function get myInfo() : proto.BgStageMyInfo
      {
         return myInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.startStamp);
         _loc2_ = uint(0);
         while(_loc2_ < this.teamInfos.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.teamInfos[_loc2_]);
            _loc2_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.resInfos.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.resInfos[_loc3_]);
            _loc3_++;
         }
         if(hasMyInfo)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,myInfo$field);
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
                     throw new IOError("Bad data format: BgCryStageInfoNotify.startStamp cannot be set twice.");
                  }
                  _loc3_++;
                  this.startStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.teamInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new BgCryTeamInfo()));
                  continue;
               case 2:
                  this.resInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new BgStageResInfo()));
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BgCryStageInfoNotify.myInfo cannot be set twice.");
                  }
                  _loc5_++;
                  this.myInfo = new proto.BgStageMyInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.myInfo);
                  continue;
            }
         }
      }
   }
}
