package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TitleContentInfo extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TitleContentInfo.id","id",8 | 0);
      
      public static const ENDTM:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.TitleContentInfo.endTm","endTm",16 | 0);
      
      public static const FIGHTPROP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.TitleContentInfo.fightProp","fightProp",24 | 0);
       
      
      public var id:uint;
      
      public var endTm:UInt64;
      
      private var fightProp$field:UInt64;
      
      public function TitleContentInfo()
      {
         super();
      }
      
      public function clearFightProp() : void
      {
         fightProp$field = null;
      }
      
      public function get hasFightProp() : Boolean
      {
         return fightProp$field != null;
      }
      
      public function set fightProp(param1:UInt64) : void
      {
         fightProp$field = param1;
      }
      
      public function get fightProp() : UInt64
      {
         return fightProp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT64(param1,this.endTm);
         if(hasFightProp)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT64(param1,fightProp$field);
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
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: TitleContentInfo.id cannot be set twice.");
                  }
                  _loc6_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: TitleContentInfo.endTm cannot be set twice.");
                  }
                  _loc3_++;
                  this.endTm = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: TitleContentInfo.fightProp cannot be set twice.");
                  }
                  _loc4_++;
                  this.fightProp = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
