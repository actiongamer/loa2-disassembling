package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyTechInfoRes extends Message
   {
      
      public static const HIGHESTLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyTechInfoRes.highestlevel","highestlevel",8 | 0);
      
      public static const CURRESHITEM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyTechInfoRes.curreshitem","curreshitem",16 | 0);
      
      public static const CURRESHLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyTechInfoRes.curreshlevel","curreshlevel",24 | 0);
      
      public static const LASTRESHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyTechInfoRes.lastreshtime","lastreshtime",32 | 0);
      
      public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyTechInfoRes.items","items",40 | 2,FamilyTechItem);
       
      
      public var highestlevel:uint;
      
      public var curreshitem:uint;
      
      public var curreshlevel:uint;
      
      public var lastreshtime:uint;
      
      public var items:Array;
      
      public function FamilyTechInfoRes()
      {
         items = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.highestlevel);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.curreshitem);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.curreshlevel);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.lastreshtime);
         _loc2_ = uint(0);
         while(_loc2_ < this.items.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items[_loc2_]);
            _loc2_++;
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
         var _loc3_:* = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyTechInfoRes.highestlevel cannot be set twice.");
                  }
                  _loc6_++;
                  this.highestlevel = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyTechInfoRes.curreshitem cannot be set twice.");
                  }
                  _loc4_++;
                  this.curreshitem = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyTechInfoRes.curreshlevel cannot be set twice.");
                  }
                  _loc7_++;
                  this.curreshlevel = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyTechInfoRes.lastreshtime cannot be set twice.");
                  }
                  _loc5_++;
                  this.lastreshtime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  this.items.push(ReadUtils.read$TYPE_MESSAGE(param1,new FamilyTechItem()));
                  continue;
            }
         }
      }
   }
}
