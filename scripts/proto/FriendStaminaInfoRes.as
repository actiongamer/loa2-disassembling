package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FriendStaminaInfoRes extends Message
   {
      
      public static const DONATETOIDS:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.FriendStaminaInfoRes.donatetoids","donatetoids",8 | 0);
      
      public static const DONATEDALLCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FriendStaminaInfoRes.donatedallcount","donatedallcount",16 | 0);
      
      public static const DONATEDGOTCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FriendStaminaInfoRes.donatedgotcount","donatedgotcount",24 | 0);
      
      public static const DONATEDALLIDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FriendStaminaInfoRes.donatedallids","donatedallids",32 | 2,FriendStaminaInfo);
      
      public static const DONATEDIDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FriendStaminaInfoRes.donatedids","donatedids",40 | 2,FriendStaminaInfo);
       
      
      public var donatetoids:Array;
      
      public var donatedallcount:uint;
      
      public var donatedgotcount:uint;
      
      public var donatedallids:Array;
      
      public var donatedids:Array;
      
      public function FriendStaminaInfoRes()
      {
         donatetoids = [];
         donatedallids = [];
         donatedids = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc2_:* = 0;
         _loc3_ = uint(0);
         while(_loc3_ < this.donatetoids.length)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT64(param1,this.donatetoids[_loc3_]);
            _loc3_++;
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.donatedallcount);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.donatedgotcount);
         _loc4_ = uint(0);
         while(_loc4_ < this.donatedallids.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.donatedallids[_loc4_]);
            _loc4_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.donatedids.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.donatedids[_loc2_]);
            _loc2_++;
         }
         var _loc7_:int = 0;
         var _loc6_:* = this;
         for(var _loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.donatetoids);
                  }
                  else
                  {
                     this.donatetoids.push(ReadUtils.read$TYPE_UINT64(param1));
                  }
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FriendStaminaInfoRes.donatedallcount cannot be set twice.");
                  }
                  _loc5_++;
                  this.donatedallcount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FriendStaminaInfoRes.donatedgotcount cannot be set twice.");
                  }
                  _loc4_++;
                  this.donatedgotcount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  this.donatedallids.push(ReadUtils.read$TYPE_MESSAGE(param1,new FriendStaminaInfo()));
                  continue;
               case 4:
                  this.donatedids.push(ReadUtils.read$TYPE_MESSAGE(param1,new FriendStaminaInfo()));
                  continue;
            }
         }
      }
   }
}
