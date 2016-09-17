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
   
   public class BkGameStageInfoNotify extends Message
   {
      
      public static const STARTSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkGameStageInfoNotify.startStamp","startStamp",8 | 0);
      
      public static const TEAMINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BkGameStageInfoNotify.teamInfos","teamInfos",16 | 2,BkGameTeamInfo);
      
      public static const RESINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BkGameStageInfoNotify.resInfos","resInfos",24 | 2,BkStageResInfo);
      
      public static const MYINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BkGameStageInfoNotify.myInfo","myInfo",32 | 2,proto.BkStageMyInfo);
      
      public static const KILLRANK1:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BkGameStageInfoNotify.killRank1","killRank1",40 | 2,BkKillRankInfo);
      
      public static const KILLRANK2:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BkGameStageInfoNotify.killRank2","killRank2",48 | 2,BkKillRankInfo);
      
      public static const TEAMBUFF1:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BkGameStageInfoNotify.teamBuff1","teamBuff1",56 | 2,BkGameTeamBuff);
      
      public static const TEAMBUFF2:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BkGameStageInfoNotify.teamBuff2","teamBuff2",64 | 2,BkGameTeamBuff);
       
      
      public var startStamp:uint;
      
      public var teamInfos:Array;
      
      public var resInfos:Array;
      
      private var myInfo$field:proto.BkStageMyInfo;
      
      public var killRank1:Array;
      
      public var killRank2:Array;
      
      public var teamBuff1:Array;
      
      public var teamBuff2:Array;
      
      public function BkGameStageInfoNotify()
      {
         teamInfos = [];
         resInfos = [];
         killRank1 = [];
         killRank2 = [];
         teamBuff1 = [];
         teamBuff2 = [];
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
      
      public function set myInfo(param1:proto.BkStageMyInfo) : void
      {
         myInfo$field = param1;
      }
      
      public function get myInfo() : proto.BkStageMyInfo
      {
         return myInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc4_:* = 0;
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc5_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.startStamp);
         _loc6_ = uint(0);
         while(_loc6_ < this.teamInfos.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.teamInfos[_loc6_]);
            _loc6_++;
         }
         _loc7_ = uint(0);
         while(_loc7_ < this.resInfos.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.resInfos[_loc7_]);
            _loc7_++;
         }
         if(hasMyInfo)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,myInfo$field);
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.killRank1.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.killRank1[_loc4_]);
            _loc4_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.killRank2.length)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.killRank2[_loc2_]);
            _loc2_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.teamBuff1.length)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.teamBuff1[_loc3_]);
            _loc3_++;
         }
         _loc5_ = uint(0);
         while(_loc5_ < this.teamBuff2.length)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.teamBuff2[_loc5_]);
            _loc5_++;
         }
         var _loc10_:int = 0;
         var _loc9_:* = this;
         for(var _loc8_ in this)
         {
            super.writeUnknown(param1,_loc8_);
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
                     throw new IOError("Bad data format: BkGameStageInfoNotify.startStamp cannot be set twice.");
                  }
                  _loc3_++;
                  this.startStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.teamInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new BkGameTeamInfo()));
                  continue;
               case 2:
                  this.resInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new BkStageResInfo()));
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BkGameStageInfoNotify.myInfo cannot be set twice.");
                  }
                  _loc5_++;
                  this.myInfo = new proto.BkStageMyInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.myInfo);
                  continue;
               case 4:
                  this.killRank1.push(ReadUtils.read$TYPE_MESSAGE(param1,new BkKillRankInfo()));
                  continue;
               case 5:
                  this.killRank2.push(ReadUtils.read$TYPE_MESSAGE(param1,new BkKillRankInfo()));
                  continue;
               case 6:
                  this.teamBuff1.push(ReadUtils.read$TYPE_MESSAGE(param1,new BkGameTeamBuff()));
                  continue;
               case 7:
                  this.teamBuff2.push(ReadUtils.read$TYPE_MESSAGE(param1,new BkGameTeamBuff()));
                  continue;
            }
         }
      }
   }
}
