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
   
   public class BuyDoublePanelRes extends Message
   {
      
      public static const MEMBER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.BuyDoublePanelRes.member","member",8 | 2,proto.BuyDoubleMemberInfo);
      
      public static const STARTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BuyDoublePanelRes.starttime","starttime",16 | 0);
      
      public static const ENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BuyDoublePanelRes.endtime","endtime",24 | 0);
       
      
      private var member$field:proto.BuyDoubleMemberInfo;
      
      public var starttime:uint;
      
      public var endtime:uint;
      
      public function BuyDoublePanelRes()
      {
         super();
      }
      
      public function clearMember() : void
      {
         member$field = null;
      }
      
      public function get hasMember() : Boolean
      {
         return member$field != null;
      }
      
      public function set member(param1:proto.BuyDoubleMemberInfo) : void
      {
         member$field = param1;
      }
      
      public function get member() : proto.BuyDoubleMemberInfo
      {
         return member$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasMember)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,member$field);
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.starttime);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.endtime);
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
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BuyDoublePanelRes.member cannot be set twice.");
                  }
                  _loc6_++;
                  this.member = new proto.BuyDoubleMemberInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.member);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BuyDoublePanelRes.starttime cannot be set twice.");
                  }
                  _loc5_++;
                  this.starttime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: BuyDoublePanelRes.endtime cannot be set twice.");
                  }
                  _loc4_++;
                  this.endtime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
