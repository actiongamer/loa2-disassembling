package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class TeamListReq extends Message
   {
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamListReq.kind","kind",8 | 0);
      
      public static const STARTPAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamListReq.startPage","startPage",16 | 0);
      
      public static const ENDPAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamListReq.endPage","endPage",24 | 0);
      
      public static const PAGECOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamListReq.pageCount","pageCount",32 | 0);
       
      
      public var kind:uint;
      
      private var startPage$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var endPage$field:uint;
      
      private var pageCount$field:uint;
      
      public function TeamListReq()
      {
         super();
      }
      
      public function clearStartPage() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         startPage$field = new uint();
      }
      
      public function get hasStartPage() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set startPage(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         startPage$field = param1;
      }
      
      public function get startPage() : uint
      {
         return startPage$field;
      }
      
      public function clearEndPage() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         endPage$field = new uint();
      }
      
      public function get hasEndPage() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set endPage(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         endPage$field = param1;
      }
      
      public function get endPage() : uint
      {
         return endPage$field;
      }
      
      public function clearPageCount() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         pageCount$field = new uint();
      }
      
      public function get hasPageCount() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set pageCount(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         pageCount$field = param1;
      }
      
      public function get pageCount() : uint
      {
         return pageCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.kind);
         if(hasStartPage)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,startPage$field);
         }
         if(hasEndPage)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,endPage$field);
         }
         if(hasPageCount)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,pageCount$field);
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
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: TeamListReq.kind cannot be set twice.");
                  }
                  _loc3_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: TeamListReq.startPage cannot be set twice.");
                  }
                  _loc6_++;
                  this.startPage = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: TeamListReq.endPage cannot be set twice.");
                  }
                  _loc7_++;
                  this.endPage = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: TeamListReq.pageCount cannot be set twice.");
                  }
                  _loc5_++;
                  this.pageCount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
