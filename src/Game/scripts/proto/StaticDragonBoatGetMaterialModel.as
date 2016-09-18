package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class StaticDragonBoatGetMaterialModel extends Message
   {
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticDragonBoatGetMaterialModel.version","version",8 | 0);
      
      public static const ITEM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticDragonBoatGetMaterialModel.item","item",16 | 2);
      
      public static const GETTIME1:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticDragonBoatGetMaterialModel.getTime1","getTime1",24 | 0);
       
      
      private var version$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var item$field:String;
      
      private var getTime1$field:uint;
      
      public function StaticDragonBoatGetMaterialModel()
      {
         super();
      }
      
      public function clearVersion() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         version$field = new uint();
      }
      
      public function get hasVersion() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set version(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         version$field = param1;
      }
      
      public function get version() : uint
      {
         return version$field;
      }
      
      public function clearItem() : void
      {
         item$field = null;
      }
      
      public function get hasItem() : Boolean
      {
         return item$field != null;
      }
      
      public function set item(param1:String) : void
      {
         item$field = param1;
      }
      
      public function get item() : String
      {
         return item$field;
      }
      
      public function clearGetTime1() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         getTime1$field = new uint();
      }
      
      public function get hasGetTime1() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set getTime1(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         getTime1$field = param1;
      }
      
      public function get getTime1() : uint
      {
         return getTime1$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasVersion)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,version$field);
         }
         if(hasItem)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,item$field);
         }
         if(hasGetTime1)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,getTime1$field);
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
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticDragonBoatGetMaterialModel.version cannot be set twice.");
                  }
                  _loc5_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticDragonBoatGetMaterialModel.item cannot be set twice.");
                  }
                  _loc6_++;
                  this.item = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticDragonBoatGetMaterialModel.getTime1 cannot be set twice.");
                  }
                  _loc4_++;
                  this.getTime1 = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
