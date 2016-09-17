package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CrossArenaSomeDataNotify extends Message
   {
      
      public static const RESIDUALTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaSomeDataNotify.residualTimes","residualTimes",8 | 0);
      
      public static const FINALRESIDUALTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaSomeDataNotify.finalResidualTimes","finalResidualTimes",16 | 0);
      
      public static const CHEERRESIDUALTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaSomeDataNotify.cheerResidualTimes","cheerResidualTimes",24 | 0);
       
      
      private var residualTimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var finalResidualTimes$field:uint;
      
      private var cheerResidualTimes$field:uint;
      
      public function CrossArenaSomeDataNotify()
      {
         super();
      }
      
      public function clearResidualTimes() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         residualTimes$field = new uint();
      }
      
      public function get hasResidualTimes() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set residualTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         residualTimes$field = param1;
      }
      
      public function get residualTimes() : uint
      {
         return residualTimes$field;
      }
      
      public function clearFinalResidualTimes() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         finalResidualTimes$field = new uint();
      }
      
      public function get hasFinalResidualTimes() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set finalResidualTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         finalResidualTimes$field = param1;
      }
      
      public function get finalResidualTimes() : uint
      {
         return finalResidualTimes$field;
      }
      
      public function clearCheerResidualTimes() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         cheerResidualTimes$field = new uint();
      }
      
      public function get hasCheerResidualTimes() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set cheerResidualTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         cheerResidualTimes$field = param1;
      }
      
      public function get cheerResidualTimes() : uint
      {
         return cheerResidualTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasResidualTimes)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,residualTimes$field);
         }
         if(hasFinalResidualTimes)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,finalResidualTimes$field);
         }
         if(hasCheerResidualTimes)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,cheerResidualTimes$field);
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
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaSomeDataNotify.residualTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.residualTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaSomeDataNotify.finalResidualTimes cannot be set twice.");
                  }
                  _loc3_++;
                  this.finalResidualTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaSomeDataNotify.cheerResidualTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.cheerResidualTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
