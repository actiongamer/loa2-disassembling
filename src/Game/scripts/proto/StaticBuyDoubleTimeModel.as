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
   
   public class StaticBuyDoubleTimeModel extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticBuyDoubleTimeModel.id","id",8 | 0);
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticBuyDoubleTimeModel.version","version",16 | 0);
      
      public static const STARTTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticBuyDoubleTimeModel.startTm","startTm",24 | 2);
      
      public static const ENDTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticBuyDoubleTimeModel.endTm","endTm",32 | 2);
      
      public static const OPENTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticBuyDoubleTimeModel.openTm","openTm",40 | 0);
      
      public static const STARTTMFORCLIENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticBuyDoubleTimeModel.startTmForClient","startTmForClient",48 | 0);
      
      public static const ENDTMFORCLIENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticBuyDoubleTimeModel.endTmForClient","endTmForClient",56 | 0);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var version$field:uint;
      
      private var startTm$field:String;
      
      private var endTm$field:String;
      
      private var openTm$field:uint;
      
      private var startTmForClient$field:uint;
      
      private var endTmForClient$field:uint;
      
      public function StaticBuyDoubleTimeModel()
      {
         super();
      }
      
      public function clearId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         id$field = param1;
      }
      
      public function get id() : uint
      {
         return id$field;
      }
      
      public function clearVersion() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         version$field = new uint();
      }
      
      public function get hasVersion() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set version(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         version$field = param1;
      }
      
      public function get version() : uint
      {
         return version$field;
      }
      
      public function clearStartTm() : void
      {
         startTm$field = null;
      }
      
      public function get hasStartTm() : Boolean
      {
         return startTm$field != null;
      }
      
      public function set startTm(param1:String) : void
      {
         startTm$field = param1;
      }
      
      public function get startTm() : String
      {
         return startTm$field;
      }
      
      public function clearEndTm() : void
      {
         endTm$field = null;
      }
      
      public function get hasEndTm() : Boolean
      {
         return endTm$field != null;
      }
      
      public function set endTm(param1:String) : void
      {
         endTm$field = param1;
      }
      
      public function get endTm() : String
      {
         return endTm$field;
      }
      
      public function clearOpenTm() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         openTm$field = new uint();
      }
      
      public function get hasOpenTm() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set openTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         openTm$field = param1;
      }
      
      public function get openTm() : uint
      {
         return openTm$field;
      }
      
      public function clearStartTmForClient() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         startTmForClient$field = new uint();
      }
      
      public function get hasStartTmForClient() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set startTmForClient(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         startTmForClient$field = param1;
      }
      
      public function get startTmForClient() : uint
      {
         return startTmForClient$field;
      }
      
      public function clearEndTmForClient() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         endTmForClient$field = new uint();
      }
      
      public function get hasEndTmForClient() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set endTmForClient(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         endTmForClient$field = param1;
      }
      
      public function get endTmForClient() : uint
      {
         return endTmForClient$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasVersion)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,version$field);
         }
         if(hasStartTm)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,startTm$field);
         }
         if(hasEndTm)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,endTm$field);
         }
         if(hasOpenTm)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,openTm$field);
         }
         if(hasStartTmForClient)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,startTmForClient$field);
         }
         if(hasEndTmForClient)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,endTmForClient$field);
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
         var _loc10_:uint = 0;
         var _loc9_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: StaticBuyDoubleTimeModel.id cannot be set twice.");
                  }
                  _loc10_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticBuyDoubleTimeModel.version cannot be set twice.");
                  }
                  _loc9_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticBuyDoubleTimeModel.startTm cannot be set twice.");
                  }
                  _loc4_++;
                  this.startTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticBuyDoubleTimeModel.endTm cannot be set twice.");
                  }
                  _loc5_++;
                  this.endTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticBuyDoubleTimeModel.openTm cannot be set twice.");
                  }
                  _loc7_++;
                  this.openTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticBuyDoubleTimeModel.startTmForClient cannot be set twice.");
                  }
                  _loc8_++;
                  this.startTmForClient = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticBuyDoubleTimeModel.endTmForClient cannot be set twice.");
                  }
                  _loc3_++;
                  this.endTmForClient = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
