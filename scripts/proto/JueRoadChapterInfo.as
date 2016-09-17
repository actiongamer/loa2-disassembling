package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class JueRoadChapterInfo extends Message
   {
      
      public static const CHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.JueRoadChapterInfo.chapterid","chapterid",8 | 0);
      
      public static const SORT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.JueRoadChapterInfo.sort","sort",16 | 0);
      
      public static const STARS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.JueRoadChapterInfo.stars","stars",24 | 0);
      
      public static const BAOXIANGS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.JueRoadChapterInfo.baoxiangs","baoxiangs",32 | 0);
      
      public static const NODES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.JueRoadChapterInfo.nodes","nodes",40 | 2,JueRoadNodeInfo);
       
      
      public var chapterid:uint;
      
      public var sort:uint;
      
      public var stars:uint;
      
      public var baoxiangs:Array;
      
      public var nodes:Array;
      
      public function JueRoadChapterInfo()
      {
         baoxiangs = [];
         nodes = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.chapterid);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.sort);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.stars);
         _loc2_ = uint(0);
         while(_loc2_ < this.baoxiangs.length)
         {
            WriteUtils.writeTag(param1,0,4);
            WriteUtils.write$TYPE_UINT32(param1,this.baoxiangs[_loc2_]);
            _loc2_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.nodes.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.nodes[_loc3_]);
            _loc3_++;
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
         var _loc4_:* = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: JueRoadChapterInfo.chapterid cannot be set twice.");
                  }
                  _loc6_++;
                  this.chapterid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: JueRoadChapterInfo.sort cannot be set twice.");
                  }
                  _loc5_++;
                  this.sort = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: JueRoadChapterInfo.stars cannot be set twice.");
                  }
                  _loc3_++;
                  this.stars = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if((_loc4_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.baoxiangs);
                  }
                  else
                  {
                     this.baoxiangs.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 4:
                  this.nodes.push(ReadUtils.read$TYPE_MESSAGE(param1,new JueRoadNodeInfo()));
                  continue;
            }
         }
      }
   }
}
