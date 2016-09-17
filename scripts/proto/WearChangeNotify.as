package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class WearChangeNotify extends Message
   {
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WearChangeNotify.kind","kind",8 | 0);
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WearChangeNotify.id","id",16 | 0);
      
      public static const UID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.WearChangeNotify.uid","uid",24 | 0);
      
      public static const PET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.WearChangeNotify.pet","pet",32 | 2,proto.PetSceneInfo);
       
      
      public var kind:uint;
      
      public var id:uint;
      
      public var uid:UInt64;
      
      private var pet$field:proto.PetSceneInfo;
      
      public function WearChangeNotify()
      {
         super();
      }
      
      public function clearPet() : void
      {
         pet$field = null;
      }
      
      public function get hasPet() : Boolean
      {
         return pet$field != null;
      }
      
      public function set pet(param1:proto.PetSceneInfo) : void
      {
         pet$field = param1;
      }
      
      public function get pet() : proto.PetSceneInfo
      {
         return pet$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.kind);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT64(param1,this.uid);
         if(hasPet)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,pet$field);
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
         var _loc6_:* = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: WearChangeNotify.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: WearChangeNotify.id cannot be set twice.");
                  }
                  _loc7_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: WearChangeNotify.uid cannot be set twice.");
                  }
                  _loc4_++;
                  this.uid = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: WearChangeNotify.pet cannot be set twice.");
                  }
                  _loc5_++;
                  this.pet = new proto.PetSceneInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.pet);
                  continue;
            }
         }
      }
   }
}
