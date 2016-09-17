package proto.ZhuanpanCrossRankRes
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class RankData extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.ZhuanpanCrossRankRes.RankData.id","id",8 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.ZhuanpanCrossRankRes.RankData.name","name",16 | 2);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ZhuanpanCrossRankRes.RankData.score","score",24 | 0);
      
      public static const MILITARYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ZhuanpanCrossRankRes.RankData.MilitaryRank","militaryRank",32 | 0);
      
      public static const DIST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ZhuanpanCrossRankRes.RankData.dist","dist",40 | 0);
      
      public static const OPNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.ZhuanpanCrossRankRes.RankData.opname","opname",48 | 2);
       
      
      public var id:UInt64;
      
      public var name:String;
      
      public var score:uint;
      
      public var militaryRank:uint;
      
      public var dist:uint;
      
      public var opname:String;
      
      public function RankData()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         WriteUtils.writeTag(param1,2,2);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.score);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.militaryRank);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.dist);
         WriteUtils.writeTag(param1,2,6);
         WriteUtils.write$TYPE_STRING(param1,this.opname);
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
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         var _loc8_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: RankData.id cannot be set twice.");
                  }
                  _loc9_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: RankData.name cannot be set twice.");
                  }
                  _loc3_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: RankData.score cannot be set twice.");
                  }
                  _loc7_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: RankData.militaryRank cannot be set twice.");
                  }
                  _loc5_++;
                  this.militaryRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: RankData.dist cannot be set twice.");
                  }
                  _loc8_++;
                  this.dist = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: RankData.opname cannot be set twice.");
                  }
                  _loc4_++;
                  this.opname = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
