package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class MineSweepOneKeyRes extends Message
   {
      
      public static const OLDPANEL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.MineSweepOneKeyRes.oldPanel","oldPanel",8 | 2,proto.MineSweepPanelRes);
      
      public static const PANEL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.MineSweepOneKeyRes.panel","panel",16 | 2,proto.MineSweepPanelRes);
       
      
      private var oldPanel$field:proto.MineSweepPanelRes;
      
      private var panel$field:proto.MineSweepPanelRes;
      
      public function MineSweepOneKeyRes()
      {
         super();
      }
      
      public function clearOldPanel() : void
      {
         oldPanel$field = null;
      }
      
      public function get hasOldPanel() : Boolean
      {
         return oldPanel$field != null;
      }
      
      public function set oldPanel(param1:proto.MineSweepPanelRes) : void
      {
         oldPanel$field = param1;
      }
      
      public function get oldPanel() : proto.MineSweepPanelRes
      {
         return oldPanel$field;
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
         if(hasOldPanel)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,oldPanel$field);
         }
         if(hasPanel)
         {
            WriteUtils.writeTag(param1,2,2);
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
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: MineSweepOneKeyRes.oldPanel cannot be set twice.");
                  }
                  _loc3_++;
                  this.oldPanel = new proto.MineSweepPanelRes();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.oldPanel);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: MineSweepOneKeyRes.panel cannot be set twice.");
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
