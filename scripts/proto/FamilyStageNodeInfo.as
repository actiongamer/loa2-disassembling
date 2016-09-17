package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_DOUBLE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyStageNodeInfo extends Message
   {
      
      public static const BUFFID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageNodeInfo.buffid","buffid",8 | 0);
      
      public static const STATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageNodeInfo.state","state",16 | 0);
      
      public static const GROUPID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageNodeInfo.groupid","groupid",24 | 0);
      
      public static const HPS:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("proto.FamilyStageNodeInfo.hps","hps",32 | 1);
      
      public static const CHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageNodeInfo.chapterid","chapterid",40 | 0);
      
      public static const NODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyStageNodeInfo.nodeid","nodeid",48 | 0);
      
      public static const MAXHPS:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("proto.FamilyStageNodeInfo.maxhps","maxhps",56 | 1);
       
      
      public var buffid:uint;
      
      public var state:uint;
      
      public var groupid:uint;
      
      public var hps:Array;
      
      public var chapterid:uint;
      
      public var nodeid:uint;
      
      public var maxhps:Array;
      
      public function FamilyStageNodeInfo()
      {
         hps = [];
         maxhps = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = 0;
         var _loc2_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.buffid);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.state);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.groupid);
         _loc4_ = uint(0);
         while(_loc4_ < this.hps.length)
         {
            WriteUtils.writeTag(param1,1,4);
            WriteUtils.write$TYPE_DOUBLE(param1,this.hps[_loc4_]);
            _loc4_++;
         }
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.chapterid);
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_UINT32(param1,this.nodeid);
         _loc2_ = uint(0);
         while(_loc2_ < this.maxhps.length)
         {
            WriteUtils.writeTag(param1,1,7);
            WriteUtils.write$TYPE_DOUBLE(param1,this.maxhps[_loc2_]);
            _loc2_++;
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:* = 0;
         var _loc8_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageNodeInfo.buffid cannot be set twice.");
                  }
                  _loc8_++;
                  this.buffid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageNodeInfo.state cannot be set twice.");
                  }
                  _loc4_++;
                  this.state = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageNodeInfo.groupid cannot be set twice.");
                  }
                  _loc3_++;
                  this.groupid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if((_loc5_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_DOUBLE,this.hps);
                  }
                  else
                  {
                     this.hps.push(ReadUtils.read$TYPE_DOUBLE(param1));
                  }
                  continue;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageNodeInfo.chapterid cannot be set twice.");
                  }
                  _loc7_++;
                  this.chapterid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyStageNodeInfo.nodeid cannot be set twice.");
                  }
                  _loc6_++;
                  this.nodeid = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 6:
                  if((_loc5_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_DOUBLE,this.maxhps);
                  }
                  else
                  {
                     this.maxhps.push(ReadUtils.read$TYPE_DOUBLE(param1));
                  }
                  continue;
            }
         }
      }
   }
}
