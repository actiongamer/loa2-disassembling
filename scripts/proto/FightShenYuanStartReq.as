package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FightShenYuanStartReq extends Message
   {
      
      public static const POSITON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FightShenYuanStartReq.positon","positon",8 | 0);
      
      public static const LAYER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FightShenYuanStartReq.layer","layer",16 | 0);
      
      public static const FRIEND:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FightShenYuanStartReq.friend","friend",24 | 0);
       
      
      public var positon:uint;
      
      public var layer:uint;
      
      private var friend$field:UInt64;
      
      public function FightShenYuanStartReq()
      {
         super();
      }
      
      public function clearFriend() : void
      {
         friend$field = null;
      }
      
      public function get hasFriend() : Boolean
      {
         return friend$field != null;
      }
      
      public function set friend(param1:UInt64) : void
      {
         friend$field = param1;
      }
      
      public function get friend() : UInt64
      {
         return friend$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.positon);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.layer);
         if(hasFriend)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT64(param1,friend$field);
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
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FightShenYuanStartReq.positon cannot be set twice.");
                  }
                  _loc4_++;
                  this.positon = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FightShenYuanStartReq.layer cannot be set twice.");
                  }
                  _loc6_++;
                  this.layer = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FightShenYuanStartReq.friend cannot be set twice.");
                  }
                  _loc5_++;
                  this.friend = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
