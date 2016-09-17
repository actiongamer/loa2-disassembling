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
   
   public class ServerInfo extends Message
   {
      
      public static const OPENTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ServerInfo.opentime","opentime",8 | 0);
      
      public static const DIST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ServerInfo.dist","dist",16 | 0);
      
      public static const DISTNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.ServerInfo.distName","distName",24 | 2);
      
      public static const OPNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.ServerInfo.opName","opName",32 | 2);
      
      public static const OPID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.ServerInfo.opId","opId",40 | 2);
       
      
      private var opentime$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var dist$field:uint;
      
      private var distName$field:String;
      
      private var opName$field:String;
      
      private var opId$field:String;
      
      public function ServerInfo()
      {
         super();
      }
      
      public function clearOpentime() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         opentime$field = new uint();
      }
      
      public function get hasOpentime() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set opentime(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         opentime$field = param1;
      }
      
      public function get opentime() : uint
      {
         return opentime$field;
      }
      
      public function clearDist() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         dist$field = new uint();
      }
      
      public function get hasDist() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set dist(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         dist$field = param1;
      }
      
      public function get dist() : uint
      {
         return dist$field;
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
      
      public function clearOpId() : void
      {
         opId$field = null;
      }
      
      public function get hasOpId() : Boolean
      {
         return opId$field != null;
      }
      
      public function set opId(param1:String) : void
      {
         opId$field = param1;
      }
      
      public function get opId() : String
      {
         return opId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasOpentime)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,opentime$field);
         }
         if(hasDist)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,dist$field);
         }
         if(hasDistName)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,distName$field);
         }
         if(hasOpName)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,opName$field);
         }
         if(hasOpId)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,opId$field);
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
         var _loc8_:uint = 0;
         var _loc5_:uint = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: ServerInfo.opentime cannot be set twice.");
                  }
                  _loc8_++;
                  this.opentime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ServerInfo.dist cannot be set twice.");
                  }
                  _loc5_++;
                  this.dist = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: ServerInfo.distName cannot be set twice.");
                  }
                  _loc7_++;
                  this.distName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: ServerInfo.opName cannot be set twice.");
                  }
                  _loc6_++;
                  this.opName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ServerInfo.opId cannot be set twice.");
                  }
                  _loc3_++;
                  this.opId = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
