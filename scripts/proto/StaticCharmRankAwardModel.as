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
   
   public class StaticCharmRankAwardModel extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticCharmRankAwardModel.id","id",8 | 0);
      
      public static const RANK:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticCharmRankAwardModel.rank","rank",16 | 2);
      
      public static const JIBENJIANGLI:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticCharmRankAwardModel.jibenjiangli","jibenjiangli",24 | 2);
      
      public static const CHAOJIJIANGLI:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticCharmRankAwardModel.chaojijiangli","chaojijiangli",32 | 2);
      
      public static const TITLEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticCharmRankAwardModel.titleId","titleId",40 | 0);
      
      public static const TITLENAME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticCharmRankAwardModel.titleName","titleName",48 | 0);
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticCharmRankAwardModel.version","version",56 | 0);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var rank$field:String;
      
      private var jibenjiangli$field:String;
      
      private var chaojijiangli$field:String;
      
      private var titleId$field:uint;
      
      private var titleName$field:uint;
      
      private var version$field:uint;
      
      public function StaticCharmRankAwardModel()
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
      
      public function clearRank() : void
      {
         rank$field = null;
      }
      
      public function get hasRank() : Boolean
      {
         return rank$field != null;
      }
      
      public function set rank(param1:String) : void
      {
         rank$field = param1;
      }
      
      public function get rank() : String
      {
         return rank$field;
      }
      
      public function clearJibenjiangli() : void
      {
         jibenjiangli$field = null;
      }
      
      public function get hasJibenjiangli() : Boolean
      {
         return jibenjiangli$field != null;
      }
      
      public function set jibenjiangli(param1:String) : void
      {
         jibenjiangli$field = param1;
      }
      
      public function get jibenjiangli() : String
      {
         return jibenjiangli$field;
      }
      
      public function clearChaojijiangli() : void
      {
         chaojijiangli$field = null;
      }
      
      public function get hasChaojijiangli() : Boolean
      {
         return chaojijiangli$field != null;
      }
      
      public function set chaojijiangli(param1:String) : void
      {
         chaojijiangli$field = param1;
      }
      
      public function get chaojijiangli() : String
      {
         return chaojijiangli$field;
      }
      
      public function clearTitleId() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         titleId$field = new uint();
      }
      
      public function get hasTitleId() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set titleId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         titleId$field = param1;
      }
      
      public function get titleId() : uint
      {
         return titleId$field;
      }
      
      public function clearTitleName() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         titleName$field = new uint();
      }
      
      public function get hasTitleName() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set titleName(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         titleName$field = param1;
      }
      
      public function get titleName() : uint
      {
         return titleName$field;
      }
      
      public function clearVersion() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         version$field = new uint();
      }
      
      public function get hasVersion() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set version(param1:uint) : void
      {
         hasField$0 = hasField$0 | 8;
         version$field = param1;
      }
      
      public function get version() : uint
      {
         return version$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasRank)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,rank$field);
         }
         if(hasJibenjiangli)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,jibenjiangli$field);
         }
         if(hasChaojijiangli)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,chaojijiangli$field);
         }
         if(hasTitleId)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,titleId$field);
         }
         if(hasTitleName)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,titleName$field);
         }
         if(hasVersion)
         {
            WriteUtils.writeTag(param1,0,7);
            WriteUtils.write$TYPE_UINT32(param1,version$field);
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
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc10_:uint = 0;
         var _loc4_:uint = 0;
         var _loc9_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankAwardModel.id cannot be set twice.");
                  }
                  _loc8_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankAwardModel.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankAwardModel.jibenjiangli cannot be set twice.");
                  }
                  _loc6_++;
                  this.jibenjiangli = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankAwardModel.chaojijiangli cannot be set twice.");
                  }
                  _loc10_++;
                  this.chaojijiangli = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankAwardModel.titleId cannot be set twice.");
                  }
                  _loc4_++;
                  this.titleId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankAwardModel.titleName cannot be set twice.");
                  }
                  _loc9_++;
                  this.titleName = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankAwardModel.version cannot be set twice.");
                  }
                  _loc7_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
