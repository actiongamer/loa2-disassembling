package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class RankMember extends Message
   {
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.RankMember.name","name",8 | 2);
      
      public static const DISTRICT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.RankMember.district","district",16 | 2);
      
      public static const TOTALHURT:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.RankMember.totalhurt","totalhurt",24 | 0);
      
      public static const PLAYERID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.RankMember.playerid","playerid",32 | 0);
      
      public static const DISTRICTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.RankMember.districtid","districtid",40 | 0);
       
      
      public var name:String;
      
      public var district:String;
      
      public var totalhurt:UInt64;
      
      public var playerid:UInt64;
      
      public var districtid:uint;
      
      public function RankMember()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.district);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT64(param1,this.totalhurt);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT64(param1,this.playerid);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.districtid);
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
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: RankMember.name cannot be set twice.");
                  }
                  _loc4_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: RankMember.district cannot be set twice.");
                  }
                  _loc3_++;
                  this.district = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: RankMember.totalhurt cannot be set twice.");
                  }
                  _loc7_++;
                  this.totalhurt = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: RankMember.playerid cannot be set twice.");
                  }
                  _loc5_++;
                  this.playerid = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 4:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: RankMember.districtid cannot be set twice.");
                  }
                  _loc8_++;
                  this.districtid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
