package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GetVipInfoRes extends Message
   {
      
      public static const DIMOND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GetVipInfoRes.dimond","dimond",8 | 0);
      
      public static const REWARDGOT:RepeatedFieldDescriptor$TYPE_BOOL = new RepeatedFieldDescriptor$TYPE_BOOL("proto.GetVipInfoRes.rewardGot","rewardGot",16 | 0);
       
      
      private var dimond$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var rewardGot:Array;
      
      public function GetVipInfoRes()
      {
         rewardGot = [];
         super();
      }
      
      public function clearDimond() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         dimond$field = new uint();
      }
      
      public function get hasDimond() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set dimond(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         dimond$field = param1;
      }
      
      public function get dimond() : uint
      {
         return dimond$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasDimond)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,dimond$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.rewardGot.length)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_BOOL(param1,this.rewardGot[_loc2_]);
            _loc2_++;
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
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GetVipInfoRes.dimond cannot be set twice.");
                  }
                  _loc4_++;
                  this.dimond = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_BOOL,this.rewardGot);
                  }
                  else
                  {
                     this.rewardGot.push(ReadUtils.read$TYPE_BOOL(param1));
                  }
                  continue;
            }
         }
      }
   }
}
