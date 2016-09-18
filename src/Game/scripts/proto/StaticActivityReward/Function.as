package proto.StaticActivityReward
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
   
   public class Function extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticActivityReward.Function.id","id",8 | 0);
      
      public static const PARA1:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.StaticActivityReward.Function.para1","para1",16 | 0);
      
      public static const PARA2:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.StaticActivityReward.Function.para2","para2",24 | 0);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var para1$field:UInt64;
      
      private var para2$field:UInt64;
      
      public function Function()
      {
         super();
      }
      
      public function clearId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         id$field = param1;
      }
      
      public function get id() : uint
      {
         return id$field;
      }
      
      public function clearPara1() : void
      {
         para1$field = null;
      }
      
      public function get hasPara1() : Boolean
      {
         return para1$field != null;
      }
      
      public function set para1(param1:UInt64) : void
      {
         para1$field = param1;
      }
      
      public function get para1() : UInt64
      {
         return para1$field;
      }
      
      public function clearPara2() : void
      {
         para2$field = null;
      }
      
      public function get hasPara2() : Boolean
      {
         return para2$field != null;
      }
      
      public function set para2(param1:UInt64) : void
      {
         para2$field = param1;
      }
      
      public function get para2() : UInt64
      {
         return para2$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasPara1)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT64(param1,para1$field);
         }
         if(hasPara2)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT64(param1,para2$field);
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
         var _loc4_:* = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Function.id cannot be set twice.");
                  }
                  _loc6_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Function.para1 cannot be set twice.");
                  }
                  _loc3_++;
                  this.para1 = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Function.para2 cannot be set twice.");
                  }
                  _loc5_++;
                  this.para2 = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
