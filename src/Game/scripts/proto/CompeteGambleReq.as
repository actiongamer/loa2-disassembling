package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CompeteGambleReq extends Message
   {
      
      public static const GSTAGEINDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompeteGambleReq.gStageIndex","gStageIndex",8 | 0);
      
      public static const FRONTSTAGEINDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompeteGambleReq.frontStageIndex","frontStageIndex",16 | 0);
      
      public static const POSINDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.CompeteGambleReq.posIndex","posIndex",24 | 0);
       
      
      private var gStageIndex$field:int;
      
      private var hasField$0:uint = 0;
      
      private var frontStageIndex$field:int;
      
      private var posIndex$field:int;
      
      public function CompeteGambleReq()
      {
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
      
      public function clearFrontStageIndex() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         frontStageIndex$field = new int();
      }
      
      public function get hasFrontStageIndex() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set frontStageIndex(param1:int) : void
      {
         hasField$0 = hasField$0 | 2;
         frontStageIndex$field = param1;
      }
      
      public function get frontStageIndex() : int
      {
         return frontStageIndex$field;
      }
      
      public function clearPosIndex() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         posIndex$field = new int();
      }
      
      public function get hasPosIndex() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set posIndex(param1:int) : void
      {
         hasField$0 = hasField$0 | 4;
         posIndex$field = param1;
      }
      
      public function get posIndex() : int
      {
         return posIndex$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasGStageIndex)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_INT32(param1,gStageIndex$field);
         }
         if(hasFrontStageIndex)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_INT32(param1,frontStageIndex$field);
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
         var _loc4_:* = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteGambleReq.gStageIndex cannot be set twice.");
                  }
                  _loc6_++;
                  this.gStageIndex = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteGambleReq.frontStageIndex cannot be set twice.");
                  }
                  _loc5_++;
                  this.frontStageIndex = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CompeteGambleReq.posIndex cannot be set twice.");
                  }
                  _loc3_++;
                  this.posIndex = ReadUtils.read$TYPE_INT32(param1);
                  continue;
            }
         }
      }
   }
}
