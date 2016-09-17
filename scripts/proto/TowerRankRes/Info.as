package proto.TowerRankRes
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class Info extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.TowerRankRes.Info.id","id",8 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.TowerRankRes.Info.name","name",16 | 2);
      
      public static const SCORE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.TowerRankRes.Info.score","score",24 | 0);
       
      
      public var id:UInt64;
      
      public var name:String;
      
      public var score:int;
      
      public function Info()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_INT32(param1,this.score);
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
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Info.id cannot be set twice.");
                  }
                  _loc6_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Info.name cannot be set twice.");
                  }
                  _loc3_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Info.score cannot be set twice.");
                  }
                  _loc5_++;
                  this.score = ReadUtils.read$TYPE_INT32(param1);
                  continue;
            }
         }
      }
   }
}
