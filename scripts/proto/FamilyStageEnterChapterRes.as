package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyStageEnterChapterRes extends Message
   {
      
      public static const CHAPTERINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyStageEnterChapterRes.chapterinfo","chapterinfo",8 | 2,proto.FamilyStageChapterInfo);
      
      public static const HURT:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FamilyStageEnterChapterRes.hurt","hurt",16 | 0);
      
      public static const FREETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageEnterChapterRes.freetimes","freetimes",24 | 0);
      
      public static const MAXREWARDCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageEnterChapterRes.maxrewardcount","maxrewardcount",32 | 0);
      
      public static const HASGOTREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FamilyStageEnterChapterRes.hasgotreward","hasgotreward",40 | 0);
       
      
      public var chapterinfo:proto.FamilyStageChapterInfo;
      
      private var hurt$field:UInt64;
      
      private var freetimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var maxrewardcount$field:uint;
      
      private var hasgotreward$field:Boolean;
      
      public function FamilyStageEnterChapterRes()
      {
         super();
      }
      
      public function clearHurt() : void
      {
         hurt$field = null;
      }
      
      public function get hasHurt() : Boolean
      {
         return hurt$field != null;
      }
      
      public function set hurt(param1:UInt64) : void
      {
         hurt$field = param1;
      }
      
      public function get hurt() : UInt64
      {
         return hurt$field;
      }
      
      public function clearFreetimes() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         freetimes$field = new uint();
      }
      
      public function get hasFreetimes() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set freetimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         freetimes$field = param1;
      }
      
      public function get freetimes() : uint
      {
         return freetimes$field;
      }
      
      public function clearMaxrewardcount() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         maxrewardcount$field = new uint();
      }
      
      public function get hasMaxrewardcount() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set maxrewardcount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         maxrewardcount$field = param1;
      }
      
      public function get maxrewardcount() : uint
      {
         return maxrewardcount$field;
      }
      
      public function clearHasgotreward() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         hasgotreward$field = new Boolean();
      }
      
      public function get hasHasgotreward() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set hasgotreward(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 4;
         hasgotreward$field = param1;
      }
      
      public function get hasgotreward() : Boolean
      {
         return hasgotreward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_MESSAGE(param1,this.chapterinfo);
         if(hasHurt)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT64(param1,hurt$field);
         }
         if(hasFreetimes)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,freetimes$field);
         }
         if(hasMaxrewardcount)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,maxrewardcount$field);
         }
         if(hasHasgotreward)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_BOOL(param1,hasgotreward$field);
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
         var _loc5_:* = 0;
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageEnterChapterRes.chapterinfo cannot be set twice.");
                  }
                  _loc4_++;
                  this.chapterinfo = new proto.FamilyStageChapterInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.chapterinfo);
                  continue;
               case 1:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageEnterChapterRes.hurt cannot be set twice.");
                  }
                  _loc8_++;
                  this.hurt = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageEnterChapterRes.freetimes cannot be set twice.");
                  }
                  _loc3_++;
                  this.freetimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageEnterChapterRes.maxrewardcount cannot be set twice.");
                  }
                  _loc7_++;
                  this.maxrewardcount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageEnterChapterRes.hasgotreward cannot be set twice.");
                  }
                  _loc6_++;
                  this.hasgotreward = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
