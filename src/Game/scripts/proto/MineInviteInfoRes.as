package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class MineInviteInfoRes extends Message
   {
      
      public static const UID:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.MineInviteInfoRes.uid","uid",8 | 0);
      
      public static const APPLY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineInviteInfoRes.apply","apply",16 | 0);
      
      public static const AGREE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineInviteInfoRes.agree","agree",24 | 0);
       
      
      public var uid:Array;
      
      public var apply:uint;
      
      private var agree$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function MineInviteInfoRes()
      {
         uid = [];
         super();
      }
      
      public function clearAgree() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         agree$field = new uint();
      }
      
      public function get hasAgree() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set agree(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         agree$field = param1;
      }
      
      public function get agree() : uint
      {
         return agree$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.uid.length)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT64(param1,this.uid[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.apply);
         if(hasAgree)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,agree$field);
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
         var _loc4_:* = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if((_loc4_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.uid);
                  }
                  else
                  {
                     this.uid.push(ReadUtils.read$TYPE_UINT64(param1));
                  }
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: MineInviteInfoRes.apply cannot be set twice.");
                  }
                  _loc3_++;
                  this.apply = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: MineInviteInfoRes.agree cannot be set twice.");
                  }
                  _loc5_++;
                  this.agree = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
