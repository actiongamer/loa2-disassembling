package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyExpeBattleReportInfo extends Message
   {
      
      public static const ATKNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeBattleReportInfo.atkName","atkName",8 | 2);
      
      public static const DEFNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeBattleReportInfo.defName","defName",16 | 2);
      
      public static const DEFOPNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeBattleReportInfo.defOpName","defOpName",24 | 2);
      
      public static const DEFDISTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeBattleReportInfo.defDistId","defDistId",40 | 0);
      
      public static const COIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeBattleReportInfo.coin","coin",48 | 0);
      
      public static const CON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeBattleReportInfo.con","con",56 | 0);
      
      public static const ISATKWIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FamilyExpeBattleReportInfo.isAtkWin","isAtkWin",72 | 0);
      
      public static const STAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeBattleReportInfo.stamp","stamp",80 | 0);
      
      public static const REPORTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeBattleReportInfo.reportId","reportId",88 | 2);
      
      public static const DAMAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeBattleReportInfo.damage","damage",96 | 0);
       
      
      public var atkName:String;
      
      private var defName$field:String;
      
      private var defOpName$field:String;
      
      private var defDistId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var coin:uint;
      
      public var con:uint;
      
      private var isAtkWin$field:Boolean;
      
      private var stamp$field:uint;
      
      private var reportId$field:String;
      
      public var damage:uint;
      
      public function FamilyExpeBattleReportInfo()
      {
         super();
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
      
      public function clearDefDistId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         defDistId$field = new uint();
      }
      
      public function get hasDefDistId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set defDistId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         defDistId$field = param1;
      }
      
      public function get defDistId() : uint
      {
         return defDistId$field;
      }
      
      public function clearIsAtkWin() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         isAtkWin$field = new Boolean();
      }
      
      public function get hasIsAtkWin() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set isAtkWin(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 2;
         isAtkWin$field = param1;
      }
      
      public function get isAtkWin() : Boolean
      {
         return isAtkWin$field;
      }
      
      public function clearStamp() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         stamp$field = new uint();
      }
      
      public function get hasStamp() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set stamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         stamp$field = param1;
      }
      
      public function get stamp() : uint
      {
         return stamp$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_STRING(param1,this.atkName);
         if(hasDefName)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,defName$field);
         }
         if(hasDefOpName)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,defOpName$field);
         }
         if(hasDefDistId)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,defDistId$field);
         }
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_UINT32(param1,this.coin);
         WriteUtils.writeTag(param1,0,7);
         WriteUtils.write$TYPE_UINT32(param1,this.con);
         if(hasIsAtkWin)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_BOOL(param1,isAtkWin$field);
         }
         if(hasStamp)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,stamp$field);
         }
         if(hasReportId)
         {
            WriteUtils.writeTag(param1,2,11);
            WriteUtils.write$TYPE_STRING(param1,reportId$field);
         }
         WriteUtils.writeTag(param1,0,12);
         WriteUtils.write$TYPE_UINT32(param1,this.damage);
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
         var _loc13_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc11_:uint = 0;
         var _loc9_:uint = 0;
         var _loc12_:uint = 0;
         var _loc8_:uint = 0;
         var _loc10_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleReportInfo.atkName cannot be set twice.");
                  }
                  _loc13_++;
                  this.atkName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleReportInfo.defName cannot be set twice.");
                  }
                  _loc7_++;
                  this.defName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleReportInfo.defOpName cannot be set twice.");
                  }
                  _loc3_++;
                  this.defOpName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               default:
                  super.readUnknown(param1,_loc6_);
                  continue;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleReportInfo.defDistId cannot be set twice.");
                  }
                  _loc4_++;
                  this.defDistId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleReportInfo.coin cannot be set twice.");
                  }
                  _loc5_++;
                  this.coin = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
               default:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleReportInfo.con cannot be set twice.");
                  }
                  _loc11_++;
                  this.con = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleReportInfo.isAtkWin cannot be set twice.");
                  }
                  _loc9_++;
                  this.isAtkWin = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 9:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleReportInfo.stamp cannot be set twice.");
                  }
                  _loc12_++;
                  this.stamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 10:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleReportInfo.reportId cannot be set twice.");
                  }
                  _loc8_++;
                  this.reportId = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 11:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleReportInfo.damage cannot be set twice.");
                  }
                  _loc10_++;
                  this.damage = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
