package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GetCommentInfoRes extends Message
   {
      
      public static const STATUS:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GetCommentInfoRes.status","status",8 | 0);
      
      public static const SERVERID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.GetCommentInfoRes.serverid","serverid",16 | 2);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.GetCommentInfoRes.rolename","rolename",24 | 2);
      
      public static const GAMEID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.GetCommentInfoRes.gameid","gameid",32 | 2);
      
      public static const DT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.GetCommentInfoRes.dt","dt",40 | 2);
      
      public static const OPID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.GetCommentInfoRes.opid","opid",48 | 2);
      
      public static const SIGN:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.GetCommentInfoRes.sign","sign",56 | 2);
       
      
      public var status:Boolean;
      
      private var serverid$field:String;
      
      private var rolename$field:String;
      
      private var gameid$field:String;
      
      private var dt$field:String;
      
      private var opid$field:String;
      
      private var sign$field:String;
      
      public function GetCommentInfoRes()
      {
         super();
      }
      
      public function clearServerid() : void
      {
         serverid$field = null;
      }
      
      public function get hasServerid() : Boolean
      {
         return serverid$field != null;
      }
      
      public function set serverid(param1:String) : void
      {
         serverid$field = param1;
      }
      
      public function get serverid() : String
      {
         return serverid$field;
      }
      
      public function clearRolename() : void
      {
         rolename$field = null;
      }
      
      public function get hasRolename() : Boolean
      {
         return rolename$field != null;
      }
      
      public function set rolename(param1:String) : void
      {
         rolename$field = param1;
      }
      
      public function get rolename() : String
      {
         return rolename$field;
      }
      
      public function clearGameid() : void
      {
         gameid$field = null;
      }
      
      public function get hasGameid() : Boolean
      {
         return gameid$field != null;
      }
      
      public function set gameid(param1:String) : void
      {
         gameid$field = param1;
      }
      
      public function get gameid() : String
      {
         return gameid$field;
      }
      
      public function clearDt() : void
      {
         dt$field = null;
      }
      
      public function get hasDt() : Boolean
      {
         return dt$field != null;
      }
      
      public function set dt(param1:String) : void
      {
         dt$field = param1;
      }
      
      public function get dt() : String
      {
         return dt$field;
      }
      
      public function clearOpid() : void
      {
         opid$field = null;
      }
      
      public function get hasOpid() : Boolean
      {
         return opid$field != null;
      }
      
      public function set opid(param1:String) : void
      {
         opid$field = param1;
      }
      
      public function get opid() : String
      {
         return opid$field;
      }
      
      public function clearSign() : void
      {
         sign$field = null;
      }
      
      public function get hasSign() : Boolean
      {
         return sign$field != null;
      }
      
      public function set sign(param1:String) : void
      {
         sign$field = param1;
      }
      
      public function get sign() : String
      {
         return sign$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_BOOL(param1,this.status);
         if(hasServerid)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,serverid$field);
         }
         if(hasRolename)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,rolename$field);
         }
         if(hasGameid)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,gameid$field);
         }
         if(hasDt)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,dt$field);
         }
         if(hasOpid)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,opid$field);
         }
         if(hasSign)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_STRING(param1,sign$field);
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
         var _loc6_:* = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc10_:uint = 0;
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: GetCommentInfoRes.status cannot be set twice.");
                  }
                  _loc5_++;
                  this.status = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GetCommentInfoRes.serverid cannot be set twice.");
                  }
                  _loc4_++;
                  this.serverid = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: GetCommentInfoRes.rolename cannot be set twice.");
                  }
                  _loc7_++;
                  this.rolename = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: GetCommentInfoRes.gameid cannot be set twice.");
                  }
                  _loc3_++;
                  this.gameid = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: GetCommentInfoRes.dt cannot be set twice.");
                  }
                  _loc10_++;
                  this.dt = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: GetCommentInfoRes.opid cannot be set twice.");
                  }
                  _loc9_++;
                  this.opid = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: GetCommentInfoRes.sign cannot be set twice.");
                  }
                  _loc8_++;
                  this.sign = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
