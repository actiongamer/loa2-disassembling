package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class PlayerResStageFightEndRes extends Message
   {
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerResStageFightEndRes.count","count",8 | 0);
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerResStageFightEndRes.star","star",16 | 0);
      
      public static const AWARDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerResStageFightEndRes.awardid","awardid",24 | 0);
       
      
      public var count:uint;
      
      private var star$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var awardid$field:uint;
      
      public function PlayerResStageFightEndRes()
      {
         super();
      }
      
      public function clearStar() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         star$field = new uint();
      }
      
      public function get hasStar() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set star(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         star$field = param1;
      }
      
      public function get star() : uint
      {
         return star$field;
      }
      
      public function clearAwardid() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         awardid$field = new uint();
      }
      
      public function get hasAwardid() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set awardid(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         awardid$field = param1;
      }
      
      public function get awardid() : uint
      {
         return awardid$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.count);
         if(hasStar)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,star$field);
         }
         if(hasAwardid)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,awardid$field);
         }
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerResStageFightEndRes.count cannot be set twice.");
                  }
                  _loc4_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerResStageFightEndRes.star cannot be set twice.");
                  }
                  _loc5_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerResStageFightEndRes.awardid cannot be set twice.");
                  }
                  _loc6_++;
                  this.awardid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
