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
   
   public class DragonBoatMakePanelRes extends Message
   {
      
      public static const CANGET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.DragonBoatMakePanelRes.canGet","canGet",8 | 0);
      
      public static const MYSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.DragonBoatMakePanelRes.myScore","myScore",16 | 0);
      
      public static const NUM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.DragonBoatMakePanelRes.num","num",24 | 2,MapKey32Value32);
       
      
      private var canGet$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var myScore$field:uint;
      
      public var num:Array;
      
      public function DragonBoatMakePanelRes()
      {
         num = [];
         super();
      }
      
      public function clearCanGet() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         canGet$field = new uint();
      }
      
      public function get hasCanGet() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set canGet(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         canGet$field = param1;
      }
      
      public function get canGet() : uint
      {
         return canGet$field;
      }
      
      public function clearMyScore() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         myScore$field = new uint();
      }
      
      public function get hasMyScore() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set myScore(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         myScore$field = param1;
      }
      
      public function get myScore() : uint
      {
         return myScore$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasCanGet)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,canGet$field);
         }
         if(hasMyScore)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,myScore$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.num.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.num[_loc2_]);
            _loc2_++;
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
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: DragonBoatMakePanelRes.canGet cannot be set twice.");
                  }
                  _loc4_++;
                  this.canGet = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: DragonBoatMakePanelRes.myScore cannot be set twice.");
                  }
                  _loc3_++;
                  this.myScore = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  this.num.push(ReadUtils.read$TYPE_MESSAGE(param1,new MapKey32Value32()));
                  continue;
            }
         }
      }
   }
}
