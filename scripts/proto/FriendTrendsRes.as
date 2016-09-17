package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FriendTrendsRes extends Message
   {
      
      public static const CONGEDIDS:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.FriendTrendsRes.congedids","congedids",8 | 0);
      
      public static const INFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FriendTrendsRes.infos","infos",16 | 2,TrendInfo);
      
      public static const TIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FriendTrendsRes.times","times",24 | 0);
       
      
      public var congedids:Array;
      
      public var infos:Array;
      
      private var times$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function FriendTrendsRes()
      {
         congedids = [];
         infos = [];
         super();
      }
      
      public function clearTimes() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         times$field = new uint();
      }
      
      public function get hasTimes() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set times(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         times$field = param1;
      }
      
      public function get times() : uint
      {
         return times$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         _loc3_ = uint(0);
         while(_loc3_ < this.congedids.length)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT64(param1,this.congedids[_loc3_]);
            _loc3_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.infos.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.infos[_loc2_]);
            _loc2_++;
         }
         if(hasTimes)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,times$field);
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.congedids);
                  }
                  else
                  {
                     this.congedids.push(ReadUtils.read$TYPE_UINT64(param1));
                  }
                  continue;
               case 1:
                  this.infos.push(ReadUtils.read$TYPE_MESSAGE(param1,new TrendInfo()));
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FriendTrendsRes.times cannot be set twice.");
                  }
                  _loc4_++;
                  this.times = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
