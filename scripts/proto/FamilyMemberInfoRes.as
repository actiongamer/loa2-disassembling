package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyMemberInfoRes extends Message
   {
      
      public static const POST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyMemberInfoRes.post","post",8 | 0);
      
      public static const HIGHPOST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyMemberInfoRes.highPost","highPost",16 | 0);
      
      public static const CON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyMemberInfoRes.con","con",24 | 0);
      
      public static const CD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyMemberInfoRes.cd","cd",32 | 0);
      
      public static const FAMILYID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.FamilyMemberInfoRes.familyId","familyId",40 | 0);
      
      public static const FAMILYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyMemberInfoRes.familyName","familyName",48 | 2);
      
      public static const DONATE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FamilyMemberInfoRes.donate","donate",56 | 0);
      
      public static const QIANDAO:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.FamilyMemberInfoRes.qianDao","qianDao",64 | 0);
      
      public static const DONATEREWARD:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.FamilyMemberInfoRes.donateReward","donateReward",72 | 0);
      
      public static const TOKEN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyMemberInfoRes.token","token",80 | 0);
       
      
      public var post:uint;
      
      public var highPost:uint;
      
      public var con:uint;
      
      public var cd:uint;
      
      private var familyId$field:UInt64;
      
      private var familyName$field:String;
      
      private var donate$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var qianDao$field:Boolean;
      
      public var donateReward:Array;
      
      private var token$field:uint;
      
      public function FamilyMemberInfoRes()
      {
         donateReward = [];
         super();
      }
      
      public function clearFamilyId() : void
      {
         familyId$field = null;
      }
      
      public function get hasFamilyId() : Boolean
      {
         return familyId$field != null;
      }
      
      public function set familyId(param1:UInt64) : void
      {
         familyId$field = param1;
      }
      
      public function get familyId() : UInt64
      {
         return familyId$field;
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
      
      public function clearDonate() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         donate$field = new Boolean();
      }
      
      public function get hasDonate() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set donate(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         donate$field = param1;
      }
      
      public function get donate() : Boolean
      {
         return donate$field;
      }
      
      public function clearQianDao() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         qianDao$field = new Boolean();
      }
      
      public function get hasQianDao() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set qianDao(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 2;
         qianDao$field = param1;
      }
      
      public function get qianDao() : Boolean
      {
         return qianDao$field;
      }
      
      public function clearToken() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         token$field = new uint();
      }
      
      public function get hasToken() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set token(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         token$field = param1;
      }
      
      public function get token() : uint
      {
         return token$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.post);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.highPost);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.con);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.cd);
         if(hasFamilyId)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT64(param1,familyId$field);
         }
         if(hasFamilyName)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,familyName$field);
         }
         if(hasDonate)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_BOOL(param1,donate$field);
         }
         if(hasQianDao)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_BOOL(param1,qianDao$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.donateReward.length)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,this.donateReward[_loc2_]);
            _loc2_++;
         }
         if(hasToken)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT32(param1,token$field);
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
         var _loc6_:* = 0;
         var _loc4_:uint = 0;
         var _loc12_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc10_:uint = 0;
         var _loc5_:uint = 0;
         var _loc11_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMemberInfoRes.post cannot be set twice.");
                  }
                  _loc4_++;
                  this.post = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMemberInfoRes.highPost cannot be set twice.");
                  }
                  _loc12_++;
                  this.highPost = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMemberInfoRes.con cannot be set twice.");
                  }
                  _loc8_++;
                  this.con = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMemberInfoRes.cd cannot be set twice.");
                  }
                  _loc9_++;
                  this.cd = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMemberInfoRes.familyId cannot be set twice.");
                  }
                  _loc7_++;
                  this.familyId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMemberInfoRes.familyName cannot be set twice.");
                  }
                  _loc3_++;
                  this.familyName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMemberInfoRes.donate cannot be set twice.");
                  }
                  _loc10_++;
                  this.donate = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 7:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMemberInfoRes.qianDao cannot be set twice.");
                  }
                  _loc5_++;
                  this.qianDao = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 8:
                  if((_loc6_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.donateReward);
                  }
                  else
                  {
                     this.donateReward.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyMemberInfoRes.token cannot be set twice.");
                  }
                  _loc11_++;
                  this.token = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
