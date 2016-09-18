package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class HeroPracticeFightEndReq extends Message
   {
      
      public static const NANDUID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroPracticeFightEndReq.nanduid","nanduid",8 | 0);
      
      public static const TYPEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroPracticeFightEndReq.typeid","typeid",16 | 0);
      
      public static const PLAY_MODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroPracticeFightEndReq.play_mode","playMode",24 | 0);
      
      public static const STP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.HeroPracticeFightEndReq.stp","stp",32 | 2,SkillTimePoint);
      
      public static const FIGHTDROP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.HeroPracticeFightEndReq.fightdrop","fightdrop",40 | 0);
       
      
      public var nanduid:uint;
      
      public var typeid:uint;
      
      public var playMode:uint;
      
      public var stp:Array;
      
      private var fightdrop$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function HeroPracticeFightEndReq()
      {
         stp = [];
         super();
      }
      
      public function clearFightdrop() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         fightdrop$field = new Boolean();
      }
      
      public function get hasFightdrop() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set fightdrop(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 1;
         fightdrop$field = param1;
      }
      
      public function get fightdrop() : Boolean
      {
         return fightdrop$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.nanduid);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.typeid);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.playMode);
         _loc2_ = uint(0);
         while(_loc2_ < this.stp.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.stp[_loc2_]);
            _loc2_++;
         }
         if(hasFightdrop)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_BOOL(param1,fightdrop$field);
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
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
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
                     throw new IOError("Bad data format: HeroPracticeFightEndReq.nanduid cannot be set twice.");
                  }
                  _loc6_++;
                  this.nanduid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: HeroPracticeFightEndReq.typeid cannot be set twice.");
                  }
                  _loc7_++;
                  this.typeid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: HeroPracticeFightEndReq.playMode cannot be set twice.");
                  }
                  _loc3_++;
                  this.playMode = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  this.stp.push(ReadUtils.read$TYPE_MESSAGE(param1,new SkillTimePoint()));
                  continue;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: HeroPracticeFightEndReq.fightdrop cannot be set twice.");
                  }
                  _loc4_++;
                  this.fightdrop = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
