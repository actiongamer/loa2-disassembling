package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyExpeLastChampionRes extends Message
   {
      
      public static const DISTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeLastChampionRes.distId","distId",8 | 0);
      
      public static const OPNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeLastChampionRes.opName","opName",16 | 2);
      
      public static const FAMILYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeLastChampionRes.familyName","familyName",24 | 2);
      
      public static const DISTNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeLastChampionRes.distName","distName",32 | 2);
      
      public static const MYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeLastChampionRes.myRank","myRank",40 | 0);
      
      public static const MYFAMILYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeLastChampionRes.myFamilyRank","myFamilyRank",48 | 0);
      
      public static const REPUTATIONS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeLastChampionRes.reputations","reputations",56 | 0);
      
      public static const WINTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeLastChampionRes.winTimes","winTimes",64 | 0);
      
      public static const MYCON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeLastChampionRes.myCon","myCon",72 | 0);
      
      public static const MYRANKINFAMILY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeLastChampionRes.myRankInFamily","myRankInFamily",80 | 0);
       
      
      private var distId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var opName$field:String;
      
      private var familyName$field:String;
      
      private var distName$field:String;
      
      private var myRank$field:uint;
      
      private var myFamilyRank$field:uint;
      
      private var reputations$field:uint;
      
      private var winTimes$field:uint;
      
      private var myCon$field:uint;
      
      private var myRankInFamily$field:uint;
      
      public function FamilyExpeLastChampionRes()
      {
         super();
      }
      
      public function clearDistId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         distId$field = new uint();
      }
      
      public function get hasDistId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set distId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         distId$field = param1;
      }
      
      public function get distId() : uint
      {
         return distId$field;
      }
      
      public function clearOpName() : void
      {
         opName$field = null;
      }
      
      public function get hasOpName() : Boolean
      {
         return opName$field != null;
      }
      
      public function set opName(param1:String) : void
      {
         opName$field = param1;
      }
      
      public function get opName() : String
      {
         return opName$field;
      }
      
      public function clearFamilyName() : void
      {
         familyName$field = null;
      }
      
      public function get hasFamilyName() : Boolean
      {
         return familyName$field != null;
      }
      
      public function set familyName(param1:String) : void
      {
         familyName$field = param1;
      }
      
      public function get familyName() : String
      {
         return familyName$field;
      }
      
      public function clearDistName() : void
      {
         distName$field = null;
      }
      
      public function get hasDistName() : Boolean
      {
         return distName$field != null;
      }
      
      public function set distName(param1:String) : void
      {
         distName$field = param1;
      }
      
      public function get distName() : String
      {
         return distName$field;
      }
      
      public function clearMyRank() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         myRank$field = new uint();
      }
      
      public function get hasMyRank() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set myRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         myRank$field = param1;
      }
      
      public function get myRank() : uint
      {
         return myRank$field;
      }
      
      public function clearMyFamilyRank() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         myFamilyRank$field = new uint();
      }
      
      public function get hasMyFamilyRank() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set myFamilyRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         myFamilyRank$field = param1;
      }
      
      public function get myFamilyRank() : uint
      {
         return myFamilyRank$field;
      }
      
      public function clearReputations() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         reputations$field = new uint();
      }
      
      public function get hasReputations() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set reputations(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         reputations$field = param1;
      }
      
      public function get reputations() : uint
      {
         return reputations$field;
      }
      
      public function clearWinTimes() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         winTimes$field = new uint();
      }
      
      public function get hasWinTimes() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set winTimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         winTimes$field = param1;
      }
      
      public function get winTimes() : uint
      {
         return winTimes$field;
      }
      
      public function clearMyCon() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         myCon$field = new uint();
      }
      
      public function get hasMyCon() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set myCon(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         myCon$field = param1;
      }
      
      public function get myCon() : uint
      {
         return myCon$field;
      }
      
      public function clearMyRankInFamily() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         myRankInFamily$field = new uint();
      }
      
      public function get hasMyRankInFamily() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set myRankInFamily(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         myRankInFamily$field = param1;
      }
      
      public function get myRankInFamily() : uint
      {
         return myRankInFamily$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasDistId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,distId$field);
         }
         if(hasOpName)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,opName$field);
         }
         if(hasFamilyName)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,familyName$field);
         }
         if(hasDistName)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,distName$field);
         }
         if(hasMyRank)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,myRank$field);
         }
         if(hasMyFamilyRank)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,myFamilyRank$field);
         }
         if(hasReputations)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,reputations$field);
         }
         if(hasWinTimes)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,winTimes$field);
         }
         if(hasMyCon)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,myCon$field);
         }
         if(hasMyRankInFamily)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,myRankInFamily$field);
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
         var _loc8_:* = 0;
         var _loc9_:uint = 0;
         var _loc11_:uint = 0;
         var _loc3_:uint = 0;
         var _loc12_:uint = 0;
         var _loc6_:uint = 0;
         var _loc4_:uint = 0;
         var _loc10_:uint = 0;
         var _loc7_:uint = 0;
         var _loc13_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc8_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeLastChampionRes.distId cannot be set twice.");
                  }
                  _loc9_++;
                  this.distId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeLastChampionRes.opName cannot be set twice.");
                  }
                  _loc11_++;
                  this.opName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeLastChampionRes.familyName cannot be set twice.");
                  }
                  _loc3_++;
                  this.familyName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeLastChampionRes.distName cannot be set twice.");
                  }
                  _loc12_++;
                  this.distName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeLastChampionRes.myRank cannot be set twice.");
                  }
                  _loc6_++;
                  this.myRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeLastChampionRes.myFamilyRank cannot be set twice.");
                  }
                  _loc4_++;
                  this.myFamilyRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeLastChampionRes.reputations cannot be set twice.");
                  }
                  _loc10_++;
                  this.reputations = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeLastChampionRes.winTimes cannot be set twice.");
                  }
                  _loc7_++;
                  this.winTimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeLastChampionRes.myCon cannot be set twice.");
                  }
                  _loc13_++;
                  this.myCon = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeLastChampionRes.myRankInFamily cannot be set twice.");
                  }
                  _loc5_++;
                  this.myRankInFamily = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
