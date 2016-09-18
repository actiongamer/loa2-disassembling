package protoExtras
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class QQLoginExtra extends Message
   {
      
      public static const PF:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.QQLoginExtra.pf","pf",8 | 2);
      
      public static const PFKEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.QQLoginExtra.pfkey","pfkey",16 | 2);
      
      public static const PLATFORM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.QQLoginExtra.platform","platform",24 | 2);
      
      public static const OPENKEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.QQLoginExtra.openkey","openkey",32 | 2);
       
      
      public var pf:String;
      
      public var pfkey:String;
      
      public var platform:String;
      
      public var openkey:String;
      
      public function QQLoginExtra()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_STRING(param1,this.pf);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.pfkey);
         WriteUtils.writeTag(param1,2,3);
         WriteUtils.write$TYPE_STRING(param1,this.platform);
         WriteUtils.writeTag(param1,2,4);
         WriteUtils.write$TYPE_STRING(param1,this.openkey);
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
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: QQLoginExtra.pf cannot be set twice.");
                  }
                  _loc7_++;
                  this.pf = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: QQLoginExtra.pfkey cannot be set twice.");
                  }
                  _loc4_++;
                  this.pfkey = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: QQLoginExtra.platform cannot be set twice.");
                  }
                  _loc6_++;
                  this.platform = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: QQLoginExtra.openkey cannot be set twice.");
                  }
                  _loc3_++;
                  this.openkey = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
