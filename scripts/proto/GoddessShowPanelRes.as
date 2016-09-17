package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class GoddessShowPanelRes extends Message
   {
      
      public static const GODDESSID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.GoddessShowPanelRes.goddessId","goddessId",8 | 0);
      
      public static const WINWORD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.GoddessShowPanelRes.winWord","winWord",16 | 2);
       
      
      public var goddessId:uint;
      
      private var winWord$field:String;
      
      public function GoddessShowPanelRes()
      {
         super();
      }
      
      public function clearWinWord() : void
      {
         winWord$field = null;
      }
      
      public function get hasWinWord() : Boolean
      {
         return winWord$field != null;
      }
      
      public function set winWord(param1:String) : void
      {
         winWord$field = param1;
      }
      
      public function get winWord() : String
      {
         return winWord$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.goddessId);
         if(hasWinWord)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_STRING(param1,winWord$field);
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
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: GoddessShowPanelRes.goddessId cannot be set twice.");
                  }
                  _loc4_++;
                  this.goddessId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: GoddessShowPanelRes.winWord cannot be set twice.");
                  }
                  _loc5_++;
                  this.winWord = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
