package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyDonateRes extends Message
   {
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyDonateRes.level","level",8 | 0);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyDonateRes.exp","exp",16 | 0);
      
      public static const FUND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyDonateRes.fund","fund",24 | 0);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyDonateRes.score","score",32 | 0);
       
      
      public var level:uint;
      
      public var exp:uint;
      
      public var fund:uint;
      
      public var score:uint;
      
      public function FamilyDonateRes()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.level);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.exp);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.fund);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.score);
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
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyDonateRes.level cannot be set twice.");
                  }
                  _loc4_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyDonateRes.exp cannot be set twice.");
                  }
                  _loc7_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyDonateRes.fund cannot be set twice.");
                  }
                  _loc3_++;
                  this.fund = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyDonateRes.score cannot be set twice.");
                  }
                  _loc6_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
