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
   
   public class GuajiPvpFightEndReq extends Message
   {
      
      public static const PLAY_MODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiPvpFightEndReq.play_mode","playMode",8 | 0);
      
      public static const STP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.GuajiPvpFightEndReq.stp","stp",16 | 2,SkillTimePoint);
      
      public static const CRET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiPvpFightEndReq.cRet","cRet",24 | 0);
      
      public static const CDAMAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GuajiPvpFightEndReq.cDamage","cDamage",32 | 0);
      
      public static const ISESCAPE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.GuajiPvpFightEndReq.isEscape","isEscape",40 | 0);
       
      
      private var play_mode$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var stp:Array;
      
      private var cRet$field:uint;
      
      private var cDamage$field:uint;
      
      private var isEscape$field:Boolean;
      
      public function GuajiPvpFightEndReq()
      {
         stp = [];
         super();
      }
      
      public function clearPlayMode() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         play_mode$field = new uint();
      }
      
      public function get hasPlayMode() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set playMode(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         play_mode$field = param1;
      }
      
      public function get playMode() : uint
      {
         return play_mode$field;
      }
      
      public function clearCRet() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         cRet$field = new uint();
      }
      
      public function get hasCRet() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set cRet(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         cRet$field = param1;
      }
      
      public function get cRet() : uint
      {
         return cRet$field;
      }
      
      public function clearCDamage() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         cDamage$field = new uint();
      }
      
      public function get hasCDamage() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set cDamage(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         cDamage$field = param1;
      }
      
      public function get cDamage() : uint
      {
         return cDamage$field;
      }
      
      public function clearIsEscape() : void
      {
         hasField$0 = hasField$0 & 4294967287;
         isEscape$field = new Boolean();
      }
      
      public function get hasIsEscape() : Boolean
      {
         return (hasField$0 & 8) != 0;
      }
      
      public function set isEscape(param1:Boolean) : void
      {
         hasField$0 = hasField$0 | 8;
         isEscape$field = param1;
      }
      
      public function get isEscape() : Boolean
      {
         return isEscape$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasPlayMode)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,play_mode$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.stp.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.stp[_loc2_]);
            _loc2_++;
         }
         if(hasCRet)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,cRet$field);
         }
         if(hasCDamage)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,cDamage$field);
         }
         if(hasIsEscape)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_BOOL(param1,isEscape$field);
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
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiPvpFightEndReq.playMode cannot be set twice.");
                  }
                  _loc3_++;
                  this.playMode = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.stp.push(ReadUtils.read$TYPE_MESSAGE(param1,new SkillTimePoint()));
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiPvpFightEndReq.cRet cannot be set twice.");
                  }
                  _loc5_++;
                  this.cRet = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiPvpFightEndReq.cDamage cannot be set twice.");
                  }
                  _loc7_++;
                  this.cDamage = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: GuajiPvpFightEndReq.isEscape cannot be set twice.");
                  }
                  _loc6_++;
                  this.isEscape = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
            }
         }
      }
   }
}
