package proto.StaticTowerModel
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class KVPair extends Message
   {
      
      public static const K:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticTowerModel.KVPair.k","k",8 | 2);
      
      public static const V:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticTowerModel.KVPair.v","v",16 | 2);
       
      
      private var k$field:String;
      
      private var v$field:String;
      
      public function KVPair()
      {
         super();
      }
      
      public function clearK() : void
      {
         k$field = null;
      }
      
      public function get hasK() : Boolean
      {
         return k$field != null;
      }
      
      public function set k(param1:String) : void
      {
         k$field = param1;
      }
      
      public function get k() : String
      {
         return k$field;
      }
      
      public function clearV() : void
      {
         v$field = null;
      }
      
      public function get hasV() : Boolean
      {
         return v$field != null;
      }
      
      public function set v(param1:String) : void
      {
         v$field = param1;
      }
      
      public function get v() : String
      {
         return v$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasK)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_STRING(param1,k$field);
         }
         if(hasV)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,v$field);
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
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: KVPair.k cannot be set twice.");
                  }
                  _loc5_++;
                  this.k = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: KVPair.v cannot be set twice.");
                  }
                  _loc4_++;
                  this.v = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
