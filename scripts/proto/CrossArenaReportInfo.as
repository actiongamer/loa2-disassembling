package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CrossArenaReportInfo extends Message
   {
      
      public static const ATKNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CrossArenaReportInfo.atkName","atkName",8 | 2);
      
      public static const ATKOPNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CrossArenaReportInfo.atkOpName","atkOpName",16 | 2);
      
      public static const ATKDISTNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CrossArenaReportInfo.atkDistName","atkDistName",24 | 2);
      
      public static const ATKRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaReportInfo.atkRank","atkRank",32 | 0);
      
      public static const DEFNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CrossArenaReportInfo.defName","defName",40 | 2);
      
      public static const DEFOPNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CrossArenaReportInfo.defOpName","defOpName",48 | 2);
      
      public static const DEFDISTNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CrossArenaReportInfo.defDistName","defDistName",56 | 2);
      
      public static const DEFRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaReportInfo.defRank","defRank",64 | 0);
      
      public static const ISATKWIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.CrossArenaReportInfo.isAtkWin","isAtkWin",72 | 0);
      
      public static const ISRANKCHANGE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.CrossArenaReportInfo.isRankChange","isRankChange",80 | 0);
      
      public static const REPORTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CrossArenaReportInfo.reportId","reportId",88 | 2);
      
      public static const ATKID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.CrossArenaReportInfo.atkId","atkId",96 | 0);
      
      public static const DEFID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.CrossArenaReportInfo.defId","defId",104 | 0);
      
      public static const STAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaReportInfo.stamp","stamp",112 | 0);
      
      public static const ADDSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaReportInfo.addScore","addScore",120 | 0);
      
      public static const ATKDIST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaReportInfo.atkDist","atkDist",128 | 0);
      
      public static const DEFDIST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CrossArenaReportInfo.defDist","defDist",136 | 0);
       
      
      private var atkName$field:String;
      
      private var atkOpName$field:String;
      
      private var atkDistName$field:String;
      
      private var atkRank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var defName$field:String;
      
      private var defOpName$field:String;
      
      private var defDistName$field:String;
      
      private var defRank$field:uint;
      
      private var isAtkWin$field:Boolean;
      
      private var isRankChange$field:Boolean;
      
      private var reportId$field:String;
      
      private var atkId$field:UInt64;
      
      private var defId$field:UInt64;
      
      private var stamp$field:uint;
      
      private var addScore$field:uint;
      
      private var atkDist$field:uint;
      
      private var defDist$field:uint;
      
      public function CrossArenaReportInfo()
      {
         super();
      }
      
      public function clearAtkName() : void
      {
         atkName$field = null;
      }
      
      public function get hasAtkName() : Boolean
      {
         return atkName$field != null;
      }
      
      public function set atkName(param1:String) : void
      {
         atkName$field = param1;
      }
      
      public function get atkName() : String
      {
         return atkName$field;
      }
      
      public function clearAtkOpName() : void
      {
         atkOpName$field = null;
      }
      
      public function get hasAtkOpName() : Boolean
      {
         return atkOpName$field != null;
      }
      
      public function set atkOpName(param1:String) : void
      {
         atkOpName$field = param1;
      }
      
      public function get atkOpName() : String
      {
         return atkOpName$field;
      }
      
      public function clearAtkDistName() : void
      {
         atkDistName$field = null;
      }
      
      public function get hasAtkDistName() : Boolean
      {
         return atkDistName$field != null;
      }
      
      public function set atkDistName(param1:String) : void
      {
         atkDistName$field = param1;
      }
      
      public function get atkDistName() : String
      {
         return atkDistName$field;
      }
      
      public function clearAtkRank() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         atkRank$field = new uint();
      }
      
      public function get hasAtkRank() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set atkRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         atkRank$field = param1;
      }
      
      public function get atkRank() : uint
      {
         return atkRank$field;
      }
      
      public function clearDefName() : void
      {
         defName$field = null;
      }
      
      public function get hasDefName() : Boolean
      {
         return defName$field != null;
      }
      
      public function set defName(param1:String) : void
      {
         defName$field = param1;
      }
      
      public function get defName() : String
      {
         return defName$field;
      }
      
      public function clearDefOpName() : void
      {
         defOpName$field = null;
      }
      
      public function get hasDefOpName() : Boolean
      {
         return defOpName$field != null;
      }
      
      public function set defOpName(param1:String) : void
      {
         defOpName$field = param1;
      }
      
      public function get defOpName() : String
      {
         return defOpName$field;
      }
      
      public function clearDefDistName() : void
      {
         defDistName$field = null;
      }
      
      public function get hasDefDistName() : Boolean
      {
         return defDistName$field != null;
      }
      
      public function set defDistName(param1:String) : void
      {
         defDistName$field = param1;
      }
      
      public function get defDistName() : String
      {
         return defDistName$field;
      }
      
      public function clearDefRank() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         defRank$field = new uint();
      }
      
      public function get hasDefRank() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set defRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         defRank$field = param1;
      }
      
      public function get defRank() : uint
      {
         return defRank$field;
      }
      
      public function clearIsAtkWin() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         isAtkWin$field = new Boolean();
      }
      
      public function get hasIsAtkWin() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set isAtkWin(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 4;
         isAtkWin$field = param1;
      }
      
      public function get isAtkWin() : Boolean
      {
         return isAtkWin$field;
      }
      
      public function clearIsRankChange() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         isRankChange$field = new Boolean();
      }
      
      public function get hasIsRankChange() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set isRankChange(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 8;
         isRankChange$field = param1;
      }
      
      public function get isRankChange() : Boolean
      {
         return isRankChange$field;
      }
      
      public function clearReportId() : void
      {
         reportId$field = null;
      }
      
      public function get hasReportId() : Boolean
      {
         return reportId$field != null;
      }
      
      public function set reportId(param1:String) : void
      {
         reportId$field = param1;
      }
      
      public function get reportId() : String
      {
         return reportId$field;
      }
      
      public function clearAtkId() : void
      {
         atkId$field = null;
      }
      
      public function get hasAtkId() : Boolean
      {
         return atkId$field != null;
      }
      
      public function set atkId(param1:UInt64) : void
      {
         atkId$field = param1;
      }
      
      public function get atkId() : UInt64
      {
         return atkId$field;
      }
      
      public function clearDefId() : void
      {
         defId$field = null;
      }
      
      public function get hasDefId() : Boolean
      {
         return defId$field != null;
      }
      
      public function set defId(param1:UInt64) : void
      {
         defId$field = param1;
      }
      
      public function get defId() : UInt64
      {
         return defId$field;
      }
      
      public function clearStamp() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         stamp$field = new uint();
      }
      
      public function get hasStamp() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set stamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         stamp$field = param1;
      }
      
      public function get stamp() : uint
      {
         return stamp$field;
      }
      
      public function clearAddScore() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         addScore$field = new uint();
      }
      
      public function get hasAddScore() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set addScore(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         addScore$field = param1;
      }
      
      public function get addScore() : uint
      {
         return addScore$field;
      }
      
      public function clearAtkDist() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         atkDist$field = new uint();
      }
      
      public function get hasAtkDist() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set atkDist(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         atkDist$field = param1;
      }
      
      public function get atkDist() : uint
      {
         return atkDist$field;
      }
      
      public function clearDefDist() : void
      {
         hasField$0 = hasField$0 & 4294967167;
         defDist$field = new uint();
      }
      
      public function get hasDefDist() : Boolean
      {
         return (hasField$0 & 128) != 0;
      }
      
      public function set defDist(param1:uint) : void
      {
         hasField$0 = hasField$0 | 128;
         defDist$field = param1;
      }
      
      public function get defDist() : uint
      {
         return defDist$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasAtkName)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_STRING(param1,atkName$field);
         }
         if(hasAtkOpName)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,atkOpName$field);
         }
         if(hasAtkDistName)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,atkDistName$field);
         }
         if(hasAtkRank)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,atkRank$field);
         }
         if(hasDefName)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,defName$field);
         }
         if(hasDefOpName)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,defOpName$field);
         }
         if(hasDefDistName)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_STRING(param1,defDistName$field);
         }
         if(hasDefRank)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,defRank$field);
         }
         if(hasIsAtkWin)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_BOOL(param1,isAtkWin$field);
         }
         if(hasIsRankChange)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_BOOL(param1,isRankChange$field);
         }
         if(hasReportId)
         {
            WriteUtils.writeTag(param1,2,11);
            WriteUtils.write$TYPE_STRING(param1,reportId$field);
         }
         if(hasAtkId)
         {
            WriteUtils.writeTag(param1,0,12);
            WriteUtils.write$TYPE_UINT64(param1,atkId$field);
         }
         if(hasDefId)
         {
            WriteUtils.writeTag(param1,0,13);
            WriteUtils.write$TYPE_UINT64(param1,defId$field);
         }
         if(hasStamp)
         {
            WriteUtils.writeTag(param1,0,14);
            WriteUtils.write$TYPE_UINT32(param1,stamp$field);
         }
         if(hasAddScore)
         {
            WriteUtils.writeTag(param1,0,15);
            WriteUtils.write$TYPE_UINT32(param1,addScore$field);
         }
         if(hasAtkDist)
         {
            WriteUtils.writeTag(param1,0,16);
            WriteUtils.write$TYPE_UINT32(param1,atkDist$field);
         }
         if(hasDefDist)
         {
            WriteUtils.writeTag(param1,0,17);
            WriteUtils.write$TYPE_UINT32(param1,defDist$field);
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
         var _loc20_:uint = 0;
         var _loc9_:uint = 0;
         var _loc12_:uint = 0;
         var _loc17_:uint = 0;
         var _loc13_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc10_:uint = 0;
         var _loc16_:uint = 0;
         var _loc19_:uint = 0;
         var _loc14_:uint = 0;
         var _loc3_:uint = 0;
         var _loc15_:uint = 0;
         var _loc18_:uint = 0;
         var _loc11_:uint = 0;
         var _loc8_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc20_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.atkName cannot be set twice.");
                  }
                  _loc20_++;
                  this.atkName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.atkOpName cannot be set twice.");
                  }
                  _loc9_++;
                  this.atkOpName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.atkDistName cannot be set twice.");
                  }
                  _loc12_++;
                  this.atkDistName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.atkRank cannot be set twice.");
                  }
                  _loc17_++;
                  this.atkRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.defName cannot be set twice.");
                  }
                  _loc13_++;
                  this.defName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.defOpName cannot be set twice.");
                  }
                  _loc5_++;
                  this.defOpName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.defDistName cannot be set twice.");
                  }
                  _loc6_++;
                  this.defDistName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 7:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.defRank cannot be set twice.");
                  }
                  _loc10_++;
                  this.defRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.isAtkWin cannot be set twice.");
                  }
                  _loc16_++;
                  this.isAtkWin = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 9:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.isRankChange cannot be set twice.");
                  }
                  _loc19_++;
                  this.isRankChange = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 10:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.reportId cannot be set twice.");
                  }
                  _loc14_++;
                  this.reportId = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 11:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.atkId cannot be set twice.");
                  }
                  _loc3_++;
                  this.atkId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 12:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.defId cannot be set twice.");
                  }
                  _loc15_++;
                  this.defId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 13:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.stamp cannot be set twice.");
                  }
                  _loc18_++;
                  this.stamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 14:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.addScore cannot be set twice.");
                  }
                  _loc11_++;
                  this.addScore = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 15:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.atkDist cannot be set twice.");
                  }
                  _loc8_++;
                  this.atkDist = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 16:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CrossArenaReportInfo.defDist cannot be set twice.");
                  }
                  _loc4_++;
                  this.defDist = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
