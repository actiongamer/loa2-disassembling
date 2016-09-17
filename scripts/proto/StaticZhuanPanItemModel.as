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
   
   public class StaticZhuanPanItemModel extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticZhuanPanItemModel.id","id",8 | 0);
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticZhuanPanItemModel.version","version",16 | 0);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticZhuanPanItemModel.kind","kind",24 | 0);
      
      public static const ITEM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticZhuanPanItemModel.item","item",32 | 2);
      
      public static const WEIGHT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticZhuanPanItemModel.weight","weight",40 | 0);
      
      public static const SUPWEIGHT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticZhuanPanItemModel.supweight","supweight",48 | 2);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var version$field:uint;
      
      private var kind$field:uint;
      
      private var item$field:String;
      
      private var weight$field:uint;
      
      private var supweight$field:String;
      
      public function StaticZhuanPanItemModel()
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
      
      public function clearVersion() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         version$field = new uint();
      }
      
      public function get hasVersion() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set version(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         version$field = param1;
      }
      
      public function get version() : uint
      {
         return version$field;
      }
      
      public function clearKind() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         kind$field = new uint();
      }
      
      public function get hasKind() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set kind(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         kind$field = param1;
      }
      
      public function get kind() : uint
      {
         return kind$field;
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
      
      public function clearWeight() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         weight$field = new uint();
      }
      
      public function get hasWeight() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set weight(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         weight$field = param1;
      }
      
      public function get weight() : uint
      {
         return weight$field;
      }
      
      public function clearSupweight() : void
      {
         supweight$field = null;
      }
      
      public function get hasSupweight() : Boolean
      {
         return supweight$field != null;
      }
      
      public function set supweight(param1:String) : void
      {
         supweight$field = param1;
      }
      
      public function get supweight() : String
      {
         return supweight$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasVersion)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,version$field);
         }
         if(hasKind)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,kind$field);
         }
         if(hasItem)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,item$field);
         }
         if(hasWeight)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,weight$field);
         }
         if(hasSupweight)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,supweight$field);
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
         var _loc8_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc9_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanItemModel.id cannot be set twice.");
                  }
                  _loc8_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanItemModel.version cannot be set twice.");
                  }
                  _loc7_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanItemModel.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanItemModel.item cannot be set twice.");
                  }
                  _loc9_++;
                  this.item = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanItemModel.weight cannot be set twice.");
                  }
                  _loc5_++;
                  this.weight = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanItemModel.supweight cannot be set twice.");
                  }
                  _loc6_++;
                  this.supweight = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
