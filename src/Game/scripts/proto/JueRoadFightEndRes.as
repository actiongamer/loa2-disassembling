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
   
   public class JueRoadFightEndRes extends Message
   {
      
      public static const RESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.JueRoadFightEndRes.result","result",8 | 0);
      
      public static const REWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.JueRoadFightEndRes.rewards","rewards",16 | 2,Reward);
      
      public static const STARS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.JueRoadFightEndRes.stars","stars",24 | 0);
      
      public static const TOTALTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.JueRoadFightEndRes.totaltimes","totaltimes",32 | 0);
       
      
      public var result:uint;
      
      public var rewards:Array;
      
      private var stars$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var totaltimes$field:uint;
      
      public function JueRoadFightEndRes()
      {
         rewards = [];
         super();
      }
      
      public function clearStars() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         stars$field = new uint();
      }
      
      public function get hasStars() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set stars(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         stars$field = param1;
      }
      
      public function get stars() : uint
      {
         return stars$field;
      }
      
      public function clearTotaltimes() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         totaltimes$field = new uint();
      }
      
      public function get hasTotaltimes() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set totaltimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         totaltimes$field = param1;
      }
      
      public function get totaltimes() : uint
      {
         return totaltimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.result);
         _loc2_ = uint(0);
         while(_loc2_ < this.rewards.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewards[_loc2_]);
            _loc2_++;
         }
         if(hasStars)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,stars$field);
         }
         if(hasTotaltimes)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,totaltimes$field);
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
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: JueRoadFightEndRes.result cannot be set twice.");
                  }
                  _loc4_++;
                  this.result = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.rewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Reward()));
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: JueRoadFightEndRes.stars cannot be set twice.");
                  }
                  _loc3_++;
                  this.stars = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: JueRoadFightEndRes.totaltimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.totaltimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
