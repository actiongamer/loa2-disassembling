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
   
   public class FamilyExpeBattleResult extends Message
   {
      
      public static const DISTNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeBattleResult.distName","distName",8 | 2);
      
      public static const OPNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeBattleResult.opName","opName",16 | 2);
      
      public static const LV:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeBattleResult.lv","lv",24 | 0);
      
      public static const RESULT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FamilyExpeBattleResult.result","result",32 | 0);
      
      public static const CON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeBattleResult.con","con",40 | 0);
      
      public static const FLAGICON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeBattleResult.flagIcon","flagIcon",48 | 0);
      
      public static const FAMILYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyExpeBattleResult.familyName","familyName",56 | 2);
      
      public static const FLAGBASE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeBattleResult.flagBase","flagBase",64 | 0);
      
      public static const DISTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeBattleResult.distId","distId",72 | 0);
      
      public static const STAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyExpeBattleResult.stamp","stamp",80 | 0);
       
      
      private var distName$field:String;
      
      private var opName$field:String;
      
      private var lv$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var result$field:Boolean;
      
      private var con$field:uint;
      
      private var flagIcon$field:uint;
      
      private var familyName$field:String;
      
      private var flagBase$field:uint;
      
      private var distId$field:uint;
      
      private var stamp$field:uint;
      
      public function FamilyExpeBattleResult()
      {
         super();
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
      
      public function clearLv() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         lv$field = new uint();
      }
      
      public function get hasLv() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set lv(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         lv$field = param1;
      }
      
      public function get lv() : uint
      {
         return lv$field;
      }
      
      public function clearResult() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         result$field = new Boolean();
      }
      
      public function get hasResult() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set result(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 2;
         result$field = param1;
      }
      
      public function get result() : Boolean
      {
         return result$field;
      }
      
      public function clearCon() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         con$field = new uint();
      }
      
      public function get hasCon() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set con(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         con$field = param1;
      }
      
      public function get con() : uint
      {
         return con$field;
      }
      
      public function clearFlagIcon() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         flagIcon$field = new uint();
      }
      
      public function get hasFlagIcon() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set flagIcon(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         flagIcon$field = param1;
      }
      
      public function get flagIcon() : uint
      {
         return flagIcon$field;
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
      
      public function clearFlagBase() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         flagBase$field = new uint();
      }
      
      public function get hasFlagBase() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set flagBase(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         flagBase$field = param1;
      }
      
      public function get flagBase() : uint
      {
         return flagBase$field;
      }
      
      public function clearDistId() : void
      {
         hasField$0 = hasField$0 & 4294967263;
         distId$field = new uint();
      }
      
      public function get hasDistId() : Boolean
      {
         return (hasField$0 & 32) != 0;
      }
      
      public function set distId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 32;
         distId$field = param1;
      }
      
      public function get distId() : uint
      {
         return distId$field;
      }
      
      public function clearStamp() : void
      {
         hasField$0 = hasField$0 & 4294967231;
         stamp$field = new uint();
      }
      
      public function get hasStamp() : Boolean
      {
         return (hasField$0 & 64) != 0;
      }
      
      public function set stamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 64;
         stamp$field = param1;
      }
      
      public function get stamp() : uint
      {
         return stamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasDistName)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_STRING(param1,distName$field);
         }
         if(hasOpName)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,opName$field);
         }
         if(hasLv)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,lv$field);
         }
         if(hasResult)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_BOOL(param1,result$field);
         }
         if(hasCon)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,con$field);
         }
         if(hasFlagIcon)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,flagIcon$field);
         }
         if(hasFamilyName)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_STRING(param1,familyName$field);
         }
         if(hasFlagBase)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,flagBase$field);
         }
         if(hasDistId)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,distId$field);
         }
         if(hasStamp)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,stamp$field);
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
         var _loc13_:uint = 0;
         var _loc11_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc12_:uint = 0;
         var _loc6_:uint = 0;
         var _loc10_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleResult.distName cannot be set twice.");
                  }
                  _loc13_++;
                  this.distName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleResult.opName cannot be set twice.");
                  }
                  _loc11_++;
                  this.opName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleResult.lv cannot be set twice.");
                  }
                  _loc7_++;
                  this.lv = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleResult.result cannot be set twice.");
                  }
                  _loc8_++;
                  this.result = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 4:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleResult.con cannot be set twice.");
                  }
                  _loc9_++;
                  this.con = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleResult.flagIcon cannot be set twice.");
                  }
                  _loc4_++;
                  this.flagIcon = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleResult.familyName cannot be set twice.");
                  }
                  _loc3_++;
                  this.familyName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 7:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleResult.flagBase cannot be set twice.");
                  }
                  _loc12_++;
                  this.flagBase = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 8:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleResult.distId cannot be set twice.");
                  }
                  _loc6_++;
                  this.distId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeBattleResult.stamp cannot be set twice.");
                  }
                  _loc10_++;
                  this.stamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
