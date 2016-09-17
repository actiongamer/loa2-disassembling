package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgFireTeamInfo extends Message
   {
      
      public static const SIDE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgFireTeamInfo.side","side",8 | 0);
      
      public static const PLAYERNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgFireTeamInfo.playerNum","playerNum",16 | 0);
      
      public static const RESNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgFireTeamInfo.resNum","resNum",24 | 0);
      
      public static const KILLNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgFireTeamInfo.killNum","killNum",32 | 0);
      
      public static const KILLNPCNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgFireTeamInfo.killNpcNum","killNpcNum",40 | 0);
       
      
      public var side:uint;
      
      public var playerNum:uint;
      
      public var resNum:uint;
      
      public var killNum:uint;
      
      private var killNpcNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function BgFireTeamInfo()
      {
         super();
      }
      
      public function clearKillNpcNum() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         killNpcNum$field = new uint();
      }
      
      public function get hasKillNpcNum() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set killNpcNum(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         killNpcNum$field = param1;
      }
      
      public function get killNpcNum() : uint
      {
         return killNpcNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.side);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.playerNum);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.resNum);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.killNum);
         if(hasKillNpcNum)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,killNpcNum$field);
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
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: BgFireTeamInfo.side cannot be set twice.");
                  }
                  _loc8_++;
                  this.side = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BgFireTeamInfo.playerNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.playerNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BgFireTeamInfo.resNum cannot be set twice.");
                  }
                  _loc7_++;
                  this.resNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BgFireTeamInfo.killNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.killNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BgFireTeamInfo.killNpcNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.killNpcNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
