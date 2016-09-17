package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CompeteStagePlayerInfo extends Message
   {
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.CompeteStagePlayerInfo.baseInfo","baseInfo",8 | 2,proto.PlayerBaseInfo);
      
      public static const WINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CompeteStagePlayerInfo.winTime","winTime",16 | 0);
      
      public static const POSINDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompeteStagePlayerInfo.posIndex","posIndex",24 | 0);
       
      
      private var baseInfo$field:proto.PlayerBaseInfo;
      
      private var winTime$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var posIndex$field:int;
      
      public function CompeteStagePlayerInfo()
      {
         super();
      }
      
      public function clearBaseInfo() : void
      {
         baseInfo$field = null;
      }
      
      public function get hasBaseInfo() : Boolean
      {
         return baseInfo$field != null;
      }
      
      public function set baseInfo(param1:proto.PlayerBaseInfo) : void
      {
         baseInfo$field = param1;
      }
      
      public function get baseInfo() : proto.PlayerBaseInfo
      {
         return baseInfo$field;
      }
      
      public function clearWinTime() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         winTime$field = new uint();
      }
      
      public function get hasWinTime() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set winTime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         winTime$field = param1;
      }
      
      public function get winTime() : uint
      {
         return winTime$field;
      }
      
      public function clearPosIndex() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         posIndex$field = new int();
      }
      
      public function get hasPosIndex() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set posIndex(param1:int) : void
      {
         hasField$0 = hasField$0 | 2;
         posIndex$field = param1;
      }
      
      public function get posIndex() : int
      {
         return posIndex$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasBaseInfo)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,baseInfo$field);
         }
         if(hasWinTime)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,winTime$field);
         }
         if(hasPosIndex)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_INT32(param1,posIndex$field);
         }
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteStagePlayerInfo.baseInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.baseInfo = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseInfo);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteStagePlayerInfo.winTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.winTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteStagePlayerInfo.posIndex cannot be set twice.");
                  }
                  _loc4_++;
                  this.posIndex = ReadUtils.read$TYPE_INT32(param1);
                  continue;
            }
         }
      }
   }
}
