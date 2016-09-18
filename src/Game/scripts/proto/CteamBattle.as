package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CteamBattle extends Message
   {
      
      public static const WINNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CteamBattle.winName","winName",8 | 2);
      
      public static const WINID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.CteamBattle.winId","winId",16 | 0);
      
      public static const LOSENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CteamBattle.loseName","loseName",24 | 2);
      
      public static const LOSEID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.CteamBattle.loseId","loseId",32 | 0);
      
      public static const BATTLEID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CteamBattle.battleId","battleId",40 | 2);
      
      public static const POS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CteamBattle.pos","pos",48 | 0);
       
      
      public var winName:String;
      
      public var winId:UInt64;
      
      public var loseName:String;
      
      public var loseId:UInt64;
      
      public var battleId:String;
      
      private var pos$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function CteamBattle()
      {
         super();
      }
      
      public function clearPos() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         pos$field = new uint();
      }
      
      public function get hasPos() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set pos(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         pos$field = param1;
      }
      
      public function get pos() : uint
      {
         return pos$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_STRING(param1,this.winName);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT64(param1,this.winId);
         WriteUtils.writeTag(param1,2,3);
         WriteUtils.write$TYPE_STRING(param1,this.loseName);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT64(param1,this.loseId);
         WriteUtils.writeTag(param1,2,5);
         WriteUtils.write$TYPE_STRING(param1,this.battleId);
         if(hasPos)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,pos$field);
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
         var _loc9_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc8_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: CteamBattle.winName cannot be set twice.");
                  }
                  _loc9_++;
                  this.winName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CteamBattle.winId cannot be set twice.");
                  }
                  _loc4_++;
                  this.winId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CteamBattle.loseName cannot be set twice.");
                  }
                  _loc5_++;
                  this.loseName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: CteamBattle.loseId cannot be set twice.");
                  }
                  _loc8_++;
                  this.loseId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: CteamBattle.battleId cannot be set twice.");
                  }
                  _loc7_++;
                  this.battleId = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CteamBattle.pos cannot be set twice.");
                  }
                  _loc3_++;
                  this.pos = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
