package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_DOUBLE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyStageHpsNotify extends Message
   {
      
      public static const NODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageHpsNotify.nodeid","nodeid",8 | 0);
      
      public static const HPS:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("proto.FamilyStageHpsNotify.hps","hps",16 | 1);
       
      
      public var nodeid:uint;
      
      public var hps:Array;
      
      public function FamilyStageHpsNotify()
      {
         hps = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.nodeid);
         _loc3_ = uint(0);
         while(_loc3_ < this.hps.length)
         {
            WriteUtils.writeTag(param1,1,2);
            WriteUtils.write$TYPE_DOUBLE(param1,this.hps[_loc3_]);
            _loc3_++;
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageHpsNotify.nodeid cannot be set twice.");
                  }
                  _loc4_++;
                  this.nodeid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_DOUBLE,this.hps);
                  }
                  else
                  {
                     this.hps.push(ReadUtils.read$TYPE_DOUBLE(param1));
                  }
                  continue;
            }
         }
      }
   }
}
