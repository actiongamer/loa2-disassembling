package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class RecycleEquipDecomposeReq extends Message
   {
      
      public static const ID:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.RecycleEquipDecomposeReq.id","id",8 | 0);
      
      public static const CONFIRM:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.RecycleEquipDecomposeReq.confirm","confirm",16 | 0);
      
      public static const CRIT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.RecycleEquipDecomposeReq.crit","crit",24 | 0);
       
      
      public var id:Array;
      
      public var confirm:Boolean;
      
      private var crit$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function RecycleEquipDecomposeReq()
      {
         id = [];
         super();
      }
      
      public function clearCrit() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         crit$field = new Boolean();
      }
      
      public function get hasCrit() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set crit(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         crit$field = param1;
      }
      
      public function get crit() : Boolean
      {
         return crit$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.id.length)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT64(param1,this.id[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_BOOL(param1,this.confirm);
         if(hasCrit)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_BOOL(param1,crit$field);
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
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if((_loc4_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT64,this.id);
                  }
                  else
                  {
                     this.id.push(ReadUtils.read$TYPE_UINT64(param1));
                  }
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: RecycleEquipDecomposeReq.confirm cannot be set twice.");
                  }
                  _loc5_++;
                  this.confirm = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: RecycleEquipDecomposeReq.crit cannot be set twice.");
                  }
                  _loc3_++;
                  this.crit = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
