package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_DOUBLE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyStageYuKouStartRes extends Message
   {
      
      public static const RANDOM:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.FamilyStageYuKouStartRes.random","random",8 | 0);
      
      public static const PLAYER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyStageYuKouStartRes.player","player",16 | 2,BattlePlayer);
      
      public static const FREETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageYuKouStartRes.freeTime","freeTime",24 | 0);
      
      public static const BUFFS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyStageYuKouStartRes.buffs","buffs",32 | 2,BuffInfo);
      
      public static const HPS:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("proto.FamilyStageYuKouStartRes.hps","hps",40 | 1);
       
      
      public var random:Array;
      
      public var player:Array;
      
      public var freeTime:uint;
      
      public var buffs:Array;
      
      public var hps:Array;
      
      public function FamilyStageYuKouStartRes()
      {
         random = [];
         player = [];
         buffs = [];
         hps = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc6_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.random.length)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,this.random[_loc2_]);
            _loc2_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.player.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.player[_loc3_]);
            _loc3_++;
         }
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.freeTime);
         _loc4_ = uint(0);
         while(_loc4_ < this.buffs.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.buffs[_loc4_]);
            _loc4_++;
         }
         _loc6_ = uint(0);
         while(_loc6_ < this.hps.length)
         {
            WriteUtils.writeTag(param1,1,5);
            WriteUtils.write$TYPE_DOUBLE(param1,this.hps[_loc6_]);
            _loc6_++;
         }
         var _loc8_:int = 0;
         var _loc7_:* = this;
         for(var _loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.random);
                  }
                  else
                  {
                     this.random.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 1:
                  this.player.push(ReadUtils.read$TYPE_MESSAGE(param1,new BattlePlayer()));
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageYuKouStartRes.freeTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.freeTime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  this.buffs.push(ReadUtils.read$TYPE_MESSAGE(param1,new BuffInfo()));
                  continue;
               case 4:
                  if((_loc3_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_DOUBLE,this.hps);
                  }
                  else
                  {
                     this.hps.push(ReadUtils.read$TYPE_DOUBLE(param1));
                  }
                  continue;
            }
         }
      }
   }
}
