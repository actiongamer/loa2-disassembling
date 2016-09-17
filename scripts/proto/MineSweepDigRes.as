package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class MineSweepDigRes extends Message
   {
      
      public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.MineSweepDigRes.info","info",8 | 2,proto.MineSweepInfo);
      
      public static const MYSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.MineSweepDigRes.myScore","myScore",16 | 0);
      
      public static const PANEL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.MineSweepDigRes.panel","panel",24 | 2,proto.MineSweepPanelRes);
       
      
      private var info$field:proto.MineSweepInfo;
      
      private var myScore$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var panel$field:proto.MineSweepPanelRes;
      
      public function MineSweepDigRes()
      {
         super();
      }
      
      public function clearInfo() : void
      {
         info$field = null;
      }
      
      public function get hasInfo() : Boolean
      {
         return info$field != null;
      }
      
      public function set info(param1:proto.MineSweepInfo) : void
      {
         info$field = param1;
      }
      
      public function get info() : proto.MineSweepInfo
      {
         return info$field;
      }
      
      public function clearMyScore() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         myScore$field = new uint();
      }
      
      public function get hasMyScore() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set myScore(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         myScore$field = param1;
      }
      
      public function get myScore() : uint
      {
         return myScore$field;
      }
      
      public function clearPanel() : void
      {
         panel$field = null;
      }
      
      public function get hasPanel() : Boolean
      {
         return panel$field != null;
      }
      
      public function set panel(param1:proto.MineSweepPanelRes) : void
      {
         panel$field = param1;
      }
      
      public function get panel() : proto.MineSweepPanelRes
      {
         return panel$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasInfo)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,info$field);
         }
         if(hasMyScore)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,myScore$field);
         }
         if(hasPanel)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,panel$field);
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
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: MineSweepDigRes.info cannot be set twice.");
                  }
                  _loc6_++;
                  this.info = new proto.MineSweepInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.info);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: MineSweepDigRes.myScore cannot be set twice.");
                  }
                  _loc3_++;
                  this.myScore = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: MineSweepDigRes.panel cannot be set twice.");
                  }
                  _loc5_++;
                  this.panel = new proto.MineSweepPanelRes();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.panel);
                  continue;
            }
         }
      }
   }
}
