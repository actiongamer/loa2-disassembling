package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ClothesBagRes extends Message
   {
      
      public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ClothesBagRes.items","items",8 | 2,Item);
      
      public static const PROP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ClothesBagRes.prop","prop",16 | 2,proto.FightProp);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.ClothesBagRes.ability","ability",24 | 0);
       
      
      public var items:Array;
      
      private var prop$field:proto.FightProp;
      
      private var ability$field:UInt64;
      
      public function ClothesBagRes()
      {
         items = [];
         super();
      }
      
      public function clearProp() : void
      {
         prop$field = null;
      }
      
      public function get hasProp() : Boolean
      {
         return prop$field != null;
      }
      
      public function set prop(param1:proto.FightProp) : void
      {
         prop$field = param1;
      }
      
      public function get prop() : proto.FightProp
      {
         return prop$field;
      }
      
      public function clearAbility() : void
      {
         ability$field = null;
      }
      
      public function get hasAbility() : Boolean
      {
         return ability$field != null;
      }
      
      public function set ability(param1:UInt64) : void
      {
         ability$field = param1;
      }
      
      public function get ability() : UInt64
      {
         return ability$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.items.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items[_loc2_]);
            _loc2_++;
         }
         if(hasProp)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,prop$field);
         }
         if(hasAbility)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT64(param1,ability$field);
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
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  this.items.push(ReadUtils.read$TYPE_MESSAGE(param1,new Item()));
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ClothesBagRes.prop cannot be set twice.");
                  }
                  _loc3_++;
                  this.prop = new proto.FightProp();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.prop);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ClothesBagRes.ability cannot be set twice.");
                  }
                  _loc5_++;
                  this.ability = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
