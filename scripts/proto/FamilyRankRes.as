package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyRankRes extends Message
   {
      
      public static const MYFAMILYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyRankRes.myFamilyName","myFamilyName",8 | 2);
      
      public static const MYFAMILYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyRankRes.myFamilyRank","myFamilyRank",16 | 0);
      
      public static const FAMILY:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyRankRes.family","family",24 | 2,FamilyRankData);
      
      public static const PAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyRankRes.page","page",32 | 0);
       
      
      private var myFamilyName$field:String;
      
      private var myFamilyRank$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var family:Array;
      
      public var page:uint;
      
      public function FamilyRankRes()
      {
         family = [];
         super();
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
      
      public function clearMyFamilyRank() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         myFamilyRank$field = new uint();
      }
      
      public function get hasMyFamilyRank() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set myFamilyRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         myFamilyRank$field = param1;
      }
      
      public function get myFamilyRank() : uint
      {
         return myFamilyRank$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasMyFamilyName)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_STRING(param1,myFamilyName$field);
         }
         if(hasMyFamilyRank)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,myFamilyRank$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.family.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.family[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.page);
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyRankRes.myFamilyName cannot be set twice.");
                  }
                  _loc6_++;
                  this.myFamilyName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyRankRes.myFamilyRank cannot be set twice.");
                  }
                  _loc3_++;
                  this.myFamilyRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  this.family.push(ReadUtils.read$TYPE_MESSAGE(param1,new FamilyRankData()));
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyRankRes.page cannot be set twice.");
                  }
                  _loc4_++;
                  this.page = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
