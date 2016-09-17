package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class StageInfo extends Message
   {
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StageInfo.stageId","stageId",8 | 0);
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StageInfo.star","star",16 | 0);
      
      public static const DEADLINE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StageInfo.deadline","deadline",24 | 0);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StageInfo.count","count",32 | 0);
      
      public static const RESETCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StageInfo.resetCount","resetCount",40 | 0);
      
      public static const OPENBOX:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.StageInfo.openBox","openBox",48 | 0);
       
      
      private var stageId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var star$field:uint;
      
      private var deadline$field:uint;
      
      private var count$field:uint;
      
      private var resetCount$field:uint;
      
      private var openBox$field:Boolean;
      
      public function StageInfo()
      {
         super();
      }
      
      public function clearStageId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return stageId$field;
      }
      
      public function clearStar() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         star$field = new uint();
      }
      
      public function get hasStar() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set star(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         star$field = param1;
      }
      
      public function get star() : uint
      {
         return star$field;
      }
      
      public function clearDeadline() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         deadline$field = new uint();
      }
      
      public function get hasDeadline() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set deadline(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         deadline$field = param1;
      }
      
      public function get deadline() : uint
      {
         return deadline$field;
      }
      
      public function clearCount() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         count$field = new uint();
      }
      
      public function get hasCount() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set count(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         count$field = param1;
      }
      
      public function get count() : uint
      {
         return count$field;
      }
      
      public function clearResetCount() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         resetCount$field = new uint();
      }
      
      public function get hasResetCount() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set resetCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         resetCount$field = param1;
      }
      
      public function get resetCount() : uint
      {
         return resetCount$field;
      }
      
      public function clearOpenBox() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         openBox$field = new Boolean();
      }
      
      public function get hasOpenBox() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set openBox(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 32;
         openBox$field = param1;
      }
      
      public function get openBox() : Boolean
      {
         return openBox$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasStageId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,stageId$field);
         }
         if(hasStar)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,star$field);
         }
         if(hasDeadline)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,deadline$field);
         }
         if(hasCount)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,count$field);
         }
         if(hasResetCount)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,resetCount$field);
         }
         if(hasOpenBox)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_BOOL(param1,openBox$field);
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
         var _loc6_:* = 0;
         var _loc3_:uint = 0;
         var _loc9_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StageInfo.stageId cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StageInfo.star cannot be set twice.");
                  }
                  _loc9_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StageInfo.deadline cannot be set twice.");
                  }
                  _loc4_++;
                  this.deadline = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StageInfo.count cannot be set twice.");
                  }
                  _loc7_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StageInfo.resetCount cannot be set twice.");
                  }
                  _loc5_++;
                  this.resetCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StageInfo.openBox cannot be set twice.");
                  }
                  _loc8_++;
                  this.openBox = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
