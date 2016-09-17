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
   
   public class TeamListRes extends Message
   {
      
      public static const KIND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamListRes.kind","kind",8 | 0);
      
      public static const ALL:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.TeamListRes.all","all",16 | 2,TeamBasicInfo);
      
      public static const TOTALCNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.TeamListRes.totalCnt","totalCnt",24 | 0);
       
      
      public var kind:uint;
      
      public var all:Array;
      
      private var totalCnt$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function TeamListRes()
      {
         all = [];
         super();
      }
      
      public function clearTotalCnt() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         totalCnt$field = new uint();
      }
      
      public function get hasTotalCnt() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set totalCnt(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         totalCnt$field = param1;
      }
      
      public function get totalCnt() : uint
      {
         return totalCnt$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.kind);
         _loc2_ = uint(0);
         while(_loc2_ < this.all.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.all[_loc2_]);
            _loc2_++;
         }
         if(hasTotalCnt)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,totalCnt$field);
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
                     throw new IOError("Bad data format: TeamListRes.kind cannot be set twice.");
                  }
                  _loc4_++;
                  this.kind = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.all.push(ReadUtils.read$TYPE_MESSAGE(param1,new TeamBasicInfo()));
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: TeamListRes.totalCnt cannot be set twice.");
                  }
                  _loc3_++;
                  this.totalCnt = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
