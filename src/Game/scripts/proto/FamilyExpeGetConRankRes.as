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
   
   public class FamilyExpeGetConRankRes extends Message
   {
      
      public static const RANKLEN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeGetConRankRes.rankLen","rankLen",8 | 0);
      
      public static const RANKINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeGetConRankRes.rankInfos","rankInfos",16 | 2,FamilyExpeConRankInfo);
      
      public static const MYCON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeGetConRankRes.myCon","myCon",24 | 0);
      
      public static const MYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeGetConRankRes.myRank","myRank",32 | 0);
       
      
      private var rankLen$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var rankInfos:Array;
      
      private var myCon$field:uint;
      
      private var myRank$field:uint;
      
      public function FamilyExpeGetConRankRes()
      {
         rankInfos = [];
         super();
      }
      
      public function clearRankLen() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         rankLen$field = new uint();
      }
      
      public function get hasRankLen() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set rankLen(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         rankLen$field = param1;
      }
      
      public function get rankLen() : uint
      {
         return rankLen$field;
      }
      
      public function clearMyCon() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         myCon$field = new uint();
      }
      
      public function get hasMyCon() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set myCon(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         myCon$field = param1;
      }
      
      public function get myCon() : uint
      {
         return myCon$field;
      }
      
      public function clearMyRank() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         myRank$field = new uint();
      }
      
      public function get hasMyRank() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set myRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         myRank$field = param1;
      }
      
      public function get myRank() : uint
      {
         return myRank$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasRankLen)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,rankLen$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.rankInfos.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rankInfos[_loc2_]);
            _loc2_++;
         }
         if(hasMyCon)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,myCon$field);
         }
         if(hasMyRank)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,myRank$field);
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
         var _loc4_:* = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeGetConRankRes.rankLen cannot be set twice.");
                  }
                  _loc5_++;
                  this.rankLen = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.rankInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new FamilyExpeConRankInfo()));
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeGetConRankRes.myCon cannot be set twice.");
                  }
                  _loc6_++;
                  this.myCon = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeGetConRankRes.myRank cannot be set twice.");
                  }
                  _loc3_++;
                  this.myRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
