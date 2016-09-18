package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class BgResStatusNotify extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgResStatusNotify.id","id",8 | 0);
      
      public static const RESSTATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgResStatusNotify.resStatus","resStatus",16 | 0);
      
      public static const RESIDUALNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgResStatusNotify.residualNum","residualNum",24 | 0);
      
      public static const NPCGROUPID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.BgResStatusNotify.npcGroupId","npcGroupId",32 | 0);
       
      
      public var id:uint;
      
      public var resStatus:uint;
      
      public var residualNum:uint;
      
      private var npcGroupId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function BgResStatusNotify()
      {
         super();
      }
      
      public function clearNpcGroupId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         npcGroupId$field = new uint();
      }
      
      public function get hasNpcGroupId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set npcGroupId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         npcGroupId$field = param1;
      }
      
      public function get npcGroupId() : uint
      {
         return npcGroupId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.resStatus);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.residualNum);
         if(hasNpcGroupId)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,npcGroupId$field);
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
         var _loc5_:uint = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: BgResStatusNotify.id cannot be set twice.");
                  }
                  _loc5_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: BgResStatusNotify.resStatus cannot be set twice.");
                  }
                  _loc7_++;
                  this.resStatus = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: BgResStatusNotify.residualNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.residualNum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: BgResStatusNotify.npcGroupId cannot be set twice.");
                  }
                  _loc3_++;
                  this.npcGroupId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
