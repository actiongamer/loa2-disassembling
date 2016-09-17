package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class RankExtraData extends Message
   {
      
      public static const MYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.RankExtraData.myRank","myRank",8 | 0);
      
      public static const MYLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.RankExtraData.myLevel","myLevel",16 | 0);
      
      public static const MYFAMILYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.RankExtraData.myFamilyName","myFamilyName",24 | 2);
      
      public static const MYSTAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.RankExtraData.mystar","mystar",32 | 0);
      
      public static const MYABILITY:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.RankExtraData.myAbility","myAbility",40 | 0);
       
      
      public var myRank:uint;
      
      private var myLevel$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var myFamilyName$field:String;
      
      private var mystar$field:uint;
      
      private var myAbility$field:UInt64;
      
      public function RankExtraData()
      {
         super();
      }
      
      public function clearMyLevel() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         myLevel$field = new uint();
      }
      
      public function get hasMyLevel() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set myLevel(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         myLevel$field = param1;
      }
      
      public function get myLevel() : uint
      {
         return myLevel$field;
      }
      
      public function clearMyFamilyName() : void
      {
         myFamilyName$field = null;
      }
      
      public function get hasMyFamilyName() : Boolean
      {
         return myFamilyName$field != null;
      }
      
      public function set myFamilyName(param1:String) : void
      {
         myFamilyName$field = param1;
      }
      
      public function get myFamilyName() : String
      {
         return myFamilyName$field;
      }
      
      public function clearMystar() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         mystar$field = new uint();
      }
      
      public function get hasMystar() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set mystar(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         mystar$field = param1;
      }
      
      public function get mystar() : uint
      {
         return mystar$field;
      }
      
      public function clearMyAbility() : void
      {
         myAbility$field = null;
      }
      
      public function get hasMyAbility() : Boolean
      {
         return myAbility$field != null;
      }
      
      public function set myAbility(param1:UInt64) : void
      {
         myAbility$field = param1;
      }
      
      public function get myAbility() : UInt64
      {
         return myAbility$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.myRank);
         if(hasMyLevel)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,myLevel$field);
         }
         if(hasMyFamilyName)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,myFamilyName$field);
         }
         if(hasMystar)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,mystar$field);
         }
         if(hasMyAbility)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT64(param1,myAbility$field);
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
         var _loc7_:* = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         var _loc8_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: RankExtraData.myRank cannot be set twice.");
                  }
                  _loc6_++;
                  this.myRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: RankExtraData.myLevel cannot be set twice.");
                  }
                  _loc4_++;
                  this.myLevel = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: RankExtraData.myFamilyName cannot be set twice.");
                  }
                  _loc8_++;
                  this.myFamilyName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: RankExtraData.mystar cannot be set twice.");
                  }
                  _loc5_++;
                  this.mystar = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: RankExtraData.myAbility cannot be set twice.");
                  }
                  _loc3_++;
                  this.myAbility = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
