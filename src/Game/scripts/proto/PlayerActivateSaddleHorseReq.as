package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class PlayerActivateSaddleHorseReq extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerActivateSaddleHorseReq.id","id",8 | 0);
      
      public static const AUTOBUY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.PlayerActivateSaddleHorseReq.autobuy","autobuy",16 | 0);
       
      
      public var id:uint;
      
      private var autobuy$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function PlayerActivateSaddleHorseReq()
      {
         super();
      }
      
      public function clearAutobuy() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         autobuy$field = new Boolean();
      }
      
      public function get hasAutobuy() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set autobuy(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         autobuy$field = param1;
      }
      
      public function get autobuy() : Boolean
      {
         return autobuy$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         if(hasAutobuy)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_BOOL(param1,autobuy$field);
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
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerActivateSaddleHorseReq.id cannot be set twice.");
                  }
                  _loc5_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerActivateSaddleHorseReq.autobuy cannot be set twice.");
                  }
                  _loc3_++;
                  this.autobuy = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
