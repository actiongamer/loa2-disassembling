package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_DOUBLE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyStageFightEndNotify extends Message
   {
      
      public static const NODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageFightEndNotify.nodeid","nodeid",8 | 0);
      
      public static const STATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageFightEndNotify.state","state",16 | 0);
      
      public static const HPS:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("proto.FamilyStageFightEndNotify.hps","hps",24 | 1);
      
      public static const ISCHAPTERFINISH:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FamilyStageFightEndNotify.ischapterfinish","ischapterfinish",32 | 0);
       
      
      public var nodeid:uint;
      
      public var state:uint;
      
      public var hps:Array;
      
      private var ischapterfinish$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function FamilyStageFightEndNotify()
      {
         hps = [];
         super();
      }
      
      public function clearIschapterfinish() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         ischapterfinish$field = new Boolean();
      }
      
      public function get hasIschapterfinish() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set ischapterfinish(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         ischapterfinish$field = param1;
      }
      
      public function get ischapterfinish() : Boolean
      {
         return ischapterfinish$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.nodeid);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.state);
         _loc3_ = uint(0);
         while(_loc3_ < this.hps.length)
         {
            WriteUtils.writeTag(param1,1,3);
            WriteUtils.write$TYPE_DOUBLE(param1,this.hps[_loc3_]);
            _loc3_++;
         }
         if(hasIschapterfinish)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_BOOL(param1,ischapterfinish$field);
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageFightEndNotify.nodeid cannot be set twice.");
                  }
                  _loc6_++;
                  this.nodeid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageFightEndNotify.state cannot be set twice.");
                  }
                  _loc4_++;
                  this.state = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if((_loc5_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_DOUBLE,this.hps);
                  }
                  else
                  {
                     this.hps.push(ReadUtils.read$TYPE_DOUBLE(param1));
                  }
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageFightEndNotify.ischapterfinish cannot be set twice.");
                  }
                  _loc3_++;
                  this.ischapterfinish = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
