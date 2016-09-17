package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_FLOAT;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class MineAreaInfo extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineAreaInfo.id","id",8 | 0);
      
      public static const MY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineAreaInfo.my","my",16 | 0);
      
      public static const FAMILY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineAreaInfo.family","family",24 | 0);
      
      public static const EMPTY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineAreaInfo.empty","empty",32 | 0);
      
      public static const NODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineAreaInfo.node","node",40 | 0);
      
      public static const CLOSE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineAreaInfo.close","close",48 | 0);
      
      public static const FAMILYADD:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("proto.MineAreaInfo.familyAdd","familyAdd",56 | 5);
       
      
      public var id:uint;
      
      private var my$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var family$field:uint;
      
      private var empty$field:uint;
      
      private var node$field:uint;
      
      private var close$field:uint;
      
      private var familyAdd$field:Number;
      
      public function MineAreaInfo()
      {
         super();
      }
      
      public function clearMy() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         my$field = new uint();
      }
      
      public function get hasMy() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set my(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         my$field = param1;
      }
      
      public function get my() : uint
      {
         return my$field;
      }
      
      public function clearFamily() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         family$field = new uint();
      }
      
      public function get hasFamily() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set family(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         family$field = param1;
      }
      
      public function get family() : uint
      {
         return family$field;
      }
      
      public function clearEmpty() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         empty$field = new uint();
      }
      
      public function get hasEmpty() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set empty(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         empty$field = param1;
      }
      
      public function get empty() : uint
      {
         return empty$field;
      }
      
      public function clearNode() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         node$field = new uint();
      }
      
      public function get hasNode() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set node(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         node$field = param1;
      }
      
      public function get node() : uint
      {
         return node$field;
      }
      
      public function clearClose() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         close$field = new uint();
      }
      
      public function get hasClose() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set close(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         close$field = param1;
      }
      
      public function get close() : uint
      {
         return close$field;
      }
      
      public function clearFamilyAdd() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         familyAdd$field = new Number();
      }
      
      public function get hasFamilyAdd() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set familyAdd(param1:Number) : void
      {
         hasField$0 = hasField$0 | 32;
         familyAdd$field = param1;
      }
      
      public function get familyAdd() : Number
      {
         return familyAdd$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         if(hasMy)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,my$field);
         }
         if(hasFamily)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,family$field);
         }
         if(hasEmpty)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,empty$field);
         }
         if(hasNode)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,node$field);
         }
         if(hasClose)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,close$field);
         }
         if(hasFamilyAdd)
         {
            WriteUtils.writeTag(param1,5,7);
            WriteUtils.write$TYPE_FLOAT(param1,familyAdd$field);
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
         var _loc7_:* = 0;
         var _loc9_:uint = 0;
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: MineAreaInfo.id cannot be set twice.");
                  }
                  _loc9_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: MineAreaInfo.my cannot be set twice.");
                  }
                  _loc4_++;
                  this.my = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: MineAreaInfo.family cannot be set twice.");
                  }
                  _loc8_++;
                  this.family = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: MineAreaInfo.empty cannot be set twice.");
                  }
                  _loc10_++;
                  this.empty = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: MineAreaInfo.node cannot be set twice.");
                  }
                  _loc3_++;
                  this.node = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: MineAreaInfo.close cannot be set twice.");
                  }
                  _loc6_++;
                  this.close = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: MineAreaInfo.familyAdd cannot be set twice.");
                  }
                  _loc5_++;
                  this.familyAdd = ReadUtils.read$TYPE_FLOAT(param1);
                  continue;
            }
         }
      }
   }
}
