package proto.MineLogRes
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import proto.PlayerBaseInfo;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class log extends Message
   {
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineLogRes.log.time","time",8 | 0);
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineLogRes.log.kind","kind",16 | 0);
      
      public static const ATTACKER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.MineLogRes.log.attacker","attacker",24 | 2,PlayerBaseInfo);
      
      public static const LOST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineLogRes.log.lost","lost",32 | 0);
      
      public static const REPORTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.MineLogRes.log.reportId","reportId",40 | 2);
      
      public static const RES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineLogRes.log.res","res",48 | 0);
       
      
      private var time$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var kind$field:uint;
      
      private var attacker$field:PlayerBaseInfo;
      
      private var lost$field:uint;
      
      private var reportId$field:String;
      
      private var res$field:uint;
      
      public function log()
      {
         super();
      }
      
      public function clearTime() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         time$field = new uint();
      }
      
      public function get hasTime() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set time(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         time$field = param1;
      }
      
      public function get time() : uint
      {
         return time$field;
      }
      
      public function clearKind() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         kind$field = new uint();
      }
      
      public function get hasKind() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set kind(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         kind$field = param1;
      }
      
      public function get kind() : uint
      {
         return kind$field;
      }
      
      public function clearAttacker() : void
      {
         attacker$field = null;
      }
      
      public function get hasAttacker() : Boolean
      {
         return attacker$field != null;
      }
      
      public function set attacker(param1:PlayerBaseInfo) : void
      {
         attacker$field = param1;
      }
      
      public function get attacker() : PlayerBaseInfo
      {
         return attacker$field;
      }
      
      public function clearLost() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         lost$field = new uint();
      }
      
      public function get hasLost() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set lost(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         lost$field = param1;
      }
      
      public function get lost() : uint
      {
         return lost$field;
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
      
      public function clearRes() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         res$field = new uint();
      }
      
      public function get hasRes() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set res(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         res$field = param1;
      }
      
      public function get res() : uint
      {
         return res$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasTime)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,time$field);
         }
         if(hasKind)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,kind$field);
         }
         if(hasAttacker)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,attacker$field);
         }
         if(hasLost)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,lost$field);
         }
         if(hasReportId)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_STRING(param1,reportId$field);
         }
         if(hasRes)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,res$field);
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
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc8_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: log.time cannot be set twice.");
                  }
                  _loc4_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: log.kind cannot be set twice.");
                  }
                  _loc6_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: log.attacker cannot be set twice.");
                  }
                  _loc8_++;
                  this.attacker = new PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.attacker);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: log.lost cannot be set twice.");
                  }
                  _loc5_++;
                  this.lost = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: log.reportId cannot be set twice.");
                  }
                  _loc3_++;
                  this.reportId = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: log.res cannot be set twice.");
                  }
                  _loc9_++;
                  this.res = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
