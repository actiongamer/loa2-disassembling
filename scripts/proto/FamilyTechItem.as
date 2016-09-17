package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyTechItem extends Message
   {
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyTechItem.itemid","itemid",8 | 0);
      
      public static const TECHTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyTechItem.techtype","techtype",16 | 0);
      
      public static const MEMBERLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyTechItem.memberlevel","memberlevel",24 | 0);
      
      public static const FAMILYTECHLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyTechItem.familytechlevel","familytechlevel",32 | 0);
       
      
      public var itemid:uint;
      
      public var techtype:uint;
      
      public var memberlevel:uint;
      
      public var familytechlevel:uint;
      
      public function FamilyTechItem()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.itemid);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.techtype);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.memberlevel);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.familytechlevel);
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
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyTechItem.itemid cannot be set twice.");
                  }
                  _loc3_++;
                  this.itemid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyTechItem.techtype cannot be set twice.");
                  }
                  _loc6_++;
                  this.techtype = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyTechItem.memberlevel cannot be set twice.");
                  }
                  _loc5_++;
                  this.memberlevel = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyTechItem.familytechlevel cannot be set twice.");
                  }
                  _loc7_++;
                  this.familytechlevel = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
