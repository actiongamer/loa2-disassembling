package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class SuperSaleInfoData extends Message
   {
      
      public static const CANGET:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.SuperSaleInfoData.canget","canget",8 | 0);
      
      public static const ALREADYGET:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.SuperSaleInfoData.alreadyget","alreadyget",16 | 0);
      
      public static const QIPAO:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.SuperSaleInfoData.qipao","qipao",24 | 0);
       
      
      public var canget:Boolean;
      
      public var alreadyget:Array;
      
      private var qipao$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function SuperSaleInfoData()
      {
         alreadyget = [];
         super();
      }
      
      public function clearQipao() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         qipao$field = new Boolean();
      }
      
      public function get hasQipao() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set qipao(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         qipao$field = param1;
      }
      
      public function get qipao() : Boolean
      {
         return qipao$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.canget);
         _loc2_ = uint(0);
         while(_loc2_ < this.alreadyget.length)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,this.alreadyget[_loc2_]);
            _loc2_++;
         }
         if(hasQipao)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_BOOL(param1,qipao$field);
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
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: SuperSaleInfoData.canget cannot be set twice.");
                  }
                  _loc3_++;
                  this.canget = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if((_loc4_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.alreadyget);
                  }
                  else
                  {
                     this.alreadyget.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: SuperSaleInfoData.qipao cannot be set twice.");
                  }
                  _loc5_++;
                  this.qipao = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
