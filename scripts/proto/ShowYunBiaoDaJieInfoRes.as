package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ShowYunBiaoDaJieInfoRes extends Message
   {
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.ShowYunBiaoDaJieInfoRes.name","name",8 | 2);
      
      public static const QUALITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ShowYunBiaoDaJieInfoRes.quality","quality",16 | 0);
      
      public static const FAMILYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.ShowYunBiaoDaJieInfoRes.familyName","familyName",24 | 2);
      
      public static const LASTBEIDAJIETIME:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.ShowYunBiaoDaJieInfoRes.lastbeidajietime","lastbeidajietime",32 | 0);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ShowYunBiaoDaJieInfoRes.level","level",40 | 0);
       
      
      public var name:String;
      
      public var quality:uint;
      
      public var familyName:String;
      
      public var lastbeidajietime:UInt64;
      
      public var level:uint;
      
      public function ShowYunBiaoDaJieInfoRes()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.quality);
         WriteUtils.writeTag(param1,2,3);
         WriteUtils.write$TYPE_STRING(param1,this.familyName);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT64(param1,this.lastbeidajietime);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.level);
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
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc8_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ShowYunBiaoDaJieInfoRes.name cannot be set twice.");
                  }
                  _loc4_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: ShowYunBiaoDaJieInfoRes.quality cannot be set twice.");
                  }
                  _loc7_++;
                  this.quality = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ShowYunBiaoDaJieInfoRes.familyName cannot be set twice.");
                  }
                  _loc3_++;
                  this.familyName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: ShowYunBiaoDaJieInfoRes.lastbeidajietime cannot be set twice.");
                  }
                  _loc8_++;
                  this.lastbeidajietime = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ShowYunBiaoDaJieInfoRes.level cannot be set twice.");
                  }
                  _loc5_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
