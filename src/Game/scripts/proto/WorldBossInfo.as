package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class WorldBossInfo extends Message
   {
      
      public static const BOSSID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossInfo.bossid","bossid",8 | 0);
      
      public static const NPCGROUPID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossInfo.npcgroupid","npcgroupid",16 | 0);
      
      public static const HP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossInfo.hp","hp",24 | 0);
      
      public static const MAXHP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossInfo.maxhp","maxhp",32 | 0);
      
      public static const BUFFIDS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.WorldBossInfo.buffids","buffids",40 | 0);
      
      public static const RELIVETIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.WorldBossInfo.relivetimestamp","relivetimestamp",48 | 0);
       
      
      public var bossid:uint;
      
      public var npcgroupid:uint;
      
      public var hp:uint;
      
      public var maxhp:uint;
      
      public var buffids:Array;
      
      private var relivetimestamp$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function WorldBossInfo()
      {
         buffids = [];
         super();
      }
      
      public function clearRelivetimestamp() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         relivetimestamp$field = new uint();
      }
      
      public function get hasRelivetimestamp() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set relivetimestamp(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         relivetimestamp$field = param1;
      }
      
      public function get relivetimestamp() : uint
      {
         return relivetimestamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.bossid);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.npcgroupid);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.hp);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.maxhp);
         _loc2_ = uint(0);
         while(_loc2_ < this.buffids.length)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,this.buffids[_loc2_]);
            _loc2_++;
         }
         if(hasRelivetimestamp)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,relivetimestamp$field);
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
         var _loc4_:* = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfo.bossid cannot be set twice.");
                  }
                  _loc7_++;
                  this.bossid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfo.npcgroupid cannot be set twice.");
                  }
                  _loc6_++;
                  this.npcgroupid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfo.hp cannot be set twice.");
                  }
                  _loc8_++;
                  this.hp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfo.maxhp cannot be set twice.");
                  }
                  _loc3_++;
                  this.maxhp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if((_loc4_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.buffids);
                  }
                  else
                  {
                     this.buffids.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: WorldBossInfo.relivetimestamp cannot be set twice.");
                  }
                  _loc5_++;
                  this.relivetimestamp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
