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
   
   public class StaticZhuanPanCostModel extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticZhuanPanCostModel.id","id",8 | 0);
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticZhuanPanCostModel.version","version",16 | 0);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticZhuanPanCostModel.kind","kind",24 | 0);
      
      public static const COST:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticZhuanPanCostModel.cost","cost",32 | 2);
      
      public static const COSTSUP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticZhuanPanCostModel.costsup","costsup",40 | 2);
      
      public static const COSTKIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticZhuanPanCostModel.costKind","costKind",48 | 0);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var version$field:uint;
      
      private var kind$field:uint;
      
      private var cost$field:String;
      
      private var costsup$field:String;
      
      private var costKind$field:uint;
      
      public function StaticZhuanPanCostModel()
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
      
      public function clearCost() : void
      {
         cost$field = null;
      }
      
      public function get hasCost() : Boolean
      {
         return cost$field != null;
      }
      
      public function set cost(param1:String) : void
      {
         cost$field = param1;
      }
      
      public function get cost() : String
      {
         return cost$field;
      }
      
      public function clearCostsup() : void
      {
         costsup$field = null;
      }
      
      public function get hasCostsup() : Boolean
      {
         return costsup$field != null;
      }
      
      public function set costsup(param1:String) : void
      {
         costsup$field = param1;
      }
      
      public function get costsup() : String
      {
         return costsup$field;
      }
      
      public function clearCostKind() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         costKind$field = new uint();
      }
      
      public function get hasCostKind() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set costKind(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         costKind$field = param1;
      }
      
      public function get costKind() : uint
      {
         return costKind$field;
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
         if(hasCost)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,cost$field);
         }
         if(hasCostsup)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,costsup$field);
         }
         if(hasCostKind)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,costKind$field);
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
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanCostModel.id cannot be set twice.");
                  }
                  _loc9_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanCostModel.version cannot be set twice.");
                  }
                  _loc8_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanCostModel.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanCostModel.cost cannot be set twice.");
                  }
                  _loc5_++;
                  this.cost = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanCostModel.costsup cannot be set twice.");
                  }
                  _loc6_++;
                  this.costsup = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanCostModel.costKind cannot be set twice.");
                  }
                  _loc7_++;
                  this.costKind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
