package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ArenaMultiChallengeRes extends Message
   {
      
      public static const RESULTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ArenaMultiChallengeRes.results","results",8 | 2,ArenaMultiChallengeResult);
      
      public static const SCORES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaMultiChallengeRes.scores","scores",16 | 0);
      
      public static const CDSTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaMultiChallengeRes.cdStamp","cdStamp",24 | 0);
      
      public static const ISCDRED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.ArenaMultiChallengeRes.isCdRed","isCdRed",32 | 0);
      
      public static const RESIDUALTIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.ArenaMultiChallengeRes.residualTimes","residualTimes",40 | 0);
       
      
      public var results:Array;
      
      private var scores$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var cdStamp$field:uint;
      
      private var isCdRed$field:Boolean;
      
      private var residualTimes$field:int;
      
      public function ArenaMultiChallengeRes()
      {
         results = [];
         super();
      }
      
      public function clearScores() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         scores$field = new uint();
      }
      
      public function get hasScores() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set scores(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         scores$field = param1;
      }
      
      public function get scores() : uint
      {
         return scores$field;
      }
      
      public function clearCdStamp() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         cdStamp$field = new uint();
      }
      
      public function get hasCdStamp() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set cdStamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         cdStamp$field = param1;
      }
      
      public function get cdStamp() : uint
      {
         return cdStamp$field;
      }
      
      public function clearIsCdRed() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         isCdRed$field = new Boolean();
      }
      
      public function get hasIsCdRed() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set isCdRed(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 4;
         isCdRed$field = param1;
      }
      
      public function get isCdRed() : Boolean
      {
         return isCdRed$field;
      }
      
      public function clearResidualTimes() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         residualTimes$field = new int();
      }
      
      public function get hasResidualTimes() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set residualTimes(param1:int) : void
      {
         hasField$0 = hasField$0 | 8;
         residualTimes$field = param1;
      }
      
      public function get residualTimes() : int
      {
         return residualTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.results.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.results[_loc2_]);
            _loc2_++;
         }
         if(hasScores)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,scores$field);
         }
         if(hasCdStamp)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,cdStamp$field);
         }
         if(hasIsCdRed)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_BOOL(param1,isCdRed$field);
         }
         if(hasResidualTimes)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_INT32(param1,residualTimes$field);
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
         var _loc7_:uint = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  this.results.push(ReadUtils.read$TYPE_MESSAGE(param1,new ArenaMultiChallengeResult()));
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaMultiChallengeRes.scores cannot be set twice.");
                  }
                  _loc5_++;
                  this.scores = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaMultiChallengeRes.cdStamp cannot be set twice.");
                  }
                  _loc7_++;
                  this.cdStamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaMultiChallengeRes.isCdRed cannot be set twice.");
                  }
                  _loc4_++;
                  this.isCdRed = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaMultiChallengeRes.residualTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.residualTimes = ReadUtils.read$TYPE_INT32(param1);
                  continue;
            }
         }
      }
   }
}
