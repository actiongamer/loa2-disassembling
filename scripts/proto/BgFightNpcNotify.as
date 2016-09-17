package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgFightNpcNotify extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.BgFightNpcNotify.id","id",8 | 0);
      
      public static const NPCRESID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgFightNpcNotify.npcResId","npcResId",16 | 0);
      
      public static const ISWIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.BgFightNpcNotify.isWin","isWin",24 | 0);
      
      public static const TEAMKILLNPCNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgFightNpcNotify.teamKillNpcNum","teamKillNpcNum",32 | 0);
      
      public static const TEAMSIDE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgFightNpcNotify.teamSide","teamSide",40 | 0);
      
      public static const HPPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgFightNpcNotify.hpPercent","hpPercent",48 | 0);
       
      
      public var id:UInt64;
      
      private var npcResId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var isWin$field:Boolean;
      
      private var teamKillNpcNum$field:uint;
      
      private var teamSide$field:uint;
      
      private var hpPercent$field:uint;
      
      public function BgFightNpcNotify()
      {
         super();
      }
      
      public function clearNpcResId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         npcResId$field = new uint();
      }
      
      public function get hasNpcResId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set npcResId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         npcResId$field = param1;
      }
      
      public function get npcResId() : uint
      {
         return npcResId$field;
      }
      
      public function clearIsWin() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         isWin$field = new Boolean();
      }
      
      public function get hasIsWin() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set isWin(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 2;
         isWin$field = param1;
      }
      
      public function get isWin() : Boolean
      {
         return isWin$field;
      }
      
      public function clearTeamKillNpcNum() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         teamKillNpcNum$field = new uint();
      }
      
      public function get hasTeamKillNpcNum() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set teamKillNpcNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         teamKillNpcNum$field = param1;
      }
      
      public function get teamKillNpcNum() : uint
      {
         return teamKillNpcNum$field;
      }
      
      public function clearTeamSide() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         teamSide$field = new uint();
      }
      
      public function get hasTeamSide() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set teamSide(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         teamSide$field = param1;
      }
      
      public function get teamSide() : uint
      {
         return teamSide$field;
      }
      
      public function clearHpPercent() : void
      {
         hasField$0 = hasField$0 & 4294967279;
         hpPercent$field = new uint();
      }
      
      public function get hasHpPercent() : Boolean
      {
         return (hasField$0 & 16) != 0;
      }
      
      public function set hpPercent(param1:uint) : void
      {
         hasField$0 = hasField$0 | 16;
         hpPercent$field = param1;
      }
      
      public function get hpPercent() : uint
      {
         return hpPercent$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT64(param1,this.id);
         if(hasNpcResId)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,npcResId$field);
         }
         if(hasIsWin)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_BOOL(param1,isWin$field);
         }
         if(hasTeamKillNpcNum)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,teamKillNpcNum$field);
         }
         if(hasTeamSide)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,teamSide$field);
         }
         if(hasHpPercent)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,hpPercent$field);
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
         var _loc7_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BgFightNpcNotify.id cannot be set twice.");
                  }
                  _loc7_++;
                  this.id = ReadUtils.read$TYPE_UINT64(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BgFightNpcNotify.npcResId cannot be set twice.");
                  }
                  _loc4_++;
                  this.npcResId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BgFightNpcNotify.isWin cannot be set twice.");
                  }
                  _loc3_++;
                  this.isWin = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BgFightNpcNotify.teamKillNpcNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.teamKillNpcNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: BgFightNpcNotify.teamSide cannot be set twice.");
                  }
                  _loc9_++;
                  this.teamSide = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: BgFightNpcNotify.hpPercent cannot be set twice.");
                  }
                  _loc8_++;
                  this.hpPercent = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
