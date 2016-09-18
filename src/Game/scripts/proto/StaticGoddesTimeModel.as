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
   
   public class StaticGoddesTimeModel extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticGoddesTimeModel.id","id",8 | 0);
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticGoddesTimeModel.version","version",16 | 0);
      
      public static const STARTTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticGoddesTimeModel.startTm","startTm",24 | 2);
      
      public static const ENDTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticGoddesTimeModel.endTm","endTm",32 | 2);
      
      public static const OPENTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticGoddesTimeModel.openTm","openTm",40 | 0);
      
      public static const VOTESTARTTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticGoddesTimeModel.voteStartTm","voteStartTm",48 | 2);
      
      public static const VOTEENDTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticGoddesTimeModel.voteEndTm","voteEndTm",56 | 2);
      
      public static const RESULTSTARTTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticGoddesTimeModel.resultStartTm","resultStartTm",64 | 2);
      
      public static const RESULTENDTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticGoddesTimeModel.resultEndTm","resultEndTm",72 | 2);
      
      public static const WINWORD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticGoddesTimeModel.winWord","winWord",80 | 2);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var version$field:uint;
      
      private var startTm$field:String;
      
      private var endTm$field:String;
      
      private var openTm$field:uint;
      
      private var voteStartTm$field:String;
      
      private var voteEndTm$field:String;
      
      private var resultStartTm$field:String;
      
      private var resultEndTm$field:String;
      
      private var winWord$field:String;
      
      public function StaticGoddesTimeModel()
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
      
      public function clearVoteStartTm() : void
      {
         voteStartTm$field = null;
      }
      
      public function get hasVoteStartTm() : Boolean
      {
         return voteStartTm$field != null;
      }
      
      public function set voteStartTm(param1:String) : void
      {
         voteStartTm$field = param1;
      }
      
      public function get voteStartTm() : String
      {
         return voteStartTm$field;
      }
      
      public function clearVoteEndTm() : void
      {
         voteEndTm$field = null;
      }
      
      public function get hasVoteEndTm() : Boolean
      {
         return voteEndTm$field != null;
      }
      
      public function set voteEndTm(param1:String) : void
      {
         voteEndTm$field = param1;
      }
      
      public function get voteEndTm() : String
      {
         return voteEndTm$field;
      }
      
      public function clearResultStartTm() : void
      {
         resultStartTm$field = null;
      }
      
      public function get hasResultStartTm() : Boolean
      {
         return resultStartTm$field != null;
      }
      
      public function set resultStartTm(param1:String) : void
      {
         resultStartTm$field = param1;
      }
      
      public function get resultStartTm() : String
      {
         return resultStartTm$field;
      }
      
      public function clearResultEndTm() : void
      {
         resultEndTm$field = null;
      }
      
      public function get hasResultEndTm() : Boolean
      {
         return resultEndTm$field != null;
      }
      
      public function set resultEndTm(param1:String) : void
      {
         resultEndTm$field = param1;
      }
      
      public function get resultEndTm() : String
      {
         return resultEndTm$field;
      }
      
      public function clearWinWord() : void
      {
         winWord$field = null;
      }
      
      public function get hasWinWord() : Boolean
      {
         return winWord$field != null;
      }
      
      public function set winWord(param1:String) : void
      {
         winWord$field = param1;
      }
      
      public function get winWord() : String
      {
         return winWord$field;
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
         if(hasVoteStartTm)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,voteStartTm$field);
         }
         if(hasVoteEndTm)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_STRING(param1,voteEndTm$field);
         }
         if(hasResultStartTm)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_STRING(param1,resultStartTm$field);
         }
         if(hasResultEndTm)
         {
            WriteUtils.writeTag(param1,2,9);
            WriteUtils.write$TYPE_STRING(param1,resultEndTm$field);
         }
         if(hasWinWord)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_STRING(param1,winWord$field);
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
         var _loc11_:uint = 0;
         var _loc8_:uint = 0;
         var _loc10_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc13_:uint = 0;
         var _loc12_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesTimeModel.id cannot be set twice.");
                  }
                  _loc11_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesTimeModel.version cannot be set twice.");
                  }
                  _loc8_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesTimeModel.startTm cannot be set twice.");
                  }
                  _loc10_++;
                  this.startTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesTimeModel.endTm cannot be set twice.");
                  }
                  _loc4_++;
                  this.endTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesTimeModel.openTm cannot be set twice.");
                  }
                  _loc7_++;
                  this.openTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesTimeModel.voteStartTm cannot be set twice.");
                  }
                  _loc5_++;
                  this.voteStartTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesTimeModel.voteEndTm cannot be set twice.");
                  }
                  _loc9_++;
                  this.voteEndTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 7:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesTimeModel.resultStartTm cannot be set twice.");
                  }
                  _loc3_++;
                  this.resultStartTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 8:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesTimeModel.resultEndTm cannot be set twice.");
                  }
                  _loc13_++;
                  this.resultEndTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 9:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: StaticGoddesTimeModel.winWord cannot be set twice.");
                  }
                  _loc12_++;
                  this.winWord = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
