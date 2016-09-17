package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TeamMember extends Message
   {
      
      public static const PLAYER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.TeamMember.player","player",8 | 2,proto.PlayerBaseInfo);
      
      public static const GUAJIINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.TeamMember.guajiInfo","guajiInfo",16 | 2,proto.GuajiMemberInfo);
      
      public static const BGBASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.TeamMember.bgBaseInfo","bgBaseInfo",24 | 2,proto.BgBaseInfo);
       
      
      private var player$field:proto.PlayerBaseInfo;
      
      private var guajiInfo$field:proto.GuajiMemberInfo;
      
      private var bgBaseInfo$field:proto.BgBaseInfo;
      
      public function TeamMember()
      {
         super();
      }
      
      public function clearPlayer() : void
      {
         player$field = null;
      }
      
      public function get hasPlayer() : Boolean
      {
         return player$field != null;
      }
      
      public function set player(param1:proto.PlayerBaseInfo) : void
      {
         player$field = param1;
      }
      
      public function get player() : proto.PlayerBaseInfo
      {
         return player$field;
      }
      
      public function clearGuajiInfo() : void
      {
         guajiInfo$field = null;
      }
      
      public function get hasGuajiInfo() : Boolean
      {
         return guajiInfo$field != null;
      }
      
      public function set guajiInfo(param1:proto.GuajiMemberInfo) : void
      {
         guajiInfo$field = param1;
      }
      
      public function get guajiInfo() : proto.GuajiMemberInfo
      {
         return guajiInfo$field;
      }
      
      public function clearBgBaseInfo() : void
      {
         bgBaseInfo$field = null;
      }
      
      public function get hasBgBaseInfo() : Boolean
      {
         return bgBaseInfo$field != null;
      }
      
      public function set bgBaseInfo(param1:proto.BgBaseInfo) : void
      {
         bgBaseInfo$field = param1;
      }
      
      public function get bgBaseInfo() : proto.BgBaseInfo
      {
         return bgBaseInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasPlayer)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,player$field);
         }
         if(hasGuajiInfo)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,guajiInfo$field);
         }
         if(hasBgBaseInfo)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,bgBaseInfo$field);
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
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: TeamMember.player cannot be set twice.");
                  }
                  _loc5_++;
                  this.player = new proto.PlayerBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.player);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: TeamMember.guajiInfo cannot be set twice.");
                  }
                  _loc6_++;
                  this.guajiInfo = new proto.GuajiMemberInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.guajiInfo);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: TeamMember.bgBaseInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.bgBaseInfo = new proto.BgBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.bgBaseInfo);
                  continue;
            }
         }
      }
   }
}
