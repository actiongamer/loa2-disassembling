package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyStageFightEndReq extends Message
   {
      
      public static const NODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageFightEndReq.nodeid","nodeid",8 | 0);
      
      public static const PLAY_MODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageFightEndReq.play_mode","playMode",16 | 0);
      
      public static const STP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyStageFightEndReq.stp","stp",24 | 2,SkillTimePoint);
      
      public static const RESULT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.FamilyStageFightEndReq.result","result",32 | 0);
      
      public static const FIGHTDROP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FamilyStageFightEndReq.Fightdrop","fightdrop",40 | 0);
       
      
      public var nodeid:uint;
      
      public var playMode:uint;
      
      public var stp:Array;
      
      private var result$field:int;
      
      private var hasField$0:uint = 0;
      
      private var Fightdrop$field:Boolean;
      
      public function FamilyStageFightEndReq()
      {
         stp = [];
         super();
      }
      
      public function clearResult() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         result$field = new int();
      }
      
      public function get hasResult() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set result(param1:int) : void
      {
         hasField$0 = hasField$0 | 1;
         result$field = param1;
      }
      
      public function get result() : int
      {
         return result$field;
      }
      
      public function clearFightdrop() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         Fightdrop$field = new Boolean();
      }
      
      public function get hasFightdrop() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set fightdrop(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 2;
         Fightdrop$field = param1;
      }
      
      public function get fightdrop() : Boolean
      {
         return Fightdrop$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.nodeid);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.playMode);
         _loc2_ = uint(0);
         while(_loc2_ < this.stp.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.stp[_loc2_]);
            _loc2_++;
         }
         if(hasResult)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_INT32(param1,result$field);
         }
         if(hasFightdrop)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_BOOL(param1,Fightdrop$field);
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
         var _loc6_:* = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageFightEndReq.nodeid cannot be set twice.");
                  }
                  _loc7_++;
                  this.nodeid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageFightEndReq.playMode cannot be set twice.");
                  }
                  _loc3_++;
                  this.playMode = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  this.stp.push(ReadUtils.read$TYPE_MESSAGE(param1,new SkillTimePoint()));
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageFightEndReq.result cannot be set twice.");
                  }
                  _loc5_++;
                  this.result = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageFightEndReq.fightdrop cannot be set twice.");
                  }
                  _loc4_++;
                  this.fightdrop = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
