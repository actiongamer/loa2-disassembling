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
   
   public class BkStageMyInfo extends Message
   {
      
      public static const KILLNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkStageMyInfo.killNum","killNum",8 | 0);
      
      public static const ASSISTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkStageMyInfo.assistNum","assistNum",16 | 0);
      
      public static const HONOR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BkStageMyInfo.honor","honor",24 | 0);
      
      public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BkStageMyInfo.items","items",32 | 2,BkMyItemInfo);
       
      
      private var killNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var assistNum$field:uint;
      
      private var honor$field:uint;
      
      public var items:Array;
      
      public function BkStageMyInfo()
      {
         items = [];
         super();
      }
      
      public function clearKillNum() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         killNum$field = new uint();
      }
      
      public function get hasKillNum() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set killNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         killNum$field = param1;
      }
      
      public function get killNum() : uint
      {
         return killNum$field;
      }
      
      public function clearAssistNum() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         assistNum$field = new uint();
      }
      
      public function get hasAssistNum() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set assistNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         assistNum$field = param1;
      }
      
      public function get assistNum() : uint
      {
         return assistNum$field;
      }
      
      public function clearHonor() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         honor$field = new uint();
      }
      
      public function get hasHonor() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set honor(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         honor$field = param1;
      }
      
      public function get honor() : uint
      {
         return honor$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasKillNum)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,killNum$field);
         }
         if(hasAssistNum)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,assistNum$field);
         }
         if(hasHonor)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,honor$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.items.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items[_loc2_]);
            _loc2_++;
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
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BkStageMyInfo.killNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.killNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BkStageMyInfo.assistNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.assistNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BkStageMyInfo.honor cannot be set twice.");
                  }
                  _loc6_++;
                  this.honor = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  this.items.push(ReadUtils.read$TYPE_MESSAGE(param1,new BkMyItemInfo()));
                  continue;
            }
         }
      }
   }
}
