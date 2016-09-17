package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CteamReport extends Message
   {
      
      public static const WINNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CteamReport.winName","winName",8 | 2);
      
      public static const WINDIST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CteamReport.winDist","winDist",16 | 0);
      
      public static const WINOP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CteamReport.winOp","winOp",24 | 2);
      
      public static const LOSENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CteamReport.loseName","loseName",32 | 2);
      
      public static const LOSEDIST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CteamReport.loseDist","loseDist",40 | 0);
      
      public static const LOSEOP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CteamReport.loseOp","loseOp",48 | 2);
      
      public static const BATTLE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.CteamReport.battle","battle",56 | 2,CteamBattle);
      
      public static const HP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.CteamReport.hp","hp",64 | 2,CteamBattleHp);
      
      public static const POS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CteamReport.pos","pos",72 | 0);
      
      public static const WINID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.CteamReport.winId","winId",80 | 0);
       
      
      public var winName:String;
      
      public var winDist:uint;
      
      public var winOp:String;
      
      public var loseName:String;
      
      public var loseDist:uint;
      
      public var loseOp:String;
      
      public var battle:Array;
      
      public var hp:Array;
      
      private var pos$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var winId$field:UInt64;
      
      public function CteamReport()
      {
         battle = [];
         hp = [];
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
      
      public function clearWinId() : void
      {
         winId$field = null;
      }
      
      public function get hasWinId() : Boolean
      {
         return winId$field != null;
      }
      
      public function set winId(param1:UInt64) : void
      {
         winId$field = param1;
      }
      
      public function get winId() : UInt64
      {
         return winId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_STRING(param1,this.winName);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.winDist);
         WriteUtils.writeTag(param1,2,3);
         WriteUtils.write$TYPE_STRING(param1,this.winOp);
         WriteUtils.writeTag(param1,2,4);
         WriteUtils.write$TYPE_STRING(param1,this.loseName);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.loseDist);
         WriteUtils.writeTag(param1,2,6);
         WriteUtils.write$TYPE_STRING(param1,this.loseOp);
         _loc3_ = uint(0);
         while(_loc3_ < this.battle.length)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.battle[_loc3_]);
            _loc3_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.hp.length)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.hp[_loc2_]);
            _loc2_++;
         }
         if(hasPos)
         {
            WriteUtils.writeTag(param1,0,9);
            WriteUtils.write$TYPE_UINT32(param1,pos$field);
         }
         if(hasWinId)
         {
            WriteUtils.writeTag(param1,0,10);
            WriteUtils.write$TYPE_UINT64(param1,winId$field);
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:* = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc9_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc8_ >> 3) - 1)
            {
               case 0:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: CteamReport.winName cannot be set twice.");
                  }
                  _loc10_++;
                  this.winName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: CteamReport.winDist cannot be set twice.");
                  }
                  _loc11_++;
                  this.winDist = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CteamReport.winOp cannot be set twice.");
                  }
                  _loc4_++;
                  this.winOp = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: CteamReport.loseName cannot be set twice.");
                  }
                  _loc7_++;
                  this.loseName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CteamReport.loseDist cannot be set twice.");
                  }
                  _loc3_++;
                  this.loseDist = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: CteamReport.loseOp cannot be set twice.");
                  }
                  _loc9_++;
                  this.loseOp = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  this.battle.push(ReadUtils.read$TYPE_MESSAGE(param1,new CteamBattle()));
                  continue;
               case 7:
                  this.hp.push(ReadUtils.read$TYPE_MESSAGE(param1,new CteamBattleHp()));
                  continue;
               case 8:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CteamReport.pos cannot be set twice.");
                  }
                  _loc5_++;
                  this.pos = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 9:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CteamReport.winId cannot be set twice.");
                  }
                  _loc6_++;
                  this.winId = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
            }
         }
      }
   }
}
