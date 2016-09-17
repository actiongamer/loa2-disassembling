package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TeamStartReq_Attr extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamStartReq_Attr.id","id",8 | 0);
      
      public static const INTV:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamStartReq_Attr.intv","intv",16 | 0);
      
      public static const STRV:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.TeamStartReq_Attr.strv","strv",24 | 2);
      
      public static const BOLV:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.TeamStartReq_Attr.bolv","bolv",32 | 0);
       
      
      public var id:uint;
      
      private var intv$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var strv$field:String;
      
      private var bolv$field:Boolean;
      
      public function TeamStartReq_Attr()
      {
         super();
      }
      
      public function clearIntv() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         intv$field = new uint();
      }
      
      public function get hasIntv() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set intv(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         intv$field = param1;
      }
      
      public function get intv() : uint
      {
         return intv$field;
      }
      
      public function clearStrv() : void
      {
         strv$field = null;
      }
      
      public function get hasStrv() : Boolean
      {
         return strv$field != null;
      }
      
      public function set strv(param1:String) : void
      {
         strv$field = param1;
      }
      
      public function get strv() : String
      {
         return strv$field;
      }
      
      public function clearBolv() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         bolv$field = new Boolean();
      }
      
      public function get hasBolv() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set bolv(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 2;
         bolv$field = param1;
      }
      
      public function get bolv() : Boolean
      {
         return bolv$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         if(hasIntv)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,intv$field);
         }
         if(hasStrv)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,strv$field);
         }
         if(hasBolv)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_BOOL(param1,bolv$field);
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
         var _loc4_:* = 0;
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: TeamStartReq_Attr.id cannot be set twice.");
                  }
                  _loc7_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: TeamStartReq_Attr.intv cannot be set twice.");
                  }
                  _loc5_++;
                  this.intv = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: TeamStartReq_Attr.strv cannot be set twice.");
                  }
                  _loc6_++;
                  this.strv = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: TeamStartReq_Attr.bolv cannot be set twice.");
                  }
                  _loc3_++;
                  this.bolv = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
