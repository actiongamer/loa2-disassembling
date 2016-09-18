package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BuZhenViewRes extends Message
   {
      
      public static const LIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BuZhenViewRes.list","list",8 | 2,PanelBaseInfo);
      
      public static const INFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.BuZhenViewRes.info","info",16 | 2,HeroInfo);
      
      public static const BUZHEN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BuZhenViewRes.buZhen","buZhen",24 | 2,proto.BuZhenInfo);
       
      
      public var list:Array;
      
      public var info:Array;
      
      private var buZhen$field:proto.BuZhenInfo;
      
      public function BuZhenViewRes()
      {
         list = [];
         info = [];
         super();
      }
      
      public function clearBuZhen() : void
      {
         buZhen$field = null;
      }
      
      public function get hasBuZhen() : Boolean
      {
         return buZhen$field != null;
      }
      
      public function set buZhen(param1:proto.BuZhenInfo) : void
      {
         buZhen$field = param1;
      }
      
      public function get buZhen() : proto.BuZhenInfo
      {
         return buZhen$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.list.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.list[_loc2_]);
            _loc2_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.info.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.info[_loc3_]);
            _loc3_++;
         }
         if(hasBuZhen)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,buZhen$field);
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                  this.list.push(ReadUtils.read$TYPE_MESSAGE(param1,new PanelBaseInfo()));
                  continue;
               case 1:
                  this.info.push(ReadUtils.read$TYPE_MESSAGE(param1,new HeroInfo()));
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BuZhenViewRes.buZhen cannot be set twice.");
                  }
                  _loc4_++;
                  this.buZhen = new proto.BuZhenInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.buZhen);
                  continue;
            }
         }
      }
   }
}
