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
   
   public class StaticDragonBoatMakeModel extends Message
   {
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticDragonBoatMakeModel.version","version",8 | 0);
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticDragonBoatMakeModel.id","id",16 | 0);
      
      public static const COOKMATERIAL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticDragonBoatMakeModel.cookMaterial","cookMaterial",24 | 2);
      
      public static const COOKSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticDragonBoatMakeModel.cookScore","cookScore",32 | 0);
      
      public static const COOKNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticDragonBoatMakeModel.cookNum","cookNum",40 | 0);
       
      
      public var cookMaterialVoArr:Array;
      
      private var version$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var id$field:uint;
      
      private var cookMaterial$field:String;
      
      private var cookScore$field:uint;
      
      private var cookNum$field:uint;
      
      public function StaticDragonBoatMakeModel()
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
      
      public function clearId() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         id$field = param1;
      }
      
      public function get id() : uint
      {
         return id$field;
      }
      
      public function clearCookMaterial() : void
      {
         cookMaterial$field = null;
      }
      
      public function get hasCookMaterial() : Boolean
      {
         return cookMaterial$field != null;
      }
      
      public function set cookMaterial(param1:String) : void
      {
         cookMaterial$field = param1;
      }
      
      public function get cookMaterial() : String
      {
         return cookMaterial$field;
      }
      
      public function clearCookScore() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         cookScore$field = new uint();
      }
      
      public function get hasCookScore() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set cookScore(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         cookScore$field = param1;
      }
      
      public function get cookScore() : uint
      {
         return cookScore$field;
      }
      
      public function clearCookNum() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         cookNum$field = new uint();
      }
      
      public function get hasCookNum() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set cookNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         cookNum$field = param1;
      }
      
      public function get cookNum() : uint
      {
         return cookNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasVersion)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,version$field);
         }
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasCookMaterial)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,cookMaterial$field);
         }
         if(hasCookScore)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,cookScore$field);
         }
         if(hasCookNum)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,cookNum$field);
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
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticDragonBoatMakeModel.version cannot be set twice.");
                  }
                  _loc8_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticDragonBoatMakeModel.id cannot be set twice.");
                  }
                  _loc7_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticDragonBoatMakeModel.cookMaterial cannot be set twice.");
                  }
                  _loc6_++;
                  this.cookMaterial = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticDragonBoatMakeModel.cookScore cannot be set twice.");
                  }
                  _loc5_++;
                  this.cookScore = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticDragonBoatMakeModel.cookNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.cookNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
