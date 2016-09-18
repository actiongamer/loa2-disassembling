package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ArenaPlayer extends Message
   {
      
      public static const PLAYERINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ArenaPlayer.playerInfo","playerInfo",8 | 2,proto.PlayerBaseInfo);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ArenaPlayer.rank","rank",16 | 0);
      
      public static const MANIFESTO:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.ArenaPlayer.manifesto","manifesto",24 | 2);
       
      
      private var playerInfo$field:proto.PlayerBaseInfo;
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var manifesto$field:String;
      
      public function ArenaPlayer()
      {
         super();
      }
      
      public function clearPlayerInfo() : void
      {
         playerInfo$field = null;
      }
      
      public function get hasPlayerInfo() : Boolean
      {
         return playerInfo$field != null;
      }
      
      public function set playerInfo(param1:proto.PlayerBaseInfo) : void
      {
         playerInfo$field = param1;
      }
      
      public function get playerInfo() : proto.PlayerBaseInfo
      {
         return playerInfo$field;
      }
      
      public function clearRank() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return rank$field;
      }
      
      public function clearManifesto() : void
      {
         manifesto$field = null;
      }
      
      public function get hasManifesto() : Boolean
      {
         return manifesto$field != null;
      }
      
      public function set manifesto(param1:String) : void
      {
         manifesto$field = param1;
      }
      
      public function get manifesto() : String
      {
         return manifesto$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasPlayerInfo)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,playerInfo$field);
         }
         if(hasRank)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,rank$field);
         }
         if(hasManifesto)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,manifesto$field);
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
         var _loc5_:* = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaPlayer.playerInfo cannot be set twice.");
                  }
                  _loc6_++;
                  this.playerInfo = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.playerInfo);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaPlayer.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ArenaPlayer.manifesto cannot be set twice.");
                  }
                  _loc4_++;
                  this.manifesto = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
