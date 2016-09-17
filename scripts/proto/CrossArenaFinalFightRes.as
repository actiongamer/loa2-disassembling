package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CrossArenaFinalFightRes extends Message
   {
      
      public static const REPORTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CrossArenaFinalFightRes.reportId","reportId",8 | 2);
      
      public static const ISWIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.CrossArenaFinalFightRes.isWin","isWin",16 | 0);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaFinalFightRes.rank","rank",24 | 0);
      
      public static const RESIDUALTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaFinalFightRes.residualTimes","residualTimes",32 | 0);
       
      
      public var reportId:String;
      
      private var isWin$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var rank$field:uint;
      
      private var residualTimes$field:uint;
      
      public function CrossArenaFinalFightRes()
      {
         super();
      }
      
      public function clearIsWin() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         isWin$field = new Boolean();
      }
      
      public function get hasIsWin() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set isWin(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         isWin$field = param1;
      }
      
      public function get isWin() : Boolean
      {
         return isWin$field;
      }
      
      public function clearRank() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return rank$field;
      }
      
      public function clearResidualTimes() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         residualTimes$field = new uint();
      }
      
      public function get hasResidualTimes() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set residualTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         residualTimes$field = param1;
      }
      
      public function get residualTimes() : uint
      {
         return residualTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_STRING(param1,this.reportId);
         if(hasIsWin)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_BOOL(param1,isWin$field);
         }
         if(hasRank)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,rank$field);
         }
         if(hasResidualTimes)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,residualTimes$field);
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
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaFinalFightRes.reportId cannot be set twice.");
                  }
                  _loc3_++;
                  this.reportId = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaFinalFightRes.isWin cannot be set twice.");
                  }
                  _loc5_++;
                  this.isWin = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaFinalFightRes.rank cannot be set twice.");
                  }
                  _loc4_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaFinalFightRes.residualTimes cannot be set twice.");
                  }
                  _loc7_++;
                  this.residualTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
