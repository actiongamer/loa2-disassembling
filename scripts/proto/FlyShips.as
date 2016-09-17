package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FlyShips extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FlyShips.id","id",8 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FlyShips.name","name",16 | 2);
      
      public static const LASTBEIDAJIETIME:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FlyShips.lastbeidajietime","lastbeidajietime",24 | 0);
      
      public static const STARTTM:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FlyShips.startTm","startTm",32 | 0);
       
      
      public var id:UInt64;
      
      public var name:String;
      
      private var lastbeidajietime$field:UInt64;
      
      public var startTm:UInt64;
      
      public function FlyShips()
      {
         super();
      }
      
      public function clearLastbeidajietime() : void
      {
         lastbeidajietime$field = null;
      }
      
      public function get hasLastbeidajietime() : Boolean
      {
         return lastbeidajietime$field != null;
      }
      
      public function set lastbeidajietime(param1:UInt64) : void
      {
         lastbeidajietime$field = param1;
      }
      
      public function get lastbeidajietime() : UInt64
      {
         return lastbeidajietime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         if(hasLastbeidajietime)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT64(param1,lastbeidajietime$field);
         }
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT64(param1,this.startTm);
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
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlyShips.id cannot be set twice.");
                  }
                  _loc7_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FlyShips.name cannot be set twice.");
                  }
                  _loc3_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlyShips.lastbeidajietime cannot be set twice.");
                  }
                  _loc6_++;
                  this.lastbeidajietime = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlyShips.startTm cannot be set twice.");
                  }
                  _loc4_++;
                  this.startTm = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
