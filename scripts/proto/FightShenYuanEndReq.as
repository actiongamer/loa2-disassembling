package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FightShenYuanEndReq extends Message
   {
      
      public static const PLAY_MODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FightShenYuanEndReq.play_mode","playMode",8 | 0);
      
      public static const STP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FightShenYuanEndReq.stp","stp",16 | 2,SkillTimePoint);
      
      public static const POSITON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FightShenYuanEndReq.positon","positon",24 | 0);
      
      public static const LAYER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FightShenYuanEndReq.layer","layer",32 | 0);
      
      public static const CBTLRET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FightShenYuanEndReq.cBtlRet","cBtlRet",40 | 0);
      
      public static const CBTLDAMAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FightShenYuanEndReq.cBtlDamage","cBtlDamage",48 | 0);
       
      
      public var playMode:uint;
      
      public var stp:Array;
      
      public var positon:uint;
      
      public var layer:uint;
      
      private var cBtlRet$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var cBtlDamage$field:uint;
      
      public function FightShenYuanEndReq()
      {
         stp = [];
         super();
      }
      
      public function clearCBtlRet() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         cBtlRet$field = new uint();
      }
      
      public function get hasCBtlRet() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set cBtlRet(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         cBtlRet$field = param1;
      }
      
      public function get cBtlRet() : uint
      {
         return cBtlRet$field;
      }
      
      public function clearCBtlDamage() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         cBtlDamage$field = new uint();
      }
      
      public function get hasCBtlDamage() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set cBtlDamage(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         cBtlDamage$field = param1;
      }
      
      public function get cBtlDamage() : uint
      {
         return cBtlDamage$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.playMode);
         _loc2_ = uint(0);
         while(_loc2_ < this.stp.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.stp[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.positon);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.layer);
         if(hasCBtlRet)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,cBtlRet$field);
         }
         if(hasCBtlDamage)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,cBtlDamage$field);
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
         var _loc5_:* = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc8_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FightShenYuanEndReq.playMode cannot be set twice.");
                  }
                  _loc4_++;
                  this.playMode = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.stp.push(ReadUtils.read$TYPE_MESSAGE(param1,new SkillTimePoint()));
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FightShenYuanEndReq.positon cannot be set twice.");
                  }
                  _loc6_++;
                  this.positon = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FightShenYuanEndReq.layer cannot be set twice.");
                  }
                  _loc8_++;
                  this.layer = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FightShenYuanEndReq.cBtlRet cannot be set twice.");
                  }
                  _loc7_++;
                  this.cBtlRet = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FightShenYuanEndReq.cBtlDamage cannot be set twice.");
                  }
                  _loc3_++;
                  this.cBtlDamage = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
