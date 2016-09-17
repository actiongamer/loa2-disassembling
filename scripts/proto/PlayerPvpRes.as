package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   
   public class PlayerPvpRes extends Message
   {
      
      public static const SELF:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerPvpRes.self","self",8 | 2,BattlePlayer);
      
      public static const TARGET:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.PlayerPvpRes.target","target",16 | 2,BattlePlayer);
      
      public static const SEEDS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.PlayerPvpRes.seeds","seeds",24 | 0);
       
      
      public var self:Array;
      
      public var target:Array;
      
      public var seeds:Array;
      
      public function PlayerPvpRes()
      {
         self = [];
         target = [];
         seeds = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc5_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.self.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.self[_loc2_]);
            _loc2_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.target.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.target[_loc3_]);
            _loc3_++;
         }
         _loc5_ = uint(0);
         while(_loc5_ < this.seeds.length)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,this.seeds[_loc5_]);
            _loc5_++;
         }
         var _loc7_:int = 0;
         var _loc6_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  this.self.push(ReadUtils.read$TYPE_MESSAGE(param1,new BattlePlayer()));
                  continue;
               case 1:
                  this.target.push(ReadUtils.read$TYPE_MESSAGE(param1,new BattlePlayer()));
                  continue;
               case 2:
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.seeds);
                  }
                  else
                  {
                     this.seeds.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
            }
         }
      }
   }
}
