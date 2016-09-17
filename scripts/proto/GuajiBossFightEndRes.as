package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GuajiBossFightEndRes extends Message
   {
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiBossFightEndRes.star","star",8 | 0);
      
      public static const PLAYER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.GuajiBossFightEndRes.player","player",16 | 2,proto.LvExp);
       
      
      private var star$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var player$field:proto.LvExp;
      
      public function GuajiBossFightEndRes()
      {
         super();
      }
      
      public function clearStar() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         star$field = new uint();
      }
      
      public function get hasStar() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set star(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         star$field = param1;
      }
      
      public function get star() : uint
      {
         return star$field;
      }
      
      public function clearPlayer() : void
      {
         player$field = null;
      }
      
      public function get hasPlayer() : Boolean
      {
         return player$field != null;
      }
      
      public function set player(param1:proto.LvExp) : void
      {
         player$field = param1;
      }
      
      public function get player() : proto.LvExp
      {
         return player$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasStar)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,star$field);
         }
         if(hasPlayer)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,player$field);
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
         var _loc3_:* = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiBossFightEndRes.star cannot be set twice.");
                  }
                  _loc5_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiBossFightEndRes.player cannot be set twice.");
                  }
                  _loc4_++;
                  this.player = new proto.LvExp();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.player);
                  continue;
            }
         }
      }
   }
}
