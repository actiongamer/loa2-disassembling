package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class JueRoadSaoDangReq extends Message
   {
      
      public static const NODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.JueRoadSaoDangReq.nodeid","nodeid",8 | 0);
      
      public static const CHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.JueRoadSaoDangReq.chapterid","chapterid",16 | 0);
      
      public static const SAODANGTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.JueRoadSaoDangReq.saodangtimes","saodangtimes",24 | 0);
       
      
      public var nodeid:uint;
      
      public var chapterid:uint;
      
      private var saodangtimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function JueRoadSaoDangReq()
      {
         super();
      }
      
      public function clearSaodangtimes() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         saodangtimes$field = new uint();
      }
      
      public function get hasSaodangtimes() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set saodangtimes(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         saodangtimes$field = param1;
      }
      
      public function get saodangtimes() : uint
      {
         return saodangtimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.nodeid);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.chapterid);
         if(hasSaodangtimes)
         {
            WriteUtils.writeTag(param1,0,3);
            WriteUtils.write$TYPE_UINT32(param1,saodangtimes$field);
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
                     throw new IOError("Bad data format: JueRoadSaoDangReq.nodeid cannot be set twice.");
                  }
                  _loc6_++;
                  this.nodeid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: JueRoadSaoDangReq.chapterid cannot be set twice.");
                  }
                  _loc5_++;
                  this.chapterid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: JueRoadSaoDangReq.saodangtimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.saodangtimes = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
