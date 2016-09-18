package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ShowItemRes extends Message
   {
      
      public static const ITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ShowItemRes.item","item",8 | 2,proto.Item);
      
      public static const BAOWU:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ShowItemRes.baowu","baowu",16 | 2,proto.BaoWu);
       
      
      private var item$field:proto.Item;
      
      private var baowu$field:proto.BaoWu;
      
      public function ShowItemRes()
      {
         super();
      }
      
      public function clearItem() : void
      {
         item$field = null;
      }
      
      public function get hasItem() : Boolean
      {
         return item$field != null;
      }
      
      public function set item(param1:proto.Item) : void
      {
         item$field = param1;
      }
      
      public function get item() : proto.Item
      {
         return item$field;
      }
      
      public function clearBaowu() : void
      {
         baowu$field = null;
      }
      
      public function get hasBaowu() : Boolean
      {
         return baowu$field != null;
      }
      
      public function set baowu(param1:proto.BaoWu) : void
      {
         baowu$field = param1;
      }
      
      public function get baowu() : proto.BaoWu
      {
         return baowu$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasItem)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,item$field);
         }
         if(hasBaowu)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,baowu$field);
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
                     throw new IOError("Bad data format: ShowItemRes.item cannot be set twice.");
                  }
                  _loc5_++;
                  this.item = new proto.Item();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.item);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ShowItemRes.baowu cannot be set twice.");
                  }
                  _loc4_++;
                  this.baowu = new proto.BaoWu();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baowu);
                  continue;
            }
         }
      }
   }
}
