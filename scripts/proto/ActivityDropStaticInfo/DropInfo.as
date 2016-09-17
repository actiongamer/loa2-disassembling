package proto.ActivityDropStaticInfo
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class DropInfo extends Message
   {
      
      public static const DROPID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ActivityDropStaticInfo.DropInfo.dropId","dropId",8 | 0);
      
      public static const STARTTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ActivityDropStaticInfo.DropInfo.starttm","starttm",16 | 0);
      
      public static const ENDTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ActivityDropStaticInfo.DropInfo.endtm","endtm",24 | 0);
       
      
      private var dropId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var starttm$field:uint;
      
      private var endtm$field:uint;
      
      public function DropInfo()
      {
         super();
      }
      
      public function clearDropId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         dropId$field = new uint();
      }
      
      public function get hasDropId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set dropId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         dropId$field = param1;
      }
      
      public function get dropId() : uint
      {
         return dropId$field;
      }
      
      public function clearStarttm() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         starttm$field = new uint();
      }
      
      public function get hasStarttm() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set starttm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         starttm$field = param1;
      }
      
      public function get starttm() : uint
      {
         return starttm$field;
      }
      
      public function clearEndtm() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         endtm$field = new uint();
      }
      
      public function get hasEndtm() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set endtm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         endtm$field = param1;
      }
      
      public function get endtm() : uint
      {
         return endtm$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasDropId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,dropId$field);
         }
         if(hasStarttm)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,starttm$field);
         }
         if(hasEndtm)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,endtm$field);
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
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: DropInfo.dropId cannot be set twice.");
                  }
                  _loc3_++;
                  this.dropId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: DropInfo.starttm cannot be set twice.");
                  }
                  _loc6_++;
                  this.starttm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: DropInfo.endtm cannot be set twice.");
                  }
                  _loc5_++;
                  this.endtm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
