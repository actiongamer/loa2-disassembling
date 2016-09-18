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
   
   public class StaticZhuanPanShopModel extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticZhuanPanShopModel.id","id",8 | 0);
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticZhuanPanShopModel.version","version",16 | 0);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticZhuanPanShopModel.kind","kind",24 | 0);
      
      public static const ITEM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticZhuanPanShopModel.item","item",32 | 2);
      
      public static const ORIRES:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticZhuanPanShopModel.orires","orires",40 | 2);
      
      public static const CURRRES:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticZhuanPanShopModel.currres","currres",48 | 2);
      
      public static const LIMITTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticZhuanPanShopModel.limittype","limittype",56 | 0);
      
      public static const LIMITNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticZhuanPanShopModel.limitnum","limitnum",64 | 0);
      
      public static const EXTRAA:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticZhuanPanShopModel.extraa","extraa",72 | 2);
      
      public static const EXTRAB:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticZhuanPanShopModel.extrab","extrab",80 | 2);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var version$field:uint;
      
      private var kind$field:uint;
      
      private var item$field:String;
      
      private var orires$field:String;
      
      private var currres$field:String;
      
      private var limittype$field:uint;
      
      private var limitnum$field:uint;
      
      private var extraa$field:String;
      
      private var extrab$field:String;
      
      public function StaticZhuanPanShopModel()
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
      
      public function clearOrires() : void
      {
         orires$field = null;
      }
      
      public function get hasOrires() : Boolean
      {
         return orires$field != null;
      }
      
      public function set orires(param1:String) : void
      {
         orires$field = param1;
      }
      
      public function get orires() : String
      {
         return orires$field;
      }
      
      public function clearCurrres() : void
      {
         currres$field = null;
      }
      
      public function get hasCurrres() : Boolean
      {
         return currres$field != null;
      }
      
      public function set currres(param1:String) : void
      {
         currres$field = param1;
      }
      
      public function get currres() : String
      {
         return currres$field;
      }
      
      public function clearLimittype() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         limittype$field = new uint();
      }
      
      public function get hasLimittype() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set limittype(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         limittype$field = param1;
      }
      
      public function get limittype() : uint
      {
         return limittype$field;
      }
      
      public function clearLimitnum() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         limitnum$field = new uint();
      }
      
      public function get hasLimitnum() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set limitnum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         limitnum$field = param1;
      }
      
      public function get limitnum() : uint
      {
         return limitnum$field;
      }
      
      public function clearExtraa() : void
      {
         extraa$field = null;
      }
      
      public function get hasExtraa() : Boolean
      {
         return extraa$field != null;
      }
      
      public function set extraa(param1:String) : void
      {
         extraa$field = param1;
      }
      
      public function get extraa() : String
      {
         return extraa$field;
      }
      
      public function clearExtrab() : void
      {
         extrab$field = null;
      }
      
      public function get hasExtrab() : Boolean
      {
         return extrab$field != null;
      }
      
      public function set extrab(param1:String) : void
      {
         extrab$field = param1;
      }
      
      public function get extrab() : String
      {
         return extrab$field;
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
         if(hasOrires)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,orires$field);
         }
         if(hasCurrres)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,currres$field);
         }
         if(hasLimittype)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,limittype$field);
         }
         if(hasLimitnum)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,limitnum$field);
         }
         if(hasExtraa)
         {
            WriteUtils.writeTag(param1,2,9);
            WriteUtils.write$TYPE_STRING(param1,extraa$field);
         }
         if(hasExtrab)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_STRING(param1,extrab$field);
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
         var _loc5_:* = 0;
         var _loc13_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         var _loc6_:uint = 0;
         var _loc10_:uint = 0;
         var _loc4_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanShopModel.id cannot be set twice.");
                  }
                  _loc13_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanShopModel.version cannot be set twice.");
                  }
                  _loc7_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanShopModel.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanShopModel.item cannot be set twice.");
                  }
                  _loc9_++;
                  this.item = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanShopModel.orires cannot be set twice.");
                  }
                  _loc8_++;
                  this.orires = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanShopModel.currres cannot be set twice.");
                  }
                  _loc6_++;
                  this.currres = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanShopModel.limittype cannot be set twice.");
                  }
                  _loc10_++;
                  this.limittype = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanShopModel.limitnum cannot be set twice.");
                  }
                  _loc4_++;
                  this.limitnum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanShopModel.extraa cannot be set twice.");
                  }
                  _loc11_++;
                  this.extraa = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 9:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: StaticZhuanPanShopModel.extrab cannot be set twice.");
                  }
                  _loc12_++;
                  this.extrab = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
