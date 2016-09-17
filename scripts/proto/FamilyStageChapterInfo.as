package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyStageChapterInfo extends Message
   {
      
      public static const NODEINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyStageChapterInfo.nodeinfos","nodeinfos",8 | 2,FamilyStageNodeInfo);
      
      public static const STATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageChapterInfo.state","state",16 | 0);
      
      public static const CURCHAPTER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageChapterInfo.curchapter","curchapter",24 | 0);
      
      public static const HIGHCHAPTER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageChapterInfo.highchapter","highchapter",32 | 0);
      
      public static const MINGRICHAPTER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageChapterInfo.mingrichapter","mingrichapter",40 | 0);
      
      public static const CHAPTERSELECTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageChapterInfo.chapterselecttime","chapterselecttime",48 | 0);
      
      public static const NEXTRESETTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageChapterInfo.nextresettime","nextresettime",56 | 0);
       
      
      public var nodeinfos:Array;
      
      public var state:uint;
      
      public var curchapter:uint;
      
      public var highchapter:uint;
      
      public var mingrichapter:uint;
      
      public var chapterselecttime:uint;
      
      public var nextresettime:uint;
      
      public function FamilyStageChapterInfo()
      {
         nodeinfos = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.nodeinfos.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.nodeinfos[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.state);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.curchapter);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.highchapter);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.mingrichapter);
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_UINT32(param1,this.chapterselecttime);
         WriteUtils.writeTag(param1,0,7);
         WriteUtils.write$TYPE_UINT32(param1,this.nextresettime);
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:* = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         var _loc5_:uint = 0;
         var _loc4_:uint = 0;
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc8_ >> 3) - 1)
            {
               case 0:
                  this.nodeinfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new FamilyStageNodeInfo()));
                  continue;
               case 1:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageChapterInfo.state cannot be set twice.");
                  }
                  _loc7_++;
                  this.state = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageChapterInfo.curchapter cannot be set twice.");
                  }
                  _loc6_++;
                  this.curchapter = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageChapterInfo.highchapter cannot be set twice.");
                  }
                  _loc5_++;
                  this.highchapter = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageChapterInfo.mingrichapter cannot be set twice.");
                  }
                  _loc4_++;
                  this.mingrichapter = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageChapterInfo.chapterselecttime cannot be set twice.");
                  }
                  _loc9_++;
                  this.chapterselecttime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageChapterInfo.nextresettime cannot be set twice.");
                  }
                  _loc3_++;
                  this.nextresettime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
