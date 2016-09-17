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
   
   public class HeroPracticeEnterNodeRes extends Message
   {
      
      public static const SHENGYUTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroPracticeEnterNodeRes.shengyutimes","shengyutimes",8 | 0);
      
      public static const NODESTATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroPracticeEnterNodeRes.nodestate","nodestate",16 | 0);
      
      public static const NANDUINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.HeroPracticeEnterNodeRes.nanduinfos","nanduinfos",24 | 2,HeroPracticeNanduInfo);
      
      public static const SORT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.HeroPracticeEnterNodeRes.sort","sort",32 | 0);
       
      
      public var shengyutimes:uint;
      
      public var nodestate:uint;
      
      public var nanduinfos:Array;
      
      private var sort$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function HeroPracticeEnterNodeRes()
      {
         nanduinfos = [];
         super();
      }
      
      public function clearSort() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         sort$field = new uint();
      }
      
      public function get hasSort() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set sort(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         sort$field = param1;
      }
      
      public function get sort() : uint
      {
         return sort$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.shengyutimes);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.nodestate);
         _loc2_ = uint(0);
         while(_loc2_ < this.nanduinfos.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.nanduinfos[_loc2_]);
            _loc2_++;
         }
         if(hasSort)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,sort$field);
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
         var _loc4_:* = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: HeroPracticeEnterNodeRes.shengyutimes cannot be set twice.");
                  }
                  _loc3_++;
                  this.shengyutimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: HeroPracticeEnterNodeRes.nodestate cannot be set twice.");
                  }
                  _loc6_++;
                  this.nodestate = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  this.nanduinfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new HeroPracticeNanduInfo()));
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: HeroPracticeEnterNodeRes.sort cannot be set twice.");
                  }
                  _loc5_++;
                  this.sort = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
