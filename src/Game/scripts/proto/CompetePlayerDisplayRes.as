package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CompetePlayerDisplayRes extends Message
   {
      
      public static const PLAYERINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.CompetePlayerDisplayRes.playerInfos","playerInfos",8 | 2,CompetePlayerDisplayInfo);
      
      public static const GSTAGEINDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompetePlayerDisplayRes.gStageIndex","gStageIndex",16 | 0);
       
      
      public var playerInfos:Array;
      
      private var gStageIndex$field:int;
      
      private var hasField$0:uint = 0;
      
      public function CompetePlayerDisplayRes()
      {
         playerInfos = [];
         super();
      }
      
      public function clearGStageIndex() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         gStageIndex$field = new int();
      }
      
      public function get hasGStageIndex() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set gStageIndex(param1:int) : void
      {
         hasField$0 = hasField$0 | 1;
         gStageIndex$field = param1;
      }
      
      public function get gStageIndex() : int
      {
         return gStageIndex$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.playerInfos.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.playerInfos[_loc2_]);
            _loc2_++;
         }
         if(hasGStageIndex)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_INT32(param1,gStageIndex$field);
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
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  this.playerInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new CompetePlayerDisplayInfo()));
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CompetePlayerDisplayRes.gStageIndex cannot be set twice.");
                  }
                  _loc4_++;
                  this.gStageIndex = ReadUtils.read$TYPE_INT32(param1);
                  continue;
            }
         }
      }
   }
}
