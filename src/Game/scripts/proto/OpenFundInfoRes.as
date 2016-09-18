package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class OpenFundInfoRes extends Message
   {
      
      public static const HASFUND:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.OpenFundInfoRes.hasfund","hasfund",8 | 0);
      
      public static const GETREWARDS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.OpenFundInfoRes.getrewards","getrewards",16 | 0);
      
      public static const GETWELFARE:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.OpenFundInfoRes.getwelfare","getwelfare",24 | 0);
      
      public static const ALLCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.OpenFundInfoRes.allcount","allcount",32 | 0);
       
      
      public var hasfund:Boolean;
      
      public var getrewards:Array;
      
      public var getwelfare:Array;
      
      public var allcount:uint;
      
      public function OpenFundInfoRes()
      {
         getrewards = [];
         getwelfare = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.hasfund);
         _loc3_ = uint(0);
         while(_loc3_ < this.getrewards.length)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,this.getrewards[_loc3_]);
            _loc3_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.getwelfare.length)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,this.getwelfare[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.allcount);
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                     throw new IOError("Bad data format: OpenFundInfoRes.hasfund cannot be set twice.");
                  }
                  _loc5_++;
                  this.hasfund = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if((_loc4_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.getrewards);
                  }
                  else
                  {
                     this.getrewards.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 2:
                  if((_loc4_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.getwelfare);
                  }
                  else
                  {
                     this.getwelfare.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: OpenFundInfoRes.allcount cannot be set twice.");
                  }
                  _loc3_++;
                  this.allcount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
