package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyTechResearchNotify extends Message
   {
      
      public static const ITEMTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyTechResearchNotify.itemtype","itemtype",8 | 0);
      
      public static const ITEMLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyTechResearchNotify.itemlevel","itemlevel",16 | 0);
      
      public static const LASTRESEARCHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyTechResearchNotify.lastresearchtime","lastresearchtime",24 | 0);
      
      public static const NEWASSETS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyTechResearchNotify.newassets","newassets",32 | 0);
       
      
      public var itemtype:uint;
      
      public var itemlevel:uint;
      
      public var lastresearchtime:uint;
      
      public var newassets:uint;
      
      public function FamilyTechResearchNotify()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.itemtype);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.itemlevel);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.lastresearchtime);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.newassets);
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
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyTechResearchNotify.itemtype cannot be set twice.");
                  }
                  _loc7_++;
                  this.itemtype = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyTechResearchNotify.itemlevel cannot be set twice.");
                  }
                  _loc4_++;
                  this.itemlevel = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyTechResearchNotify.lastresearchtime cannot be set twice.");
                  }
                  _loc3_++;
                  this.lastresearchtime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyTechResearchNotify.newassets cannot be set twice.");
                  }
                  _loc6_++;
                  this.newassets = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
