package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BkFightNotify extends Message
   {
      
      public static const ATTACKER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BkFightNotify.attacker","attacker",8 | 2,proto.BkFightInfo);
      
      public static const TARGET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BkFightNotify.target","target",16 | 2,proto.BkFightInfo);
      
      public static const WINNERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BkFightNotify.winnerId","winnerId",24 | 0);
       
      
      public var attacker:proto.BkFightInfo;
      
      public var target:proto.BkFightInfo;
      
      public var winnerId:UInt64;
      
      public function BkFightNotify()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.attacker);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_MESSAGE(param1,this.target);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT64(param1,this.winnerId);
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
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BkFightNotify.attacker cannot be set twice.");
                  }
                  _loc4_++;
                  this.attacker = new proto.BkFightInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.attacker);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BkFightNotify.target cannot be set twice.");
                  }
                  _loc5_++;
                  this.target = new proto.BkFightInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.target);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BkFightNotify.winnerId cannot be set twice.");
                  }
                  _loc6_++;
                  this.winnerId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
