package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyTechResearchRes extends Message
   {
      
      public static const NEWLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyTechResearchRes.newlevel","newlevel",8 | 0);
      
      public static const LASTRESEARCHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyTechResearchRes.lastresearchtime","lastresearchtime",16 | 0);
      
      public static const NEWASSETS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyTechResearchRes.newassets","newassets",24 | 0);
       
      
      public var newlevel:uint;
      
      public var lastresearchtime:uint;
      
      public var newassets:uint;
      
      public function FamilyTechResearchRes()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.newlevel);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.lastresearchtime);
         WriteUtils.writeTag(param1,0,3);
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
                     throw new IOError("Bad data format: FamilyTechResearchRes.newlevel cannot be set twice.");
                  }
                  _loc6_++;
                  this.newlevel = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyTechResearchRes.lastresearchtime cannot be set twice.");
                  }
                  _loc3_++;
                  this.lastresearchtime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyTechResearchRes.newassets cannot be set twice.");
                  }
                  _loc5_++;
                  this.newassets = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
